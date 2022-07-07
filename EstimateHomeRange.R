EstimateHomeRange <- function(drive.data, grid.size, h, template.size, score.unit, cut.off) {

  dyn.load("./calc_kernel_mat.so")

  kernel.row = ceiling((max(drive.data[,1], na.rm=TRUE) + h - min(drive.data[,1], na.rm=TRUE) + h)/grid.size)
  kernel.col = ceiling((max(drive.data[,2], na.rm=TRUE) + h - min(drive.data[,2], na.rm=TRUE) + h)/grid.size)
  kernel.mat <- matrix(0, nrow=kernel.row, ncol=kernel.col)
  lat.seq <- seq(min(drive.data[,1] - h, na.rm=TRUE) ,max(drive.data[,1] + h, na.rm=TRUE), by = grid.size)
  lon.seq <- seq(min(drive.data[,2] - h, na.rm=TRUE) ,max(drive.data[,2] + h, na.rm=TRUE), by = grid.size)

  # idx.mat <- outer(1:nrow(kernel.mat), 1:ncol(kernel.mat), "paste")
  # dim(idx.mat) <- NULL
  # idx.mat <- t(sapply(idx.mat, function(x){
  #                               tmp <- strsplit(x, " ")[[1]];
  #                               c(as.integer(tmp[1]), as.integer(tmp[2]))
  #                              }))
  # rownames(idx.mat) <- NULL

  dim(kernel.mat) <- NULL
  lat.vec = drive.data[, 1]
  lon.vec = drive.data[, 2]
  # idx.mat.lat <- idx.mat[, 1]
  # idx.mat.lon <- idx.mat[, 2]

  na.idx <- which(is.na(lat.vec))


  if(length(na.idx) != 0) {
    lat.vec <- lat.vec[-na.idx]
    lon.vec <- lon.vec[-na.idx]
  }
  data.len <- length(lat.vec)
  browser()
  result <- .C("calc_kernel_mat", len_data = as.integer(data.len), kernel_row = as.integer(kernel.row),
                                  kernel_col = as.integer(kernel.col), template = as.integer(template.size),
                                  lat_vec = lat.vec, lon_vec = lon.vec,
                                  lat_seq = lat.seq, lon_seq = lon.seq,
                                  # idx_lat = idx.mat.lat, idx_lon = idx.mat.lon,
                                  kernel_mat = kernel.mat,
                                  unit = score.unit)$kernel_mat

  result <- matrix(result, nrow=kernel.row, ncol=kernel.col, byrow=TRUE)
  cutoff.idx <- which(result < cut.off)
  result[cutoff.idx] <- 0
  if(length(cutoff.idx) != 0) {
    clipped.idx <- which(result >= cut.off)
    result[clipped.idx] <- 1
  }
  # browser()
  return(list(home.range=result, lat.seq=lat.seq, lon.seq=lon.seq))
}
