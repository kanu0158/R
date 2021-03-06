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
com
my <- 2
if(my - com == 1 || my - com == -2) print("승리") else if(my - com == -1 || my - com == 2) print("패배") else print("비김")

if((my - com - 1)%%3 == 0 ) print("승리") else  if((my - com + 1)%%3 == 0 || my - com == 2) print("패배") else print("비김")

if(my - com == 1 || my - com == -2){ print("승리") 
  }else if(my - com == -1 || my - com == 2){ print("패배") 
    }else print("비김")

#switch
com <- sample(1:3,1,replace = TRUE)
my <- 2
cat("컴퓨터 :",com)
res <- toString(my-com)
cat("결과 :",res)
x <- switch(
  res,
  '-2' = {"승리"},
  '1' = {"승리"},
  '-1' = {"패배"},
  '2' = {"패배"},
  '0' = {"비김"}
)
print(x)


#switch 2
my <- 2
print(switch(
  res <- toString(my - sample(1:3,1,replace = TRUE)),
  '-2' = {"승리"},
  '1' = {"승리"},
  '-1' = {"패배"},
  '2' = {"패배"},
  '0' = {"비김"}
))

#bmi
height <- 180
weight <- 77
bmi <- weight/(height*height/10000)
cat('키:',height,' 무게:',weight,' bmi:',bmi)
print(if(bmi<18.5){'저체중'} else
  if(18.5 <= bmi && bmi <23) {'정상'} 
   else if(23 <= bmi && bmi <25) {'비만 전단계'} 
    else if(25 <= bmi && bmi <30) {'1단계 비만'} 
     else if(30 <= bmi && bmi <35) {'2단계 비만'} 
      else {'3단계 비만'})

#벡터만드는 방법들
print(
  c(1:10)
)
print(
  seq(from=1,to=10,by=2)
)
print(
  seq(from=1,length=10,by=2)
)
print(
  seq(1,10,2)
)
print(
  rep(1:5)
)
print(
  rep(1,6)
)
print(
  rep(1:5,each=2)
)
print(
  rep(1:5,times=2)
)
print(
  rep(1:5,each=2,time=3)
)
print(
  rep(1:5,time=3,each=2)
)
print(
  rep(1:5,time=3,each=2,len=5)
)
print(
  rep(1:5,each=2,times=3,len=5)
)


#기본타입: character, wide character, integer, floating point, double floating point, Boolean etc.
#R-Objects: Vector, List, Matrix, Array, Factor, Data Frame

#Vector로부터 만든 6개 타입
#Logical(T,F), Numeric(실수), Integer(정수),
#Complex(허수),Character(문자열), Raw(주소값)


#계산기
a <- 5
b <- 2
op <- '/'
cat(a,op,b,'=',switch(
  op,
  '+' = {a+b},
  '-' = {a-b},
  '*' = {a*b},
  '/' = {a%/%b},
  '%' = {a%%b}
))

LETTERS[1:4]

#1+2+3=6 형태로 나오게 for 사용
a <- 5
b <- 2
op <- '+'
for(i in c(1:5)){
  if(i==5) cat(i ,' = ',sum(1:5)) else cat(i,op) 
}
#1-2+3-4+5-6+...-100 = -50
for(i in c(1:100)){
  if(i == 100)cat(-i, ' = ',sum(seq(1,100,2)) + sum(seq(0,-100,-2)))  else if(i%%2 == 0) cat(-i, ' + ') else cat(i, ' + ') 
}
#switch
for(i in c(1:100)){
  if(i == 100)cat(i, ' = ',sum(seq(1,100,2)) + sum(seq(0,-100,-2)))  
  else 
    switch(toString(i %% 2),
           '0'=cat(i,'+'),
           '1'=cat(i,'-'))
}

#s 누적
s = 0
for(i in c(1:100)){
  if(i==100){  
    s = s - i
    cat(-i, ' = ', s) }else 
      if(i%%2 == 0){s = s - i 
      cat(-i, ' + ') }else
      {s = s + i
        cat(i, ' + ')} 
}

#이름,국어,영어,수학
name <- '신'
kor <- 85
eng <- 92
math <- 85
switch(
  toString((kor+eng+math)%/%3%/%10),
  '10'=cat(" 이름|총점|평균|등급" ,"\n",name,"|",(kor+eng+math),"|",(kor+eng+math)/3,"|",'A'),
  '9'=cat(" 이름|총점|평균|등급" ,"\n",name,"|",(kor+eng+math),"|",(kor+eng+math)/3,"|",'A'),
  '8'=cat(" 이름|총점|평균|등급" ,"\n",name,"|",(kor+eng+math),"|",(kor+eng+math)/3,"|",'B'),
  '7'=cat(" 이름|총점|평균|등급" ,"\n",name,"|",(kor+eng+math),"|",(kor+eng+math)/3,"|",'C'),
  '6'=cat(" 이름|총점|평균|등급" ,"\n",name,"|",(kor+eng+math),"|",(kor+eng+math)/3,"|",'D'),
  '5'=cat(" 이름|총점|평균|등급" ,"\n",name,"|",(kor+eng+math),"|",(kor+eng+math)/3,"|",'F')
)

print(list(c(1:5),21.3,'god',sin))

c(1:5,2)
seq(1,5,2)

#matrix
M = matrix( c('1','2','3','4','5','6','7','8'), nrow = 2, ncol = 4, byrow = TRUE)
print(M)

M = matrix( c(1:8), nrow = 2, ncol = 4, byrow = TRUE)
print(M)

M = matrix( c('1','2','3','4','5','6','7','8'), nrow = 2, ncol = 4, byrow = FALSE)
print(M)

M = matrix( seq(1,8,1), nrow = 2, ncol = 4, byrow = TRUE)
print(M)

#arrays
a <- array(c('1','2','3','4','5','6'),dim = c(3,3,2))
print(a)
a <- array(c(1:8),c(2,3,2))
print(a)

# Create a vector.
apple_colors <- c('yellow','red','red','red','green','red','red','ace')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)
print(nlevels(factor_apple))

#create dataframe, data.frame()을 사용
BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)

BMI <- 	data.frame(
  name = c("신", "김","차"), 
  height = c(211, 11.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26),
  nation = c('korea','france','china')
)
print(BMI)

print(ls())
#List the variables starting with the pattern "var".
print(ls(pattern = "m"))   


M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
print(M)
print(t(M))
t = M %*% t(M)
print(t)
