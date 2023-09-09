import torch
from torch import nn
from torch.utils.tensorboard import SummaryWriter
from torch.utils.data import DataLoader
import torchvision
datssets = torchvision.datasets.CIFAR10("../data",train=False,transform=torchvision.transforms.ToTensor(),download=True)

dataloader = DataLoader(datssets,batch_size=64)



class test_optim(nn.Module):
    def __init__(self):
        super(test_optim, self).__init__()
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


loss = nn.CrossEntropyLoss()
test_optims = test_optim()
optim = torch.optim.SGD(test_optims.parameters(),lr=0.01)
for epoch in range(20):
    running_loss = 0.0
    step = 0
    for data in dataloader:
        imgs, target = data
        outputs = test_optims(imgs)
        result_loss = loss(outputs,target)
        optim.zero_grad()#上次梯度清0
        result_loss.backward()#反向传播
        optim.step()
        running_loss = running_loss+result_loss
        # print("ok")
    print(running_loss)

