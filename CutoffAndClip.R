CutoffAndClip <- function(data.mat, cutoff.val) {
  cutoff.idx <- which(data.mat < cutoff.val)
  clip.idx <- which(data.mat >= cutoff.val)

  result <- data.mat
  result[cutoff.idx] <- 0
  result[clip.idx] <- 1

  image(result)

  return(result)
}
