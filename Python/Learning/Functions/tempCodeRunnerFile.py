from scipy.integrate import quad

def f(x):
  return (1-x**2)**0.5
value,I=quad(f,-1,1)
print(value)