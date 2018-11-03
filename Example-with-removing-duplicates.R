# search for removeDupKeys = TRUE below!
# also search for varsToDrop

###
 # Small data example
 ###

 # sort data frame, decreasing by one column and increasing by the other
 sortByVars <- c("Sepal.Length", "Sepal.Width")
 decreasing <- c(TRUE, FALSE)
 sortedIris <- rxSort( inData = iris, sortByVars = sortByVars,
       decreasing = decreasing)

 # define file names and locations
 inXDF <- file.path(tempdir(), ".rxInFileTemp.xdf")
 outXDF1 <- file.path(tempdir(), ".rxOutFileTemp1.xdf")

 # Create xdf file for iris data
 rxDataStep(inData = iris, outFile = inXDF, overwrite = TRUE)
 rxGetInfo(inXDF)

 # sort the iris data set, first by sepal length in decreasing order
 # and then by sepal width in increasing order
 sortByVars <- c("Sepal.Length", "Sepal.Width")
 decreasing <- c(TRUE, FALSE)
 rxSort(inData = inXDF, outFile = outXDF1, sortByVars = sortByVars,
    decreasing = decreasing)
 z1 <- rxDataStep(inData = outXDF1)
 print(head(z1,10))

 # clean up
 if (file.exists(inXDF)) file.remove(inXDF)
 if (file.exists(outXDF1)) file.remove(outXDF1)

 ###
 # larger data example
 ###
 sampleDataDir <- rxGetOption("sampleDataDir")
 CensusPath <- file.path(sampleDataDir, "CensusWorkers.xdf")
 outXDF <- file.path(tempdir(), ".rxCensusSorted.xdf")

 # sort census data by 'age' and then 'incwage' in increasing 
 # and decreasing order, respectively. drop the 'perwt' and 'wkswork1
 # variables from the output.
 rxSort(inData = CensusPath, outFile = outXDF, sortByVars = c("age", "incwage"), 
           decreasing = c(FALSE, TRUE), varsToDrop = c("perwt", "wkswork1"))
 z <- rxDataStep(outXDF)
 print(head(z, 10))

 if (file.exists(outXDF)) file.remove(outXDF)

 ###
 # example removing duplicates and creating duplicate counts variable
 ###
 sampleDataDir <- rxGetOption("sampleDataDir")
 airDemo <- file.path(sampleDataDir, "AirlineDemoSmall.xdf")
 airDedup <- file.path(tempdir(), ".rxAirDedup.xdf")
 rxSort(inData = airDemo, outFile = airDedup, 
     sortByVars =  c("DayOfWeek", "CRSDepTime", "ArrDelay"),
     removeDupKeys = TRUE, dupFreqVar = "FreqWt")

 # Use the duplicate frequency as frequency weights in a regression
 linModObj <- rxLinMod(ArrDelay~CRSDepTime + DayOfWeek, 
     data = airDedup, fweights = "FreqWt")
 summary(linModObj)

 if (file.exists(airDedup)) file.remove(airDedup)
