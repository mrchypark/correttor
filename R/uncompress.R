crt_unc <- function(os, ...){
  UseMethod("crt_unc")
}

crt_unc.Windowsx86 <- function(dest){
  tar <- download_links()
  download.file(tar, destfile = dest, mode = "wb")
}

crt_unc.Windowsx64 <- function(os, dest){
  tar <- download_links()
  download.file(tar, destfile = dest, mode = "wb")
}

crt_unc.Darwinx64 <- function(os, dest){
  tar <- download_links()
  download.file(tar, destfile = dest)
}

crt_unc.Linuxx64 <- function(os, dest){
  tar <- download_links()
  download.file(tar, destfile = dest)
}

crt_unc.default <- function(os, dest){
  stop("no method for ", class(os)[1L])
}
