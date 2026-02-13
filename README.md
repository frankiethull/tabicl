
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tabicl

TabICL: A Tabular Foundation Model for In-Context Learning on Large Data
with reticulate

## Setup

``` r
pak::pak("frankiethull/tabicl")

tabicl::create_tabicl_env()
tabicl::use_tabicl_env()
tabicl::install_tabicl_dependencies()
```

## Example

``` r
library(tabicl)
library(rsample)
tabicl::use_tabicl_env()

corn_data <- maize::corn_data

corn_splits <- initial_validation_split(corn_data)
train <- training(corn_splits)
validate <- validation(corn_splits)
test <- testing(corn_splits)
```

### Classification

TabICLv2 supports classification and regression.

``` r
fit_cls <- tabicl_fit(
  train |> dplyr::select(-type), train$type
)
#> INFO: You are downloading 'tabicl-classifier-v2-20260212.ckpt', the latest best-performing version, used in our TabICLv2 paper.
#> 
#> Checkpoint 'tabicl-classifier-v2-20260212.ckpt' not cached.
#>  Downloading from Hugging Face Hub (jingang/TabICL).

class_preds <- tabicl_predict(fit_cls, test |> dplyr::select(-type))

class_preds |> head()
#> [1] "Sweet" "Sweet" "Sweet" "Sweet" "Sweet" "Sweet"
```

``` r
class_probs <- tabicl_predict(fit_cls, test |> dplyr::select(-type), type = "proba")

class_probs |> head()
#>              [,1]         [,2]      [,3]
#> [1,] 6.042506e-06 0.0007294500 0.9992645
#> [2,] 4.003172e-06 0.0027193110 0.9972767
#> [3,] 1.184751e-05 0.0002443175 0.9997439
#> [4,] 2.951169e-06 0.0010944309 0.9989026
#> [5,] 5.359673e-06 0.0004850619 0.9995096
#> [6,] 7.217017e-06 0.0253459066 0.9746469
```

### Regression

TabICLv2 supports classification and regression.

``` r
fit_reg <- tabicl_fit(
  train |> dplyr::select(-height), train$height, problem_type = "regression"
)

preds <- tabicl_predict(fit_reg, test |> dplyr::select(-height))

preds |> head()
#> [1] 60.83174 60.56970 60.29520 60.02024 59.83897 60.31300
```
