PlotAllTrips <- function(trip.list) {

  lat.min <- min(unlist(lapply(trip.list, function(x){min(x[, 8], na.rm=TRUE)})))
  lon.min <- min(unlist(lapply(trip.list, function(x){min(x[, 9], na.rm=TRUE)})))
  lat.max <- max(unlist(lapply(trip.list, function(x){max(x[, 8], na.rm=TRUE)})))
  lon.max <- max(unlist(lapply(trip.list, function(x){max(x[, 9], na.rm=TRUE)})))

  plot(trip.list[[1]][, c(8, 9)], xlim=c(lat.min, lat.max), ylim=c(lon.min, lon.max), cex=0.005)
  for(i in 1:length(trip.list)) {
    par(new=TRUE)
    plot(trip.list[[i]][c(8, 9)],
          xlim=c(lat.min, lat.max), ylim=c(lon.min, lon.max),
          cex=0.005, axes=FALSE, main="")
  }

}
