#' install corretto
#' 
#' @export
#' @example 
#' \donttest{
#'   install_corretto()
#' }
install_corretto <- function(){
  os <-  get_os()
  dest <- crt_dest_loc()
  crt_download(os, dest)
  loc <- crt_path(os)
  crt_unc(os, dest, exdir = loc)
  set_java_home(os)
  post_process("install.packages('rJava', type = 'binary');library(rJava);.jinit();rstudioapi::restartSession()")
}
