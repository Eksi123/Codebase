# 加载python模块
import jieba  # 分词模块
from jieba import posseg
import string # 标点符号
from sklearn.feature_extraction.text import CountVectorizer # 构建文档词序列表示
import numpy as np
import pickle

# 1 加载2005年“行政服务”数据文档（除标点符号外，暂不去停用词）
docs = [] # 文档列表
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_DanZi.txt') # 加载词典
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_DM_changchun.txt')
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_JiChu.txt')
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_xingshi.txt')
with open('Thesis/ETM-市长电话文本数据/data/zhdd_lines.txt','r',encoding='utf-8') as f:
    while True:
        text = f.readline().rstrip()
        if not text:
            break
        text = jieba.lcut(text, cut_all=False, use_paddle=True, HMM=True) # 分词
        text = [word for word in text if word not in string.punctuation] # 去除标点符号（类似可用于去除停用词）
        docs.append(" ".join(text))
doc_size = len(docs) # 文档数量

# 2 构建文档词序列
cvz = CountVectorizer(token_pattern=r"(?u)\b\w+\b") # 文档词序列模型（默认会剔除单字符或单个中文，此处修改匹配模式）
cvz_sequence = cvz.fit_transform(docs) # 获取文档的序列表示（稀疏矩阵表示，行表示文档，列表示单词）

# 3 获得单词-索引双向词典
"""
获得的word2id和id2word是按什么排序的？
答：遍历所有文档doc，按照单词出现顺序将单词添加至词典，但感到困惑的地方是虽然单词出现是按顺序的，但它对应的索引号不是按顺序的（影响不大）
这个顺序和文档词序列对得上嘛？
答：对得上，可以根据词序列量和词典还原文档内容
"""
word2id = dict([(word, cvz.vocabulary_.get(word)) for word in cvz.vocabulary_]) # 单词-索引
id2word = dict([(cvz.vocabulary_.get(word), word) for word in cvz.vocabulary_]) # 索引-单词
vocab_size = len(word2id) # 词典长度
print(vocab_size)
del cvz

# 4 把词典和词序列写入文件并保存
# 词典
with open('Thesis\\ETM-市长电话文本数据\\word_dict\\word2id.pkl', 'wb') as f:
    pickle.dump(word2id, f)
with open('Thesis\\ETM-市长电话文本数据\\word_dict\\id2word.pkl', 'wb') as f:
    pickle.dump(id2word, f)

# 词序列（分为token/单词，value/计数两部分）
cvz_sequence_token = np.array([np.array([indices for indices in cvz_sequence[doc,:].indices]) for doc in range(doc_size)])
with open('Thesis\\ETM-市长电话文本数据\\data\\seq_token.pkl', 'wb') as f:
    pickle.dump(cvz_sequence_token, f)
cvz_sequence_value = np.array([np.array([value for value in cvz_sequence[doc,:].data]) for doc in range(doc_size)])
with open('Thesis\\ETM-市长电话文本数据\\data\\seq_value.pkl', 'wb') as f:
    pickle.dump(cvz_sequence_value, f)
del cvz_sequence
del cvz_sequence_token
del cvz_sequence_value

# 5 把预训练词向量与本地词典做比较，若本地检索不到则随机赋值，将比对后的预训练词向量保存
with open('Thesis\\ETM-市长电话文本数据\\pred_embedding_baidu\\vocab.pkl', 'rb') as f:
    vocab_pred = pickle.load(f)
with open('Thesis\\ETM-市长电话文本数据\\pred_embedding_baidu\\vector.pkl', 'rb') as f:
    vector_pred = pickle.load(f)
pre_embedding = dict([(word,value) for word,value in zip(vocab_pred,vector_pred)])
vocab = [word for word in word2id]

embedding = np.zeros((len(vocab),300))
for i,word in enumerate(vocab):
    if word in vocab_pred:
        embedding[i] = pre_embedding[word]
    else:
        embedding[i] = np.random.uniform(-0.1, 0.1, 300)

with open('Thesis\\ETM-市长电话文本数据\\pred_embedding_baidu\\pretrained_embeddings.pkl', 'wb') as f:
    pickle.dump(embedding,f)


