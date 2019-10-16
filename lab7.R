####################################################
#### LABORATORIO 7 - ANALISIS DE REDES SOCIALES ####
################## DATA SCIENCE ####################
####### SERGIO MARCHENA   16387 ####################
####### PABLO VIANA       16091 ####################
####### JOSE MARTINEZ     15163 ####################
####################################################

############# CODIGO DE LYNETTE ############# 

install.packages("twitteR")
install.packages("RCurl")
install.packages("wordcloud")
install.packages("tm")

library(twitteR)
library(RCurl)
library(wordcloud)
library(tm)


setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)
tweets<-searchTwitteR("traficogt",n=150,lang = "es")
tweetdf<-twListToDF(tweets)
dif_UTC_gt<-6*60*60
tweetdf$created2<-tweetdf$created-dif_UTC_gt
write.csv(tweetdf,"tweets_aux.csv")

#getFollowers
user<-getUser("NuestroDiario")
location(user)
followers<-user$getFollowers()

############# FIN DE CODIGO ############# 


# CARGAMOS EL CSV DE TWEETS GENERADO POR TWITTER USANDO "traficogt"
data<-read.csv("tweets_aux.csv")
View(data)

# seleccionamos solo la columna donde estan los tweets [2]
realData<-subset(data[c(2)])
View(realData)


# PREPROCESAMIENTO #
  # Minusculas
realData$text <- tolower(realData$text)

  # Lista de stopwords y caracteres especiales
stopWords <- stopwords(kind = "es")
caracteresEspeciales <- c("'", "@", "#", "rt")

  # Removición de caracteres especiales
for (i in 1:length(caracteresEspeciales)){
  caracEsp <- caracteresEspeciales[i]
  realData$text <- gsub(caracEsp, "", realData$text)
}

  # Removición de urls
realData$text<- gsub('http\\S+\\s*', '', realData$text)


  # Removición de stopwords, signos de puntuación y numeros
realData$text <- removeWords(realData$text, stopWords)
realData$text <- removePunctuation(realData$text)
realData$text <- removeNumbers(realData$text)


