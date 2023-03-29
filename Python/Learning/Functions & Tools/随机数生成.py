# 自定义随机数（伪随机数）产生器
xx=[1,0]
def Rand():
    xx[1]=xx[0]*45221+xx[0]*4793
    xx[0]=xx[0]*45221+453806245
    xx[1]=xx[1]+(xx[0]-xx[0]%65536)/65536
    xx[1]=xx[1]%32768; xx[0]=xx[0]%65536
    return (xx[1]*65536+xx[0])/2147483648

print(Rand())

# API-random 
# 均匀随机数
import random

print(random.randint(1,10)) # 1到10以内的整型随机数

print(random.random()) # 0到1以内的浮点型随机数

print(random.uniform(1,10)) # 1到10以内的浮点型随机数

A=[1,3,6,3,7,9,4]
print(random.choice(A)) # 从列表A内随机抽取一个元素

for i in range(5): # 指定任一随机数种子，只要种子相同，则产生的同一规格的随机数相同
    random.seed(1)
    print(random.random())

# 非均匀随机数
A,B=[],[]
for i in range(10000):
    A.append(random.normalvariate(0,1)) # 生成10000个均匀分布随机数（均值为0，方差为1）
    B.append(random.expovariate(5)) # 生成10000个指数分布随机数（lambda=5）

# API-numpy



