EstimateHomeRange <- function(drive.data, h, grid.size) {
  kernel.mat <- matrix(0, nrow=ceiling((max(drive.data[,1] + h) - min(drive.data[,1]) - h)/grid.size),
                          ncol=ceiling((max(drive.data[,2] + h) - min(drive.data[,2]) - h)/grid.size))
    
}