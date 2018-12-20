# Estimate a binary neural net
 rxNeuralNet1 <- rxNeuralNet(isCase ~ age + parity + education + spontaneous + induced,
                   transforms = list(isCase = case == 1),
                   data = infert)

 # Score to a data frame
 scoreDF <- rxPredict(rxNeuralNet1, data = infert, 
     extraVarsToWrite = "isCase",
     outData = NULL) # return a data frame

 # Compute and plot the Radio Operator Curve and AUC
 roc1 <- rxRoc(actualVarName = "isCase", predVarNames = "Probability", data = scoreDF) 
 plot(roc1)
 rxAuc(roc1)

 #########################################################################
 # Regression neural net

 # Create an xdf file with the attitude data
 myXdf <- tempfile(pattern = "tempAttitude", fileext = ".xdf")
 rxDataStep(attitude, myXdf, rowsPerRead = 50, overwrite = TRUE)
 myXdfDS <- RxXdfData(file = myXdf)

 attitudeForm <- rating ~ complaints + privileges + learning + 
     raises + critical + advance

 # Estimate a regression neural net 
 res2 <- rxNeuralNet(formula = attitudeForm,  data = myXdfDS, 
     type = "regression")

 # Score to data frame
 scoreOut2 <- rxPredict(res2, data = myXdfDS, 
     extraVarsToWrite = "rating")

 # Plot the rating versus the score with a regression line
 rxLinePlot(rating~Score, type = c("p","r"), data = scoreOut2)

 # Clean up   
 file.remove(myXdf)    

 #############################################################################
 # Multi-class neural net
 multiNN <- rxNeuralNet(
     formula = Species~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
     type = "multiClass", data = iris)
 scoreMultiDF <- rxPredict(multiNN, data = iris, 
     extraVarsToWrite = "Species", outData = NULL)    
 # Print the first rows of the data frame with scores
 head(scoreMultiDF)
 # Compute % of incorrect predictions
 badPrediction = scoreMultiDF$Species != scoreMultiDF$PredictedLabel
 sum(badPrediction)*100/nrow(scoreMultiDF)
 # Look at the observations with incorrect predictions
 scoreMultiDF[badPrediction,]



