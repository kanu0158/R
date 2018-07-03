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
res <- grade("강감찬",60,60,60)
class(res$name)
class(res$sum)
class(res$avg)
class(res$grade)