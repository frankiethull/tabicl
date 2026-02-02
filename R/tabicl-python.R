# binders between Python, R, and venv dependency helpers
# ------------------------------------------------------

#' Create Virtual Environment Wrapper
#'
#' @param envname virtual environment to create
#' @param ... additional passes for `create_virtualenv`
#'
#' @return creation of virtual environment
#' @export
create_tabicl_env <- \(envname = "tabicl", ...) {
  reticulate::virtualenv_create(envname, ...)
}

#' Use Virtual Environment Wrapper
#'
#' @param envname virtual environment to use
#' @param ...  additional passes for `use_virtualenv`
#'
#' @return sets environment to virtualenv
#' @export
use_tabicl_env <- \(envname = "tabicl", ...) {
  reticulate::use_virtualenv(envname, ...)
}

#' Install tabicl
#'
#' @param envname virtual environment name
#' @param method  method defaults to "auto"
#' @param ...     additional passes for `py_install`
#'
#' @return installs to "tabicl" env by default
#' @export
install_tabicl_dependencies <- \(envname = "tabicl", method = "auto", ...) {
  reticulate::py_install(
    "tabicl",
    envname = envname,
    method = method,
    ...
  )
}
