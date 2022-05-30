class Check:   # 用于判断走位的正确性
    def __init__(self,n,m,x,y):
        self.n=n
        self.m=m
        self.x=x
        self.y=y
        self.A=[]  
        for i in range(self.n): # 规划棋盘
            self.A.append([])
            for j in range(self.m):
                self.A[i].append(0)

    def check(self):
        if (self.x<1 or self.x>self.m) or (self.y<1 or self.y>self.n) or self.A[self.x-1][self.y-1]!=0:
            return False
        return True

class Run(Check): # 用于递归走位
    def __init__(self, n, m, x, y):
        super().__init__(n, m, x, y)
        self.step=None
        self.D_x=[-2,-2,2,2,1,-1,1,-1]
        self.D_y=[1,-1,1,-1,-2,-2,2,2]

    def run(self):
        for i in range(8):
            if self.check():
                self.A[self.x-1][self.y-1]=self.step
                if self.step==self.n*self.m:
                    return self.A
                else:
                    self.step=self.step+1
                    self.run()
                    self.step=self.step-1
                    self.A[self.x-1][self.y-1]=0
            else:
                self.x=self.x-self.D_x[i]; self.y=self.y-self.D_y[i]

class Game(Run):   #   用于初始化棋盘和起始点，并输出路线
    def __init__(self, n, m, x, y):
        super().__init__(n, m, x, y)
        self.A[self.x-1][self.y-1]=1
        self.step=2
        
    def game(self):
        if self.run()!=None:
            for i in range(len(self.A)):
                print("\t".join(self.A[i]))
        else:
            print("try again!")

p=Game(5,5,1,1)
p.run()
