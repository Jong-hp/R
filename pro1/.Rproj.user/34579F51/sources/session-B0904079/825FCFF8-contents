library(rJava)
library(DBI)
library(RJDBC)

drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver", 
            classPath = "C:/work/mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv = drv, "jdbc:mysql://127.0.0.1:3306/test", "root", "123")
conn

dbListTables(conn)  # 테이블 목록 보기

query <- "select jikwon_pay,date_format(now(),'%Y') - date_format(jikwon_ibsail,'%Y') + 1 as jikwon_ibsa from jikwon"

datas <- dbGetQuery(conn, query)
head(datas, 3)
is(datas)
str(datas)
table(datas$jikwon_ibsa)  # 입사년도별 건수

cor(datas$jikwon_ibsa, datas$jikwon_pay)  # r : 0.9196725

model <- lm(formula = jikwon_pay ~ jikwon_ibsa, data = datas)
model
plot(datas$jikwon_ibsa, datas$jikwon_pay)
abline(model, col='red')

summary(model)  

go_func <- function(){
  y_num <- readline('근무년수 입력:')
  y_num <- as.numeric(y_num)
  new_data <- data.frame(jikwon_ibsa=y_num)
  return(predict(model, newdata = new_data))
}

cat('예측결과는 ', go_func())
