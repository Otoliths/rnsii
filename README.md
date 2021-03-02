This [**rnsii**]package programatically download Chinese biodiversity data from the National Specimen Information Infrastructure <http://www.nsii.org.cn> .


## Installation


### Current beta / GitHub release:

Installation using R package
[**devtools**](https://cran.r-project.org/package=devtools):
```r
if (!requireNamespace(c("devtools","tibble"), quietly = TRUE))
  install.packages("devtools","tibble")
    
devtools::install_github("Otoliths/rnsii")

```

## Example

##### Take "Artemisia argyi"

Load the **rnsii** package
```r
library("rnsii")
```
###### Search family IDs via family name
```r
result <- get_nsii(query = "Artemisia argyi")
```
```r
Download  date: 2021-03-03
Query successfully: Artemisia argyi
Include latitude and longitude: Artemisia argyi
```
```r
result <- get_nsii(query = "Artemisia argyi")
```

```r
str(result)
```
List of 10
 $ Title      : chr "Artemisia argyi"
 $ Description: chr "多年生草本或略成半灌木状，植株有浓烈香气。主根明显，略粗长，直径达1.5厘米，侧根多；常有横卧地下根状茎及营养枝。"| __truncated__
 $ QueryName  : chr "Artemisia argyi"
 $ LatinName  : chr "Artemisia argyi"
 $ CommonName : chr "艾"
 $ Images     :'data.frame':	1 obs. of  5 variables:
  ..$ title      : chr "Artemisia argyi"
  ..$ description: chr ""
  ..$ type       : chr "image"
  ..$ source     : chr "http://www.nsii.org.cn/eol/eolmedia/13256627.jpg"
  ..$ url        : chr "http://www.nsii.org.cn"
 $ Specimens  :'data.frame':	921 obs. of  9 variables:
  ..$ barcode     : chr [1:921] "0021954" "0021953" "0021952" "0000681" ...
  ..$ sname       : chr [1:921] "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" ...
  ..$ commonName  : chr [1:921] "艾" "艾" "艾" "艾" ...
  ..$ latitude    : num [1:921] 29.8 31.6 30.2 31.3 31.3 31.3 33.8 34.1 37.4 37.4 ...
  ..$ longitude   : num [1:921] 110 111 109 109 109 ...
  ..$ recordedby  : chr [1:921] "李洪钧" "鄂神农架植考队" "黄仁煌" "方明渊" ...
  ..$ recordnumber: chr [1:921] "5984" "21740" "3389" "23960" ...
  ..$ locality    : chr [1:921] "中国湖北鹤峰县" "中国湖北神农架林区" "中国湖北利川市" "中国重庆奉节县" ...
  ..$ year        : chr [1:921] "1958" "1976" "1975" "1958" ...
 $ StatusCode : int 0
 $ Status     : chr "ok"
 $ Message    : chr ""
```r
tibble::tibble(result$Specimens)
```
```r
# A tibble: 921 x 9
   barcode sname           commonName latitude longitude recordedby     recordnumber locality           year 
   <chr>   <chr>           <chr>         <dbl>     <dbl> <chr>          <chr>        <chr>              <chr>
 1 0021954 Artemisia argyi 艾             29.8      110. 李洪钧         5984         中国湖北鹤峰县     1958 
 2 0021953 Artemisia argyi 艾             31.6      111. 鄂神农架植考队 21740        中国湖北神农架林区 1976 
 3 0021952 Artemisia argyi 艾             30.2      109. 黄仁煌         3389         中国湖北利川市     1975 
 4 0000681 Artemisia argyi 艾             31.3      109. 方明渊         23960        中国重庆奉节县     1958 
 5 0000680 Artemisia argyi 艾             31.3      109  张泽荣         25990        中国重庆奉节县     1958 
 6 0000677 Artemisia argyi 艾             31.3      109. 方明渊         24868        中国重庆奉节县     1958 
 7 0000676 Artemisia argyi 艾             33.8      108. 张襄明         350          中国陕西周至县     1958 
 8 0000675 Artemisia argyi 艾             34.1      108. 张襄明         947          中国陕西眉县       1958 
 9 0000671 Artemisia argyi 艾             37.4      114  刘鑫源         914          中国河北赞皇县     1951 
10 0000670 Artemisia argyi 艾             37.4      114  刘鑫源         1101         中国河北赞皇县     1951 
# … with 911 more rows
```
