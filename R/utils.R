get_os <- function(){
  os <- "os_class"
  bits <- Sys.info()["machine"]
  if (grepl("x86", bits) & grepl("64", bits)) {
    bits <- "x64"
  }
  class(os) <- paste0(Sys.info()["sysname"], as.character(bits))
  return(os)
}

system_sudo <- function(password, command){
  cmd <- paste0("echo ", password," | sudo -S ", command)
  system(cmd, ignore.stderr = T)
}

#' @export
java_available <- function(){
  sys::exec_wait("java", "-version", std_out = F, std_err = F) == 0
}

java_available <- function(os, ...){
  UseMethod("java_available")
}

java_available.Windowsx64 <- function(){
  sys::exec_wait("java", "-version", std_out = F, std_err = F) == 0
}

java_available.Windowsx86 <- java_available.Windowsx64

java_available.Darwinx64 <- function() {
  sys::exec_wait("/usr/libexec/java_home", "-V", std_out = F, std_err = F) == 0
}

#' @export
java_home_check <- function(){
  UseMethod("java_home_check")
}

java_home_check.Windowsx64 <- function(){
  Sys.getenv("JAVA_HOME") != ""
}

java_home_check.Windowsx86 <- java_home_check.Windowsx64

java_home_check.Darwinx64 <- function() {
  sys::exec_wait("/usr/libexec/java_home", "-V", std_out = F, std_err = F) == 0
}
