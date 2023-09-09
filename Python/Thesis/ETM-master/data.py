# import os
# import random
# import pickle
# import numpy as np
# import torch 
# from scipy.io import loadmat
# from pathlib import Path
# from sklearn.model_selection import train_test_split
# from gensim.models.fasttext import FastText as FT_gensim
# from tqdm import tqdm

# def read_mat_file(key, path):
#     """
#     read the preprocess mat file whose key and and path are passed as parameters

#     Args:
#         key ([type]): [description]
#         path ([type]): [description]

#     Returns:
#         [type]: [description]
#     """
#     term_path = Path().cwd().joinpath('data', 'preprocess', path)
#     doc = loadmat(term_path)[key]
#     # doc = h5py.File(term_path)[key]
#     return doc


# def split_train_test_matrix(dataset):
#     """Split the dataset into the train set , the validation and the test set

#     Args:
#         dataset ([type]): [description]

#     Returns:
#         [type]: [description]
#     """
#     X_train, X_test = train_test_split(dataset, test_size=0.2, random_state=1)
#     X_test_1, X_test_2 = train_test_split(X_test, test_size=0.5, random_state=1)
#     X_train, X_val = train_test_split(X_train, test_size=0.25, random_state=1) # 0.25 x 0.8 = 0.2
#     return X_train, X_val, X_test_1, X_test_2

# def get_data(doc_terms_file_name="tf_idf_doc_terms_matrix", terms_filename="tf_idf_terms"):
#     """read the data and return the vocabulary as well as the train, test and validation tests

#     Args:
#         path ([type]): [description]

#     Returns:
#         [type]: [description]
#     """
#     doc_term_matrix = read_mat_file("doc_terms_matrix", doc_terms_file_name)
#     terms = read_mat_file("terms", terms_filename)
#     vocab = terms
#     train, validation, test_1, test_2 = split_train_test_matrix(doc_term_matrix)

#     return vocab, train, validation, test_1, test_2

# def get_batch(doc_terms_matrix, indices, device):
#     """
#     get the a sample of the given indices 

#     Basically get the given indices from the dataset

#     Args:
#         doc_terms_matrix ([type]): the document term matrix
#         indices ([type]):  numpy array 
#         vocab_size ([type]): [description]

#     Returns:
#         [numpy arayy ]: a numpy array with the data passed as parameter
#     """
#     data_batch = doc_terms_matrix[indices, :]
#     data_batch = torch.from_numpy(data_batch.toarray()).float().to(device)
#     return data_batch


# def read_embedding_matrix(vocab, device,  load_trainned=True):
#     """
#     read the embedding  matrix passed as parameter and return it as an vocabulary of each word 
#     with the corresponding embeddings

#     Args:
#         path ([type]): [description]

#     # we need to use tensorflow embedding lookup heer
#     """
#     model_path = Path.home().joinpath("Projects", 
#                                     "Personal", 
#                                     "balobi_nini", 
#                                     'models', 
#                                     'embeddings_one_gram_fast_tweets_only').__str__()
#     embeddings_path = Path().cwd().joinpath('data', 'preprocess', "embedding_matrix.npy")

#     if load_trainned:
#         embeddings_matrix = np.load(embeddings_path, allow_pickle=True)
#     else:
#         model_gensim = FT_gensim.load(model_path)
#         vectorized_get_embeddings = np.vectorize(model_gensim.wv.get_vector)
#         embeddings_matrix = np.zeros(shape=(len(vocab),50)) #should put the embeding size as a vector
#         print("starting getting the word embeddings ++++ ")
#         vocab = vocab.ravel()
#         for index, word in tqdm(enumerate(vocab)):
#             vector = model_gensim.wv.get_vector(word)
#             embeddings_matrix[index] = vector
#         print("done getting the word embeddings ")
#         with open(embeddings_path, 'wb') as file_path:
#             np.save(file_path, embeddings_matrix)

#     embeddings = torch.from_numpy(embeddings_matrix).to(device)
#     return embeddings


import os
import random
import pickle
import numpy as np
import torch 
import scipy.io

# 获取文本数据BOW
def _fetch(path, name):
    if name == 'train':
        token_file = os.path.join(path, 'bow_tr_tokens.mat')
        count_file = os.path.join(path, 'bow_tr_counts.mat')
    elif name == 'valid':
        token_file = os.path.join(path, 'bow_va_tokens.mat')
        count_file = os.path.join(path, 'bow_va_counts.mat')
    else:
        token_file = os.path.join(path, 'bow_ts_tokens.mat')
        count_file = os.path.join(path, 'bow_ts_counts.mat')
    tokens = scipy.io.loadmat(token_file)['tokens'].squeeze()
    counts = scipy.io.loadmat(count_file)['counts'].squeeze()
    if name == 'test':
        token_1_file = os.path.join(path, 'bow_ts_h1_tokens.mat')
        count_1_file = os.path.join(path, 'bow_ts_h1_counts.mat')
        token_2_file = os.path.join(path, 'bow_ts_h2_tokens.mat')
        count_2_file = os.path.join(path, 'bow_ts_h2_counts.mat')
        tokens_1 = scipy.io.loadmat(token_1_file)['tokens'].squeeze()
        counts_1 = scipy.io.loadmat(count_1_file)['counts'].squeeze()
        tokens_2 = scipy.io.loadmat(token_2_file)['tokens'].squeeze()
        counts_2 = scipy.io.loadmat(count_2_file)['counts'].squeeze()
        return {'tokens': tokens, 'counts': counts, 
                    'tokens_1': tokens_1, 'counts_1': counts_1, 
                        'tokens_2': tokens_2, 'counts_2': counts_2}
    return {'tokens': tokens, 'counts': counts}

def get_data(path):
    with open(os.path.join(path, 'vocab.pkl'), 'rb') as f:
        vocab = pickle.load(f)

    train = _fetch(path, 'train')   
    valid = _fetch(path, 'valid')
    test = _fetch(path, 'test')

    return vocab, train, valid, test

def get_batch(tokens, counts, ind, vocab_size, device):
    """fetch input data by batch."""
    batch_size = len(ind)
    data_batch = np.zeros((batch_size, vocab_size))
    
    for i, doc_id in enumerate(ind):
        doc = tokens[doc_id]
        count = counts[doc_id]
        L = count.shape[1]
        if len(doc) == 1: 
            doc = [doc.squeeze()]
            count = [count.squeeze()]
        else:
            doc = doc.squeeze()
            count = count.squeeze()
        if doc_id != -1:
            for j, word in enumerate(doc):
                data_batch[i, word] = count[j]
    data_batch = torch.from_numpy(data_batch).float().to(device)
    return data_batch

