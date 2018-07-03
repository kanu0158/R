#matrix
#1~25 행순서
M <- matrix(c(1:25), nrow = 5, ncol = 5, byrow = TRUE)
print(M)
#1~25 열순서
M <- matrix(c(1:25), nrow = 5, ncol = 5, byrow = FALSE)
print(M)


M <- matrix(c(1:25), nrow = 5, ncol = 5)
print(M)

n <- 1
for(i in 1:8){
  n <- n*2
}
cat(n)

x=c()
x[1] = 1
cat(x)
for(i in 2:5){
  x[i]=i
}
cat(x)


x <- c(1,2,3,4,5)
y <- c(10,9,8,7,6)
rbind(x,y)

z <- append(x,y)
rbind(c(1,2,3,4,5),c(10,9,8,7,6))
cat(z)

rbind(c(1,0,0,0),c(2,3,0,0),c(4,5,6,0),c(7,8,9,10))
rbind(c(1,2,3,4),c(8,7,6,5),c(9,10,11,12),c(16,15,14,13))
rbind(c(0,0,1,0,0),c(0,2,3,4,0),c(5,6,7,8,9),c(0,10,11,12,0),c(0,0,13,0,0))

mtxSelect <- function(num){
  return (switch(toString(num),
                 #"1"=rbind(c(1,0,0,0),c(2,3,0,0),c(4,5,6,0),c(7,8,9,10)),
                 "1"=rbind(matrix(c(1,0,0,0),nrow=1,ncol=4,byrow=TRUE),matrix(c(2,3,0,0),nrow=1,ncol=4,byrow=TRUE),matrix(c(4,5,6,0),nrow=1,ncol=4,byrow=TRUE),matrix(c(7,8,9,10),nrow=1,ncol=4,byrow=TRUE)),
                 "2"=rbind(c(1,2,3,4),c(8,7,6,5),c(9,10,11,12),c(16,15,14,13)),
                 "3"=rbind(c(0,0,1,0,0),c(0,2,3,4,0),c(5,6,7,8,9),c(0,10,11,12,0),c(0,0,13,0,0))
  ))
} 
mtxSelect(1)

