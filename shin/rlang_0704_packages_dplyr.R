##tidyverse 그중 dplyr 

# Alternatively, install just dplyr:
install.packages("dplyr")
library(dplyr)
library(ggplot2)
path <- getwd() #현재 워킹디렉토리 
path
setwd("csv_exam")
df_exam <- read.csv("csv_exam.csv",stringsAsFactors = F)
df_exam

## 문자가 들어있는 파일을 불러올때는 stringAsFactors = F
## 를 넣어줄것. 지정하지 않으면 문자요소는 factor 로
## 전환 됨. 숫자는 전환 되지 않음
View(df_exam)
df_exam <- rename(df_exam,userid = id)

#세 과목 평균 속성 추가
mean((df_exam$math+df_exam$english+df_exam$science)/3)
df_exam$avg <- (df_exam$math+df_exam$english+df_exam$science) /3
#평균등급
df_exam$grade <- ifelse(df_exam$avg >= 75, "A",
                        ifelse(df_exam$avg >= 65, "B",
                               ifelse(df_exam$avg >= 55, "C",
                                      ifelse(df_exam$avg >= 45, "D", "F"))))
## dplyr
# filter() 행추출
# select() 열추출
# arrange() 정렬
# mutate() 변수추가
# summarise() 통계치산출
# group_by() 집단별로 나누기
# left_join() 데이터합치기(열)
# bind_rows() 데이터합치기(행)