set.seed(1234)

 # classification
 iris.sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
 iris.dforest <- rxDForest(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
     data = iris[iris.sub, ], importance = TRUE)

 rxVarImpPlot(iris.dforest)
 rxTreeSize(iris.dforest)
 rxVarUsed(iris.dforest)
 rxGetTree(iris.dforest)

