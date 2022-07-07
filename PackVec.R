PackVec <- function(a.vec) {

  val <- a.vec[1]
  res.vec <- as.vector(NULL)
  for(i in 2:length(a.vec)) {
    if(a.vec[i] != val) {
      res.vec <- c(res.vec, val)
      val <- abs(val - 1)
    } else {
      res.vec <- c(res.vec, val)
      val <- abs(val - 1)
    }
  }

  return(res.vec)
}
