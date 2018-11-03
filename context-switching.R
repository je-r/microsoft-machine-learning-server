sqlComputeTrace <- RxInSqlServer(
    connectionString = sqlConnString,
    #shareDir = sqlShareDir,
    wait = sqlWait,
    consoleOutput = sqlConsoleOutput,
    traceEnabled = TRUE,
    traceLevel = 7)
    
    
# to change the compute context, use the rxSetComputeContext function and specify the context by name 
    
    rxSetComputeContext( sqlComputeTrace)
    
