ExtractOnlyDate <- function(drive_data) {
  date.vec <- apply(drive_data, 1, function(x) {tmp <- strsplit(x[3], " ")[[1]];
                                                return(tmp[1])})
  return(date.vec)
}
