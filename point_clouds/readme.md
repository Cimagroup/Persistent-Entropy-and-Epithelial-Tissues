Functions used for the computational experiments appearing in the papers
"Persistent entropy: a scale-invariant topological statistic for analyzing
cell arrangements" and "Characterising epithelial tissues using persistent
entropy".

The functions are the following:
    - reduce_cells.m: contains the spiral algorithm for normalizing the 
    number of cells in the image. (matlab)
    - persistentEntropy: take a barcode and calculate its persistent
    entropy. (R)

The scripts with the code of the experiments are:
    - obtain_point_cloud.m: read the data, run reduce_cells.m and write
    the result.
    - generateFrame.R: calculate the data.frame containing the entropy
    values of all images and a normalization number n = 5, 10, 15... up to
    385.
        - generateBarcode.R: calculate all barcodes of a type of cell.
    - generateFigures: create a boxplot with the persistent entropy value
    
The workspace.Rdata file can be loaded to obtain the persistent entropy 
values for all tissue images and different normalization numbers. You can find 
the sum of the length of all bars in each barcode as well. Please, feel 
free to use this values as long as you cite our paper.

Unfortunately, I am not the owner of the data, so I cannot provide you the
images nor the point clouds (these folders are empty). However, you
can use the barcodes appearing in the namesake folder.

If you would like to talk with the data owner and ask for permission to 
use it, please, contact us via email: msoriano4 (at) us (dot) es
