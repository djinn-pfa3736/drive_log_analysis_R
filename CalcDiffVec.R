CalcDiffVec <- function(data.mat) {

  na.idx <- which(is.na(data.mat[, 1]))
  if(length(na.idx) != 0) {
    data.mat <- data.mat[-na.idx, ]
  }

  tmp <- round(data.mat[, 1], 4)
  # browser()
  tmp.diff <- diff(tmp)
  data.diff <- diff(data.mat[, 2])
  diff.mat <- cbind(tmp.diff, data.diff)
  diff.vec <- apply(diff.mat, 1,
                    function(x){
                      sqrt(sum((x/0.01)^2))
                    })
  return(diff.vec)
}
