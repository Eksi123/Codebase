# 爬虫基础-爬取文字
from urllib.request import Request
import requests    # 导入爬虫模块
from bs4 import BeautifulSoup
"""
假定我们的目标是爬取小白盘网站首页的推荐书籍书名，并将其导入至EXCEL中
目标网址:https://www.xiaobaipan.com/
查看robot协议: 点击https://www.xiaobaipan.com/robots.txt可访问网址源文件根目录中robots声明，一般不允许商业爬虫，个人
用于学习研究影响不大。
打开网址html源码:点击f12 -> elements或元素，利用左上角导航箭头，可用于定位
"""
res = requests.get("https://www.xiaobaipan.com")  # 以国家统计局2021国内生产总值为例，向服务器发出请求并捕捉响应
# print(res.status_code)  返回结果为200表示请求成功
# print(res.text)  返回html标记语言
html=BeautifulSoup(res.text,"html.parser") # 解析html标记语言
# print(html) 内容与上一条输出信息相同，只是变成了解析后的html
"""
对于最常见的爬虫技术来说，其基本原理十分简单，就是从解析后的html中寻找，定位，抓取我们想要的内容，以文本内容为例，
鉴于html语言的分层特点，可以利用find()【寻找满足条件的第一个】和find_all【寻找满足条件的全部】层层定位，或者快速
定位文本内容所在位置，其中两个函数的参数均为"("标签","对应标签的属性")
"""
tag1=html.find("div",class_="main-container")
tag2=tag1.find_all("h6")
file= open("book_name.txt","w",encoding="utf-8")  # 将爬取的内容写入txt文件
for tag in tag2:
    tag_root=tag.find("a")  # tag_root指不可再展开的html标签，即根标签
    # file.write(tag_root["title"][:-5]+"\n") # tag_root["title"]用来提取标签的"title"属性值
    file.write(tag_root.text.strip()+"\n") # tag_root.text用来提取标签内的text文本内容，效果与上述方法一致
file.close()


# 爬取图片
import requests    # 导入爬虫模块
import os  # 导入OS文件处理模块
from bs4 import BeautifulSoup

path="C:/Users/熊高庆/Desktop/项目文件/Python/Python程序/Learning/Functions/images"  # 判断该路径下文件夹images是否存在
if not os.path.exists(path):  # 不存在则创建一个新文件images
    os.mkdir(path)

res=requests.get("https://www.xiaobaipan.com/list-SPSS.html?from=1") 
html=BeautifulSoup(res.text,"html.parser")
tags=html.find_all("img")  # 直接暴力搜索标签"img"   
img_url=[] 
for tag in tags:
    img_url.append(tag["src"])  # 以上操作类比文字爬虫，仅仅从爬取文字转而为url链接,然后将图片URL链接保存在列表Url中

for i in range(len(img_url)):
    try:   # try……except语句用来避免程序因某个子操作异常而终止          
        res=requests.get(img_url[i])  # 针对图片网络链接发出新的请求
        new_url=path+"/"+img_url[i].split("/")[-1]  # 将网络链接改为本地链接
        file=open(new_url,"wb")  # 创建本地链接，用二进制形式保存图片信息
        file.write(res.content)
        print("爬取成功")
    except Exception:
        print("爬取失败")

"""
各页链接:
url_j="https://www.xiaobaipan.com/"+"list-数学分析-p"+"j"+".html"
"""


# 爬取视频
"""
随着网页制作中Ajax技术的发展，制作者往往会利用json文件来封装部分html源码以加快网页的刷新，因此我们直接利用requests获取
的html源码并不完整，自然也就无法找到对应资源（如文字，图片，视频）的内容或链接。一般来说，有两种常用的方法来解决这一问题:
（1）模拟Chrome浏览器来访问网页。（2）将json文件中解析为字典，并从中找到资源内容或链接。本文主要介绍第二种
"""

import requests # 导入爬虫模块
import os  # 导入OS文件处理模块
import time  # 导入time系统时间模块
import json # 导入json模块
from bs4 import BeautifulSoup

path="C:/Users/熊高庆/Desktop/项目文件/Python/Python程序/Learning/Functions/videos"  # 判断该路径下文件夹videos是否存在
if not os.path.exists(path):  # 不存在则创建一个新文件videos
    os.mkdir(path)

header={
    "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36"
} # 类似的，还可以添加cookie等信息，不过一般user-agent够用

Request_URL="https://haokan.baidu.com/videoui/api/videorec?title=%E6%98%AF%E4%BB%80%E4%B9%88%E8%AF%B1%E5%8F%91%E5%BF%83%E6%A2%97%EF%BC%9F80%25%E7%9A%84%E4%BA%BA%E5%81%9A%E4%BA%86%E8%BF%99%E4%BB%B6%E4%BA%8B%EF%BC%81%E7%8E%B0%E5%9C%A8%E6%94%B9%E8%BF%98%E6%9D%A5%E5%BE%97%E5%8F%8A&vid=10574496528365121007&act=pcRec&pd=pc"
res=requests.get(Request_URL,headers=header) # 找到XHR中视频的json链接（可以逐个preview预览排查）
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
        file=open(new_url,"wb")  
        file.write(res.content) # 用二进制形式保存视频信息
        print("爬取成功")
    except Exception:
        print("爬取失败")

    time.sleep(2) # 每爬取完一次，程序暂停两秒再执行



    