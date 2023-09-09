from torchvision import transforms
from PIL import Image
from torch.utils.tensorboard import SummaryWriter
img_path = "data/hymenoptera_data/train/ants/6743948_2b8c096dda.jpg"
img_PIL = Image.open(img_path)
img_to_tensor = transforms.ToTensor()
img_tensor = img_to_tensor(img_PIL)
writer = SummaryWriter('logt')
writer.add_image("img_tensor",img_tensor,1)
# writer.close()
# P12-13 常用的tranforms
# Compose是用来把多个class的工具组合到一起的。
# 就是调用类的时候，如果有call方法，就可以用图中的第10行的方式进行调用这个Person类。用处不大，知道就行。
# 归一化class normalization
trans_norm = transforms.Normalize([0.5,0.5,0.5],[0.5,0.5,0.5])
img_tensor_norm = trans_norm(img_tensor)
writer.add_image("img_tensor_normal",img_tensor_norm,0)


# compose使用
trans_resize = transforms.Resize([128,128])

trans_compose = transforms.Compose([trans_resize,img_to_tensor])
img_tensor_resize = trans_compose(img_PIL)
writer.add_image("img_tensor_resize",img_tensor_resize,1)
writer.close()