# import os
# import random
# import numpy as np
# from PIL import Image
# import torchvision.transforms as transforms
# from degradation.degradation import Degradation
# from utils import check_image_file
#
#
# # 데이터 셋 생성 클래스
# class Dataset(object):
#     def __init__(self, images_dir, image_size, upscale_factor):
#         deg = Degradation()
#         self.filenames = [
#             os.path.join(images_dir, x)
#             for x in os.listdir(images_dir)
#             if check_image_file(x)
#         ]
#         self.lr_transforms = transforms.Compose(
#             [
#                 transforms.ToPILImage(),
#                 transforms.Lambda(deg.degradation_pipeline),
#                 transforms.ToTensor(),
#             ]
#         )
#         self.hr_transforms = transforms.Compose(
#             [
#                 transforms.RandomCrop((image_size, image_size)),
#                 transforms.RandomHorizontalFlip(),
#                 transforms.RandomVerticalFlip(),
#                 transforms.ToTensor(),
#             ]
#         )
#
#     # lr & hr 이미지를 읽고 크롭하여 lr & hr 이미지를 반환하는 함수
#     def __getitem__(self, idx):
#         b = Image.open(self.filenames[idx])
#         # L代表转换为灰度图
#         if b.mode != 'L':
#             L = b.convert('L')
#         L = L.convert('RGB')
#         # 将图像转为数组
#         rgb_array = np.asarray(L)
#         # 将数组转换为图像
#         rgb_image = Image.fromarray(rgb_array)
#         hr = self.hr_transforms(rgb_image.convert("RGB"))
#         lr = self.lr_transforms(hr)
#         return lr, hr
#
#     def __len__(self):
#         return len(self.filenames)

from torch.utils.data import Dataset
import cv2
from PIL import Image
import os
import torchvision
transform = torchvision.transforms.ToTensor()
class MyData(Dataset):

    def __init__(self,root_dir, label_dir, transform=None):
        self.root_dir = root_dir
        self.label_dir = label_dir
        self.path = os.path.join(root_dir,label_dir)
        self.img_path = os.listdir(self.path)
        self.transform = transform
    def __getitem__(self, idx):
        img_name = self.img_path[idx]
        img_item_path = os.path.join(self.root_dir,self.label_dir,img_name)
        img = Image.open(img_item_path)
        label = self.label_dir
        if self.transform:
            img = self.transform(img)
        return img, label

    def __len__(self):
        return len(self.img_path)

root_dir = "data/hymenoptera_data/train"
ants_label_dir = "ants"
bees_label_dir = "bees"

ants_dataset = MyData(root_dir,ants_label_dir,transform=transform)
bees_dataset = MyData(root_dir,bees_label_dir,transform=transform)

train_dataset = ants_dataset + bees_dataset
# +号可以将两个数据集进行拼接，适用于需要扩充数据集时