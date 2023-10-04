#################### 파일 가져오기.

ex_data = read.table('C:/Rstudy/data_ex.txt',
                     encoding = 'EUC-KR', fileEncoding = 'UTF-8')
View(ex_data)
ex_data1 = read.table('C:/rstudy/data_ex.txt', encoding = 'EUC-KR'
                      , fileEncoding='UTF-8', header = TRUE)
View(ex_data1)
varname = c('ID','SEX','AGE','AREA')
ex1_data = read.table('C:/Rstudy/data_ex_col.txt',encoding = 'EUC-KR',
                      fileEncoding='UTF-8', col.names = varname)
View(ex1_data)
ex_data2 = read.table('C:/rstudy/data_ex.txt', encoding = 'EUC-KR'
                      , fileEncoding='UTF-8', header = TRUE,
                      skip = 2)
View(ex_data2)
ex_data3 = read.table('C:/rstudy/data_ex.txt', encoding = 'EUC-KR'
                      , fileEncoding='UTF-8', header = TRUE,
                      nrows = 7)
View(ex_data3)
ex_data4 = read.table('C:/Rstudy/data_ex1.txt',encoding = 'EUC-KR'
                      , fileEncoding='UTF-8', header = TRUE,
                      sep = ',')
View(ex_data4)

ex_data = read.csv('C:/Rstudy/data_ex.csv')
View(ex_data)

install.packages('readxl')
library(readxl)
excel_data_ex = read_excel('C:/rstudy/data_ex.xlsx')
View(excel_data_ex)

install.packages('XML')
library(XML)
xml_data = xmlToDataFrame('C:/rstudy/data_ex.xml')
View(xml_data)

install.packages('jsonlite')
library(jsonlite)
json_data = fromJSON('C:/rstudy/data_ex.json')
str(json_data)


#################### 데이터 요약하기.

data()
data('iris')
iris
str(iris)                  # 데이터 구조 확인
ncol(iris)
nrow(iris)
dim(iris)
length(iris)
length(iris$Species)
ls(iris)                   # 변수명 출력
head(iris)
tail(iris)
tail(iris, n=8)
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
min(iris$Sepal.Length)
max(iris$Sepal.Length)
range(iris$Sepal.Length)   # 최솟값, 최댓값의 범위
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, probs = 0.3)   # 분위수 출력
var(iris$Sepal.Length)
sd(iris$Sepal.Length)
install.packages('psych')
library(psych)
kurtosi(iris$Sepal.Length)    # 첨도 구하기. 정규분포보다 완만함.
skew(iris$Sepal.Length)       # 왜도 구하기. 오른쪽 꼬리가 긺.
install.packages('descr')
library(descr)
freq_test = freq(iris$Sepal.Length, plot = F)    # 변수의 빈도 구하기.
freq_test                                        # plot == 막대그래프 옵션.


#################### 그래프로 데이터 시각화 하기.

library(descr)
library(readxl)
exdata1 = read_excel('C:/rstudy/Sample1.xlsx')
head(exdata1)
freq(exdata1$SEX, plot=TRUE, main = '성별(barplot)')    # 막대그래프
dist_sex = table(exdata1$SEX)
dist_sex
barplot(dist_sex)
barplot(freq(exdata1$SEX))   # 틀린 예시.
barplot(table(exdata1$SEX), ylim = c(0,14), main = 'BARPLOT', xlab = 'SEX',
        ylab = 'FREQ', names = c('Female','Male'), col = c('purple','pink'))

boxplot(exdata1$Y21_CNT, exdata1$Y20_CNT)               # 상자그림 BOXPLOT.
attach(exdata1)
boxplot(Y21_CNT, Y20_CNT, ylim = c(0,60), main = 'boxplot',
        names = c('21년 건수', '20년 건수'), col = c('gray','lightblue'))

