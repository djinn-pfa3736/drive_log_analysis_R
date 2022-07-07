RemoveInvalidTrips <- function(drive.data, thre) {

  trip.vec <- drive.data[, 1]
  unique.trip.vec <- unique(drive.data[, 1])

  valid.trip.list <- as.list(NULL)
  trip.length.vec <- as.vector(NULL)
  for(i in 1:length(unique.trip.vec)) {
    cat(paste("*** Processing ", i, "/", length(unique.trip.vec), " Trip ***\n"))
    trip <- unique.trip.vec[i]
    trip.idx <- which(trip.vec == trip)

    data.mat <- drive.data[trip.idx, ]
    trip.length.vec <- c(trip.length.vec, nrow(data.mat))
    if(nrow(data.mat) > thre) {
      valid.trip.list <- c(valid.trip.list, list(data.mat))
    }
  }

  return(list(valid.trip.list = valid.trip.list, trip.length.vec = trip.length.vec))
}
