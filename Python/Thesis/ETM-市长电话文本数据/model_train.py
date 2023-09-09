# 加载python模块
import torch
import torch.onnx
import pickle
import numpy as np

from model_etm import ETM
from data_load import TextData

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# 1.加载词典
with open('Thesis\\ETM-市长电话文本数据\\word_dict\\word2id.pkl' ,'rb') as f:
    word2id = pickle.load(f)
with open('Thesis\\ETM-市长电话文本数据\\word_dict\\id2word.pkl' ,'rb') as f:
    id2word = pickle.load(f)
with open('Thesis\\ETM-市长电话文本数据\\data\\seq_token.pkl' ,'rb') as f:
    seq_token = pickle.load(f)
print("当前词汇总数为：",len(word2id))
print("当前文档总数：",len(seq_token))

# 2.模型初始化+优化器选择
batch_size = 50
num_topics = 10
vocab_size = len(word2id)
embedding_size = 300
t_hidden_size = 500
theta_act = 'tanh'
pre_trained_embeddings = False
enc_drop = 0.0
learning_rate = 0.001

# 此处还可选择加载现成的模型
with open('Thesis\\ETM-市长电话文本数据\\models\\labeled_ETM_2005.pkl' ,'rb') as f:
    model = pickle.load(f)
model = ETM(num_topics, vocab_size, embedding_size, t_hidden_size, theta_act,  pre_trained_embeddings, enc_drop).to(device)
optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)

# # 输出模型参数名及初始化值
# for name,parameters in model.named_parameters(): 
#     print(name)
#     print(parameters.shape)
#     print(parameters)

# 3.模型训练
epochs = 45
for epoch in range(1,epochs+1):
    print("Epoch [{}/{}]".format(epoch, epochs))

    ELBO = 0; cnt = 0
    Data = TextData(root_dir='Thesis\\ETM-市长电话文本数据\\data', vocab_size=vocab_size, batch_size=batch_size)
    Loader = Data.__get_batch__()
    model.train()
    for batch in Loader:
        batch_normalized = batch/batch.sum(1).unsqueeze(1)
        batch = batch.to(device)
        batch_normalized = batch_normalized.to(device)

        optimizer.zero_grad()
        elbo = model(batch,batch_normalized)
        # elbo = model(batch)
        # print(recon_loss,kld_theta)
        elbo.backward() 
        optimizer.step()
        ELBO += elbo.item()
        cnt += 1
    ELBO = round(ELBO/cnt,2)
    print("ELBO:{:.4f}".format(ELBO))

# 4.主题展示：查看某些词的前10个近邻词，以及对应主题下的前20主题词（用来粗略查看模型效果）
model.eval()
with torch.no_grad():
    print('-------------------近邻词查看-------------------')
    try:
        word_embeddings = np.array(model.rho.weight)
        topic_embeddings = np.array(model.alpha.weight)
    except:
        word_embeddings = np.array(model.rho) 
        topic_embeddings = np.array(model.alpha)       

    words = ['灰尘','噪声','窗口','警察','驾驶']
    for word in words:
        if word in word2id:
            embedding_word = word_embeddings[word2id[word]]
            rank = word_embeddings.dot(embedding_word)
            mostSimilar = []
            [mostSimilar.append(idx) for idx in rank.argsort()[::-1]]
            nearest_neighbors = mostSimilar[:11]
            print('给定词:{}  近邻词:{}'.format(
                        word, [id2word[idx] for idx in nearest_neighbors][1:]))
    print('------------------------------------------------')

    print('-------------------主题词查看-------------------')
    Beta = np.dot(topic_embeddings,word_embeddings.T)
    for i in range(num_topics):
        beta = Beta[i]
        topic_words = []
        [topic_words.append(idx) for idx in beta.argsort()[::-1]] #对所得到的词排序。
        topic_words =  topic_words[:20]
        print('主题{}: {}'.format(
                    i+1, [id2word[int(idx)] for idx in topic_words]))
    print('------------------------------------------------')


# 5.模型整体保存（如果使用了预训练词向量，则为labeled ETM）
if pre_trained_embeddings==False:
    with open('Thesis\\ETM-市长电话文本数据\\models\\ETM_2005.pkl', 'wb') as f:
        pickle.dump(model, f)
else:
    with open('Thesis\\ETM-市长电话文本数据\\models\\labeled_ETM_2005.pkl', 'wb') as f:
        pickle.dump(model, f)






