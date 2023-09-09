from torch import nn
import torchvision.datasets
from torch.utils.data import DataLoader
from torch.utils.tensorboard import SummaryWriter

class test_pool(nn.Module):
    def __init__(self):
        super(test_pool, self).__init__()
        self.poll = nn.MaxPool2d(kernel_size=3,ceil_mode=True)
    # polling kenersize 与 stride 一样的大小
    def forward(self,x):
        x = self.poll(x)
        return x

datasets = torchvision.datasets.CIFAR10("../data",train=False,transform=torchvision.transforms.ToTensor(),download=True)
dataloader = DataLoader(datasets,batch_size=64)

writer = SummaryWriter(log_dir="logpoll")

test_p = test_pool()
step = 0
for data in dataloader:
    imgs, targets = data
    output = test_p(imgs)
    print(imgs.shape)
    print(output.shape)
    writer.add_images("input",imgs,step)
    writer.add_images("Polling_output",output,step)
    step+=1
writer.close()