d = read.csv(file="census_income.csv")
View(d)
ggplot(d,aes(x=hours.per.week))+
  geom_density(color="red")+
  stat_function(fun=dnorm,color="green",args=list(mean=mean(d$hours.per.week),sd=sd(d$hours.per.week))) 

##############################3

ggplot(d,aes(x=relationship,fill = Y))+
  geom_bar(position = "fill")+
  ylab("percentage")+
  theme(axis.text.x = element_text(face="bold", color="#993333",
                                   size=9, angle=45))
###################################
ggplot(d,aes(x=age,y = hours.per.week,color=sex))+
  geom_point(aes(alpha=0.2))+
  geom_smooth()
########################  
ggplot(d,aes(x=Y,y = capital.gain,color=Y))+
  geom_point()+
  geom_jitter()

ggplot(d,aes(x=Y,y = capital.loss,color=Y))+
  geom_point()+
  geom_jitter()

###########################

ggplot(d,aes(x=Y,y = fnlwgt,color=Y,fill=sex))+
  geom_violin()
ggplot(d,aes(x=Y,y=fnlwgt,color=Y,fill=sex))+
  geom_violin()

