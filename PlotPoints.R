PlotPoints <- function(lat.vec, lon.vec, zoom.ratio) {

  library(ggmap)

  register_google("AIzaSyBcfAzjEnUHiiQEbT2ZYTk5cAKOCYQg5HQ")

  for(i in 1:length(lat.vec)) {
    # file.name <- paste(file.header, formatC(i, digits=5, flag=0), ".png", sep="")

    center.pos <- c(lon.vec[i], lat.vec[i])
    marker.pos <- data.frame(lon <- c(lon.vec[i]), lat <- c(lat.vec[i]))
    map <- get_googlemap(center=center.pos, scale=1, size=c(500, 500), zoom=zoom.ratio, markers=marker.pos)

    browser()
    ggmap(map)
    # ggsave(file.name)
    # graphics.off()
  }

}
