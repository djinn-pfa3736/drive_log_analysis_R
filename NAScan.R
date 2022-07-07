NAScan <- function(drive.data) {
  data <- drive.data[, 1]
  na.idx <- which(is.na(data))
  nan.idx <- which(is.nan(data))

  # return(list(na.idx = na.idx, nan.idx = nan.idx))
  return(list(na.idx = na.idx))
}
