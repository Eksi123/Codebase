import requests # 导入爬虫模块
import os  # 导入OS文件处理模块
import json # 导入json模块
from bs4 import BeautifulSoup

path="C:/Users/熊高庆/Desktop/项目文件/Python/Python程序/Learning/Functions/videos"  # 判断该路径下文件夹videos是否存在
if not os.path.exists(path):  # 不存在则创建一个新文件videos
    os.mkdir(path)

Request_URL="https://haokan.baidu.com/videoui/api/videorec?title=%E6%98%AF%E4%BB%80%E4%B9%88%E8%AF%B1%E5%8F%91%E5%BF%83%E6%A2%97%EF%BC%9F80%25%E7%9A%84%E4%BA%BA%E5%81%9A%E4%BA%86%E8%BF%99%E4%BB%B6%E4%BA%8B%EF%BC%81%E7%8E%B0%E5%9C%A8%E6%94%B9%E8%BF%98%E6%9D%A5%E5%BE%97%E5%8F%8A&vid=10574496528365121007&act=pcRec&pd=pc"
res=requests.get(Request_URL) # 找到XHR中视频的json链接（可以逐个preview预览排查）
# print(res.text) 打印出来，我们会发现这是一个json文件
json=json.loads(res.text) # 将上述json文件解析为字典
video_list=json["data"]["response"]["videos"] # 根据preview预览的字典结构进行拆分，找到最底层视频所在的列表
for i in range(5):
    # print(video_list[i],"\n") 打印列表内各个元素，我们会看到每一个视频的信息，它们是以字典的形式存在
    video_url=video_list[i]["play_url"]  # 找到视频的网络链接
    video_name=video_list[i]["title"]+".mp4"  # 将视频重命名
    try:           
        res=requests.get(video_url)  
        new_url=path+"/"+video_name # 将网络链接改为本地链接
        file=open(new_url,"wb")  # 创建本地链接，用二进制形式保存图片信息
        file.write(res.content)
        print("爬取成功")
    except Exception:
        print("爬取失败")