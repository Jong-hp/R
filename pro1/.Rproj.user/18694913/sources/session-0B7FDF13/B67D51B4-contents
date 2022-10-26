# 머신러닝(ML)
# 선형회귀분석 : 두 변수간에 상관관계가 있고 인과관계가 있는 경우 모델 작성이 가능하다
# 독립변수(x, 연속형), 종속변수(y, 연속형)
# 모델 수식 : y = wx + b
# 기울기(slope)와 절편(bias)은 최소제곱법 공식을 사용

# 부모의 IQ와 자식의 IQ 데이터를 사용해 선형회귀 분석
# 부모의 IQ와 자식의 IQ는 인과관계가 있다고 가정
x <- c(110, 120, 130, 140, 150) # 부모의 IQ
y <- c(100, 105, 128, 115, 142) # 자식의 IQ

cor(x, y) # 양의 상관관계가 매우 높음
plot(x, y)

x_dev <- x - mean(x)  # 편차
y_dev <- y - mean(y)  # 편차
dev_mul <- (x - mean(x)) * (y - mean(y))
square <- x_dev ** 2
df <- data.frame(x, y, x_dev, y_dev, dev_mul, square)
df

slope <- sum(df$dev_mul) / sum(df$square)
slope # 0.94
bias <- mean(df$y) - slope * mean(df$x)
bias # -4.2
# 모델 수식 y = 0.94 * x + -4.2
y_hat <- slope * 120 + bias
cat('예측값 : ', y_hat, '실제값 : ', 105)

? lm
line_model <- lm(formula = y ~ x)
line_model
plot(x, y)
abline(line_model, col="blue")

new_x = 99.5  # 미지의 x에 대한 y값이 궁금
new_y_hat <- slope * new_x + bias
new_y_hat

predict(line_model, data.frame(x=c(78.5, 123.4, 167.1)))
