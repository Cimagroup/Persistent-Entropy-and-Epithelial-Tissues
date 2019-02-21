# Generate a data.frame with values of persistent entropy and sum of 
# lengths of each dimension for different number of cells.

source('generateBarcode.R')
source('persistentEntropy.R')

#infty is the endpoint assigned to infinity bars. Its length
#is consider zero when its endpoint is smaller than the 
#initial one.
infty <- 0

#select the number of cells you want to perform the experiment
#(it might be a list of numbers)
list.numbers <- seq(5,385,5)

PE.dimension.0 <- c()
PE.dimension.1 <- c()
PE.dimension.All <- c()
sum.length.0 <- c()
sum.length.1 <- c()
sum.length.All <- c()
cell.type <- c()
cell.number <- c()

for (type in c('cNT', 'dWP', 'dWL')){
  for (i in list.numbers){
    barcode.list <- generateBarcode(name.cells = type, number.cells = i)
    for (j in 1:length(barcode.list))
    {
      aux <- persistentEntropy(barcode = barcode.list[[j]][["diagram"]],
                                            dimension.value = 0, 
                                            infty.value = infty)
      PE.dimension.0 <- c(PE.dimension.0, aux[1])
      sum.length.0 <- c(sum.length.0, aux[2])
      
      aux <- persistentEntropy(barcode = barcode.list[[j]][["diagram"]],
                                            dimension.value = 1, 
                                            infty.value = infty)
      PE.dimension.1<- c(PE.dimension.1, aux[1])
      sum.length.1 <- c(sum.length.1, aux[2])
      
      aux <- persistentEntropy(barcode = barcode.list[[j]][["diagram"]],
                                            infty.value = infty)
      PE.dimension.All<- c(PE.dimension.All, aux[1])
      sum.length.All <- c(sum.length.All, aux[2])
      
      cell.type <- c(cell.type, type)
      cell.number <- c(cell.number, i)
    }  
  }
}
  
myData0 <- data.frame(PE.dimension.0, PE.dimension.1, PE.dimension.All, sum.length.0,
                       sum.length.1, sum.length.All, cell.type, cell.number)
  