
# Demo taken from trestletech/plumber

#* @get /mean
normalMean <- function(samples=10){
  data <- stats::rnorm(samples)
  mean(data)
}

#* @post /sum
addTwo <- function(a, b){
  as.numeric(a) + as.numeric(b)
}
