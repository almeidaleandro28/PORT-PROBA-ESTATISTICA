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

contWeatherLight <- sum( weatherCodition == "C\xe9u Claro" )
contAcidents <- nrow( df )

# probability of an accident happening in clear weather
probAcidentWetherLight <- ( contWeatherLight / contAcidents ) * 100

# print( probAcidentWetherLight )
# cat("Probabilidade de ocorre um acidente no clima claro ", probAcidentWetherLight, "% ")

# ------------------------------------------------
contWeatherSun <- ( sum( weatherCodition == "Sol") / contAcidents )
contWeatherRain <-( sum( weatherCodition == "Chuva") / contAcidents )
contWeatherWind <- ( sum( weatherCodition == "Vento") / contAcidents )
contWeatherHail <- (sum( weatherCodition == "Granizo ") / contAcidents )
contWeatherSnow <- (sum( weatherCodition == "Neve") / contAcidents )
contWeatherDrizzle <- (sum( weatherCodition == "Garoa/Chuvisco") / contAcidents )
contWeatherCloudy <- (sum( weatherCodition == " Nublado") / contAcidents )
contWeaherFogMist <- (sum( weatherCodition == "Nevoeiro/Neblina") / contAcidents ) 
contWeatherIgnored <- (sum( weatherCodition == " Ignorado")  / contAcidents)

# cat("Tempo com sol", contWeatherSun)
#-----------------------------------------------------------
# como a fase do dia afeta a ocorrência de acidentes
dayPhase <- df$fase_dia
contDayPhase <- table( dayPhase )

dayPhaseDawn <- sum( dayPhase == "Amanhecer")
dayPhaseDusk <- sum( dayPhase == "Anoitecer")
dayPhaseFullNight <- sum( dayPhase == "Plena Noite" )
dayPhaseFullDay <- sum( dayPhase == "Pleno dia")

prodayPhaseDawn <- dayPhaseDawn / contAcidents
prodayPhaseDusk <- dayPhaseDusk / contAcidents
prodaPhaseFullNight <- dayPhaseFullNight / contAcidents
prodayPhaseFullDay <- dayPhaseFullDay / contAcidents

print(prodayPhaseDawn)
print(prodayPhaseDusk)
print(prodaPhaseFullNight)
print(prodayPhaseFullDay)

