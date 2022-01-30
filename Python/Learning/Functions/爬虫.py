# 爬虫基础
import requests    # 导入爬虫库
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


# 爬取图片与视频