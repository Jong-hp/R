# 회귀모델 평가
cars  # 자동차의 속도와 제동거리
head(cars, 3)
cor(cars)
is(cars)

# 속도에 따른 제동거리 예측 모델

model <- lm(formula = dist ~ speed, data = cars)
summary(model)

coef(model)

fitted(model)[1:4] # 모델이 예측한 값(dist)

residuals(model)[1:4] # 모델과 실제값과의 차이(residuals, 잔차)

cars[1:4,]
fitted(model)[1:4] + residuals(model)[1:4]  # 예측값 + 잔차 = 실제값. 잔차 = 실제값 - 예측값

confint(model)

predict(model, newdata = data.frame(speed=10))
predict(model, newdata = data.frame(speed=c(10, 15, 20)))
predict(model, newdata = data.frame(speed=10), interval = 'confidence')

# 모델 간 평가
full_model <- lm(dist ~ speed, data = cars) # 완전모형
full_model

reduce_model <- lm(dist ~ 1, data = cars) # 축소모형
reduce_model

anova(reduce_model, full_model) # 두 모델을 비교
# p-value : 1.49e-12 < 0.05 이므로 두 모델 간 유의한 차이가 있다.
# 다시 말하면 speed 변수가 유의미한 독립변수임을 알 수 있다.


# 정형 데이터 처리 : RDBMS와 연동
# RJDBC api를 사용
install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
# Sys.setenv(JAVA_HOME="c:/Program Files/Java/jdk-11.0.5")  c:\\Program Files\\Java\\jdk-11.0.5
library(rJava)
library(DBI)
library(RJDBC)

drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver",
            classPath = "c:/work/mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv = drv, "jdbc:mysql://127.0.0.1:3306/test", "root", "123")
conn

dbListTables(conn)

# sangdata table로  crud 경험



query <- "select jikwon_pay, date_format(now(), '%Y')-date_format(jikwon_ibsail,'%Y') + 1 as jikwon_ibsa from jikwon;"
jik <- dbGetQuery(conn, query)
jik


# 속도에 따른 제동거리 예측 모델

jik_model <- lm(formula = jikwon_pay ~ jikwon_ibsa, data = jik)
summary(jik_model)

coef(jik_model)


cor(jik$jikwon_ibsa, jik$jikwon_pay)  # 0.9196725
plot(jik$jikwon_ibsa, jik$jikwon_pay)

fitted(jik_model)[1:4] # 모델이 예측한 값(dist)

residuals(jik_model)[1:4] # 모델과 실제값과의 차이(residuals, 잔차)

jik[1:4,]
fitted(jik_model)[1:4] + residuals(jik_model)[1:4]  # 예측값 + 잔차 = 실제값. 잔차 = 실제값 - 예측값

confint(jik_model)


y_num <- readline('근무년수 입력:')
y_num <- as.numeric(y_num)
y_num

predict(jik_model, newdata = data.frame(jikwon_ibsa=y_num))





