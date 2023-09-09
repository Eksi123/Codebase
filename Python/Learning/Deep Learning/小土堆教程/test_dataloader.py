from dataset import train_dataset
from torch.utils.data import DataLoader
from torch.utils.tensorboard import SummaryWriter

train_loader = DataLoader(dataset=train_dataset,batch_size=4,shuffle=True,num_workers=0)
img, target = train_dataset[0]
print(img.shape)
print(target)

writer = SummaryWriter('dataloader')
for epoch in range(2):
    step = 0
    for data in train_loader:
        imgs, targets = data
        writer.add_images("Epoch:{}".format(epoch),imgs,step)
        step = step+1

writer.close()
