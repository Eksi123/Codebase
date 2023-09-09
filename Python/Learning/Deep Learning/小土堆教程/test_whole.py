import torch
from torch import nn
from torch.utils.tensorboard import SummaryWriter
from torch.utils.data import DataLoader
import torchvision
from test_model import *
# 启用GPU
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
#导入数据集
train_datasets = torchvision.datasets.CIFAR10("../data",train=True,transform=torchvision.transforms.ToTensor(),download=True)
test_datasets = torchvision.datasets.CIFAR10("../data",train=False,transform=torchvision.transforms.ToTensor(),download=True)
tran_size = len(train_datasets)
test_size = len(test_datasets)
print("train : {}".format(tran_size))
print("train : {}".format(test_size))
#加载
train_loader = DataLoader(train_datasets, batch_size=64)
test_loader = DataLoader(test_datasets, batch_size=64)

#创建模型
model = test_model()
model = model.to(device)
#损失函数
loss_fn = nn.CrossEntropyLoss()
loss_fn = loss_fn.to(device)
#优化器
learning_rate = 1e-05
optimizer = torch.optim.Adam(params=model.parameters(),lr=learning_rate)

total_train_step = 0
total_test_step = 0
#训练次数
epoch = 20

#tensorboard
writer = SummaryWriter(log_dir='log_whole')

for i in range(1, epoch+1):
    print("第{}论训练开始".format(i))
    #训练开始
    model.train()
    for data in train_loader:
        imgs , targets = data
        imgs = imgs.to(device)
        targets = targets.to(device)
        output = model(imgs)
        loss = loss_fn(output,targets)
        #优化器
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        total_train_step += 1
        if total_train_step % 100 == 0:
            print("训练次数{}，loss:{}".format(total_train_step,loss.item()))
            writer.add_scalar('train_loss',loss,total_train_step)
    #测试开始
    model.eval()
    total_test_loss = 0
    total_accuracy = 0
    with torch.no_grad():
        for data in test_loader:
            imgs, targets = data
            imgs = imgs.to(device)
            targets = targets.to(device)
            output = model(imgs)
            loss = loss_fn(output,targets)
            total_test_loss = total_test_loss + loss.item()
            accuracy = (output.argmax(1) == targets).sum() # 0或1表示方向，1为横向比较大小# 1：横向比较，==：True或False，sum：计算True或False个数
            total_accuracy = total_accuracy + accuracy
    writer.add_scalar("test_total_loss",total_test_loss,total_test_step)
    print("整体测试集上得loss : {}".format(total_test_loss))
    print("整体测试集上的正确率:{}".format(total_accuracy / test_size))
    writer.add_scalar("test_accuracy",total_accuracy / test_size,total_test_step)
    total_test_step += 1
    if i % 10 == 0:
        # torch.save(model,"./weights/model_conv{}.pth".format(i))
        print("模型已保存")
writer.close()
