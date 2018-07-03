##가위바위보 함수로
num_toString <- function(rps_num){
  return (switch(toString(rps_num),
                 '1' = '가위',
                 '2' = '바위',
                 '3' = '보'))
}
rps <- function(my){
  com <- sample(1:3,1,replace = TRUE)
  return (c(num_toString(my),
            num_toString(com),
            switch(
              toString(my-com),
              '-2' = {"승리"},
              '1' = {"승리"},
              '-1' = {"패배"},
              '2' = {"패배"},
              '0' = {"비김"}
            )))
}
res <- rps(2)
cat("나 : ",res[1]," 컴퓨터 :",res[2]," 결과 :",res[3])
