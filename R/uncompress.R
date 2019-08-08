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

crt_unc.Darwinx64 <- function(os, file_path, exdir, ...){
  tem <- askpass::askpass("Please enter your MacOS password for install java:")
  system(paste0("echo ",tem," | sudo -S tar -xvzf ", file_path, " -C ", exdir), ignore.stderr = T)
  from <- fs::path(exdir, dir(exdir))
  to <- fs::path(exdir, "jdk-11.0.1.jdk")
  system(paste0("echo ",tem," | sudo -S rm -rf ", to), ignore.stderr = T)
  system(paste0("echo ",tem," | sudo -S mv ", from, " ", to), ignore.stderr = T)
  system("R CMD javareconf", intern = T)
}
