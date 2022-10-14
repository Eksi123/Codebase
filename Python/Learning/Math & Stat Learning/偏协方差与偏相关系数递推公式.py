import numpy as np

A=np.array([
    [16,3,4],
    [3,9,5],
    [4,5,9]
])

# 1
B11=A[0,0]; B12=A[0,1:]
B21=A[1:,0].reshape(2,1); B22=A[1:,1:]
print(B11,B12,B21,B22)
b22=np.linalg.inv(B22)

print(B11-np.dot(np.dot(B12,b22),B21))

# 2
B11=A[:2,:2]; B12=A[:2,2].reshape(2,1)
B21=A[2,:2].reshape(1,2); B22=A[2,2]
print(B11,B12,B21,B22)
b22=1/B22

C=B11-np.dot(np.dot(B12,b22),B21)
print(C)

D11=C[0,0]; D12=C[0,1]
D21=C[1,0]; D22=C[1,1]
d22=1/D22

print(D11-np.dot(np.dot(D12,d22),D21))

