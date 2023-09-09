# 加载python模块
import jieba  # 分词模块
import string # 标点符号
from gensim.corpora import Dictionary # 词典生成
import numpy as np
import pickle
stopwords1 = open('Thesis/ETM-市长电话文本数据/stopwords/stopwords.txt','r',encoding='utf-8').read()
stopwords2 = open('Thesis/ETM-市长电话文本数据/stopwords/stopwords_supplement.txt','r',encoding='utf-8').read()

# 1 加载2005年“行政服务”数据文档（除标点符号外，暂不去停用词）
docs = [] # 文档列表
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_DanZi.txt') # 加载词典
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_DM_changchun.txt')
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_JiChu.txt')
# jieba.load_userdict('Thesis/ETM-市长电话文本数据/word_dict/CK_xingshi.txt')
with open('Thesis/data/服务态度与质量（二级行业）/2020.txt','r',encoding='utf-8') as f:
    while True:
        text = f.readline().rstrip()
        if not text:
            break
        text = jieba.lcut(text, cut_all=False, use_paddle=True, HMM=True) # 分词
        text = [word for word in text if word not in string.punctuation] # 去除标点符号（类似可用于去除停用词）
        docs.append(text)
doc_size = len(docs) # 文档数量

# 2 构建双向词典
dictionary = Dictionary(docs)
word2id = dictionary.token2id
id2word = {v:k for k,v in word2id.items()}


# 3 把词典和词序列写入文件并保存
# 词典
with open('Thesis\\ETM-市长电话文本数据\\word_dict\\word2id.pkl', 'wb') as f:
    pickle.dump(word2id, f)
with open('Thesis\\ETM-市长电话文本数据\\word_dict\\id2word.pkl', 'wb') as f:
    pickle.dump(id2word, f)

# 词序列（分为token/单词，value/计数两部分）
Seq_Token,Seq_Value = [],[]
for doc in docs:
    token_value = dictionary.doc2bow(doc)
    Seq_Token.append(np.array([p[0] for p in token_value]))
    Seq_Value.append(np.array([p[1] for p in token_value]))
Seq_Token,Seq_Value = np.array(Seq_Token),np.array(Seq_Value)

with open('Thesis\\ETM-市长电话文本数据\\data\\seq_token.pkl', 'wb') as f:
    pickle.dump(Seq_Token, f)
with open('Thesis\\ETM-市长电话文本数据\\data\\seq_value.pkl', 'wb') as f:
    pickle.dump(Seq_Value, f)
del Seq_Token
del Seq_Value

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


