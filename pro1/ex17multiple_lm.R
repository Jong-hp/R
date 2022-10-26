# 다중회귀분석 : 독립변수가 복수

head(state.x77, 3)
colnames(state.x77)
dim(state.x77)
str(state.x77)
cor(state.x77)

states <- as.data.frame(state.x77[, c('Murder', 'Population', 'Illiteracy', 'Income', 'Frost')])
head(states, 3)
cor(states)

# 다중회귀모델
mfit <- lm(formula = Murder ~ Population+Illiteracy+Income+Frost, data = states)
mfit
summary(mfit) # p-value : 9.133e-08 < 0.05 유의한 모델. Adjusted R-squared:  0.5285

# *** 선형회귀분석의 기존 가정 충족 조건 ***
# . 선형성 : 독립변수(feature)의 변화에 따라 종속변수도 일정 크기로 변화해야 한다.
# . 정규성 : 잔차항이 정규분포를 따라야 한다.
# . 독립성 : 독립변수의 값이 서로 관련되지 않아야 한다.
# . 등분산성 : 그룹간의 분산이 유사해야 한다. 독립변수의 모든 값에 대한 오차들의 분산은 일정해야 한다.
# . 다중공선성 : 다중회귀 분석 시 3 개 이상의 독립변수 간에 강한 상관관계가 있어서는 안된다.

# 모델을 시각화
par(mfrow=c(2, 2))
plot(mfit)

# 잔차항의 정규성 검정
shapiro.test(residuals(mfit))  # p-value : 0.6672 > 0.05 정규성 만족

# 독립성 검정
install.packages("car")
library(car)
durbinWatsonTest(mfit)   
# D-W Statistic : 2.317  0~4의 범위이며 2근처의 값이 나와야 자기상관관계가 없다. 독립성 만족

# 선형성 검정
boxTidwell()
