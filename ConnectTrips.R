ConnectTrips <- function(trip.list) {

  first.end.list <- lapply(trip.list,
                            function(x){
                              first.row <- x[1, ]
                              end.row <- x[nrow(x), ]
                              return(c(first.row, end.row))
                            })


}
