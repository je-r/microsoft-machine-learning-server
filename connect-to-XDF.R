xdfSource <- … # name of XDF file
dataSource <- RxXdfData(xdfSource)
rxOpen(src = dataSource, mode = "r")
currentData <- rxReadNext(src = dataSource)
chunkNum <- 1
while (nrow(currentData) > 0 ) {
 print(paste("Chunk ", chunkNumber, ", Number of rows:", nrow(currentData), sep = ""))
 currentData <- rxReadNext(src = dataSource)
 chunkNumber <- chunkNumber + 1
}
rxClose(src = dataSource) 
