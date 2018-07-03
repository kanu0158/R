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
#dataframe 구현
grade.data <- data.frame(
  st_name = c(res[[1]]$name,res[[2]]$name,res[[3]]$name,res[[4]]$name,res[[5]]$name),
  score_sum = c(res[[1]]$sum,res[[2]]$sum,res[[3]]$sum,res[[4]]$sum,res[[5]]$sum),
  score_avg = c(res[[1]]$avg,res[[2]]$avg,res[[3]]$avg,res[[4]]$avg,res[[5]]$avg),
  score_grade = c(res[[1]]$grade,res[[2]]$grade,res[[3]]$grade,res[[4]]$grade,res[[5]]$grade),
  stringsAsFactors = FALSE
)

print(grade.data)

name <- data.frame(grade.data$st_name,grade.data$score_sum)
result 

##파이차트
name_avg1 <- paste(res[[1]]$name,",",res[[1]]$avg)
name_avg2 <- paste(res[[2]]$name,",",res[[2]]$avg)
name_avg3 <- paste(res[[3]]$name,",",res[[3]]$avg)
name_avg4 <- paste(res[[4]]$name,",",res[[4]]$avg)
name_avg5 <- paste(res[[5]]$name,",",res[[5]]$avg)

x <- c(res[[1]]$avg,res[[2]]$avg,res[[3]]$avg,res[[4]]$avg,res[[5]]$avg)
labels <- c(name_avg1, name_avg2, name_avg3, name_avg4,name_avg5)
pie(x,labels)

##바차트
barplot(c(res[[1]]$avg,res[[2]]$avg,res[[3]]$avg,res[[4]]$avg,res[[5]]$avg),names.arg = c(res[[1]]$name,res[[2]]$name,res[[3]]$name,res[[4]]$name,res[[5]]$name))

##히스토그램
hist(c(9,13,41,8,36,22,12,41,31,33,19),xlab = "grade",col = c("yellow","blue","red","green","brown"),border = "blue")
##라인차트
plot(c(7,12,28,3,41),type = "o")
##산포도차트
input <- mtcars[,c('wt','mpg')]
print(input)
plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)
##주식차트
input <- mtcars[,c('mpg','cyl')]
print(head(input))
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")


