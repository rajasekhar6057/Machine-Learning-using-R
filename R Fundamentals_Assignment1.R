#### Question 1

##Part 1
  
value = c(1:10)
value
cube_value = 2^value
cube_value

##Part 2

alphabets = letters
alphabets

numbers = c(26:1)
numbers 

equation = paste0(alphabets,numbers)

#### Question 2

address_list=c("802/hiranandani/Mumbai",
               "2A/kalka-Delhi",
               "345#near adyar#Chennai",
               "10-shyaam bazzar-Kolkata")
address_list[1]


newlist1 = substr(address_list[1],17,22)
newlist2 = substr(address_list[2],10,15)
newlist3 = substr(address_list[3],16,22)
newlist4 = substr(address_list[1],17,24)

new_address = list(newlist1,newlist2,newlist3,newlist4)

temp=gsub("-","/",address_list)
temp=gsub("#","/",temp)
l=strsplit(temp,"/")
for(i in 1:4){
  print(l[[i]][3])
}

### Question 3

primes=c(2,3,5,7,11,13,17,19,23,29,31,37,41,43,47)

for(i in 48:100){
  temp=i%%primes
  condition=temp==0
  if(sum(condition)==0){print(i)}
}



### Question 4

x = as.data.frame(mtcars)
avg= mean(x[,1])

?mtcars


### Question 5

set.seed(2)
x=sample(letters[1:5],50,replace=T)
y=sample(letters[1:3],50,replace=T)


mymode=function(x){
  t=table(x)
  result=names(t)[which(t==max(t))]
  return(result)
}
mymode(x)
  
  




