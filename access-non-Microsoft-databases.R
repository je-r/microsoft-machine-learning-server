# use ODBC!, works also for Oracle

## Not run:

# Create an ODBC data source for a SQLite database
claimsSQLiteFileName <- file.path(rxGetOption("sampleDataDir"), "claims.sqlite")
connectionString <-
 paste("Driver={SQLite3 ODBC Driver};Database=", claimsSQLiteFileName,
       sep = "")
claimsOdbcSource <-
 RxOdbcData(sqlQuery = "SELECT * FROM claims",
            connectionString = connectionString)

# Create an xdf file name
claimsXdfFileName <- file.path(tempdir(), "importedClaims.xdf")

# Import the data into the xdf file
rxImport(claimsOdbcSource, claimsXdfFileName, overwrite = TRUE)

# Read xdf file into a data frame
claimsIn <- rxDataStep(inData = claimsXdfFileName)
head(claimsIn)

# Clean-up: delete the new file
file.remove(claimsXdfFileName)

# Create an ODBC data source for storing a data frame 
irisOdbcSource <- RxOdbcData(table = "irisTable", connectionString = connectionString)

# Store the data frame in the database 
rxWriteObject(irisOdbcSource, "irisData", iris)

# Retrieve the data frame from the database 
irisData <- rxReadObject(irisOdbcSource, "irisData") 
identical(irisData, iris) # TRUE 

# Create an ODBC data source for storing a sample XDF 
airlineOdbcSource <- RxOdbcData(table = "airlineTable", connectionString = connectionString)

# Store a sample XDF in the database 
airlineXdf <- rxReadXdf( file.path(rxGetOption("sampleDataDir"), "AirlineDemoSmall.xdf") )
rxWriteObject(airlineOdbcSource, "airlineData", airlineXdf)

# Retrieve the XDF object from the database 
airlineData <- rxReadObject(airlineOdbcSource, "airlineData")
identical(airlineData, airlineXdf) # TRUE
## End(Not run)
