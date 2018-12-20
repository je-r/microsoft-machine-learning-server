# run only once:
#install.packages('ggplot2', dep = TRUE)

# now ggplot2 installed so you can use it:
library(ggplot2)

#

diamondData <- rxDataStep(inData = ggplot2::diamonds, 
  transforms = list(
    set = factor(ifelse(runif(.rxNumRows) >= 0.05, "train", "test")),
    value = factor(ifelse(price >= 4000, "high", "low"))), 
 varsToKeep = c("cut", "clarity", "carat", "color"))

# -----


diamondDataList <- rxSplit(diamondData, splitByFactor = "set")

diamondDTree <- rxDTree(value ~ cut + carat + color + clarity, data = diamondDataList$diamondData.set.train, maxDepth = 4)

library(RevoTreeView)

plot(createTreeView(diamondDTree))

rxLeafSize(diamondDTree, use.weight = TRUE)

