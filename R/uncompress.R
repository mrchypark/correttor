crt_unc <- function(os, ...){
  UseMethod("crt_unc")
}

crt_unc.default <- function(os){
  stop("no method for ", class(os)[1L])
}

#' @importFrom zip unzip
crt_unc.Windowsx86 <- function(os, ...){
  zip::unzip(...)
}

crt_unc.Windowsx64 <- function(os, ...){
  zip::unzip(...)
}

#' @importFrom utils untar
crt_unc.Darwinx64 <- function(os, file_path, exdir, ...){
  utils::untar(tarfile = file_path, exdir = exdir)
}
# 
# crt_unc.Linuxx64 <- function(os, dest){
#  
# }
# 

ttt <- function(){
  tem <- askpass::askpass()
  system(paste0("echo ",tem," | sudo -S -k whoami"), intern = T)
}
