tabicl <- NULL

.onLoad <- function(libname, pkgname) {
  tabicl <<- reticulate::import(
    "tabicl",
    delay_load = TRUE
  )
}
