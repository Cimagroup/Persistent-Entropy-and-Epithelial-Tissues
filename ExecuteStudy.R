# Execute a study of the cell tissues.
#     Input: The .txt files in /Point_clouds with the barycenters of the cells.
#     Output:  A.- Save their barcodes in the folder/barcodes
#              B.- Write their persistent entropy of dimension 0, 1 
#                  and 0-1 together in PE.data

# 
# The first part of the code calculate the main data from the point cloud which 
# will be used and the second calculate persistent entropy for different 
# dimensions. Finally, we write the needed information in a data frame.

#-------------------------------------------------------------------------------
# 0th part.- Preambles
#-------------------------------------------------------------------------------

# Load necessary packages and functions
library("ggplot2")
require("TDA")
source("PersistentEntropy.R")

#-------------------------------------------------------------------------------
# 1st part.- Read point clouds and calculates PH and barcodes.
#-------------------------------------------------------------------------------

# Read .txt containing barycenters coordinates and save them as a nx2 matrix
# inside the list *.barycenters.

cNT.barycenters <- list()
dWP.barycenters <- list()
dWL.barycenters <- list()

cNT.length <- 16;
dWP.length <- 13;
dWL.length <- 15;

  for ( i in 1:cNT.length){
    cNT.barycenters[[i]] <- read.table(paste("results//cNT//point_clouds//", "cNT",
                                              as.character(i), ".txt", sep=""))
  }

  for ( i in 1:dWP.length){
    dWP.barycenters[[i]] <- read.table(paste("results//dWP//point_clouds//", "dWP",
                                             as.character(i), ".txt", sep="")) 
  }

  for ( i in 1:dWL.length){
    dWL.barycenters[[i]] <- read.table(paste("results//dWL//point_clouds//", "dWL",
                                              as.character(i), ".txt", sep=""))
  }

# Calculate their PH using alpha-complexes and save them in  a list *.diagrams and
# save the barcodes in results\barcodes.
  
cNT.diagrams <- list()
dWP.diagrams <- list()
dWL.diagrams <- list()

  for (i in 1:cNT.length){
    cNT.diagrams[[i]] <-  alphaComplexDiag(X = cNT.barycenters[[i]],
                                             library = c("GUDHI", "Dionysus"))
    png(filename = paste("results//cNT//barcodes//cNT", as.character(i), ".png", sep = ""))
    plot(cNT.diagrams[[i]][["diagram"]], barcode = TRUE)
    dev.off()
  }

  for (i in 1:dWP.length){
    dWP.diagrams[[i]] <-  alphaComplexDiag(X = dWP.barycenters[[i]],
                                           library = c("GUDHI", "Dionysus"))
    png(filename = paste("results//dWP//barcodes//dWP", as.character(i), ".png", sep = ""))
    plot(dWP.diagrams[[i]][["diagram"]], barcode = TRUE)
    dev.off()
  }

  for (i in 1:dWL.length){
    dWL.diagrams[[i]] <-  alphaComplexDiag(X = dWL.barycenters[[i]],
                                             library = c("GUDHI", "Dionysus"))
    png(filename = paste("results//dWL//barcodes//dWL", as.character(i), ".png", sep = ""))
    plot(dWL.diagrams[[i]][["diagram"]], barcode = TRUE)
    dev.off()
  }

#-------------------------------------------------------------------------------
# 2nd part.- Calculating PE.
#-------------------------------------------------------------------------------

# Calculate the persistent entropy of all dimensions together and save it as a
# vector with name *.All.PE. Calculate the 0 and 1 dimensional one and save them
# as *.0.PE and *.1.PE.

cNT.All.PE <- matrix(0, cNT.length, 1)
cNT.0.PE <- matrix(0, cNT.length, 1)
cNT.1.PE <- matrix(0, cNT.length, 1)

dWP.All.PE <- matrix(0, dWP.length, 1)
dWP.0.PE <- matrix(0, dWP.length, 1)
dWP.1.PE <- matrix(0, dWP.length, 1)

dWL.All.PE <- matrix(0, dWL.length, 1)
dWL.0.PE <- matrix(0, dWL.length, 1)
dWL.1.PE <- matrix(0, dWL.length, 1)

for (i in 1:cNT.length){
  cNT.All.PE[i] <- PersistentEntropy(barcode = cNT.diagrams[[i]][["diagram"]])
  cNT.0.PE[i] <- PersistentEntropy(barcode = cNT.diagrams[[i]][["diagram"]], 
                                   dimension.value = 0)
  cNT.1.PE[i] <- PersistentEntropy(barcode = cNT.diagrams[[i]][["diagram"]], 
                                   dimension.value = 1)
}
for (i in 1:dWP.length){
  dWP.All.PE[i] <- PersistentEntropy(barcode = dWP.diagrams[[i]][["diagram"]])
  dWP.0.PE[i] <- PersistentEntropy(barcode = dWP.diagrams[[i]][["diagram"]], 
                                   dimension.value = 0)
  dWP.1.PE[i] <- PersistentEntropy(barcode = dWP.diagrams[[i]][["diagram"]], 
                                   dimension.value = 1)
}

for (i in 1:dWL.length){
  dWL.All.PE[i] <- PersistentEntropy(barcode = dWL.diagrams[[i]][["diagram"]])
  dWL.0.PE[i] <- PersistentEntropy(barcode = dWL.diagrams[[i]][["diagram"]], 
                                   dimension.value = 0)
  dWL.1.PE[i] <- PersistentEntropy(barcode = dWL.diagrams[[i]][["diagram"]], 
                                   dimension.value = 1)
}


#-------------------------------------------------------------------------------
# 3rd part.- Write everything in a data.frame.
#-------------------------------------------------------------------------------

PE.dimension.0 <- c(cNT.0.PE, dWP.0.PE, dWL.0.PE)
PE.dimension.1 <- c(cNT.1.PE, dWP.1.PE, dWL.1.PE)
PE.dimension.All <- c(cNT.All.PE, dWP.All.PE, dWL.All.PE)
type <- c()
for (i in 1:cNT.length){
  type <- c(type,'cNT')
}
for (i in 1:dWP.length){
  type <- c(type,'dWP')
}
for (i in 1:dWL.length){
  type <- c(type,'dWL')
}

PE.data <- data.frame(PE.dimension.0, PE.dimension.1, PE.dimension.All, type)
source("ExecuteFigures.R")





