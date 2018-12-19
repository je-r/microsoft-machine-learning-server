lagVar <- function(dataList) { 

     # .rxStartRow returns the overall row number of the first row in this
     # chunk. So - the first row of the first chunk is equal to one.
     # If this is the very first row, there no previous value to use - so
     # it just an NA.
     if(.rxStartRow == 1) {

        # Put the NA out front, then shift all the other values down one row.
        # newName is the desired name of the lagged variable, set using
        # transformObjects - see below
        dataList[[newName]] <- c(NA, dataList[[varToLag]][-.rxNumRows]) 

    } else {

        # If this isn't the very first chunk, we have to fetch the previous
        # value from the previous chunk using .rxGet, then shift all other
        # values down one row, just as before.
        dataList[[newName]] <- c(.rxGet("lastValue"),
                                 dataList[[varToLag]][-.rxNumRows]) 

      }

    # Finally, once this chunk is done processing, set its lastValue so that
    # the next chunk can use it.
    .rxSet("lastValue", dataList[[varToLag]][.rxNumRows])

    # Return dataList with the new variable
    dataList

}
# Get a sample dataset
xdfPath <- file.path(rxGetOption("sampleDataDir"), "DJIAdaily.xdf")
pointer0_xdf <- RxXdfData(xdfPath)
rxGetInfo(pointer0_xdf)
head(pointer0_xdf)
# Get a sample dataset
xdfPath <- file.path(rxGetOption("sampleDataDir"), "DJIAdaily.xdf")

# Set a path to a temporary file
xdfLagged <- tempfile(fileext = ".xdf")

# Sort the dataset chronologically - otherwise, the lagging will be random.
rxSort(inData = xdfPath,
       outFile = xdfLagged,
       sortByVars = "Date")

# Finally, put the lagging function to use:
rxDataStep(inData = xdfLagged, 
           outFile = xdfLagged,
           transformObjects = list(
               varToLag = "Open", 
               newName = "previousOpen"), 
           transformFunc = lagVar,
           append = "cols",
           overwrite = TRUE)

# Check the results
rxDataStep(xdfLagged, 
           varsToKeep = c("Date", "Open", "previousOpen"),
           numRows = 10)

