a = c(2,1,3,2,1)
cate_a = factor(a, labels = c('Apple','Banana','Cherry'))
cate_a
x = c(1,2,3,4,5,6)
matrix(x, ncol=3, byrow=TRUE)
matrix(x, dim = c(2,2,3))
array(x, dim = c(2,2,3))
list1 = list(c(1,2,3), 'hello')
list1
str(list1)
list1[1]
list1[[1]]
list1[1][1]
b = sum(1:100)
b
Sys.Date()
cat(1,2,3,4,'cat is cute')
print(1,2,3,4)
print(1)
print(c(1,2,3,4))
print(c(1,2,3,4),'hello')
cat(c(1,2,3,4),'hello')

install.packages('reshape2')
library()
library(reshape2)
remove.packages('reshape2')
!5


a= 10
if(a%%2 == 0){
  print('짝수입니다.')
} else {
  print('홀수입니다.')
}


b = 88
if (b >= 90){
  print('A학점입니다.')
} else if (b >= 80) {
  print('B학점입니다.')
} else {
  print('C학점입니다.')
}


for (i in 1:9) {
  print(i*2)
}


for (i in 1:9) {
  print(paste('>>>>>>>>',i,'단'))
  for (j in 1:9) {
    print(paste(i,'*',j,'=',i*j))
  }
}


x = matrix(1:4, 2, 2)
x
apply(x, 1, sum)
apply(x, 2, sum)
apply(x, 2, min)
str(iris)
View(iris)
apply(iris[, 1:4], 2, mean)
lapply(iris[,1:4], mean)
sapply(iris[,1:4],mean)
