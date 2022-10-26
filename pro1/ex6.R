# 멜론 노래 가사 읽기

install.packages('httr')
library(httr)
install.packages('XML')
library(XML)

url <- "https://www.melon.com/song/popup/lyricPrint.htm?songId=10000"
source <- htmlParse(rawToChar(GET(url)$content))
source

text <- xpathSApply(source, "//div[@class='box_lyric_text']", xmlValue)
text

mytext <- gsub("[\r\n\t]","", text)
mytext

# ---------------------------------
# xml data 읽기
url <- "https://raw.githubusercontent.com/pykwon/python/master/seoullibtime5.xml"
r <- GET(url)
doc <- xmlTreeParse(r, useInternalNodes = T)
doc

rootNode <- xmlRoot(doc)
rootNode
rootNode[[1]]
rootNode[[1]][[1]]

xmlSApply(rootNode, xmlValue)

xpathSApply(rootNode, "//LBRRY_NAME", xmlValue)

# -----------------------------
# json data 읽기
install.packages("rjson")
library(rjson)
url <- "https://raw.githubusercontent.com/pykwon/python/master/seoullibtime5.json"
doc <- fromJSON(file=url)
doc
df <- data.frame(doc)
df
df$SeoulLibraryTime.row.LBRRY_NAME
df$SeoulLibraryTime.row.ADRES
