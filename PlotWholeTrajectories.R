PlotWholeTrajectories <- function(trip.list, lat.min, lat.max, lon.min, lon.max, digits) {

  col.vec <- rainbow(length(trip.list), alpha=0.1)
  plot(round(trip.list[[1]][, c(9, 8)], digits=digits), col=col.vec[1], ylim=c(lat.min, lat.max), xlim=c(lon.min, lon.max), cex=0.05, xlab="", ylab="")
  for(i in 2:length(trip.list)) {
    par(new=TRUE)
    plot(round(trip.list[[i]][, c(9, 8)], digits=digits), col=col.vec[i], ylim=c(lat.min, lat.max), xlim=c(lon.min, lon.max), axes=FALSE, cex=0.05, xlab="", ylab="")
  }

}
