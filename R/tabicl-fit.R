#' Fit tabicl Tabular Foundation Model
#'
#' @param X training data
#' @param data a dataset
#' @param problem_type either "classification" or "regression"
#' @param ... for tabicl additional hyperparameters such as `batch_size`
#'
#' @returns a tabicl fit
#'
#' @export
tabicl_fit <- \(
  X,
  y,
  problem_type = "classification",
  ...
) {

  if(problem_type == "classification"){
  cls <- tabicl$TabICLClassifier(...)

  fit <- cls$fit(
    X, y
  )
} else if(problem_type == "regression"){
  reg <- tabicl$TabICLRegressor(...)

  fit <- reg$fit(
    X, y
  )
}

  return(fit)
  }

