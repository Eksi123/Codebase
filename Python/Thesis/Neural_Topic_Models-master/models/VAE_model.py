import torch
import torch.nn as nn
import torch.nn.functional as F

# VAE model
class VAE(nn.Module):
    def __init__(self, dropout=0.0, emb_dim=300):
        super(VAE, self).__init__()

        self.rho = nn.Linear(emb_dim,self.vocab_size)
        self.alpha = nn.Linear(emb_dim,self.n_topic)    
        self.dropout = nn.Dropout(p=dropout)

    # encoder把稀疏的BOW文本向量转化为稠密的mu和logvar
    def encode(self, x):
        f1 = nn.Sequential(
            nn.Linear(in_features=2000, out_features=1024, bias=True),
            self.dropout,
            nn.ReLU())
        f2 = nn.Sequential(
            nn.Linear(in_features=1024, out_features=512, bias=True),
            self.dropout,
            nn.ReLU())
        
        hid1 = f1(x)
        hid2 = f2(hid1)
        fc_mu = nn.Linear(in_features=512, out_features=20)
        mu = fc_mu(hid2)
        fc_logvar = nn.Linear(in_features=512, out_features=20)
        log_var = fc_logvar(hid2)

        return mu, log_var
    
    # 利用mu和logvar进行采样z
    def reparameterize(self, mu, log_var):
        std = torch.exp(log_var/2)
        eps = torch.randn_like(std)
        z = mu + eps * std
        return z

    # decoder把稠密的z转化为稀疏向量y
    def decode(self, z):
        f = nn.Sequential(
            nn.Linear(in_features=20, out_features=1024, bias=True),
            self.dropout,
            nn.ReLu(),
            nn.Linear(in_features=1024, out_features=2000, bias=True))
        y = f(z)
        return y
    
    # get theta and kl_div
    def get_theta(self,x,collate_fn=None):
        mu, log_var = self.encode(x)
        # get kl_div
        kl_div = -0.5 * torch.sum(1+log_var-mu.pow(2)-log_var.exp())
        # get theta
        self.fc1 = nn.Linear(in_features=20, out_features=20)
        _theta = self.reparameterize(mu, log_var)
        _theta = self.fc1(_theta)
        if collate_fn!=None:
            theta = collate_fn(_theta)
        else:
            theta = _theta
        return theta, kl_div

    # get beta
    def get_beta(self):
        wght_dec = self.alpha(self.rho.weight) 
        beta = F.softmax(wght_dec,dim=0).transpose(1,0)    
        return beta

    # get loss
    def forward(self, x):
        # theta & kl_div
        theta,kl_div = self.get_theta(x)
        # beta
        beta = self.get_beta()
        # logits
        res = torch.mm(theta,beta)
        logits = torch.log(res+1e-6)  
        # rec_loss     
        x_reconst = self.decode(theta)
        logsoftmax = torch.log_softmax(x_reconst,dim=1)
        rec_loss = -1.0 * torch.sum(x*logsoftmax)

        return rec_loss + kl_div*beta

print(VAE().decode)