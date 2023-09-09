#Relu 非线性激活
# inplace 是否替换输入值为输出值

import torch
import torchvision
from torch import nn
from torch.utils.tensorboard import SummaryWriter
from torch.utils.data import DataLoader
# 非线性激活层，只有一个batchsize参数需要设置

input  = torch.tensor([[1, -0.5],[-1,3]])
print(input.shape)
input = torch.reshape(input,(-1,1,2,2))
print(input.shape)
datasets = torchvision.datasets.CIFAR10("../data",train=False,transform=torchvision.transforms.ToTensor(),download=True)
dataloader = DataLoader(datasets,batch_size=64)

class test_Relu(nn.Module):
    def __init__(self):
        super(test_Relu, self).__init__()
        self.relu = nn.ReLU()
        self.sigmod = nn.Sigmoid()
    def forward(self,input):
        output = self.relu(input)
        return  output

test_relu = test_Relu()
writer = SummaryWriter(log_dir='logRelu')
step =0
for data in dataloader:
    imgs, target = data
    output = test_relu(imgs)
    writer.add_images('output',output,step)
    step += 1
writer.close()
#线性层
# 线性层：这里的线性层，跟非线性激活，形成对比：线性层，是k和b，对输入数据x，进行一次函数的处理，
# 而非线性激活（激活函数）是在对神经元或者输入，做非线性处理：
class Linear(nn.Module):
    def __init__(self):
        super(Linear, self).__init__()
        self.linear = nn.Linear(196608,10)
    def forward(self,input):
        output = self.linear(input)
        return output

for data in dataloader:
    imgs,targets = data
    output = torch.flatten(imgs)
    output = Linear(output)
    print(output.shape)

# Sequential能把网络写在一起，按顺序执行方便使用

# 写一个针对CIFAR10的分类网络
class test_Sequential(nn.Module):
    def __init__(self):
        super(test_Sequential, self).__init__()
        self.model1 = nn.Sequential(
            nn.Conv2d(3,32,5,padding=2),
            nn.MaxPool2d(2),
            nn.Conv2d(32, 32, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Conv2d(32, 64, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Flatten(),
            nn.Linear(1024,64),
            nn.Linear(64,10)
        )
    def forward(self,input):
        output = self.model1(input)
        return output
# 可视化模型
# #writer = SummaryWriter("logs_seq")
# writer.add_graph(tudui, input)
# writer.close()
