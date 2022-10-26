# 통계분석 : 어떤 데이터가 주여졋을 때 데이터 간의 관계를 파악하고, 이를 분석하는 것

# 기술통계 : 자료를 정리하고 요약 및 시각화를 하는 기초적인 총계
# 중심경향값 (평균, 중위수, 최빈수), 산포도(분산, 표준편차, 범위, 사분위수), 분포도(왜도, 첨도)
# 기초 통계량 계산 함수 약간 보기

mean(1:5)
var(1:5)
sd(1:5)
summary(1:10)

# 표준화(Standardization), 정규화(Normalization)
# 표준화 : 평균과 표준편차를 사용하여 평균이 0, 표준편차를 1로 만드는 작업
# 수식 : (요소값 - 평균) / 표준편차

# iris dataset로 작업
head(iris, 3)

df <- iris[, 1:4]
head(df, 3)
dim(df)
# 방법1 : 수식 직접 사용
(iris$Sepal.Length - mean(iris$Sepal.Length)) / sd(iris$Sepal.Length)
df$Sepal.Length

# 방법2 : 내장 사용
scale(df$Sepal.Length)
scale(df)

# 방법3 : 함수작성 후 사용
func1 <- function(x){
  return((x - mean(x)) / sd(x))
}

func1(df$Sepal.Length)

# 방법3 : 내장 함수 사용
apply(X=as.matrix(df$Sepal.Length), MARGIN = 2, FUN = "func1")
apply(X=df, MARGIN = 2, FUN = "func1")


# 정규화 : 최대값과 최소값을 사용하여 원래 데이터의 최소값을 0, 최대값을 1로 만드는 방법
# 수식 : (요소값 - 최소값) / (최대값 - 최소값)
func2 <- function(x){
  return((x - min(x)) / (max(x) - min(x)))
}

func2(iris$Sepal.Length)
func2(1:10)
func2(c(5000:5100, 10))
func2(-10:-20)

# 변동계수(c.v) : 평균에 대한 표준편차의 비율. 표준편차를 산술평균으로 나눈 것
# 평균이 크게 다른 두개 이상의 집단이 있을 때, 각 집단의 상대적 동질성을 감안한 산포도의 척도
# 변동계수 = 표준편차 / 평균

# 예) 3개의 생물에 대해 2명의 관측자가 물 용량을 측정한 데이터가 있다.
tom <- c(54, 50, 52)  # 물 : 리터 단위 측정
james <- c(54017, 49980, 52003) # 물 : 밀리리터 단위 측정
mean(tom) #52
mean(james) #52000
sd(tom)
sd(james)

sd(tom) / mean(tom) # 리터 단위 측정한 변동계수
sd(james) / mean(james) # 밀리리터 단위 측정한 변동계수

