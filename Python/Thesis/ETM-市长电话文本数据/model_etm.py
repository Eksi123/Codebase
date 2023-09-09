# 加载python模块
import torch
import torch.nn as nn
import torch.nn.functional as F 
from data_load import get_embeddings_weight

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

class ETM(nn.Module):
    """
    num_topics: 主题个数
    vocab_size: 词典长度
    embedding_size: 词向量维度
    t_hidden_size: 隐藏层输出变量数
    theta_act: 变分参数推断网络中的激活函数
    pre_trained_embeddings: 是否载入预训练词向量
    enc_drop: dropout几率，通常用于使全连接层后的部分神经元失活，防止过拟合
    """
    def __init__(self, num_topics, vocab_size, embedding_size, t_hidden_size, 
                    theta_act, pre_trained_embeddings, enc_drop):
        super(ETM, self).__init__()
    
        self.num_topics = num_topics
        self.vocab_size = vocab_size
        self.embedding_size = embedding_size
        self.t_hidden_size = t_hidden_size
        self.t_drop = nn.Dropout(enc_drop)

        def get_activation(act):
            if act == 'tanh':
                act = nn.Tanh()
            elif act == 'relu':
                act = nn.ReLU()
            elif act == 'softplus':
                act = nn.Softplus()
            elif act == 'rrelu':
                act = nn.RReLU()
            elif act == 'leakyrelu':
                act = nn.LeakyReLU()
            elif act == 'elu':
                act = nn.ELU()
            elif act == 'selu':
                act = nn.SELU()
            elif act == 'glu':
                act = nn.GLU()
            else:
                print('Defaulting to tanh activations...')
                act = nn.Tanh()
            return act
        self.theta_act = get_activation(theta_act)

        # word_embeddding(得到论文中的词向量矩阵rho)
        """
        word_embeddding 词向量矩阵，维度为(vocab_size, embedding_size)
        下面的topic_embedding为主题向量矩阵，维度为(num_topics, embedding_size)
        两者处于同一语义空间内，可计算余弦相似度来比较主题与词的相似性

        nn.linear和nn.embedding均可实现词向量训练，但前者输入为BOW词袋，后者为词序列或索引
        """
        if pre_trained_embeddings:
            self.rho = nn.Linear(self.embedding_size, self.vocab_size, bias=False)
            pretrained_embeddings = get_embeddings_weight()
            self.rho.weight.data.copy_(torch.from_numpy(pretrained_embeddings))
        else:
            self.rho = nn.Linear(self.embedding_size, self.vocab_size, bias=False)
        
        # topic_embedding(得到论文中的主题向量矩阵alpha)
        self.alpha = nn.Linear(self.embedding_size, self.num_topics, bias=False)

        # variational distribution & inference network(论文中变分分布参数均值mu和对数方差logsigma的推断网络)
        # 推断网络是否可以进一步改进？（变分自编码器VAE架构）
        self.q_theta = nn.Sequential(
                nn.Linear(self.vocab_size, self.t_hidden_size), 
                self.t_drop,
                self.theta_act,
                nn.Linear(self.t_hidden_size, self.t_hidden_size),
                self.t_drop,
                self.theta_act,
            )
        self.mu_q_theta = nn.Linear(self.t_hidden_size, self.num_topics, bias=True)  
        self.logsigma_q_theta = nn.Linear(self.t_hidden_size, self.num_topics, bias=True)  

    # encode编码：返回推断后的参数mu,logsigma（这一块是不是可以修改呢？）
    def encode(self, normalized_bows):
        q_theta = self.q_theta(normalized_bows)
        mu_theta = self.mu_q_theta(q_theta)
        logsigma_theta = self.logsigma_q_theta(q_theta)
        kld_theta = -0.5 * torch.sum(1 + logsigma_theta - mu_theta.pow(2) - logsigma_theta.exp(),dim=-1).mean()
        # 这一块真的是在求kl_theta嘛？怎么可求？
        return mu_theta, logsigma_theta, kld_theta

    # 根据参数mu和std（由logsigma变形）对样本进行采样(样本为论文中的delta_d)
    # 采样函数这一块是不是可以做修改呢？
    def reparameterize(self, mu, logsigma):
        std = torch.exp(0.5 * logsigma) 
        eps = torch.randn_like(std)
        return mu + eps * std

    # 计算给定文档主题下，单词的对数似然(即P(W|theta))
    def decode(self, theta):
        logit = self.alpha(self.rho.weight) # 等价于余弦值（高维向量模长几近相等？）
        beta = F.softmax(logit, dim=0).transpose(1,0) # 计算主题-单词分布beta：每一个主题下的主题词属于分类分布
        res = torch.mm(theta, beta)
        preds = torch.log(res+1e-6)
        return preds
    
    # 网络前向传播（最后求的是-ELBO 神经变分推断-梯度下降方法）
    def forward(self, bows, normalized_bows):
        mu,logsigma,kld_theta = self.encode(normalized_bows)
        sample = self.reparameterize(mu, logsigma)
        theta = F.softmax(sample, dim=-1) # 计算文档-主题分布theta：每一篇文档可能的主题
        preds = self.decode(theta)
        recon_loss = -(preds*bows).sum(1)
        recon_loss = recon_loss.mean()

        return recon_loss+kld_theta