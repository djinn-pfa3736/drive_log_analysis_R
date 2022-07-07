ExtractWholeTrips <- function(data.fr) {
  trip.vec <- unique(data.fr[, 1])
  res.list <- as.list(NULL)
  for(i in 1:length(trip.vec)) {
    idx <- trip.vec[i]
    extracted.idx <- which(data.fr[,1] == idx)
    trip.dat <- data.fr[extracted.idx, ]
    res.list <- c(res.list, list(trip.dat))
  }

  return(res.list)
}
