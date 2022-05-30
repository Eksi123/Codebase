import scipy.integrate as spi
from scipy.signal import savgol_filter
import numpy as np
import pylab as pl
import math
 
# 模拟SIR模型求解常数c1
beta=1.46 # 每周平均接触率
gamma=1.3 # 每周平均移出率
TS=1.0 # 时间间隔
ND=9 # 终止时间
S0=0.999 # 初始s0
I0=0.001 # 初始i0
INPUT = (S0, I0, 0.0)
 
def diff_eqs(INP,t): # 微分方程
	'''The main set of equations'''
	Y=np.zeros((3))
	V = INP
	Y[0] = - beta * V[0] * V[1]
	Y[1] = beta * V[0] * V[1] - gamma * V[1]
	Y[2] = gamma * V[1]
	return Y   # For odeint
 
t_start = 0.0; t_end = ND; t_inc = TS
t_range = np.arange(t_start, t_end+t_inc, t_inc) # 时间序列
RES = spi.odeint(diff_eqs,INPUT,t_range) # 求解微分方程，返回三种群体的比例

Infected=1000*np.array(RES[:,1]+RES[:,2]) # 模拟感染+移出数
Infected=savgol_filter(Infected,9,3,mode="nearest") # 数据平滑
real_Infected=np.array([1,3,4,7,10,17,21,24,25]) # 真实感染+移出数
real_Infected=savgol_filter(real_Infected,9,3,mode="nearest") # 数据平滑

pl.plot(Infected, label='Infectious',color="red")
pl.plot(real_Infected, label='real_Infectious',color="blue")
pl.title('SIR_Model')
pl.xlabel('Time')
pl.ylabel('Infectious')
pl.legend()
pl.show()


# 比较不同扑杀半径r情形下的扑杀数随时间的变化（扑杀半径1-5公里，间隔为1公里）
r=[1,2,3,4,5] # 扑杀半径
Beta=[] # 平均接触率（考虑不同扑杀半径）
for i in range(5): 
    Beta.append(2.53/math.sqrt(r[i]))
gamma=1.3 # 平均移出率
TS=1.0 # 时间间隔
ND=9 # 终止时间
S0=0.999 # 初始s0
I0=0.001 # 初始i0
INPUT = (S0, I0, 0.0)

RES=[]
for i in range(5):
    def diff_eqs(INP,t): # 微分方程
        '''The main set of equations'''
        Y=np.zeros((3))
        V = INP
        Y[0] = - Beta[i] * V[0] * V[1]
        Y[1] = Beta[i] * V[0] * V[1] - gamma * V[1]
        Y[2] = gamma * V[1]
        return Y   # For odeint

    t_start = 0.0; t_end = ND; t_inc = TS
    t_range = np.arange(t_start, t_end+t_inc, t_inc) # 时间序列
    res = spi.odeint(diff_eqs,INPUT,t_range) # 求解微分方程，返回三种群体的比例
    RES.append(res)

real_Culled=np.array([28783,48379,49948,97525,113948,222160,369930,372550,374230]) # 真实扑杀数
real_Culled=savgol_filter(real_Culled,9,3,mode="nearest") # 数据平滑

pl.plot(real_Culled,  label='real_Culled',color="blue")
pl.title('SIR_Model')
pl.xlabel('Time')
pl.ylabel('Cull')

col=["yellow","orange","pink","red","purple"]
for i in range(5):
    Culled=1000*np.array(RES[i][:,1]+RES[i][:,2])*1666.67*(i+1)*(i+1) # 模拟扑杀数
    print((RES[i][:,1]+RES[i][:,2])*1000)
    Culled=savgol_filter(Culled,9,3,mode="nearest") # 数据平滑
    pl.plot(Culled, label='Culled--'+str(r[i])+"km",color=col[i])

pl.legend()
pl.show()
