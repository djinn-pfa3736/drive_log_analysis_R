NormalizeName <- function(data.frame) {
    name.vec <- apply(data.frame, 1, function(x) {gsub("[0-9].*", "", x[13])})
    # browser()

    return(name.vec)
}