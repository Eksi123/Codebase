import torch
from torch import nn

# 实现任意图像大小输入-全连接层自动计算
# 实现任意图像大小输入-使用卷积层替代全连接层
# class test_model(nn.Module):
#     def __init__(self):
#         super(test_model, self).__init__()
#         self.model1 = nn.Sequential(
#             nn.Conv2d(3, 32, 5, padding=2),
#             nn.MaxPool2d(2),
#             nn.Conv2d(32, 32, 5, padding=2),
#             nn.MaxPool2d(2),
#             nn.Conv2d(32, 64, 5, padding=2),
#             nn.MaxPool2d(2),
#             nn.Flatten(),
#             nn.Linear(1024, 64),
#             nn.Linear(64, 10)
#         )
#     def forward(self,input):
#         output = self.model1(input)
#         return output

# class test_model(nn.Module):
#     def __init__(self):
#         super(test_model, self).__init__()
#         self.model1 = nn.Sequential(
#             nn.Conv2d(3, 32, 5, padding=2),
#             nn.MaxPool2d(2),
#             nn.Conv2d(32, 32, 5, padding=2),
#             nn.MaxPool2d(2),
#             nn.Conv2d(32, 64, 5, padding=2),
#             nn.MaxPool2d(2),
#             nn.Flatten(),
#             # nn.Linear(1024, 64),
#             # nn.Linear(64, 10)
#         )
#     def forward(self,input):
#         output = self.model1(input)
#         output = output.view(output.size(0), -1)  # (batch_size,size(1)*size(2))
#         output = nn.Linear(output.shape[1],10)(output)
#         return output


class test_model(nn.Module):
    def __init__(self):
        super(test_model, self).__init__()
        self.model1 = nn.Sequential(
            nn.Conv2d(3, 32, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Conv2d(32, 32, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Conv2d(32, 64, 5, padding=2),
            nn.MaxPool2d(2),
            nn.Dropout(0.5),
            nn.AdaptiveAvgPool2d((1,1)),
            nn.Conv2d(64, 10, 1),
            nn.Flatten()
            # nn.Linear(1024, 64),
            # nn.Linear(64, 10)
        )
    def forward(self,input):
        output = self.model1(input)
        return output

if __name__ == '__main__':
    test = test_model()
    print(test)
    input = torch.ones([64,3,22,64])
    output = test(input)
    print(output.shape)