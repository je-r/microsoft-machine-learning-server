testObs <- rnorm(nrow(iris)) > 0
 testIris <- iris[testObs,]
 trainIris <- iris[!testObs,]

 multiLogitOut <- rxLogisticRegression(
         formula = Species~Features, type = "multiClass", data = trainIris,
         mlTransforms = list(concat(vars = list(
             Features = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
           ))))
 summary(multiLogitOut)
