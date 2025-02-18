% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ATACRunSeurat.R
\docType{methods}
\name{ATACRunSeurat}
\alias{ATACRunSeurat}
\title{Clustering analysis for scATAC-seq data using Seurat}
\usage{
ATACRunSeurat(
  inputMat,
  type = "matrix",
  project = "MAESTRO.scATAC.Seurat",
  orign.ident = NULL,
  min.c = 10,
  min.p = 100,
  method = "LSI",
  dims.use = 1:30,
  cluster.res = 0.6,
  only.pos = FALSE,
  peaks.test.use = "presto",
  peaks.cutoff = 1e-05,
  peaks.pct = 0.1,
  peaks.logfc = 0.2,
  runtfidf.args = list(),
  runsvd.args = list(),
  runpca.args = list(),
  findneighbors.args = list(),
  findclusters.args = list(),
  ...
)
}
\arguments{
\item{inputMat}{Input unnormalized count matrix, with peaks as rows and cells as columns. Rownames should be like "chromosome_peakstart_peakend",
for example "chr10_100020591_100020841".}

\item{type}{Type of the input matrix. Default is "matrix". Set to "object" if the input is Seurat object.}

\item{project}{Output project name. Default is "MAESTRO.scATAC.Seurat".}

\item{orign.ident}{Orginal identity for the input cells. If supplied, should keep the same order with the column name of the peak x cell matrix.}

\item{min.c}{Minimum number of cells required for a peak. Will exclude the peaks from input matrix if they only identified in 
less than \code{min.c} cells. Default is 10. See \code{\link{CreateSeuratObject}} for details.}

\item{min.p}{Minimum number of peaks required for a cell. Will exclude the cells from input matrix if less than \code{min.p}
peaks are deteced in one cell. Default is 100. See \code{\link{CreateSeuratObject}} for details.}

\item{method}{Methods for dimension reduction, available options are LSI and PCA. Default is "LSI".}

\item{dims.use}{Number of dimensions used for UMAP analysis. Default is 1:30, use the first 30 PCs.}

\item{cluster.res}{Value of the clustering resolution parameter. Please use a value above (below) 1.0 
if users want to obtain a larger (smaller) number of communities. Default is 0.6.}

\item{only.pos}{If seting true, only positive peaks will be output. Default is False.}

\item{peaks.test.use}{Denotes which test to use to identify differnetial peaks. Default is "presto", a fast version of Wilcoxon Rank Sum test. 
Available options are "wilcox" and "t". See \code{\link{FindAllMarkersMAESTRO}} for details.}

\item{peaks.cutoff}{Identify differential peaks with adjusted p.value less than \code{peaks.cutoff} as cluster specific peaks}

\item{peaks.pct}{Only test peaks that are detected in a minimum fraction of min.pct cells in either of the two populations. Meant to speed up the function by not testing peaks that are very infrequently detected Default is 0.1}

\item{peaks.logfc}{Limit testing to peaks which show, on average, at least X-fold difference (log-scale) between the two groups of cells. Default is 0.2 Increasing logfc.threshold speeds up the function, but can miss weaker signals.
for each cluster. Default cutoff is 1E-5.}

\item{runpca.args}{Extra arguments passed to \code{\link{RunPCA}}.}

\item{findneighbors.args}{Extra arguments passed to \code{\link{FindNeighbors}}.}

\item{findclusters.args}{Extra arguments passed to \code{\link{FindClusters}}.}

\item{\dots}{Extra arguments passed to \code{\link{RunUMAP}}.}

\item{runlsi.args}{Extra arguments passed to \code{\link{RunLSI}}.}
}
\value{
A list contains a Seurat object for ATAC clusters and a data frame of cluster specific peaks.
}
\description{
Clustering analysis for scATAC-seq dataset using Seurat (version >=4.0.0) and Signac (version >= 1.1.1). Including normalization, LSI/PCA dimension reduction, clustering and UMAP visualization. To run UMAP analysis, you must first install the umap-learn python package (e.g. via \code{pip install umap-learn}).
}
\examples{
data(pbmc.ATAC)
pbmc.ATAC.res <- ATACRunSeurat(inputMat = pbmc.ATAC, project = "PBMC.scATAC.Seurat", method = "LSI")
str(pbmc.ATAC.res$ATAC)
head(pbmc.ATAC.res$peaks)

}
\author{
Chenfei Wang
}
