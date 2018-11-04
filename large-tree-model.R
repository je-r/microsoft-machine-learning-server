# rxDForest: Parallel External Memory Algorithm for Classification and Regression Decision Forests

#but where is xVal ? not here:

rxDForest(formula, data,
      outFile = NULL, writeModelVars = FALSE, overwrite = FALSE,    
      pweights = NULL, fweights = NULL, method = NULL, parms = NULL, cost = NULL,    
      minSplit = NULL, minBucket = NULL, maxDepth = 10, cp = 0,
      maxCompete = 0, maxSurrogate = 0, useSurrogate = 2, surrogateStyle = 0,    
      nTree = 10, mTry = NULL, replace = TRUE, cutoff = NULL, 
      strata = NULL, sampRate = NULL, importance = FALSE, seed = sample.int(.Machine$integer.max, 1),
      computeOobError = 1,
      maxNumBins = NULL, maxUnorderedLevels = 32, removeMissings = FALSE, 
      useSparseCube = rxGetOption("useSparseCube"), findSplitsInParallel = TRUE,    
      scheduleOnce = FALSE,    
      rowSelection = NULL, transforms = NULL, transformObjects = NULL, transformFunc = NULL,
      transformVars = NULL, transformPackages = NULL, transformEnvir = NULL,
      blocksPerRead = rxGetOption("blocksPerRead"), reportProgress = rxGetOption("reportProgress"),
      verbose = 0, computeContext = rxGetOption("computeContext"), 
      xdfCompressionLevel = rxGetOption("xdfCompressionLevel"),
        ...  )

 ## S3 method for class `rxDForest':
plot  (x, type = "l", main = deparse(substitute(x)), 
      ...  )

# xVal only in rxDTree not in rxDForest above? check it by trying in server for real! 
# xVal: controls the number of folds used to perform cross-validation. The default of 2 allows for some pruning; once you have closed in a model you may want to increase the value for final fitting and pruning.
