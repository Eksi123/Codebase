a = [1, 123 ,324 , 42]
b = [23,34 ,54]
import numpy as np
a = np.array(a)
b = np.array(b)
a = np.hstack((a,b))
print(a)