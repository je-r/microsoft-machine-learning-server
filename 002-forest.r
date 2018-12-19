stackForest <- rxDForest(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc., data=stackloss, nTree=200, mTry=2, importance = TRUE)



