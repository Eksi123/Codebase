#模拟均匀分布[0,2]的样本均值的分布

T=[]
import random
import matplotlib.pyplot as plot
for i in range(1,21):
    A=[]
    for j in range(1,21):
        A.append(random.uniform(0,2))
    T.append(sum(A)/20)
plot.hist(T)
plot.show()