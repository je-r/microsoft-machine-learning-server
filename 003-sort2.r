peopleXdf <- "people.xdf"

pointer0_xdf <- RxXdfData(peopleXdf)

head(pointer0_xdf)

peopleSortedXdf <- "peopleSorted.xdf"

rxSort(inData=peopleXdf,outFile=peopleSortedXdf,sortByVars = c("field1","field4","field8"),removeDupKeys = TRUE, varsToDrop = "field4", overwrite=TRUE)

pointer_xdf <- RxXdfData(peopleSortedXdf)

head(pointer_xdf)

