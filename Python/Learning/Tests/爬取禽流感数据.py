# 爬取禽流感数据
from urllib.request import Request
import requests   
from bs4 import BeautifulSoup

res = requests.get("https://home.kahis.go.kr/home/lkntscrinfo/selectLkntsOccrrncList.do")  # 以国家统计局2021国内生产总值为例，向服务器发出请求并捕捉响应
html=BeautifulSoup(res.text,"html.parser") 

tag1=html.find("body")
tag2=tag1.find("div",class_="oldtable")
tag3=tag2.find("td",class_="list_g_line")
print(tag3)