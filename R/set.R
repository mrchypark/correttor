setx <- function(key, value){
  sys::exec_wait("setx", args = c(key, value))
  if (rstudioapi::hasFun("openProject"))
    rstudioapi::openProject(".")
}
