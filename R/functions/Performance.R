performance<-function(table,n-2){
  if(!all(dim(table)==c(2,2)))  
     stop("Must be a 2 x 2 table")
  tn=table[1,1]
  fp=table[1,2]
  fn=table[2,1]
  tp=table[2,2]
  sensitivity=tp/(tp+fn)
  specificity=tn/(tn+fp)
  ppp=tp/(tp+fp)
  npp=tn/(tn+fn)
  hitrate=(tp+tn)/(tp+tn+fp+fn)
  result<-paste("Sensitivity=",round(sensitivity,n),
       "\nSpecificity=",round(specificity,n) ,
       "\nPositive Predictive Value=",round(ppp,n),
       "\nNegative Predecitive Value=",round(npp,n),
       "\nAccuracy=",round(hitrate,n),"\n",sep=",")
 cat(result)  
}