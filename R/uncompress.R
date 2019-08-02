crt_unc <- function(os, ...){
  UseMethod("crt_unc")
}

crt_unc.default <- function(os){
  stop("no method for ", class(os)[1L])
}

crt_unc.Windowsx86 <- function(os, ...){
  zip::unzip(...)
}

crt_unc.Windowsx64 <- function(os, ...){
  zip::unzip(...)
}

# crt_unc.Darwinx64 <- function(os, dest){
#  
# }
# 
# crt_unc.Linuxx64 <- function(os, dest){
#  
# }
# 
