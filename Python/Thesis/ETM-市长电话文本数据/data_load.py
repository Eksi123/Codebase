# 加载python模块
import pickle
import os
import numpy as np
import torch
from torch.utils.data import Dataset, DataLoader

# 1 按照batch加载词袋/词序列向量数据
"""
考虑到后续训练词向量，可能采用nn.linear或nn.embedding模块，因此在数据输入时可选择加载文档的词序列或词袋向量
"""
# TextData数据模块
class TextData(Dataset):
    def __init__(self, root_dir, vocab_size, batch_size):
        self.root_dir = root_dir
        self.path_token = os.path.join(root_dir,'seq_token.pkl')
        self.path_value = os.path.join(root_dir,'seq_value.pkl')
        with open(self.path_token, 'rb') as f:
            self.Token = pickle.load(f)
        with open(self.path_value, 'rb') as f:
            self.Value = pickle.load(f)
        self.doc_size = len(self.Token)
        self.vocab_size = vocab_size
        self.batch_size = batch_size
    
    # 获取词袋向量BOW
    def __get_batch__(self):
        Bow_Vector = torch.full((self.doc_size, self.vocab_size),0,dtype=torch.float)
        for i, doc_idx in enumerate(range(self.doc_size)):
            token = self.Token[doc_idx]
            value = self.Value[doc_idx]
            for j, word in enumerate(token):
                Bow_Vector[i, word] = value[j]
        Loader = DataLoader(dataset=Bow_Vector, num_workers=0, batch_size=self.batch_size, shuffle=True, drop_last=False)
        return Loader
    
    # 获取词序列SE（取文档长度最大值为上界，对不足该长度的文档进行填补）
    
# 2 加载预训练的中文词向量
# 直接加载处理后的预训练词向量，速度更快
def get_embeddings_weight():
    with open('Thesis\\ETM-市长电话文本数据\\pred_embedding_baidu\\pretrained_embeddings.pkl', 'rb') as f:
        pretrained_embeddings = pickle.load(f)
    return pretrained_embeddings