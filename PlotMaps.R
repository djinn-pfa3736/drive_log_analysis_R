PlotMaps <- function(lat.vec, lon.vec, file.header, zoom.ratio) {

  library(ggmap)

  register_google("AIzaSyBcfAzjEnUHiiQEbT2ZYTk5cAKOCYQg5HQ")

  for(i in 1:length(lat.vec)) {
    file.name <- paste(file.header, formatC(i, digits=5, flag=0), ".png", sep="")

    center.pos <- c(lon.vec[i], lat.vec[i])
    marker.pos <- data.frame(lon <- c(lon.vec[i]), lat <- c(lat.vec[i]))
    map <- get_googlemap(center=center.pos, scale=1, size=c(500, 500), zoom=zoom.ratio, markers=marker.pos, filename=file.name, format="png8")

    # browser()
    # png(filename=file.name, width=500, height=500, pointsize=12, bg="white")

    ggmap(map)
    ggsave(file.name)
    graphics.off()
  }

}
