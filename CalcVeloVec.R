CalcVeloVec <- function(diff.vec) {
  velo.vec <- as.vector(NULL)
  for(i in 1:(length(diff.vec) - 3600)) {
    velo <- sum(diff.vec[i:(i+3600)])
    velo.vec <- c(velo.vec, velo)
  }

  return(velo.vec)
}
