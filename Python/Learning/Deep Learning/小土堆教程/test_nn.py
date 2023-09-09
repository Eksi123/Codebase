import torch
import torchvision.datasets
from torch import nn
from torch.utils.data import DataLoader
from torch.utils.tensorboard import SummaryWriter
class test_model(nn.Module):
    def __init__(self):
        super(test_model, self).__init__()

    def forward(self, input):
        output = input+1
        return output
class CT_model(nn.Module):
    def __init__(self):
        super(CT_model, self).__init__()
        self.conv1 = nn.Conv2d(in_channels=3,out_channels=6,kernel_size=3,stride=1,padding=0)

    def forward(self,x):
        x = self.conv1(x)
        return x
dataset = torchvision.datasets.CIFAR10("../data",train=False,transform=torchvision.transforms.ToTensor(),download=True)
dataloader = DataLoader(dataset,batch_size=64)
# test = test_model()
# output = test(torch.tensor(1.0))
test = CT_model()
print(test)

writer = SummaryWriter("lognn")
step = 0
for data in dataloader:
    imgs, target = data
    output = test(imgs)
    print(imgs.shape)
    print(output.shape)
    writer.add_images("input",imgs,step)
    output = torch.reshape(output,(-1,3,30,30))
    writer.add_images("output",output,step)
    step+=1
writer.close()