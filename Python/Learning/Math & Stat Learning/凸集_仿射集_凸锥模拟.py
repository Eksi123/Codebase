"""
点的坐标
p1: (1,2)
p2: (2,5)
p3: (3,3)
"""

import matplotlib.pyplot as plt
import numpy as np

# 散点
X = [1, 2, 3]
Y = [2, 5, 3]
plt.scatter(X,Y)
plt.show()

# 凸集
XX = []
YY = []
for i in range(100000):
    theta1 = np.random.uniform(0,1,1)
    theta2 = np.random.uniform(0,1-theta1,1)
    theta3 = 1-theta1-theta2

    XX.append(1*theta1+2*theta2+3*theta3)
    YY.append(2*theta1+5*theta2+3*theta3)

plt.scatter(XX,YY)
plt.show()

# 仿射集
XX = []
YY = []
for i in range(100000):
    theta1 = np.random.uniform(-1000,1000,1)
    theta2 = np.random.uniform(-1000,1000,1)
    theta3 = 1-theta1-theta2

    XX.append(1*theta1+2*theta2+3*theta3)
    YY.append(2*theta1+5*theta2+3*theta3)

plt.scatter(XX,YY)
plt.show()


# 凸锥
XX = []
YY = []
for i in range(100000):
    theta1 = np.random.uniform(0,100,1)
    theta2 = np.random.uniform(0,100,1)
    theta3 = np.random.uniform(0,100,1)

    XX.append(1*theta1+2*theta2+3*theta3)
    YY.append(2*theta1+5*theta2+3*theta3)

plt.scatter(XX,YY)
plt.show()