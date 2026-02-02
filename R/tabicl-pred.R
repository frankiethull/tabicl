#' tabicl Predictions
#'
#' @param fit a fitted model
#' @param data a dataset
#' @param type 'raw' or 'proba'
#' @param ... for passing parameters to the predict method
#'
#' @returns predictions
#'
#' @export
tabicl_predict <- \(fit, data, type = 'raw', ...) {
  if(type == 'raw'){
    predictions <- fit$predict(data, ...)
  } else if(type == 'proba'){
    predictions <- fit$predict_proba(data, ...)
  }
  return(predictions)
}