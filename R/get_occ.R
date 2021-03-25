#' @title Download occurrence data from the NSII
#' @description The result returns the detailed information of the queried species, including the scientific name, the Latin name, common name, description, latitude and longitude, etc.
#' @rdname get_occ
#' @name get_occ
#' @param query \code{character} Only single Latin name is queried.
#' @return list
#' @author Liuyong Ding <ly_ding@126.com>
#' @details Visit the website \url{http://www.nsii.org.cn} for more details.
#' @importFrom RCurl postForm
#' @importFrom jsonlite fromJSON
#' @examples
#' \dontrun{
#' result <- get_occ(query = "Artemisia argyi")
#' str(result)
#' tibble::tibble(result$Specimens)
#' }
#' @export
get_occ <- function(query){
  cat(sprintf("Download  date: %s",Sys.Date()),sep = "\n")
  res <- jsonlite::fromJSON(RCurl::postForm(uri = "http://www.nsii.org.cn/2017/API/nsiimap.php",name = query),flatten = TRUE)
  if(res$Status == "ok"){
    cat(sprintf("Query successfully: %s",query), sep = "\n")
  }
  if("Title" %in% names(res)){
    res[["Title"]] <- gsub("<.*?>", "", res[["Title"]])
  }
  if(length(res$Specimens) > 0 ){
    cat(sprintf("Include latitude and longitude: %s",query), sep = "\n")
  }else{
    cat(sprintf("Exclude latitude and longitude: %s",query), sep = "\n")
  }
  return(res)

}
