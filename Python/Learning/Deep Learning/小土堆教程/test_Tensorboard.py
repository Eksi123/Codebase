from torch.utils.tensorboard import SummaryWriter

import numpy as np
from PIL import Image
img_path = "data/hymenoptera_data/train/ants/0013035.jpg"
writer = SummaryWriter("logs")
img_PIL= Image.open(img_path)
img_np = np.array(img_PIL)
writer.add_image("ants",img_np,1,dataformats='HWC')#只接受np或者torch.tensor格式
#y=2x
for i in range(100):
    writer.add_scalar("y=2x",2*i,i)
writer.close()