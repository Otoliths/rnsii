#' @title Download specimen data from the NSII
#' @description The result returns the detailed information of the queried species, including the scientific name, the Latin name, common name, description, etc.
#' @rdname get_nsii
#' @name get_nsii
#' @param query \code{character} Only single Latin name is queried.
#' @param offset \code{numeric} Query page number.The default value is 0, which corresponds to the first page, each query returns 30.
#' @return list
#' @author Liuyong Ding
#' @details Visit the website \url{http://www.nsii.org.cn} for more details.
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom rlist list.stack
#' @examples
#' \dontrun{
#' result <- get_nsii(query = "Artemisia argyi",offset = 0)
#' str(result)
#' tibble::tibble(result$row)
#' }
#' @export

get_nsii <- function(query,offset = 0){
  cat(sprintf("Download  date: %s",Sys.Date()),sep = "\n")
  query <- gsub(" ","%20",query)
  url <- paste0("https://www.cvh.ac.cn/controller/spms/list.php?&taxonName=",query,"&offset=",offset)
  x <- httr::GET(url = url,
                 httr::add_headers("user-agent" = "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36",
                                   'referer'= url))
  res <- jsonlite::fromJSON(httr::content(x, "text"), simplifyVector = FALSE)
  if(httr::http_status(x)$category == "Success"){
    cat(sprintf("Query successfully: %s",gsub("%20"," ",query)))
    cat(sprintf("(%s)",res$total, sep = "\n"))
  }
  res$rows <- rlist::list.stack(res$row)
  names(res)[5] <- "data"
  return(res)
}


nsii <- function(query){
  query <- gsub(" ","%20",query)
  url <- paste0("https://www.cvh.ac.cn/controller/spms/list.php?&taxonName=",query)
  x <- httr::GET(url = url,
                 httr::add_headers("user-agent" = "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36",
                                   'referer'= url))
  res <- jsonlite::fromJSON(content(x, "text"), simplifyVector = FALSE)
  if(httr::http_status(x)$category == "Success"){
    cat(sprintf("Query successfully: %s",gsub("%20"," ",query)))
    cat(sprintf("(%s)",res$total, sep = "\n"))
  }
  result <- lapply(seq(0,(ceiling(res$total/30)*10),10),function(i){
  get_nsii(query = query,offset = i)
})
  return(result)
}
