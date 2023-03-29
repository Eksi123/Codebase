import keras # 深度学习Keras框架
from keras.models import Sequential # 
from keras.layers import Dense # 神经网络全连接层
from keras.optimizers import SGD   # 随机梯度下降优化算法
import keras.datasets.mnist as mnist # 数字手写识别数据集

#划分数据集
(x_train,y_train),(x_test,y_test) = mnist.load_data()
x_train.shape

x_train = x_train.reshape(60000,784)
x_test = x_test.reshape(10000,784) 

#设置数据类型为float32
x_train = x_train.astype('float32')
x_test = x_test.astype('float32')

# 数据值映射在[0,1]之间
x_train = x_train/255
x_test = x_test/255

#数据标签one-hot处理
y_train = keras.utils.to_categorical(y_train,10)
y_test = keras.utils.to_categorical(y_test,10)
print(y_train[1])

#建立神经网络
model = Sequential()
model.add(Dense(256,activation='relu',input_shape=(784,))) #第一层隐藏层，神经元256
model.add(Dense(256,activation='relu',input_dim=784))
model.add(Dense(256,activation='relu'))  #第二层隐藏层，神经元256
model.add(Dense(10,activation='softmax'))   #输出维度为10，激活函数：softmax

#编译模型
model.compile(optimizer=SGD(), # 标准梯度下降优化器
             loss='categorical_crossentropy', # 交叉熵损失函数
             metrics=['acc']) # 准确率评价指标
#训练模型
model.fit(x_train,y_train,batch_size=100,epochs=15,validation_data=(x_test, y_test)) # batch_size：单轮梯度下降优化所需样例数  epochs：全部样例完成一轮优化称为一个epoch（周期）

#打印模型
model.summary()

#测试数据表现
test_loss, test_acc = model.evaluate(x_test, y_test)
print(test_loss, test_acc)
