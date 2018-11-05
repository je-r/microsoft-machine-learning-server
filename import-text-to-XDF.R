readPath <- rxGetOption("jerDataDir")
infile <- file.path(readPath, "jerData.txt")
jerDF <- rxImport(infile) 
