persistentEntropy <- function(barcode, normalized = "False",
                              dimension.value = -1, infty.value){
# Takes a barcode with dimension=dimension.value and calculate its 
# persitent entropy. When dimension.value = -1 calculates PE of all
# dimensions together. When normalized is active, it calculates the 
# normalized persistent entropy. infty.value set the value of bars at
# infinity.
# We also generate the total sum of the bars as an output.
  
  if (dimension.value != -1 ){
    valid.intervals <- which(barcode[, 1] == dimension.value)
    n <- length(valid.intervals)
  } else {
    n <- dim(barcode)[1]
    valid.intervals <- 1 : n
  }
  
  
  infty.intervals <- which(barcode[, 3] == 'Inf')
  barcode[infty.intervals, 3] <- infty.value
  # If the infty.value is smaller than the birth value we consider the bar
  # to have length 0.
  bars.length <- matrix(0, 1, n)
  for (i in 1:n){
    bars.length[i] <- max(barcode[valid.intervals[i], 3] - 
                            barcode[valid.intervals[i], 2], 0)
  }
  L <- sum(bars.length[1:n])
  M <- median(bars.length)/L
  entropy.auxiliar <- matrix(0, 1, n)
  
  for (i in 1:n){
    if (bars.length[i] != 0){
    entropy.auxiliar[i] <- (bars.length[i] / L) *
                   log2(bars.length[i] / L)
    }
  }
  
  if (normalized == "False"){
    entropy <- -sum(entropy.auxiliar)
  } else {
    entropy <- -sum(entropy.auxiliar) / log2(n)
  }
  return(c(entropy, L))
}