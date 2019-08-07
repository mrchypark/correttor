#' @export
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

# TODO
crt_unc.Darwinx64 <- function(os, file_path, exdir, ...){
  tem <- askpass::askpass("Please enter your MacOS password for install java:")
  system(paste0("echo ",tem," | sudo -S -k whoami"), intern = T)
  # utils::untar(tarfile = file_path, exdir = exdir)
}
