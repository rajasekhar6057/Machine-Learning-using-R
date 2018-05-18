d = read.csv(file="census_income.csv")
View(d)
class(d[,1])

##
### 2nd Answer
##

for(i in 1:ncol(d))
  {
  if(class(d[,i])=="integer")
    {
    
    print(paste("Summary for ",names(d)[i]));
    print(table(d[,i]))
    }
}

################3

tab1=table(d$education)
round(prop.table(tab1),2)
tab2 = table(d$education,d$Y)
round(prop.table(tab2,1),2)
#####################33

hist(d$fnlwgt)
hist(d$education.num)


outlier.limits=function(x,k){
  x.q1=quantile(x)[2]
  x.q3=quantile(x)[4]
  x.iqr=IQR(x)
  ll=x.q1-k*x.iqr
  ul=x.q3+k*x.iqr
  limits=c(ll,ul)
  names(limits)=NULL
  return(limits)
}
outlier.limits(d$education.num,c)
