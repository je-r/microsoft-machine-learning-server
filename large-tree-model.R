# rxDForest: Parallel External Memory Algorithm for Classification and Regression Decision Forests

#but where is xVal ?:

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
