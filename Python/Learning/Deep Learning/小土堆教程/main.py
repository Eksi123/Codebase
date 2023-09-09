import argparse

import torch
import torch.nn as nn
from pip._internal.cli.cmdoptions import progress_bar
from torch import log10


class Net(torch.nn.Module):
    def __init__(self, num_channels, base_filter, upscale_factor=2):
        super(Net, self).__init__()

        self.layers = torch.nn.Sequential(
            nn.Conv2d(in_channels=num_channels, out_channels=base_filter, kernel_size=9, stride=1, padding=4, bias=True),
            nn.ReLU(inplace=True),
            nn.Conv2d(in_channels=base_filter, out_channels=base_filter // 2, kernel_size=1, bias=True),
            nn.ReLU(inplace=True),
            nn.Conv2d(in_channels=base_filter // 2, out_channels=num_channels * (upscale_factor ** 2), kernel_size=5, stride=1, padding=2, bias=True),
            nn.PixelShuffle(upscale_factor)
        )

    def build_model(self):
        self.model = Net(num_channels=1, base_filter=64, upscale_factor=self.upscale_factor).to(self.device)
        self.model.weight_init(mean=0.0, std=0.01)
        self.criterion = torch.nn.MSELoss()
        torch.manual_seed(self.seed)

    def train(self):
        self.model.train()
        train_loss = 0
        for batch_num, (data, target) in enumerate(self.training_loader):
            data, target = data.to(self.device), target.to(self.device)
            self.optimizer.zero_grad()
            loss = self.criterion(self.model(data), target)
            train_loss += loss.item()
            loss.backward()
            self.optimizer.step()
            progress_bar(batch_num, len(self.training_loader), 'Loss: %.4f' % (train_loss / (batch_num + 1)))
        print("    Average Loss: {:.4f}".format(train_loss / len(self.training_loader)))

    def test(self):
            self.model.eval()
            avg_psnr = 0

            with torch.no_grad():
                for batch_num, (data, target) in enumerate(self.testing_loader):
                    data, target = data.to(self.device), target.to(self.device)
                    prediction = self.model(data)
                    mse = self.criterion(prediction, target)
                    psnr = 10 * log10(1 / mse.item())
                    avg_psnr += psnr
                    progress_bar(batch_num, len(self.testing_loader), 'PSNR: %.4f' % (avg_psnr / (batch_num + 1)))

            print("    Average PSNR: {:.4f} dB".format(avg_psnr / len(self.testing_loader)))
# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='PyTorch Super Res Example')
    parser.add_argument('--batchSize', type=int, default=8, help='training batch size')
    parser.add_argument('--testBatchSize', type=int, default=8, help='testing batch size')
    parser.add_argument('--nEpochs', type=int, default=20, help='number of epochs to train for')
    parser.add_argument('--lr', type=float, default=0.01, help='Learning Rate. Default=0.01')
    parser.add_argument('--seed', type=int, default=123, help='random seed to use. Default=123')

    parser.add_argument('--upscale_factor', '-uf', type=int, default=4, help="super resolution upscale factor")
    parser.add_argument('--model', '-m', type=str, default='srcnn', help='choose which model is going to use')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
