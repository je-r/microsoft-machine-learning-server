sqlConnString <- "Driver=SQL Server;Server=JERSQLR;Database=JERData;Trusted_Connection=True"

connection <- RxSqlServerData(connectionString = sqlConnString,
 table = "dbo.JERDataBase", rowsPerRead = 1000)
 
# Display the first few rows from the Airports table
head(connection) 
