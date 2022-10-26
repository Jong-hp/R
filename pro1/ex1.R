# 데이터 유형(종류)
# numeric(integer, double), character, logical, complex, factor, closure

# numeric
kbs <- 9  # 객체변수에 double type의 객체의 주소를 참조하도록 한다.
# kbs = 9 # 함수 안에서 사용 권장
# 9 -> kbs
object.size(kbs)
typeof(kbs) # 자료형
mode(kbs)   # 자료 유형
class(kbs)  # 자료 구조
mbc <- as.integer(kbs)  # double 을 integer
typeof(mbc)
is(mbc)
mbc <- 5L   # integer로 저장
typeof(mbc)

# character
ss <- '홍길동'
is(ss)
ss[0]
ss[1]
print(ss)  # 함수내에서 출력하고자 할 때
print(ss, kbs)  # 하나만 출력이 된다.
cat(ss)
cat(ss, kbs)  # 복수로 출력이 가능하다.

# logical
b <- TRUE
b <- T
is(b)

# 복 소수 
z <- 5.3-3i
z
Re(z) # 실수
Im(z) # 허수
is(z)

# Factor(요인형 변수) 문자열에 순서를 넣고 싶으면 Factor를 해주면 된다.
kbs <- c('second', 'first', 'third', 'second')
kbs
is(kbs)
plot(kbs)

mbc <- as.factor(kbs)
mbc
is(mbc)
plot(mbc)

# 특수한 값 형태로 
# NULL : 데이터 값 없다(값 인식X)
# NA : 결측값 없음(값 인식O)
# NaN : 수학적으로 정의되지 않은 값(값 인식O)
cat(length(NULL), typeof(NULL))
cat(length(NA), typeof(NA))
cat(length(NaN), typeof(NaN))

sum(2, 3)
sum(2, 3, NULL)  # NULL은 무시하고 연산
sum(2, 3, NA)    # err
sum(2, 3, NaN)   # err
Inf
0 / 0
Inf + -Inf
Inf - Inf

sbs <- 10
strOptions(sbs)

ls()  # 객체목록을 보여준다.
objects()
ls.str()

rm(b) # 하나씩 지울 수 있다.
ls()
rm(list=ls()) # 전체 지움.
ls()
gc()

# package 사용 : 특정dataset + library의 묶음
available.packages()
dim(available.packages())
utils::installed.packages()
base::print(5)

install.packages("plyr")  # packages 설치
library(plyr) # library 로딩
help(plyr) # 도움말
? plyr # 도움말
ls("package:plyr") # 목록 확인
remove.packages("plyr") # packages 제거

# dataset
data() # dataset 목록
iris
head(iris) # 위에서 부터 
tail(iris, 3) # 밑에서 부터
hist(iris$Sepal.Length)

? mean
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))


# <연습문제1> name, age, address 라는 변수에 적당한 데이터를 대입하시오.
# 조건1) 변수의 특성에 맞게 값을 초기화하고 결과를 확인한다.
name <- '신기해'
age <- 33
address <- '강남구'
name
age
print(address)
cat('이름:',name, age, address) # 한번에 보기
# 조건2) 각 변수에 데이터 타입 보기 함수와 타입확인 함수 적용
# typeof(), is.***()
typeof(name)
typeof(age)
is.character(name)
is.numeric(age)
is.numeric(address)

# <연습문제2> R에서 제공하는 women dataset을 이용하여 아래의 조건을 처리하시오.
# <조건1> women dataset은 어떤 데이터의 모음인가?
head(women, 3)
str(women)
? women

# <조건2> women dataset의 자료 유형과 자료구조는?
mode(women)
class(women)
