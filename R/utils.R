java_home_mac <- function(args = "") {
  res <- sys::exec_wait("/usr/libexec/java_home", args = args)
  invisible(res)
}

get_os <- function(){
  os <- "os_class"
  bits <- Sys.info()["machine"]
  if (grepl("x86", bits) & grepl("64", bits)) {
    bits <- "x64"
  }
  class(os) <- paste0(Sys.info()["sysname"], as.character(bits))
  return(os)
}

dependency <- function(os){
  UseMethod("dependency")
}

dependency.default <- function(os){
  stop("no method for ", class(os)[1L])
}

dependency.Windowsx86 <- function(os){
  invisible(os)
}

dependency.Windowsx64 <- function(os){
  invisible(os)
}

dependency.Darwinx64 <- function(os){
  print("a")
  invisible(os)
}

dependency.Linuxx64 <- function(os){
  invisible(os)
}
