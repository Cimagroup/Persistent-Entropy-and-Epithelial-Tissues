This computational experiment appeared in https://arxiv.org/abs/1810.05835
"Characterising epithelial tissues using persistent entropy"

The experiment is desgined as follows:
1) Run obtain_points.m in matlab to normalize each tissue image to a fixed
 number of cells.
	Auxiliary functions: reducing_cells.
2) Run ExecuteStudy.R in R to obtain the Persistent entropy values
 of each tissue and the figures appearing in the paper.
	Auxiliary functions: PeristentEntropy.R, ExecuteFigures.R

Unfortunately, I am not the owner of the data we have used, so I cannot upload
it here. Please, email me to msoriano4 at us dot es if you want to contact the
owner or need more info.
The barcodes used can be found in /results/{cNT,dWL,dWP}/barcodes.
