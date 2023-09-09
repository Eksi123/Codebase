import torch
import torchvision.transforms
from PIL import Image
from torch import nn
from test_model import *
img_path = "./input/th.jpg"
image = Image.open(img_path)
print(image)
image = image.convert("RGB")
# transform = torchvision.transforms.Compose([torchvision.transforms.Resize((32,32)),torchvision.transforms.ToTensor()])
transform = torchvision.transforms.Compose([torchvision.transforms.ToTensor()])

image = transform(image)
print(image.shape)
image = torch.unsqueeze(image,0)
# image = torch.reshape(image,[1,3,-1,-1])
print(image.shape)

model = test_model()

if __name__ == '__main__':
    model = torch.load("../weights/model_conv10.pth",map_location=torch.device('cpu'))
    print(model)
    output = model(image)
    print(output)
