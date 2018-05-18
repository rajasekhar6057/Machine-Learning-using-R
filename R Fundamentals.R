##
### Data Frames
##

d= mtcars
#Structure of the Data Frame
str(d)
#To view the data frame
View(d)
dim(d)
d[3,]
d[,5]
d[3:7,]
d[2:4,5:8]
d[c(2,5),]
d[c(1,5),c(3,5,8)]
#Excluding the column names
d[1:5,-c(2,3,4)]
# Retriving column by names
d[,c("wt","mpg")]
# Retriving single column by name 
d$disp
# To display the column value in perticular
d[,3][3]
# To display the column names
colnames(d)
# Grep: To find the column number for a perticular column in a Table
grep(pattern = "disp",x=colnames(d)) 
# Subset Fuction is used to exclude the certain column by its name
subset(d,select = -c(wt,mpg))
# Sorting a data frame
d[order(d$mpg, decreasing = T),]
# Sorting two columns
d[order(d$vs,d$wt),]
#To change the direction of the sort for the different column
d[order(d$vs,-d$wt),]

# SQL Type concepts(Joining two data sets)

install.packages("dplyr") # It will store in to the hard disc
library("dplyr") # This will load it into the ram

df1=data.frame(Cust_Id=c(1:6),Product=c(rep("Toaster",3),rep("Radio",3)))
View(df1)
df2=data.frame(Cust_Id=c(3,4,7,8),State=c(rep("Alabama",2),rep("ohio",2)))
View(df2)
#Inner Join
inner = inner_join(df1,df2,by="Cust_Id")
inner
#Left Join
left = left_join(df1,df2,by="Cust_Id")
left
#Right Join
right = right_join(df1,df2,by="Cust_Id")
right
# Package called sqldf for writing the sql quieries


##
### Loops
##

set.seed(123)
x=sample(1:100,10)
x
for(i in 1:10)
{
  print(x[i]^2)
}


which(x%%2 !=0)
for(j in which(x%%2 !=0))
{
  print(x[j]^2)
}

##
### Functions
##


# Function Definition
myfunc = function(x)
{
  range1=max(x)-min(x)
  return(range1)
}

#Functional Call
myfunc(x)

myfunc = function(x)
{
  if(class(x) %in% c("numeric","integer"))
  {
  range1=max(x)-min(x)
  }
  else
  {
    print("Vestor is not of supproted type")
  }
  
}

myfunc(rep("a",10))



##
##Matrix
##

x=1:10
z= matrix(x,3,3)
View(z)

## Creating a data frame from the vector

n=100000
set.seed(123)
myvec = sample(1:10,n*9, replace = TRUE)
length(myvec)
x= as.data.frame(matrix(myvec,ncol=9,nrow = n))
View(x)