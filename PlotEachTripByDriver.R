PlotEachTripByDriver <- function(driver.trip.data, trip.idx) {

  na.idx <- which(is.na(driver.trip.data[, 2]))
  if(length(na.idx) != 0) {
    driver.trip.data <- driver.trip.data[-na.idx, ]
  }

  lat.min <- min(driver.trip.data[, 2])
  lat.max <- max(driver.trip.data[, 2])
  lon.min <- min(driver.trip.data[, 3])
  lon.max <- max(driver.trip.data[, 3])

  tripid.list <- unique(driver.trip.data[, 1])
  plot.idx <- which(driver.trip.data[, 1] == tripid.list[trip.idx])
  browser()

  plot(driver.trip.data[, c(3, 2)],
        xlim=c(lon.min, lon.max), ylim=c(lat.min, lat.max),
        cex=0.01)
  par(new=TRUE)
  plot(driver.trip.data[plot.idx, c(3, 2)],
        xlim=c(lon.min, lon.max), ylim=c(lat.min, lat.max),
        cex=0.2, col="#ff000099", axes=FALSE, xlab="", ylab="")
}
