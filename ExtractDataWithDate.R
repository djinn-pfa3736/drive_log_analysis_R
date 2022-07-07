ExtractDataWithDate <- function(drive.data, date.vec, date.vec.idx) {
  date.flag.vec <- apply(drive.data, 1, function(x) {tmp <- strsplit(x[3], " ")[[1]];
                                                if(tmp[1] == date.vec[date.vec.idx]) {
                                                  return(1);
                                                } else {
                                                  return(0);
                                                }})
  date.idx <- which(date.flag.vec == 1)

  return(drive.data[date.idx, ])
}
