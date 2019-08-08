#' install corretto
#' 
#' @export
install_corretto <- function(){
  os <-  get_os()
  dest <- crt_dest_loc()
  crt_download(os, dest)
  loc <- crt_path(os)
  crt_unc(os, dest, exdir = loc)
  set_java_home(os)
}
