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

#' java available check
#' 
#' @param os system os
#' @importFrom sys exec_wait
#' @export
java_available <- function(){
  os <- class(get_os())
  switch(os,
    Darwinx64 = sys::exec_wait("/usr/libexec/java_home", "-V", std_out = F, std_err = F) == 0, 
    Windowsx64 = sys::exec_wait("java", "-version", std_out = F, std_err = F) == 0,
    Windowsx86 = sys::exec_wait("java", "-version", std_out = F, std_err = F) == 0
  )
}

#' java home check
#' 
#' @param os system os
#' @export
java_home_check <- function(os){
  UseMethod("java_home_check")
}

java_home_check.Windowsx64 <- function(os){
  Sys.getenv("JAVA_HOME") != ""
}

java_home_check.Windowsx86 <- java_home_check.Windowsx64

java_home_check.Darwinx64 <- function(os) {
  sys::exec_wait("/usr/libexec/java_home", "-V", std_out = F, std_err = F) == 0
}
