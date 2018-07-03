#bmi 함수로

info <- function(height,weight){
  bmi <- weight/(height*height/10000)
  return (c(height,weight,bmi,if(bmi<18.5){'저체중'} 
            else if(18.5 <= bmi && bmi <23) {'정상'} 
            else if(23 <= bmi && bmi <25) {'비만 전단계'} 
            else if(25 <= bmi && bmi <30) {'1단계 비만'} 
            else if(30 <= bmi && bmi <35) {'2단계 비만'} 
            else {'3단계 비만'}))
}
res <-info(180,77)
cat('키:',res[1],' 무게:',res[2],' bmi:',res[3],' level:',res[4])