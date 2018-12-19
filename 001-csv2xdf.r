getwd()
print("testing")
peopleColumns <- c("field1" = "numeric",
                       "field2" = "numeric",
                       "field3" = "numeric",
                       "field4" = "numeric",
                       "field5" = "factor")
peopleCsv <- "people.csv"
peopleXdf <- "people.xdf"
rxImport(peopleCsv, peopleXdf, colClasses = peopleColumns, overwrite = TRUE)
rxGetInfo(peopleXdf)


