import numpy as np
def Gaussian(x, mu, sigma): # 计算高斯分布密度
    GaussianP = (1/(sigma * np.sqrt(2 * np.pi)))*(np.exp(-1 * np.square(x - mu)/(2 * np.square(sigma))))
    return GaussianP

print(Gaussian(0,0,1))
print((1/np.sqrt(2*np.pi)))