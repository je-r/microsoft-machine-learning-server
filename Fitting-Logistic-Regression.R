# from https://docs.microsoft.com/en-us/machine-learning-server/r/how-to-revoscaler-logistic-regression 

#  Prediction Standard Errors and Confidence Intervals

logitObj2 <- rxLogit(default ~ year + creditScore + yearsEmploy + ccDebt,
	data = trainingDataFileName, blocksPerRead = 2, verbose = 1,
	reportProgress=2, covCoef=TRUE)
  
# variable "logitObj2" can be named "model" too  
  
rxPredict(logitObj2, data = targetDataFileName,
	outData = targetDataFileName, computeStdErr = TRUE,
	interval = "confidence", overwrite=TRUE)
  
