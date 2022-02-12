# matplotlib：matplotlib是python中运用最广的绘图模块，下面我们对其基本属性及基本绘图种类作介绍：

# 1 基本属性：以最简单的折线图为例
# (1) 自定义或导入数据
import matplotlib.pyplot as plt
import numpy as np

X=np.array(range(1,11)) # 数据X和Y1，Y2，Y3，Y4
Y1=X
Y2=X**2
Y3=np.sqrt(X)
Y4=np.sin(X)+np.sin(X)

# （2）创建画布
fig=plt.figure(figsize=[8,8]) # 创造一个主画布，并调整主画布的尺寸[width, height]，可不填
axes1=fig.add_subplot(2,2,1) # 从主画布中分划出一个子画布（坐标轴）1，位于左上角
axes2=fig.add_subplot(2,2,2) # 子画布2，位于右上角
axes3=fig.add_subplot(2,2,3) # 子画布3，位于左下角
axes4=fig.add_subplot(2,2,4) # 子画布4，位于右下角
plt.subplots_adjust(wspace=0.2,hspace=0.2) # 调整子画布之间的相对宽，高间距，间距均为0时表示各幅子图贴在一起

axes1.plot(X,Y1)
axes2.plot(X,Y2)
axes3.plot(X,Y3)
axes4.plot(X,Y4)

"""
也可以： fig,axes=plt.subplots(nrows=2, ncols=2) 将返回一个包含两行两列子画布的数组axes。
"""

plt.savefig("figure1.png") # 用于下载绘制的图表，不过一般直接在figure窗口交互下载
plt.show()

# (3) 画布操作：下面的演示以单图为例
import matplotlib.pyplot as plt
import numpy as np

X=np.array(range(1,11)); Y=np.sqrt(X)+np.sin(X) # 自定义数据X，Y

plt.rcParams["font.sans-serif"]=["SimHei"] # 解决中文标题，坐标轴名，刻度名等问题
plt.rcParams["axes.unicode_minus"]=False

fig=plt.figure() # 创建画布
plt.title("图1") # 为当前图表添加标题
plt.xlabel("X轴") # 为当前图标添加横纵坐标轴名
plt.ylabel("Y轴")
plt.xticks(range(1,11,2),labels=[0.0, 2.0, 4.0, 6.0, 8.0]) # 重新定义X轴的刻度（一般不重新定义Y轴的刻度）
plt.xlim(xmin=0, xmax=12) # 调整X轴和Y轴的范围（使用较少）
plt.ylim(ymin=0, ymax=5)

plt.plot(X,Y)
plt.show()

# (4) 图表操作
import matplotlib.pyplot as plt
import numpy as np

X=np.array(range(1,11)); Y1=np.sqrt(X)+np.sin(X); Y2=X**2-X

fig=plt.figure()

plt.plot(X, Y1, linestyle="--", linewidth="2", color="blue",
     marker="o", markerfacecolor="red",  label="x-y1")

plt.plot(X, Y2, linestyle="-.", linewidth="2.5", color="red",
     marker="D", markerfacecolor="blue",  label="x-y2")

plt.fill_between(X, Y1, Y2, facecolor="green",alpha=0.3)

"""
linestyle表示线条样式, linewidth表示线条粗细, color表示线条颜色
marker表示坐标点样式, markerfacecolor表示坐标点颜色, label用于给该线图起名, 用于绘制图例
fill_between函数用于曲线间颜色填充, Y1, Y2用于给填充区域划界, 其中facecolor表示填充颜色, alpha指填充透明度
"""

plt.legend(frameon=False, facecolor="blue") # 前者指去除图例边框，后者指图例背景颜色

plt.show()

"""
fig,axes1=plt.subplots() # 可用于在同一画布内绘制两个Y坐标轴
axes2=axes1.twinx()

axes1.plot(X,Y1)
axes2.plot(X,Y2)

plt.show()
"""

# 2 基本绘图种类：折线图已介绍
# (1) 散点图
import matplotlib.pyplot as plt
import numpy as np

X=np.array(range(1,11)); Y=np.random.rand(10)

fig=plt.figure()
plt.scatter(X, Y, marker="D", s=25, color="blue",alpha=0.5) 
"""
marker表示散点样式，s表示散点大小，color表示散点颜色，aplha表示透明度
增加第三维变量Z则可绘制三维散点图
"""
plt.show()

# (2) 柱状图
import matplotlib.pyplot as plt
import numpy as np

X=np.array(range(1,11)); Y=np.random.rand(10)

fig,axes=plt.subplots(1,2)
axes[0].bar(X, Y, color="blue") # 柱形图
axes[1].barh(X, Y, color="red") # 条形图
plt.show()

# (3) 直方图
import matplotlib.pyplot as plt
from scipy import stats

Y1=stats.binom.rvs(n=100, p=0.6, size=1000)
Y2=stats.binom.rvs(n=100, p=0.4, size=1000)

fig=plt.figure()
plt.hist(Y1, bins=50, range=[1,60], density=True, color="blue") 
plt.hist(Y2, bins=50, range=[41,100], density=True, color="red")
"""
bins表示直方图箱的总数，range=[min,max]表示直方图的范围，density=True表示为频率直方图，False为频数直方图
"""
plt.xlim(xmin=35, xmax=65)
plt.show()

# (4) 箱线图
import matplotlib.pyplot as plt
from scipy import stats

Y=stats.norm.rvs(loc=2, scale=4, size=3000).reshape(1000,3)

fig=plt.figure()
plt.boxplot(Y, vert=True) # vert=True表示箱线图垂直，FaLse表示水平
plt.show()

# (5) 饼图
import matplotlib.pyplot as plt
import numpy as np

Y=np.array([10,25,30,18,40])
label=np.array(["type1", "type2", "type3", "type4", "type5"])

fig=plt.figure()
plt.pie(Y,autopct="%.2f%%", labels=label) # autopct="%.2f%%"表示各项比率大小按两位小数展示
plt.show()

# serborn
