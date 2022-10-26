# DataFrame : 2차원 구조 - 열 단위로 같은 타입의 자료를 기억

# 생성방법1 : vector를 이용 data.frame
no <- c(1,2,3)
name <- c('hong', 'lee', 'kim')
pay <- c(330, 450, 500)
df <- data.frame(bunho=no, irum=name, imkum=pay)
df
class(df)
mode(df)
is(df)
df$irum

df <- data.frame(irum=c('james','oscar','tom'),
                 nai=c(22, 25, 27),
                 row.names = c('one', 'two', 'three'))
df

nrow(df) # 행 갯수
ncol(df) # 열 갯수
str(df)
summary(df)
head(df, n=2)
tail(df, n=2)
rownames(df)
colnames(df)

# 생성방법2 : Matrix(배열)를 이용 data.frame
m <- base::matrix(c(1,'hong',150,2,'lee', 250,3,'kim',350), 3, by=T)
m
mdf <- data.frame(m)
mdf

m <- matrix(1:6, nrow = 3)
mdf <- data.frame(m)
mdf
colnames(mdf) <- c("c1", "c2")
mdf

mdf$c1 # 인덱싱
mdf['c1']
mdf[1]
mdf[-1]
mdf[1, 2]
mdf[, 2]
mdf[1, ]
mdf[1:2, 1:2]
mdf[2:3, c(1,2)]
mdf[2:3, c('c1','c2')]

# 조건 지정해 행 출력
mdf[mdf$c1 == 2,] # c1에 있는 2행을 출력
subset(mdf, c1 == 2)
?subset

mdf[mdf$c1 == 2 & mdf$c2 == 5, ]
subset(mdf, c1 == 2 & c2 == 5) # 관계연산자를 쓸 수 있다.

mdf[mdf$c1 == 2, c(1, 2)]
subset(mdf, c1 == 2, select = c(2))
subset(mdf, c1 == 2, select = c(1, 2)) # subset은 속성으로 select 를 사용 할 수 있다.

mdf$c2 <- ifelse(mdf$c2 == 4, NA, mdf$c2)
mdf
summary(mdf)
mean(mdf$c1)
mean(mdf$c2)
mean(mdf$c2, na.rm = T) # NA(결측치)를 제외하고 연산

# 행 또는 렬 추가
mdfr <- rbind(mdf, c(10, 11)) # 행 추가
mdfr

mdfc <- cbind(mdf, c3=c('a','b','c'), c4=c('a1','a2','a3')) # 렬 추가
mdfc

# 열삭제
mdfc[, 'c1'] <- NULL
mdfc

# 행 삭제
mdfr <- mdfr[-1,]
mdfr

# 생성방법3 : 파일을 이용하여 data.frame 생성
getwd() # 현재 경로
txtdf <- read.table('testdata/emp.txt', header = T) # 데이터 파일 읽어오기
txtdf
is(txtdf)

csvdf <- read.csv('testdata/emp.csv')
csvdf

csvdf$이름
sum(csvdf$급여)
mean(csvdf$급여)
sd(csvdf$급여)

# DataFrame을 스크립트 파일로 저장(rdata)
df <- data.frame(eng=c(90, 80, 70), mat=c(55, 67, 90), class=c(1,2,3))
df
write.csv(df, file = 'output/mydf.csv')
# ?write.csv

save(df, file='output/mydf.rda') # rda형식으로 저장
rm(df)
df
load('output/mydf.rda') # 파일을 읽어준다.
df

# 객체 file i/o
x <- 1:5
y = 6:10
save(x, y, file = 'output/xy.RData') # 객체 저장
rm(list=ls())
load('output/xy.RData') # 객체 읽어오기
