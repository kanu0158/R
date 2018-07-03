grade <- function(name,kor,eng,math){
  x <- c(kor,eng,math)
  return (c(name,sum(x),mean(x), switch(
    toString(mean(x)%/%10),
    '10' = 'A',
    '9' = 'A',
    '8' = 'B',
    '7' = 'C',
    '6' = 'D',
    '5' = 'F'
  )))
}
res <- grade("강감찬",60,60,60)
res[2]
res
class(res[1])
class(res[2])
class(res[3])
class(res[4])
#dataframe 개선
grade <- function(name,kor,eng,math){
  x <- c(kor,eng,math)
  return (list(name=name,sum=sum(x),avg=mean(x), grade=switch(
    toString(mean(x)%/%10),
    '10' = 'A',
    '9' = 'A',
    '8' = 'B',
    '7' = 'C',
    '6' = 'D',
    '5' = 'F'
  )))
}
res <- list(grade("김신욱",60,60,60),grade("구자철",70,70,70),grade("손흥민",90,90,90),grade("조현우",100,100,100),grade("이승우",80,80,80))
class(res$name)
class(res$sum)
class(res$avg)
class(res$grade)

#dataframe 구현
grade.data <- data.frame(
  st_name = c(res[[1]]$name,res[[2]]$name,res[[2]]$name,res[[3]]$name,res[[4]]$name),
  score_sum = c(res[[1]]$sum,res[[2]]$sum,res[[2]]$sum,res[[3]]$sum,res[[4]]$sum),
  score_avg = c(res[[1]]$avg,res[[2]]$avg,res[[2]]$avg,res[[3]]$avg,res[[4]]$avg),
  score_grade = c(res[[1]]$grade,res[[2]]$grade,res[[2]]$grade,res[[3]]$grade,res[[4]]$grade),
  stringsAsFactors = FALSE
)

print(grade.data)

# Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE
)
# Print the data frame.			
print(emp.data) 

