## ----For detailed comments on code snippets , please refer to reading material----------------------------------------------------------



## setwd(" Here/Goes/Path/To/Your/Data/Folder/")

## ----eval=FALSE----------------------------------------------------------
## getwd()

## ------------------------------------------------------------------------
bd=read.csv("bank-full.csv")
head(bd,2)

## ------------------------------------------------------------------------
bd=read.csv("bank-full.csv",sep=";")
head(bd,2)

## -----------------------------------------------------------
library(dplyr)
glimpse(bd)

## ------------------------------------------------------------------------
bd=read.csv("bank-full.csv",sep=";",stringsAsFactors = FALSE)
glimpse(bd)

## ------------------------------------------------------------------------
table(bd$job)

## ------------------------------------------------------------------------
bd=read.csv("bank-full.csv",sep=";",stringsAsFactors = FALSE,na.strings = "unknown")
sum(is.na(bd$job))

## ------------------------------------------------------------------------
for(i in 1:ncol(mtcars)){
  print(mean(mtcars[,i]))
}

## -----------------------------------------------------------
x=round(rnorm(10),2)
x
lapply(x,log10)


## --------------------------------------------------------------
## # Before running these codes , you'll have to set your working directory to the folder "namesbystate".
## # You will find this folder inside "Data" folder which you downloaded from LMS
file_names=list.files(getwd(),pattern="*.TXT")
files=lapply(file_names,read.csv,header=F, stringsAsFactors = F)

## --------------------------------------------------------------
file=do.call(rbind,files)

## ----
sapply(x, log)

## ------------------------------------------------------------------------
apply(mtcars,2,sd)
apply(mtcars,2,outlier)
library(psych)
## ----
temps=data.frame(days=1:30,T1=sample(20:30,30,replace = T),T2=sample(20:30,30,replace = T),T3=sample(20:30,30,replace = T))
head(temps)

## ------------------------------------------------------------------------
temps$max_temp=apply(temps,1,max)
head(temps)

## ------------------------------------------------------------------------
outlier_upper=function(x){
  m=mean(x);
  s=sd(x);
  return(m+3*s);
}
apply(mtcars,2,outlier_upper)


## ------------------------------------------------------------------------
apply(mtcars,2,function(x) sum(x>outlier_upper(x)))

## ------------------------------------------------------------------------
tapply(mtcars$mpg,mtcars$am,mean)

## ------------------------------------------------------------------------
apply(mtcars,2,function(x) tapply(x,mtcars$am,mean))

## ----
library(vcd)
Arthritis$new=log(Arthritis$Age)
colnames(Arthritis)[5]="Improved"
head(Arthritis)

## ------------------------------------------------------------------------
Arthritis$new=as.numeric(Arthritis$Age<40)
head(Arthritis)

## ------------------------------------------------------------------------
x=sample(40,10)
x
y=ifelse(x>20,20,x)
y

## ------------------------------------------------------------------------
Arthritis$new=ifelse(Arthritis$Age<40,40,Arthritis$Age)
head(Arthritis)

## ----
sales=data.frame(months=1:12,sales=sample(1000:2000,12))
sales

## ----
library(dplyr)
library(hflights)

data(hflights)
head(hflights)

## ------------------------------------------------------------------------
flights=tbl_df(hflights)
flights

## ------------------------------------------------------------------------
flights[flights$Month==1 & flights$DayofMonth==1, ]

## ------------------------------------------------------------------------
#note: you can use comma or ampersand to represent AND condition
filter(flights, Month==1, DayofMonth==1)

# use pipe for OR condition
filter(flights, UniqueCarrier=="AA" | UniqueCarrier=="UA")

# you can also use %in% operator
filter(flights, UniqueCarrier %in% c("AA", "UA"))

## ------------------------------------------------------------------------
# base R approach to select DepTime, ArrTime, and FlightNum columns
flights[, c("DepTime", "ArrTime", "FlightNum")]
# dplyr approach
select(flights, DepTime, ArrTime, FlightNum)

## ------------------------------------------------------------------------
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))

## ------------------------------------------------------------------------
# nesting method to select UniqueCarrier and DepDelay columns and filter for delays over 60 minutes
filter(select(flights, UniqueCarrier, DepDelay), DepDelay > 60)

## ------------------------------------------------------------------------
x=sample(10,6)
x %>% 
  log() %>%
  sum()

## ------------------------------------------------------------------------
# chaining method
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  filter(DepDelay > 60)

## ------------------------------------------------------------------------
# base R approach to select UniqueCarrier and DepDelay columns and sort by DepDelay
flights[order(flights$DepDelay), c("UniqueCarrier", "DepDelay")]
# dplyr approach
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select( DepDelay) %>%
  arrange(DepDelay)

