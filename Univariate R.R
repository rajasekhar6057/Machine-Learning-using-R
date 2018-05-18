
## For detailed discussion on the same, refere to reading material for the module
data(mtcars)

## ------------------------------------------------------------------------
mean(mtcars$mpg)
median(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)


## ------------------------------------------------------------------------
summary(mtcars$mpg)
summary(mtcars)

## ------------------------------------------------------------------------
s=summary(mtcars$mpg)
class(s)
names(s)


## ------------------------------------------------------------------------
s["Max."]

## ------------------------------------------------------------------------
s=summary(mtcars)
class(s)
names(s)

## ------------------------------------------------------------------------
#this outputs element in 1st row and 2 column in tables s, which will be min value of variable "cyl"
s[1,2]

 ## ------------------------------------------------------------------------
install.package("psych")
library(psych)
describe(mtcars)

## ------------------------------------------------------------------------
s=describe(mtcars)
class(s)

## ------------------------------------------------------------------------
s["gear","max"]

## ------------------------------------------------------------------------
s[c("gear","mpg","wt"),c("max","sd","skew")]

## ------------------------------------------------------------------------
boxplot(mtcars$mpg)
hist(mtcars$hp)

## ------------------------------------------------------------------------
library(vcd)
View(Arthritis)
data(Arthritis)

## ------------------------------------------------------------------------
tab1=table(Arthritis$Improved)
tab1

## ------------------------------------------------------------------------
prop.table(tab1)


## ------------------------------------------------------------------------
round(prop.table(tab1),2)
prop.table(tab1)*100

## ------------------------------------------------------------------------
table(Arthritis$Improved,Arthritis$Sex)
xtabs(~Improved+Sex,data=Arthritis)

## ------------------------------------------------------------------------
tab2=xtabs(~Treatment+Improved,data=Arthritis)

## ------------------------------------------------------------------------
prop.table(tab2)
#Percentages total to 1 across values of Treatment
prop.table(tab2,1)
#Percentages total to 1 across values of Improved
prop.table(tab2,2)

## ------------------------------------------------------------------------
margin.table(tab2)
margin.table(tab2,1)
margin.table(tab2,2)

## ------------------------------------------------------------------------
addmargins(tab2)
addmargins(tab2,2)
addmargins(tab2,1)


## ------------------------------------------------------------------------
tab3=xtabs(~Treatment+Sex+Improved,data=Arthritis)
ftable(tab3)

## ------------------------------------------------------------------------
margin.table(tab3,1)
margin.table(tab3,c(1,3))

## ------------------------------------------------------------------------
ftable(prop.table(tab3,c(1,3)))

## ------------------------------------------------------------------------
ftable(addmargins(prop.table(tab3,c(1,2)),3))

mtcars_am0=mtcars[mtcars$am == 0,]
mtcars_am1=mtcars[mtcars$am == 1,]

mean(mtcars_am0$mpg)
mean(mtcars_am1$mpg)