ExtractDriversWithTrip <- function(drive.data, name.vec, unique.name.vec) {

  driver.list <- as.list(NULL)
  for(name in unique.name.vec) {
      idx = which(name.vec == name)
      driver.data <- drive.data[idx, c(1, 8:9)]
      driver.list <- c(driver.list, list(driver.data))
  }

  return(driver.list)
}
