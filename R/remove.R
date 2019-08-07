remove_corretto <- function(os, ...) {
  UseMethod("remove_corretto")
}

remove_corretto.default <- function(os){
  stop("no method for ", class(os)[1L])
}
