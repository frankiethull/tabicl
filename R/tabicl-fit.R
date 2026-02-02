#' Fit tabicl Tabular Foundation Model
#'
#' @param X training data
#' @param data a dataset
#' @param ... for tabicl additional hyperparameters such as `batch_size`
#'
#' @returns a tabicl fit
#'
#' @export
tabicl_fit <- \(
  X,
  y,
  ...
) {

  cls <- tabicl$TabICLClassifier(...)

  fit <- cls$fit(
    X, y
  )

  return(fit)
}