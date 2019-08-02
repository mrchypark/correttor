install_corretto <- function(os = get_os()){
  dest <- crt_dest_loc(os)
  crt_download(os, dest)
}
