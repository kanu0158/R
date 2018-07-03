##stmt 를 합치면 function이 된다.
##4가지가 반드시 있어야 function이 된다.. R syntax
#이름,국어,영어,수학
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
cat(res)
cat(" 이름|총점|평균|등급" ,"\n",res[1],"|",res[2],"|",res[3],"|",res[4])
cat(" 이름|총점|평균|등급" ,"\n",grade("강감찬",60,60,60)[1],"|",grade("강감찬",60,60,60)[2],"|",grade("강감찬",60,60,60)[3],"|",grade("강감찬",60,60,60)[4])
