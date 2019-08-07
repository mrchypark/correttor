set_java_home <- function(os, ...){
  UseMethod("set_java_home")
}

set_java_home.default <- function(os){
  stop("no method for ", class(os)[1L])
}

set_java_home.Windowsx86 <- function(os, path = "", command = ""){
  if (path == "") {
    path <- fs::dir_ls(crt_path(os))[1]
  }
  if (length(path) == 0) {
    stop("There's empty. Please install java first.")
  }
  setx("JAVA_HOME", path)
  forenvron <- paste0('JAVA_HOME=', path) 
  usethis::write_union(fs::path(fs::path_home_r(), "/",ext = "Renviron"), forenvron)
  rstudioapi::restartSession(command)
}

#' @importFrom usethis write_union
#' @importFrom fs path path_home_r
set_java_home.Windowsx64 <- function(os, path = "", command = ""){
  if (path == "") {
    path <- fs::dir_ls(crt_path(os))[1]
  }
  if (length(path) == 0) {
    stop("There's empty. Please install java first.")
  }
  setx("JAVA_HOME", path)
  forenvron <- paste0('JAVA_HOME=', path) 
  usethis::write_union(fs::path(fs::path_home_r(), "/",ext = "Renviron"), forenvron)
  rstudioapi::restartSession(command)
}

crt_path <- function(os) {
  UseMethod("crt_path")
}

crt_path.default <- function(os){
  stop("no method for ", class(os)[1L])
}

crt_path.Windowsx86 <- function(os){
  fs::path(fs::path_home(),"corretto")
}

crt_path.Windowsx64 <- function(os){
  fs::path(fs::path_home(),"corretto")
}

crt_path.Darwinx64 <- function(os){
  fs::path("/Library/Java/JavaVirtualMachines/")
}

# mklink <- function(link, target) {
#   R.utils::createLink(link, target, overwrite = T, methods = "windows-ntfs-symlink")
# }
# mklink(fs::path(crt_path(get_os()),"current"), fs::dir_ls(crt_path(get_os())))

setx <- function(key = "", value = ""){
  if (key != "" & value == "") {
    sys::exec_wait("setx", args = c(key))
  } else {
    sys::exec_wait("setx", args = c(key, value))
  }
}

java_home_mac <- function(args = "") {
  res <- sys::exec_wait("/usr/libexec/java_home", args = args)
  invisible(res)
}


