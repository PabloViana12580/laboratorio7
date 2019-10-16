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

consumerKey<-"DQlyuJkQhLr7DFvWdZORvGnor"
consumerSecret<-"ObizzJtiNKsMaKYPXM48RVIABCA1xdmKk0bXwLDcFnBFfaXfJV"
accessToken <-	"239983021-oV2kHZ7GzoK2MCrVDCXRoYt9Phwf7SUTkLnBino3"
accessTokenSecret <-	"z8J4KUsEl4kaT4Sycg2DwVsKaoOTWd4LF7lHxuG8Z1t6X"

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