#tidyverse 패키지 그 중 ggplot2
install.packages("ggplot2") #rstudio로 들어오고
library(ggplot2) # 요 파일에서 불러오는 녀석
k <- read.csv(file = "C:\\Users\\1027\\eclipse\\jee-oxygen\\eclipse\\RWorkspace\\2013년_전년대비_시간대별_교통사고_사망자_현황.csv")
x <- c("2","2","3","1","4","4","4","4")
qplot(x)
rm(x)

# manufacturer
# model
# model name
# 
# displ
# engine displacement, in litres
# 
# year
# year of manufacture
# 
# cyl
# number of cylinders
# 
# trans
# type of transmission
# 
# drv
# f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# 
# cty
# city miles per gallon
# 
# hwy
# highway miles per gallon
# 
# fl
# fuel type
# 
# class
# "type" of car
###### mpg 데이터 파악하기
## 내가 모르는 빅데이터를 분석하는 방법
# data = mpg, x축에 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)
# x축 cty
qplot(data = mpg, x = cty)

# mpg 데이터를 데이터 프레임으로 만든다
mpg <- as.data.frame(ggplot2::mpg)
head(mpg) # 상위 6개만 보임
tail(mpg) # 하위 6개만 보임
dim(mpg) ## 234 행  11 열 구조이다
str(mpg) # 각 컬럼들의 타입과 들어있는 값이 나옴
summary(mpg) # df에 대한 요약 정보를 보여준다
mpg$total <- (mpg$cty + mpg$hwy) / 2 # mpg내에 total이라는 속성을 추가시켜 값 대입, 통합 연비 변수 생성
head(mpg)
#통합연비 변수 평균
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)
# total 연비의 평균과 중앙값이 약 20이다
# total 연비가 20~25 사이에 해당하는
# 자동차 모델이 가장 많다.
# 대부분 25 이하이고, 25를 넘기는 자동차는 많지 않다.
## 합격 판정 변수 만들기
## total 이 20 이상이면 pass, 미만이면 fail 을 
## 부여하는 test 라는 변수를 생성합니다.
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg,20)#상위 20개 출력
#합격판정을 받은 자동차 수 살펴보자
table(mpg$test)
?qplot()
qplot(mpg$test, xlab = "평가",ylab = "수")
# 중첩 조건문
# total 30 이상이면 A
# total 20 ~ 29 면 B
# total 20 미만이면 c
mpg$grade <- ifelse(
  mpg$total >= 30, "A",
  ifelse(mpg$total >= 20, "B", "C")
)
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)

mpg$grade <- ifelse(
  mpg$total >= 30, "A",
  ifelse(mpg$total >= 20, "B",
         ifelse(mpg$total >= 10, "C","D")))
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)
#변수명 변경 reshape 설치할 것
#mpg <- rename(mpg, company <- menufacturer)



# ggplot2 패키지에는 미국 동북중부 437개 지역의 
# 인구통계 정보를 담은 midwest 라는 데이터가 
# 들어 있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오
# 1.  poptotal 변수를 total 로, popasian 변수를 
# asian 으로 수정하세요
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
str(midwest)
summary(midwest)
midwest$total <- midwest$poptotal
midwest$asian <- midwest$popasian

# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 
# 백분율' 파생변수를만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보시오.
midwest$asianbytotal <- ((midwest$asian / midwest$total) * 100)
head(midwest)
?hist()
hist(midwest$asianbytotal,xlab = "percent",main = "아시아분포도")

# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large' , 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
asia_avg <- mean(midwest$asianbytotal)
asia_avg
midwest$size <- ifelse(midwest$asianbytotal > asia_avg, "large", "small")
head(midwest)
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
qplot(midwest$size) # 빈도막대그래프
table(midwest$size) # 빈도표
midwest <- subset(midwest,select = -asian) ##삭제
write.csv(midwest, file = "update_midwest.csv") ## csv파일로 저장