hist(AGE, xlim = c(0,60), ylim = c(0,7),                # 히스토그램
     main = 'AGE 분포', col = 'deeppink')

data(mtcars)
pie(table(mtcars$gear))                                 # 파이차트

x = c(1,2,3,4,6,6,8,8,9,4,4,5)
stem(x)                                                 # 줄기와 잎 그림  
stem(x, scale = 2)
stem(x, scale = 0.5)

data(iris)
attach(iris)
plot(Sepal.Length, Petal.Width)                         # 산점도 SCATTER PLOT

pairs(iris)                                             # 산점도 행렬
library(psych)
pairs.panels(iris)


#################### ggplot2 및 ggmap 패키지로 데이터 시각화.

library(ggplot2)
data(airquality)
head(airquality)
str(airquality)
ggplot(airquality, aes(x = Day, y = Temp))              # 빈 그래프 틀 생성

ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point()                                          # 그래프 틀에 산점도
install.packages('farver')
library(farver)
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point(size=1, col='red')

ggplot(airquality, aes(x = Day, y = Temp)) +            # 그래프 틀에 선그래프
  geom_line()

ggplot(mtcars, aes(x = cyl)) + 
  geom_bar(width = 0.5)


#################### 그래프에 객체 추가하기.

data(economics)
ggplot(economics, aes(x = date, y = psavert)) + 
  geom_line() + 
  geom_abline(intercept = 12.18671, slope = -0.0005444)    # 사선 그리기.

ggplot(economics, aes(x = date, y = psavert)) +            # 수평선 그리기.
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))

install.packages('dplyr')
library(dplyr)
x_inter = filter(economics, psavert == min(economics$psavert))$date
                                                           # 저축률 가장 낮은 날
ggplot(economics, aes(x = date, y = psavert)) +            # 수직선 그리기.
  geom_line() +
  geom_vline(xintercept = x_inter)

ggplot(economics, aes(x = date, y = psavert)) +           
  geom_line() + 
  geom_vline(xintercept = as.Date('2005-07-01'))           # 날짜 형식 변환

ggplot(airquality, aes(x = Day, y = Temp)) +               # label 삽입.
  geom_point() +
  geom_text(aes(label = Temp, vjust = 0, hjust = 0))

ggplot(mtcars, aes(x = wt, y = mpg)) +                     # 도형 삽입.
  geom_point() +
  annotate('rect', xmin = 3, xmax = 4, ymin = 12, ymax = 21,
           alpha = 0.5, fill = 'purple')

ggplot(mtcars, aes(x = wt, y = mpg)) +                     # 화살표 삽입.
  geom_point() +
  annotate('rect', xmin = 3, xmax = 4, ymin = 12, ymax = 21,
           alpha = 0.5, fill = 'lightcoral') + 
  annotate('segment', x = 2.5, xend = 3.7, y = 10, yend = 17,
           col = 'darkgreen', arrow = arrow())

ggplot(mtcars, aes(x = wt, y = mpg)) +                     # 화살표 label 삽입.
  geom_point() +
  annotate('rect', xmin = 3, xmax = 4, ymin = 12, ymax = 21,
           alpha = 0.5, fill = 'lightyellow') + 
  annotate('segment', x = 2.5, xend = 3.7, y = 10, yend = 17,
           col = 'navy', arrow = arrow()) +
  annotate('text', x = 2.5, y = 10, label = 'point')

ggplot(mtcars, aes(x = gear)) +
  geom_bar() + 
  labs(x = '기어수', y = '자동차수', title = '변속기 기어별 자동차수')

cor.test(exdata1$Y20_CNT, exdata1$Y21_CNT)            #회귀분석 절편과 기울기
reg_result = lm(Y21_CNT ~ Y20_CNT, data = exdata1)
reg_result
ggplot(exdata1, aes(x = Y20_CNT, y = Y21_CNT)) +
  geom_point() +
  geom_abline(intercept = 0.7104, slope = 0.7864)












