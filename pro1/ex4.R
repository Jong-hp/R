# 연산자
# 산술 : +, -, *, /, %%, ^, **
# 관계 : ==, !=, >, >=, <, <=
# 논리 : &, |, !, xor()

no <- 7
no >= 2 + 2 * 2 | no < 5 %% 2
no >= 5 & no <= 10
(no != 6) # ( ) 를 써도 출력이 된다.

# 제어문 : 조건 판단문 - if, switch, which
# 1) if() 함수 
x <- 10; y <- 5

if(x + y >= 10){
  cat('결과는 ', x+y)
  cat('\n참일 때 수행')
}else{
  print('거짓일 때 수행')
  a = 10
}

# 2) ifelse(조건, 참, 거짓)
ifelse(x > 5, 'good', 'bad')

# mpg dataset을 사용
install.packages('ggplot2')
library(ggplot2)
head(mpg, 3)

mpg <- as.data.frame(ggplot2::mpg)
head(mpg, 3)
dim(mpg)
str(mpg)
summary(mpg)

# 새로운 칼럼(변수)를 추가 : 통합연비
mpg$total <- (mpg$cty + mpg$hwy) / 2
head(mpg, 3)

if(mean(mpg$total) >= 20){
  print('우수연비')
}else{
  print('일반연비')
}

summary(mpg$total)
hist(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, 'pass', 'fail')
head(mpg, 3)
tail(mpg, 3)
table(mpg$test)

mpg$grade <- ifelse(mpg$total >= 30, 'A', ifelse(mpg$total >= 20, 'B', "c"))
head(mpg, 3)
qplot(mpg$grade)
qplot(data = mpg, x=grade)

# switch
switch("age", id="hong", age=22)
a <- 1
switch(a, mean(1:10), sd(1:10))
a <- 2
switch(a, mean(1:10), sd(1:10))

# which 
name <- c("kor", 'eng', 'mat', 'kor')
which(name=='eng')

no <- 10:13
df <- data.frame(번호=no, 이름=name)
df
which(df$번호==12)
which(df$이름=='kor')

# 반복문 : for, while, repeat
# for
su <- 1:10  # 1~10 출력
for(n in su){
  cat(n)
}

for(num in 1:9){  # 2단 출력
  res = 2 * num
  cat(2, '*', num, '=', res, '\n')
}

for(n in su){
  if(n %% 2 == 0){
    next
  }else{
    print(n)
  }
}

# while
i <- 0
while(i < 10){
  i = i + 1
  print(i)
}

i <- 0
while(TRUE){
  i = i + 1
  print(i)
  if(i == 3) break
}
cat('반복문 수행 후 i : ', i)

# repeat
cnt <- 1
repeat{
  print(cnt)
  cnt = cnt + 2
  if(cnt > 10) break
}
