ExtractPointCount <- function(drive_data, lat.min, lat.max, lon.min, lon.max) {

  library(infotheo)
  # source("PackVec.R")
  dyn.load("./pack_bin_vec.so")

  lat.vec <- drive_data[,8]
  na.idx <- which(is.na(lat.vec))
  if(length(na.idx != 0)) {
    lat.vec <- lat.vec[-na.idx]
  }
  lat.min <- min(lat.vec)
  lat.max <- max(lat.vec)
  lat.disc.idx <- discretize(lat.vec, nbins=(lat.max - lat.min)/0.001)
  lat.disc <- seq(lat.min, lat.max, length.out=(lat.max - lat.min)/0.001)

  lon.vec <- drive_data[,9]
  na.idx <- which(is.na(lon.vec))
  if(length(na.idx) != 0) {
    lon.vec <- lon.vec[-na.idx]
  }
  lon.min <- min(lon.vec)
  lon.max <- max(lon.vec)
  lon.disc.idx <- discretize(lon.vec, nbins=(lon.max - lon.min)/0.001)
  lon.disc <- seq(lon.min, lon.max, length.out=(lon.max - lon.min)/0.001)

  # browser()
  n.rows <- max(lat.disc.idx, na.rm=TRUE)
  n.cols <- max(lon.disc.idx, na.rm=TRUE)

  idx.mat <- cbind(lat.disc.idx, lon.disc.idx)
  # browser()

  uni.idx.mat <- unique(idx.mat)
  # hit.vec <- as.vector(NULL)
  # browser()
  count.vec <- as.vector(NULL)
  for(i in 1:nrow(uni.idx.mat)) {

    cat(paste("*** Calculating ", i, "-th Row ***\n", sep=""))
    hit.idx <- which(idx.mat[, 1] == uni.idx.mat[i, 1] & idx.mat[, 2] == uni.idx.mat[i, 2])
    hit.vec <- rep(0, length=nrow(idx.mat))
    hit.vec[hit.idx] <- 1
    # run.vec <- as.vector(NULL)
    run.vec <- pack(hit.vec, length(hit.vec))
    # browser()
    count.vec <- c(count.vec, sum(run.vec))
  }

  # res.mat <- cbind(uni.idx.mat, count.vec)
  uni.lat.disc <- lat.disc[uni.idx.mat[, 1]]
  uni.lon.disc <- lon.disc[uni.idx.mat[, 2]]
  res.mat <- cbind(uni.lat.disc, uni.lon.disc, count.vec)

  return(res.mat)
}

pack <- function(a.vec, a.len) {
  res <- rep(0, a.len)
  # browser()
  result <- .C("pack_bin_vec", len_a=a.len, a=a.vec, res=res)$res
  # browser()
  return(result)
}
