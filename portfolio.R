df <- read.table('datatran2024.csv', header = TRUE,  sep = ";",  stringsAsFactors = FALSE)

dataColumn <- colnames( df )

dataEstados <- df$uf
# cont all value for state select
# contValue <- table( df$uf == 'RJ' )

# count for all states
contStates <- table( df$uf )

#state with more acidents
moreStatesAcident <- names( which.max( table( df$uf ) ) )
nameStates <- max( table(df$uf) )

# cat("Estado com mais acidentes ", moreStatesAcident,'com um total de', nameStates," acidentes")
# -------------------------------------------------------------------------------------------------
weatherCodition <- df$condicao_metereologica
contWeatherCodition <- table( weatherCodition )
print( contWeatherCodition )