## ------------------------------------------------------------------------
# base R approach to create a new variable Speed (in mph)
flights$Speed <- flights$Distance / flights$AirTime*60
flights[, c("Distance", "AirTime", "Speed")]
# dplyr approach 
flights %>%
  mutate(Speed = Distance/AirTime*60)
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

## ------------------------------------------------------------------------
flight_sub=flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

## ------------------------------------------------------------------------
# dplyr approach: create a table grouped by Dest, and then summarise each group by taking the mean of ArrDelay
flights %>%
  group_by(Dest) %>%
  summarise(avg_delay = mean(ArrDelay, na.rm=TRUE))

## ------------------------------------------------------------------------
# for each day of the year, count the total number of flights and sort in descending order
z=flights %>%
  group_by(Month, DayofMonth) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))


# rewrite more simply with the 'tally' function
flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE)

# for each destination, count the total number of flights and the number of distinct planes that flew there
flights %>%
  group_by(Dest) %>%
  summarise(flight_count = n(), plane_count = n_distinct(TailNum))
flights %>%
  plane_count = n_distinct(TailNum)



# for each destination, show the number of cancelled and not cancelled flights
flights %>%
  group_by(Dest) %>%
  select(Cancelled) %>%
  table() %>%
  head()

# for each month, calculate the number of flights and the change from the previous month
flights %>%
  group_by(Month) %>%
  summarise(flight_count = n()) %>%
  mutate(change = flight_count - lag(flight_count),percent = 100*(flight_count - lag(flight_count))/flight_count + lag(flight_count)) 


# rewrite more simply with the `tally` function
flights %>%
  group_by(Month) %>%
  tally() %>%
  mutate(change = n - lag(n))


# base R approach to view the structure of an object
str(flights)

# dplyr approach: better formatting, and adapts to your screen width
glimpse(flights)


## ------------------------------------------------------------------------
set.seed(1)
s=sample(1:nrow(mtcars),0.7*nrow(mtcars))
# we are using set.seed for our random sample to be reproducible

## ------------------------------------------------------------------------
mtcars_sample=mtcars[s,]

## ------------------------------------------------------------------------
mtcars_remaining=mtcars[-s,]

## ------------------------------------------------------------------------
set.seed(1)
s=sample(1:nrow(mtcars),100,replace = TRUE)
mtcars_bootstrapped=mtcars[s,]

## ----

messy <- data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)
messy

## ----

library(tidyr)

messy %>% 
  gather(drug,heartrate,a:b)

## ----
set.seed(10)
messy <- data.frame(
  id = 1:4,
  trt = sample(rep(c('control', 'treatment'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)
messy

## ------------------------------------------------------------------------
tidier = messy %>%
  gather(key,time,-id,-trt)
tidier

## ------------------------------------------------------------------------
tidier=tidier %>% separate(key,into=c("location","shift"),sep="\\.")
tidier

## ------------------------------------------------------------------------
step1= tidier %>%
  unite(key,location,shift,sep=".")
step1
step2=step1 %>%
  spread(key,time)
step2

## ----
library(lubridate)
ymd("20110604")
mdy("06-04-2011")
dmy("04/06/2011")

## ------------------------------------------------------------------------
arrive = ymd_hms("2011-06-04 12:00:00", tz = "Pacific/Auckland")

leave = ymd_hms("2011-08-10 14:00:00", tz = "Pacific/Auckland")

## ------------------------------------------------------------------------
second(arrive)

second(arrive) = 25
arrive

second(arrive) = 0
wday(arrive)

wday(arrive, label = TRUE)

## ------------------------------------------------------------------------
meeting <- ymd_hms("2011-07-01 09:00:00", tz = "Pacific/Auckland")

## ------------------------------------------------------------------------
with_tz(meeting, "America/Chicago")

## ------------------------------------------------------------------------
leap_year(2011)

ymd(20110101) + dyears(1)

ymd(20110101) + years(1)

## ------------------------------------------------------------------------
 
leap_year(2012)

ymd(20120101) + dyears(1)

ymd(20120101) + years(1)

## ------------------------------------------------------------------------
parse_date_time("01-12-Jan","%d-%y-%b")
parse_date_time("01-12-Jan 12:05 PM","%d-%y-%b %I:%M %p")

#Function can be used seamlessely for vectors as well

x = c("09-01-01", "09-01-02", "09-01-03")
parse_date_time(x, "ymd")
parse_date_time(x, "%y%m%d")
parse_date_time(x, "%y %m %d")

 
## ** heterogenuous formats **

x = c("09-01-01", "090102", "09-01 03", "09-01-03 12:02")
parse_date_time(x, c("%y%m%d", "%y%m%d %H%M"))

