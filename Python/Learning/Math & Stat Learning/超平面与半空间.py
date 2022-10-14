"""
a: (2,3)
b = 2
超平面：{x|t(a)*x = b}
半空间：{x|t(a)*x <= b}
"""

import numpy as np
import matplotlib.pyplot as plt

X1 = []; X2 = []
Y1 = []; Y2 = []
for i in range(100000):
    x = np.random.uniform(-10,10,1)
    y = np.random.uniform(-10,10,1)
    if abs(2*x+3*y-2) < 0.1:
        X1.append(x)
        Y1.append(y)
    if 2*x+3*y-2<0:
        X2.append(x)
        Y2.append(y)
plt.scatter(X1,Y1)  # 超平面
plt.show()
plt.scatter(X2,Y2)  # 半空间
plt.show()