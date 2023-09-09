import torch
from torch import nn
from torch.utils.tensorboard import SummaryWriter
from torch.utils.data import DataLoader
import torchvision
datssets = torchvision.datasets.CIFAR10("../data",train=False,transform=torchvision.transforms.ToTensor(),download=True)

dataloader = DataLoader(datssets,batch_size=64)



class test_loss(nn.Module):
    def __init__(self):
        super(test_loss, self).__init__()
        self.model1 = nn.Sequential(
            nn.Conv2d(3, 32, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Conv2d(32, 32, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Conv2d(32, 64, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Flatten(),
            nn.Linear(1024, 64),
            nn.Linear(64, 10)
        )
    def forward(self,input):
        output = self.model1(input)
        return output
# L1loss 之差绝对值函数

# MSE 均方根误差

# 查看反向传播的梯度
test_lo = test_loss()

loss = nn.CrossEntropyLoss()

step = 0
for data in dataloader:
    imgs, target = data
    outputs = test_lo(imgs)
    result_loss = loss(outputs,target)
    result_loss.backward()#反向传播
    print("ok")


