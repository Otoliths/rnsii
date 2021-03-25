This **rnsii** package programatically download Chinese biodiversity data from the National Specimen Information Infrastructure <http://www.nsii.org.cn> .


## :arrow\_double\_down: Installation


### Current beta / GitHub release:

Installation using R package
[**devtools**](https://cran.r-project.org/package=devtools):
```r
if (!requireNamespace(c("devtools","tibble"), quietly = TRUE))
  install.packages("devtools","tibble")
    
devtools::install_github("Otoliths/rnsii",build_vignettes = TRUE)

```

## :beginner: Example

###### Load the **rnsii** package
```r
library("rnsii")
```
##### Take "Artemisia argyi"

###### Download specimen data from the NSII

```r
result1 <- get_nsii(query = "Artemisia argyi",offset = 0)
```
```r
# Download  date: 2021-03-25
# No encoding supplied: defaulting to UTF-8.
# Query successfully: Artemisia argyi(1796)
```
```r
str(result1)
```
```r
# List of 5
# $ from  : chr "国家植物标本资源库"
# $ total : int 1796
# $ offset: int 0
# $ limit : int 30
# $ data  :'data.frame':	30 obs. of  13 variables:
#   ..$ collectionID   : chr [1:30] "bca470dc" "bca47178" "bca47214" "bca472b0" ...
# ..$ institutionCode: chr [1:30] "WUK" "WUK" "WUK" "WUK" ...
# ..$ collectionCode : chr [1:30] "0357558" "0371743" "0365274" "0356022" ...
# ..$ canonicalName  : chr [1:30] "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" ...
# ..$ formattedName  : chr [1:30] "<em>Artemisia argyi</em>  <em></em>  <em></em>" "<em>Artemisia argyi</em>  <em></em>  <em></em>" "<em>Artemisia argyi</em>  <em></em>  <em></em>" "<em>Artemisia argyi</em>  <em></em>  <em></em>" ...
# ..$ chineseName    : chr [1:30] "艾" "艾" "艾" "艾" ...
# ..$ recordNumber   : chr [1:30] "11193" "10505" "18245" "8733" ...
# ..$ year           : chr [1:30] "1959" "1959" "1978" "1959" ...
# ..$ recordedBy     : chr [1:30] "李培元" "张志英" "张志英" "李培元" ...
# ..$ country        : chr [1:30] "中国" "中国" "中国" "中国" ...
# ..$ stateProvince  : chr [1:30] "湖北省" "甘肃省" "陕西省" "陕西省" ...
# ..$ withPhoto      : chr [1:30] "0" "0" "0" "0" ...
# ..$ isType         : chr [1:30] "0" "0" "0" "0" ..
```
```r
tibble::tibble(result1$data)
```

```r
# # A tibble: 30 x 13
# collectionID institutionCode collectionCode canonicalName  formattedName chineseName recordNumber
# <chr>        <chr>           <chr>          <chr>          <chr>         <chr>       <chr>       
#   1 bca470dc     WUK             0357558        Artemisia arg… <em>Artemisi… 艾          11193       
# 2 bca47178     WUK             0371743        Artemisia arg… <em>Artemisi… 艾          10505       
# 3 bca47214     WUK             0365274        Artemisia arg… <em>Artemisi… 艾          18245       
# 4 bca472b0     WUK             0356022        Artemisia arg… <em>Artemisi… 艾          8733        
# 5 bca4734b     WUK             0405413        Artemisia arg… <em>Artemisi… 艾          3069        
# 6 bca473e5     WUK             0354634        Artemisia arg… <em>Artemisi… 艾          7229        
# 7 bdaf9f8f     WUK             0374515        Artemisia arg… <em>Artemisi… 艾          13693       
# 8 bdafa02b     WUK             0360427        Artemisia arg… <em>Artemisi… 艾          10905       
# 9 bdafa0c7     WUK             0288094        Artemisia arg… <em>Artemisi… 艾          2089        
# 10 bdafa164     WUK             0282248        Artemisia arg… <em>Artemisi… 艾          27          
# # … with 20 more rows, and 6 more variables: year <chr>, recordedBy <chr>, country <chr>,
# #   stateProvince <chr>, withPhoto <chr>, isType <chr>
```
###### Download occurrence data from the NSII

```r
result2 <- get_occ(query = "Artemisia argyi")
```
```r
# Download  date: 2021-03-03
# Query successfully: Artemisia argyi
# Include latitude and longitude: Artemisia argyi
```

```r
str(result2)
```
```r
# List of 10
# $ Title      : chr "Artemisia argyi"
# $ Description: chr "多年生草本或略成半灌木状，植株有浓烈香气。主根明显，略粗长，直径达1.5厘米，侧根多；常有横卧地下根状茎及营养枝。"| __truncated__
# $ QueryName  : chr "Artemisia argyi"
# $ LatinName  : chr "Artemisia argyi"
# $ CommonName : chr "艾"
# $ Images     :'data.frame':	1 obs. of  5 variables:
#   ..$ title      : chr "Artemisia argyi"
# ..$ description: chr ""
# ..$ type       : chr "image"
# ..$ source     : chr "http://www.nsii.org.cn/eol/eolmedia/13256627.jpg"
# ..$ url        : chr "http://www.nsii.org.cn"
# $ Specimens  :'data.frame':	921 obs. of  9 variables:
#   ..$ barcode     : chr [1:921] "0021954" "0021953" "0021952" "0000681" ...
# ..$ sname       : chr [1:921] "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" ...
# ..$ commonName  : chr [1:921] "艾" "艾" "艾" "艾" ...
# ..$ latitude    : num [1:921] 29.8 31.6 30.2 31.3 31.3 31.3 33.8 34.1 37.4 37.4 ...
# ..$ longitude   : num [1:921] 110 111 109 109 109 ...
# ..$ recordedby  : chr [1:921] "李洪钧" "鄂神农架植考队" "黄仁煌" "方明渊" ...
# ..$ recordnumber: chr [1:921] "5984" "21740" "3389" "23960" ...
# ..$ locality    : chr [1:921] "中国湖北鹤峰县" "中国湖北神农架林区" "中国湖北利川市" "中国重庆奉节县" ...
# ..$ year        : chr [1:921] "1958" "1976" "1975" "1958" ...
# $ StatusCode : int 0
# $ Status     : chr "ok"
# $ Message    : chr ""
```

```r
tibble::tibble(result2$Specimens)
```
```r
# List of 10
# $ Title      : chr "Artemisia argyi"
# $ Description: chr "多年生草本或略成半灌木状，植株有浓烈香气。主根明显，略粗长，直径达1.5厘米，侧根多；常有横卧地下根状茎及营养枝。"| __truncated__
# $ QueryName  : chr "Artemisia argyi"
# $ LatinName  : chr "Artemisia argyi"
# $ CommonName : chr "艾"
# $ Images     :'data.frame':	1 obs. of  5 variables:
#   ..$ title      : chr "Artemisia argyi"
# ..$ description: chr ""
# ..$ type       : chr "image"
# ..$ source     : chr "http://www.nsii.org.cn/eol/eolmedia/13256627.jpg"
# ..$ url        : chr "http://www.nsii.org.cn"
# $ Specimens  :'data.frame':	921 obs. of  9 variables:
#   ..$ barcode     : chr [1:921] "0021954" "0021953" "0021952" "0000681" ...
# ..$ sname       : chr [1:921] "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" "Artemisia argyi" ...
# ..$ commonName  : chr [1:921] "艾" "艾" "艾" "艾" ...
# ..$ latitude    : num [1:921] 29.8 31.6 30.2 31.3 31.3 31.3 33.8 34.1 37.4 37.4 ...
# ..$ longitude   : num [1:921] 110 111 109 109 109 ...
# ..$ recordedby  : chr [1:921] "李洪钧" "鄂神农架植考队" "黄仁煌" "方明渊" ...
# ..$ recordnumber: chr [1:921] "5984" "21740" "3389" "23960" ...
# ..$ locality    : chr [1:921] "中国湖北鹤峰县" "中国湖北神农架林区" "中国湖北利川市" "中国重庆奉节县" ...
# ..$ year        : chr [1:921] "1958" "1976" "1975" "1958" ...
# $ StatusCode : int 0
# $ Status     : chr "ok"
# $ Message    : chr ""
# # A tibble: 921 x 9
# barcode sname           commonName latitude longitude recordedby     recordnumber locality           year 
# <chr>   <chr>           <chr>         <dbl>     <dbl> <chr>          <chr>        <chr>              <chr>
#   1 0021954 Artemisia argyi 艾             29.8      110. 李洪钧         5984         中国湖北鹤峰县     1958 
# 2 0021953 Artemisia argyi 艾             31.6      111. 鄂神农架植考队 21740        中国湖北神农架林区 1976 
# 3 0021952 Artemisia argyi 艾             30.2      109. 黄仁煌         3389         中国湖北利川市     1975 
# 4 0000681 Artemisia argyi 艾             31.3      109. 方明渊         23960        中国重庆奉节县     1958 
# 5 0000680 Artemisia argyi 艾             31.3      109  张泽荣         25990        中国重庆奉节县     1958 
# 6 0000677 Artemisia argyi 艾             31.3      109. 方明渊         24868        中国重庆奉节县     1958 
# 7 0000676 Artemisia argyi 艾             33.8      108. 张襄明         350          中国陕西周至县     1958 
# 8 0000675 Artemisia argyi 艾             34.1      108. 张襄明         947          中国陕西眉县       1958 
# 9 0000671 Artemisia argyi 艾             37.4      114  刘鑫源         914          中国河北赞皇县     1951 
# 10 0000670 Artemisia argyi 艾             37.4      114  刘鑫源         1101         中国河北赞皇县     1951 
# # … with 911 more rows
```


### How to cite this package
```r
citation("rnsii")
```
```r
To cite package ‘rnsii’ in publications use:

  Liuyong Ding (2021). rnsii: Interface to the National Specimen Information Infrastructure. R package version 0.1.0.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {rnsii: Interface to the National Specimen Information Infrastructure},
    author = {Liuyong Ding},
    year = {2021},
    note = {R package version 0.1.0},
  }
```

## :sparkling\_heart: Contribution

Contributions to this package are welcome. 
The preferred method of contribution is through a GitHub pull request. 
Feel also free to contact us by creating [**an issue**](https://github.com/Otoliths/rnsii/issues).
