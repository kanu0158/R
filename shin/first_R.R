help("solve")
?solve
object("Hello world !!")
#java : int a = 3;
#System.out.print(a);
a = 3
a
a <- 5
a
a <- "2"
a
b <- 4
b
c <- a + b
c

a <- c(1,2,3,4)
c(1,"2",3,"4") -> a
a

#JAVA : int[] arr = new int[3];
#JAVA : arr[0] = 1;
#JAVA : arr[1] = 2;
#JAVA : arr[2] = 3;
# R : arr <- c(1,2,3)

x <- c(1,2,3,4,5,6,7,8,9,10)
mean(x)
x-mean(x)
(x-mean(x))^2
length(x)

sum((x-mean(x))^2)/(length(x)-1)
my_sum <- sum(x)
my_sum

?seq
#length 
# <- 객체할당할때 사용
# = 변수값 할당할때 사용(가독성을 위해서 분리)
x <- seq(length=100,from=1,by=1)
x
sum(seq(length=100,from=1,by=1))

?sample
sample(1:3,replace = TRUE)
sample(1:3,1,replace = TRUE)

#가위:1 바위:2 보:3
com <- sample(1:3,1,replace = TRUE)
my <- 1
if(my - com == -1 || my - com == 2) print("승리") 
  else if(my - com == 1 || my - com == -2) print("패배")
    else print("비김")
