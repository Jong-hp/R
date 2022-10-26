# 상관계수 : 변수들 간의 관련성을 분석. 공분산을 표준화한 값. -1 ~ 0 ~ 1 사시의 값으로 관계를 분석
# 공분산 : 두 개 이상의 확률변수에 대한 관계를 보여주는 값. 힘의 방향은 알 수 있으나 크기는 제각각이다.
plot(1:5, 2:6)
cov(1:5, 2:6) # 2.5 이므로 우상향 패턴을 보임

plot(1:5, c(3, 3, 3, 3, 3))
cov(1:5, c(3, 3, 3, 3, 3))  # 0 이므로 패턴을 보이지 않음

plot(1:5, 5:1)
cov(1:5, 5:1) # -2.5 이므로 우하향 패턴을 보임
plot(1:5, c(5000, 4000, 3000, 2000, 1000))
cov(1:5, c(5000, 4000, 3000, 2000, 1000))
cor(1:5, 5:1)
cor(1:5, c(5000, 4000, 3000, 2000, 1000))

plot(1:5, c(5000, 3500, 2200, 1000, 1200))
cov(1:5, c(5000, 3500, 2200, 1000, 1200)) # 공분산
cor(1:5, c(5000, 3500, 2200, 1000, 1200)) # 상관계수

# 프랜시스 골턴이 만든 csv 자료를 사용
hf <- read.csv("testdata/galton.csv", header = T)
head(hf, 3)
dim(hf)
str(hf)
summary(hf)

hf_man <- subset(hf, sex=='M')
hf_man
hf_man <- hf_man[c("father", "height")]
dim(hf_man)
head(hf_man, 3)

# 공분산 : 수식
f_mean <- mean(hf_man$father)
s_mean <- mean(hf_man$height)
cov_sum <- sum((hf_man$father - f_mean) * (hf_man$height - s_mean)) # 편차 곱의 합
cov_xy <- cov_sum / (nrow(hf_man) - 1)
cov_xy # 2.368441

cov(hf_man$father, hf_man$height) # 2.368441

# 상관계수 : 수식
r_xy <- cov_xy / (sd(hf_man$father) * sd(hf_man$height))
r_xy # 0.3913174

# 상관계수  : 함수
cor(hf_man$father, hf_man$height) # 0.3913174

plot(height ~ father, data = hf_man)
abline(lm(height ~ father, data = hf_man), col='red', lwd=2)

# 상관계수 검정 : 상관계수의 통계적 유의성을 판단할 수 있다
cor.test(hf_man$father, hf_man$height, method = 'pearson')
c