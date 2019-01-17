PersistentEntropy <- function(barcode, normalized = "False",
                              dimension.value = -1)
# Take the bars with dimension dimension.value in the barcode and 
# calculate their persitent entropy. When dimension.value = -1 
# calculates PE of all the bars and when normalized = "True" computes
# the normalized persistent entropy.

{
  if (dimension.value != -1 ){
    valid.intervals <- which(barcode[, 1] == dimension.value)
    n <- length(valid.intervals)
  } else {
    n <- dim(barcode)[1]
    valid.intervals <- 1 : n
  }
  
  bars.length <- barcode[, 3] - barcode[, 2]
  bars.length[1] <- 2500  # 2500 is the max value of our filtration.
  L <- sum(bars.length[valid.intervals])
  entropy.auxiliar <- matrix(0, 1, n)
  
  for (i in 1:n){
    entropy.auxiliar[i] <- (bars.length[valid.intervals[i]] / L) *
                   log2(bars.length[valid.intervals[i]] / L)
  }
  
  if (normalized == "False"){
    entropy <<- -sum(entropy.auxiliar)
  } else {
    entropy <<- -sum(entropy.auxiliar) / log2(n)
  }
  
}