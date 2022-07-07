ExtractTrip <- function(data.fr, trip.idx) {
  trip.vec <- unique(data.fr[, 1])
  idx <- trip.vec[trip.idx]
  extracted.idx <- which(data.fr[,1] == idx)

  return(data.fr[extracted.idx, ])
}
