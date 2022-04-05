#序列生成
a1<-rep(0:4,c(5,5,5,5,5))
a1

a2<-rep(1:5,5)
a2

p<-c(1,2,3,4,5); q<-c(5,6,7,8,9); a3<-c()
for (i in 1:5){
  a<-seq(p[i],q[i])
  a3<-c(a3,a)
}
a3

#矩阵生成
matrix_1<-matrix(1:20,4,5) #按列排序
matrix_1

matrix_2<-matrix(1:20,5,4) #按行排序
matrix_2<-t(matrix_2)
matrix_2

matrix_3<-matrix(rep(1:5,5),5,5)
matrix_3

data<-c(1:30)
dim(data)<-c(5,6)
data
