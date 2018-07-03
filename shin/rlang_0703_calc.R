#계산기
calc <- function(num1,num2,op){
  return (c(num1,num2,op,switch(
    op,
    '+' = {num1+num2},
    '-' = {num1-num2},
    '*' = {num1*num2},
    '/' = {num1%/%num2},
    '%' = {num1%%num2}
  )))
}
res <- calc(9,3,'%')
cat(res[1]," ", res[3]," " ,res[2], " = ",res[4])