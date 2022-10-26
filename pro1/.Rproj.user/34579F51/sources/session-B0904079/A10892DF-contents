# 단순선형회귀 모델 작성
head(women, 2)
summary(women)
cor(women$height, women$weight) #0.9954948
plot(women$height, women$weight)

# 인과관계가 있다고 가정하고 회귀분석 모델 작성
mfit <- lm(formula = weight ~ height, data = women)
mfit
abline(mfit, col='red')

summary(mfit) # 모델 관련 요약 통계량 표시
# p-value: 1.091e-14 < 0.05 이므로 현재모델은 유의하다. 인과관계가 있음이 증명
37.85 * 37.85
3.45000 / 0.09114

# y = wx + b    3.45 * x + -87.51667
y_hat = 3.45 * 58 + -87.51667
y_hat
y_hat <- predict(mfit, data.frame(height=c(58, 45, 67, 77)))
y_hat

# 상관계수 분석
cor.test(women$height, women$weight)


# 회귀분석모형의 적절성을 위한 조건 : 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.
# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.
plot(mfit)
par(mfrow=c(2, 2))
plot(mfit)
