# 회귀식 적합도에 대한 가설 검정
# iris dataset
head(iris, 3)

cor(iris[, -5])

cor(iris$Sepal.Length, iris$Sepal.Width)  # -0.1175698
plot(iris$Sepal.Length, iris$Sepal.Width)

# Sepal.Length 가 Sepal.Width에 영향을 주는가?
# 선형회귀분석
model1 <- lm(formula =  Sepal.Width ~ Sepal.Length, data = iris)
summary(model1) # 모델의 p-value : 0.1519 > 0.05 이므로 의미없는 모델
# 평가 : Sepal.Length 가 Sepal.Width에 영향을 주지 않는다.
# R-squared 는 상관계수를 제곱한 값. 0.1175698 ** 2

cor(iris$Sepal.Length, iris$Petal.Length)  # 0.8717538
plot(iris$Sepal.Length, iris$Petal.Length)

# Sepal.Length 가 Petal.Length에 영향을 주는가?
# 선형회귀분석
model2 <- lm(formula =  Petal.Length ~ Sepal.Length, data = iris)
summary(model2) # 모델의 p-value : 2.2e-16 < 0.05 이므로 의미있는 모델
# 평가 : Sepal.Length 가 Petal.Length에 영향을 주지 않는다.
0.8 ** 2

