##rlang_0704_factor

# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

# Create the data frame. == 테이블
input_data <- data.frame(height,weight,gender) # 도메인단위로 쭉 넣음(타입유지해서)
print(input_data)

# Test if the gender column is a factor.
print(is.factor(input_data)) #구분 불가 false
print(is.factor(input_data$gender)) #구분이가능해서 true
print(is.factor(input_data$weight)) #구분 불가 false
print(is.factor(input_data$height)) #구분 불가 false
print(is.data.frame(input_data))
# Print the gender column so see the levels.
print(input_data$gender)

#바차트
barplot(height,weight)
