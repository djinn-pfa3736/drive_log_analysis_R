RemoveDuplicate <- function(data.mat) {

  dyn.load("./pack_rens.so")

  na.idx <- which(is.na(data.mat[, 1]))
  if(length(na.idx) != 0) {
    data.mat <- data.mat[-na.idx, ]
  }

  a.vec <- round(data.mat[, 1], 5)
  b.vec <- round(data.mat[, 2], 5)
  vec.len <- length(a.vec)

  res.vec0 <- rep(0, vec.len)
  res.vec1 <- rep(0, vec.len)

  res <- .C("pack_rens", len_a = vec.len,  a = a.vec, b = b.vec, res_a = res.vec0, res_b = res.vec1)
  result <- cbind(res$res_a, res$res_b)
  nonzero.idx <- which(result[, 1] != 0)
  unique.mat <- result[nonzero.idx, ]

  return(unique.mat)
}
