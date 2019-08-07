install_corretto <- function(os = get_os()){
  dest <- crt_dest_loc()
  crt_download(os, dest)
  loc <- crt_path(os)
  crt_unc(os, dest, exdir = loc)
  set_java_home(os)
  if (grepl("Windows", class(os))){
    ans <- showQuestion("Set JAVA_HOME",
                 "Set env process need to restart rstudio.\n Quit rstudio now?",
                 "Now","later")
  }
  if (ans) {
    rstudioapi::executeCommand("quitSession", quiet = T)
  }
  invisible(ans)
}
