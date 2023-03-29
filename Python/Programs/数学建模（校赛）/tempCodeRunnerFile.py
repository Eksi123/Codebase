# 混合高斯模型（以一维两高斯混合模型为例）
import numpy as np

def Gaussian(x, mu, sigma): # 计算高斯分布密度
    GaussianP = (1/(sigma * np.sqrt(2 * np.pi)))*(np.exp(-1 * np.square(x - mu)/(2 * np.square(sigma))))
    return GaussianP

def EM_Algorithm(Data,theta,times): # EM算法
    """
    输入样本数据Data和迭代参数theta=[pi,mu1,sigma1,mu2,sigma2]
    """
    def E_step(x,theta): # E步，计算pi的期望值（进而可知Q函数）
        exp_pi = theta[0]*Gaussian(x,theta[1],theta[2])+(1-theta[0])*Gaussian(x,theta[3],theta[4])
        exp_pi1 = (theta[0]*Gaussian(x,theta[1],theta[2]))/exp_pi
        exp_pi2 = (1-theta[0])*Gaussian(x,theta[3],theta[4])/exp_pi
        return(exp_pi1, exp_pi2)
    
    def M_step(Data,theta): # M步，根据优化计算结果更新参数
        theta_new = []
        length = len(Data)
        sum_exp_pi1,sum_exp_pi2 = 0,0; sum11,sum12 = 0,0; sum21,sum22 = 0,0
        for i in range(length):
            sum_exp_pi1 =  sum_exp_pi1+E_step(Data[i],theta)[0]
            sum_exp_pi2 =  sum_exp_pi2+E_step(Data[i],theta)[1]
            sum11 = sum11+E_step(Data[i],theta)[0]*Data[i]
            sum21 = sum21+E_step(Data[i],theta)[1]*Data[i]
            sum12 = sum12+E_step(Data[i],theta)[0]*(Data[i]-theta[1])*(Data[i]-theta[1])
            sum22 = sum12+E_step(Data[i],theta)[1]*(Data[i]-theta[3])*(Data[i]-theta[3])
        theta_new.append(sum_exp_pi1/length)
        theta_new.append(sum11/sum_exp_pi1)
        theta_new.append(np.sqrt(sum12/sum_exp_pi1))
        theta_new.append(sum21/sum_exp_pi2)
        theta_new.append(np.sqrt(sum12/sum_exp_pi2))
        return theta_new
    
    for j in range(times): # 迭代计算，直至达到预定次数
        theta = M_step(Data,theta)
    return theta

Data = np.array([-67,-48,6,8,14,16,23,24,28,29,41,49,56,60,75]) # 输入数据
Theta = np.array([0.4,0,100,0,200])
theta_new = EM_Algorithm(Data,Theta,100)
print(theta_new)