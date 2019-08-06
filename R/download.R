#' @importFrom utils download.file
crt_download <- function(os, ...){
  UseMethod("crt_download")
}

crt_download.Windowsx86 <- function(os, dest = crt_dest_loc()){
  tar <- download_links()
  download.file(tar, destfile = dest, mode = "wb")
}

crt_download.Windowsx64 <- function(os, dest = crt_dest_loc()){
  tar <- download_links()
  download.file(tar, destfile = dest, mode = "wb")
}

crt_download.Darwinx64 <- function(os, dest = crt_dest_loc()){
  tar <- download_links()
  download.file(tar, destfile = dest)
}

crt_download.Linuxx64 <- function(os, dest = crt_dest_loc()){
  tar <- download_links()
  download.file(tar, destfile = dest)
}

crt_download.default <- function(os, ...){
  stop("no method for ", class(os)[1L])
}

#' @importFrom rvest html_nodes html_attr
#' @importFrom xml2 read_html
download_links <- function(os = class(get_os())){
  link8 <- download_link_8()
  link11 <- download_link_11()
  return(
    switch(os,
    Darwinx64 = grep("(?=.*mac)(?=.*x64)(?=.*pkg)", link11, value = T, perl = T)[1],
    Windowsx64 = grep("(?=.*win)(?=.*x64)(?=.*zip)", link11, value = T, perl = T)[1],
    Windowsx86 = grep("(?=.*win)(?=.*jdk)(?=.*x86)", link8, value = T, perl = T)[1],
    message("not support os yet")
    )
  )
}

download_link_8 <- function(){
  hobj <- xml2::read_html("https://docs.aws.amazon.com/ko_kr/corretto/latest/corretto-8-ug/downloads-list.html")
  tnodes <- rvest::html_nodes(hobj, "p a")
  links <- rvest::html_attr(tnodes, "href")
  return(links)
}

download_link_11 <- function(){
  hobj <- xml2::read_html("https://docs.aws.amazon.com/ko_kr/corretto/latest/corretto-11-ug/downloads-list.html")
  tnodes <- rvest::html_nodes(hobj, "p a")
  links <- rvest::html_attr(tnodes, "href")
  return(links)
}



#' @importFrom fs path path_temp path_home
crt_dest_loc <- function() {
  os <- get_os()
  return(switch(
    class(os),
    Windowsx64 = fs::path(fs::path_temp(), "crt.zip"),
    Windowsx64 = fs::path(fs::path_temp(), "crt.zip"),
    Darwinx64 = fs::path(fs::path_temp(), "crt.pkg"),
    Linuxx64 = fs::path(fs::path_temp(), "crt.tar.gz"),
    message("not support os yet")
  ))
}

