#V1.0.0
#Author liuyue
#date 2021-1-27

#V1.0.0：第一版多重比较模型


multi_comp <- function(mydata, ana_var, gro_var,method = "LSD", savePath,round){
  # input:
  # mydata: dataframe 需处理的数据
  # ana_var:strVector 分析变量
  # gro_var:str 分组变量
  # method: str 多重比较方法（LSD、Bonferroni、SNK、Tukey、Duncan、Scheffe）
  # savePath:str 图片保存路径
  # round:int 小数点位数
  # return:
  # results$table:dataframe 表格结果
  # results$boxplot: strVector 箱线图图片路径
  # results$descrip:strVector 描述结果
  #library(agricolae)
  library(dplyr)
  library(stringr)
  library(ggplot2)
  results <- list() #结果
  mytime <- format(Sys.time(), "%b_%d_%H_%M_%S_%Y")  #时间
  rand <- sample(1:100,1)
  ana_var0 <- mydata[,ana_var]
  gro_var0 <- mydata[,gro_var]
  
  #建立方差分析模型
  model<-aov(ana_var0~gro_var0,data=mydata)
  #选择多重比较方法
  #"LSD", "Bonferroni", "SNK", "Tukey", "Duncan", "Scheffe"
  out <- switch(method, 
                LSD        = LSD.test(model, "gro_var0", p.adj="none",group = FALSE),
                Bonferroni = LSD.test(model, "gro_var0", p.adj="bonferroni",group = FALSE),
                SNK        = SNK.test(model, "gro_var0", group = FALSE, console=FALSE),
                Tukey      = HSD.test(model, "gro_var0", group = FALSE, console=FALSE),
                Duncan     = duncan.test(model, "gro_var0", group = FALSE, console=FALSE),
                Scheffe    = scheffe.test(model, "gro_var0", group = FALSE, console=FALSE)
                )
  
  #画箱线图
  pic=ggplot(data = mydata,aes(x=gro_var0,y=ana_var0))+
      stat_boxplot(geom = "errorbar",width=0.4)+
      geom_boxplot(aes(fill=gro_var0))+
      guides(fill=F)+
      xlab(gro_var)+
      ylab(ana_var)+
      theme(panel.background = element_rect(fill = "white",color = "black"),
          panel.grid.major.x = element_blank(),
          axis.line = element_line(),
          axis.title.x = element_text(size = 16),
          axis.title.y = element_text(size = 16),
          legend.position = "top")
  picname <- paste0("mypictrue",mytime,"_",rand,".jpeg")
  jpeg(file=paste0(savePath,picname),width=7,height=8,units="in",res=600)
  print(pic)
  dev.off()
  results$picname <- picname

  #输出表格&添加描述
  table <- out$comparison
  tb <- cbind(table[,1], table[,4], table[,5], table[,2])
  rownames(tb)  <- rownames(table)
  colnames(tb) <- c("均数差值","95%LCI","95%UCI","p值")
  results$table <- data.frame(round(tb,round))
  descrip <- NULL
  a <- NULL
  p_adj <- out$comparison$pvalue
  for(i in 1:nrow(table)){
    if(p_adj[i]<0.05){
      a[i] <- rownames(table)[i]
    }
  }
  a<-na.omit(a)
  descrip <- paste0('不同',gro_var,'样本对于',ana_var,'呈现出显著差异，通过'
                    ,method,'方法可以得到，有着较为明显差异的组别分别为',
                    paste0(a, collapse = "；"),'，其P值均小于0.05。')
  results$descrip <-descrip
  return(results)
}

#------test------#
data("sweetpotato")
mydata = sweetpotato
ana_var = "yield"
gro_var = "virus"
x=multi_comp(mydata, ana_var, gro_var,method = "Duncan", savePath='D:/R_test/',round=2)

mydata=read.csv('D:/R_test/df_test.csv')
ana_var = "年龄"
gro_var = "分组名称1肝癌0肝炎"
