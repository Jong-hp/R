# 함수
# 내장함수
seq(0, 5, by = 1.5)

set.seed(123)
rnorm(10, mean = 0, sd = 1) # 정규분포를 따르는 난수 / https://cafe.daum.net/flowlife/RlkF/31 참고
hist(rnorm(1000, mean = 0, sd = 1))

runif(10, min=0, max=100) # 균등분포
hist(runif(5000, min=0, max=100))

sample(0:10, 5)

vec <- 1:10
min(vec)
range(vec)
mean(vec)
median(vec)
var(vec) # 분산
sqrt(var(vec)) # 표준 편차
sd(vec) # 표준편차
sd(vec) / mean(vec) # 표준편차를 평균으로 나누어준다.
quantile(vec)
sum(vec)
prod(vec) # 곱을 누적한다.
# ...

# 사용자 정의 함수
func1 <- function(arg){
  print(arg)
  return(arg + 10)
}
typeof(func1)

funcl(5)

gugu_func <- function(dan){
  for(d in dan){
    for(i in 1:9){
      cat(d, '*', i, '=',d * i, ' ')
    }
    cat('\n')
  }
}

gugu_func(2:5)
