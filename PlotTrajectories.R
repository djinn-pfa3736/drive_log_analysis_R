PlotTrajectories <- function(trip.list, lat.min, lat.max, lon.min, lon.max, digits, file.header) {

  col.vec <- rainbow(length(trip.list), alpha=0.2)
  file.name <- paste(file.header, formatC(1, digits=2, flag=0), ".png", sep="")
  png(file.name)
  plot(round(trip.list[[1]][, c(9, 8)], digits=digits), col=col.vec[1], ylim=c(lat.min, lat.max), xlim=c(lon.min, lon.max), cex=0.3, xlab="", ylab="")
  dev.off()
  for(i in 2:length(trip.list)) {
    file.name <- paste(file.header, formatC(i, digits=2, flag=0), ".png", sep="")
    png(file.name)
    plot(round(trip.list[[i]][, c(9, 8)], digits=digits), col=col.vec[i], ylim=c(lat.min, lat.max), xlim=c(lon.min, lon.max), axes=FALSE, cex=0.3, xlab="", ylab="")
    dev.off()
  }

}
