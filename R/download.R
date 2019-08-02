#' @importFrom utils download.files
crt_download <- function(os, ...){
  UseMethod("crt_download")
}

crt_download.Windowsx86 <- function(os, dest){
  tar <- download_links()
  download.file(tar, destfile = dest, mode = "wb")
}

crt_download.Windowsx64 <- function(os, dest){
  tar <- download_links()
  download.file(tar, destfile = dest, mode = "wb")
}

crt_download.Darwinx64 <- function(os, dest){
  tar <- download_links()
  download.file(tar, destfile = dest)
}

crt_download.Linuxx64 <- function(os, dest){
  tar <- download_links()
  download.file(tar, destfile = dest)
}

crt_download.default <- function(os, dest){
  stop("no method for ", class(os)[1L])
}

#' @importFrom rvest html_nodes html_attr
#' @importFrom xml2 read_html
download_links <- function(os = class(get_os())){
  hobj <- xml2::read_html("https://docs.aws.amazon.com/ko_kr/corretto/latest/corretto-8-ug/downloads-list.html")
  tnodes <- rvest::html_nodes(hobj, "p a")
  links <- rvest::html_attr(tnodes, "href")
  return(
    switch(os,
    Darwinx64 = grep("(?=.*mac)(?=.*x64)(?=.*tar)", links, value = T, perl = T)[1],
    Windowsx64 = grep("(?=.*win)(?=.*jdk)(?=.*x64)", links, value = T, perl = T)[1],
    Windowsx86 = grep("(?=.*win)(?=.*jdk)(?=.*x86)", links, value = T, perl = T)[1],
    message("not support os yet")
    )
  )
}



#' @importFrom fs path path_temp path_home
crt_dest_loc <- function(os){
  UseMethod("crt_dest_loc")
}


crt_dest_loc.default <- function(os){
  stop("no method for ", class(os)[1L])
}


crt_dest_loc.Windowsx86 <- function(os){
  fs::path(fs::path_temp(), "crt.zip")
}


crt_dest_loc.Windowsx64 <- function(os){
  fs::path(fs::path_temp(), "crt.zip")
}


crt_dest_loc.Darwinx64 <- function(os){
  fs::path(fs::path_home(), "crt.tar.gz")
}


crt_dest_loc.Linuxx64 <- function(os){
  fs::path(fs::path_home(), "crt.tar.gz")
}

