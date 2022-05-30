from pyecharts import Map
import pandas as pd
import numpy as np

area = ["北京","天津","河北","山西","内蒙古","辽宁","吉林","黑龙江","上海","江苏","浙江","安徽",
"福建","江西","山东","河南","湖北","湖南","广东","广西","海南","重庆","四川","贵州","云南",
"西藏","陕西","甘肃","青海","宁夏","新疆"]

data1=pd.DataFrame(pd.read_csv("DEI_JCJS.csv",header=0,encoding="utf8")) # 基础建设指数
data2=pd.DataFrame(pd.read_csv("DEI_JSTR.csv",header=0,encoding="utf8")) # 技术投入指数
data3=pd.DataFrame(pd.read_csv("DEI_CYFZ.csv",header=0,encoding="utf8")) # 产业发展指数

# 基础建设指数
value0 = np.array(data1["2017"].values+data1["2018"].values+data1["2019"].values+data1["2020"].values)/4
value=[] # 基础建设指数level
for i in range(31):
    if value0[i]<=np.percentile(value0,20):
        value.append(1)
    elif value0[i]<=np.percentile(value0,40):
        value.append(2)
    elif value0[i]<=np.percentile(value0,60):
        value.append(3)
    elif value0[i]<=np.percentile(value0,80):
        value.append(4)
    else:
        value.append(5)

map = Map("2017-2020平均发展水平", width=1000, height=800)
map.add("",area,value,is_map_symbol_show=True,maptype="china", is_visualmap=True, visual_text_color='#000',is_label_show=True, visual_range=[np.min(value),np.max(value)])
map.render()#结果导出.html
print("DONE!")#程序结束提示。

# 技术投入指数
value0 = np.array(data2["2017"].values+data2["2018"].values+data2["2019"].values+data2["2020"].values)/4
value=[] # 技术投入指数level
for i in range(31):
    if value0[i]<=np.percentile(value0,20):
        value.append(1)
    elif value0[i]<=np.percentile(value0,40):
        value.append(2)
    elif value0[i]<=np.percentile(value0,60):
        value.append(3)
    elif value0[i]<=np.percentile(value0,80):
        value.append(4)
    else:
        value.append(5)

map = Map("2017-2020平均发展水平", width=1000, height=800)
map.add("",area,value,is_map_symbol_show=True,maptype="china", is_visualmap=True, visual_text_color='#000',is_label_show=True, visual_range=[np.min(value),np.max(value)])
map.render()#结果导出.html
print("DONE!")#程序结束提示。

# 产业发展指数
value0 = np.array(data3["2017"].values+data3["2018"].values+data3["2019"].values+data3["2020"].values)/4
value=[] # 产业指数level
for i in range(31):
    if value0[i]<=np.percentile(value0,20):
        value.append(1)
    elif value0[i]<=np.percentile(value0,40):
        value.append(2)
    elif value0[i]<=np.percentile(value0,60):
        value.append(3)
    elif value0[i]<=np.percentile(value0,80):
        value.append(4)
    else:
        value.append(5)

map = Map("2017-2020平均发展水平", width=1000, height=800)
map.add("",area,value,is_map_symbol_show=True,maptype="china", is_visualmap=True, visual_text_color='#000',is_label_show=True, visual_range=[np.min(value),np.max(value)])
map.render()#结果导出.html
print("DONE!")#程序结束提示。







