# R애서 제공하는 자료구조(객체 타입) - Vector, Matrix, Array, List, DataFrame
# R은 스칼라 타입 없다. 가장 작은 단위가 1차워 배열인 Vector

# Vector : 1차원 배열

year <- 2022
is.vector(year)

seq(1, 5)
seq(from=1, to=10, by=2) # 등차수열
seq(3, 7) # 3 ~ 7 사이
seq(7, 3)
seq(1, 10, length.out = 4) # 1 ~ 10 사이 4개만
seq(1, 10)

rep(1:3, times=3) # 1,2,3 반복
rep(1:3, each=3) # 수 마다 반복

v <- c(1, 5, 7, 10:20)
v

v2 <- c(1, 2.5, 3, T, F)  # 실수가 하나라도 있으면 전체 실수로 변환한다. T=1, F=0
#v2 <- c(1, 2, 5, 3, T, F)  # 정수가 하나라도 있으면 전체 정수로 변환한다. T=1, F=0
#v2 <- c(1, 2.5, '3', T, F)  # 문자열가 하나라도 있으면 전체 문자열로 변환한다. T=1, F=0
v2

age <- c(23, 26, 32)
age
age[1]
age[2]
age[5]
names(age) <- c('오공', '팔계', '오정')
age
age[3]
age['오정']
age <- c(age, 44)
age
age[10] <- 55 # 10번째
age
length(age)
age <- append(age, 66, after=5) # 위치를 지정해서 추가 할 수 있다.
age
age <- NULL
age
length(age)
rm(age)
age

v1 <- c(13, -5, 15:20, 12, -2:3)  # 내부함수
v1

# 인덱싱 / 슬라이싱
v1[1]
v1[-1]  # 여집합 (13 빼고 나머지)
v1[c(2, 5)]
v1[c(2:5)]
v1[-c(2:5)]
length(v1)
nrow(v1)  # 행렬에서 가능
NROW(v1)

v2 <- v1 + 10 # 연산이 가능
v2
v2 <- v1 %% 3
v2

a <- 1:5
a + 5
a - 5
a * 5
a / 5
sqrt(a) # 제곱 값
sqrt(a)^2

a
b <- 6:10
b
a + b   # 열끼리 연산
a * b
a[6] <- 3
a
union(a, b) # 합집합(중복을 허용 안함)
c(a, b)
setdiff(a, b)
intersect(a, b) # 교집합

# Matrix : 2차원 배열
a <- 1:8
dim(a) <- c(2, 4) # 2행 4열
a
typeof(a)
class(a)
mode(a)

m <- matrix(1:5)  # 5행 1열
m
dim(m) # 5행 1열

# m <- matrix(c(1:9), nrow=3)  # 열부터 채움
m <- matrix(c(1:9), nrow=3, byrow = T)  # 행부터 채움
m
dim(m)

m <- matrix(1:10, 2)  # 2행 5열
m
m <- matrix(1:10, 3)
m
class(m)
m[1,] # 1행만
m[1,1] # 1행 1열만
m[,3] # 3열만
m[c(1,3),c(2:4)]
# m[-c(1,3),-c(2:4)] # 여집합
m[c(1,3),c(1, 2:4)]
m[-1,] # 1행만 빼고 ( 여집합 )

a <- matrix(c(1:9), nrow=3, ncol=3)
a
rownames(a) <- c('r1', 'r2', 'r3') # 행 이름 지정
colnames(a) <- c('one', 'two', 'three') # 열 이름 지정
a
nrow(a)
NROW(a)
dim(a)
length(a) # 갯수

a <- matrix(c(1,2,3,4,5), 2, 2)
b <- matrix(5:8, 2, 2)
a
b

a + 10
a + b # 요소끼리 합

a * b # 아다마르 곱 ( 요소끼리 곱 )

a %*% b # 행렬곱만 가능
# 행렬 곱 : 도형의 면적, 부피 계산, 머신러닝의 차원축소,
# 딥러닝에서 입력자료와 가중치 연산 등을 할 때 사용
# a %+% b # X
a
diag(a) # 주대각값

diag(2) # 간의 행렬

a
t(a) # 행렬전환 (transpose : 전치)
solve(a) # 역행렬
solve(solve(a))
solve(a) %*% a # 간의 행렬

x1 <- c(5, 40, 50:52)
x2 <- c(30, 5, 6:8)
x1
x2
mr <- rbind(x1, x2) # 행묶음
mr
mc <- cbind(x1, x2)
mc


# Array : 다차원 배열

d <- c(1:12)
class(d)
arr1 <- array(d)
arr1
class(arr1)

arr2 <- array(c(1:12), dim=c(6, 2)) # 2차원 6행 2열
arr2

arr3 <- array(c(1:12), dim=c(3, 2, 2)) # 3차원 행,열,면
arr3

arr3[,,2]
arr3[,1,1]  # 1면 1열
arr3[1,,1]  # 1면 1행
arr3[1,1,1]  # 1면 1행 1열

# 사칙연산 가능

# List : 서로 다른 타입의 데이터를 기억(키,값)

num <- list(c(1:5), c(6:10), c("a", "b", "c")) # 타입이 달라도 들어갈 수 있다.
num
num[1]
typeof(num[1]) # list
num[[1]]
typeof(num[[1]]) # integer
num[[1]][2]

number <- list(name='hong', age=22)
number
number$name
number$age

print('----------')
aa <- list()
tracemem(aa) # 객체의 주소를 보여준다.
untracemem(aa) # 주소 추적 해지
