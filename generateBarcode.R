generateBarcode <- function(name.cells, number.cells){
  # input: name of the cells (cNT, dWL, dWP) and the numbers
  # of cells after normalization
  # output: images and text of barcodes saved in 
  # /barcodes/number.cells
  
require("TDA")
barcode.list <- list()
barycenter.list <- list()

if ( name.cells == 'cNT'){
  number.images <- 16
  valid.images <- 1:16
}

# If number.cells > 245, the last two images of dWP must be removed,
# since they do not have enough cells. 
if ( name.cells == 'dWP'){
  #number.images <- 16
  #valid.images <- c(1:16) 
  number.images <- 14
  valid.images <- c(1:14)
}

if ( name.cells == 'dWL'){
  number.images <- 15
  valid.images <- 1:15
}

for ( i in 1:number.images){
  barycenter.list[[i]] <- read.table(paste("point_clouds//", 
                                         as.character(number.cells),
                                        "//", name.cells, valid.images[i],
                                        ".txt", sep=""))
}

dir.create(paste("barcodes", as.character(number.cells), sep = "//"))
for (i in 1:number.images){
  barcode.list[[i]] <-  alphaComplexDiag(X = barycenter.list[[i]],
                                         library = c("GUDHI", "Dionysus"))
  png(filename = paste("barcodes//", as.character(number.cells), "//",
                       name.cells, as.character(i), ".png", sep = ""))
  plot(barcode.list[[i]][["diagram"]], barcode = TRUE)
  dev.off()
  write.table(barcode.list[[i]][["diagram"]], 
              file=paste("barcodes//", as.character(number.cells), "//",
                          name.cells, as.character(i),".txt", sep = ""))
}

return(barcode.list)
}