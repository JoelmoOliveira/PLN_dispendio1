
install.packages("tm")
install.packages("stringr")
install.packages("wordcloud")
library(tm)
library(stringr)
library(wordcloud)
library(dplyr)


#tm_map(abs, removeWords, c(stopwords("english"),"my","custom","words")) 
#tm_map(abs, removeWords, c(stopwords("english"), myStopWords))
#Adicionar palavras a uma lista de stopwords no primeiro exemplo,
#no segundo exemplo, cria-se um vetor com as palavras que se quer eliminar

# Dados

palavras_chave<-readLines("palavras.txt",encoding = "UTF-8") ## Lê como várias linhas

dru16.r <- dru16 %>%
  select(FUN,SFUN,PROG,ACAO,NOME_UG,NOME_ACAO,NOME_PO,PD,ACTC)

dru17.r <- dru17 %>%
  select(FUN,SFUN,PROG,ACAO,NOME_UG,NOME_ACAO,NOME_PO,PD,ACTC)

dru18.r <- dru18 %>%
  select(FUN,SFUN,PROG,ACAO,NOME_UG,NOME_ACAO,NOME_PO,PD,ACTC)

dru16.r<-as.data.frame(dru16.r)
dru17.r<-as.data.frame(dru17.r)
dru18.r<-as.data.frame(dru18.r)


which(dru16$NOME_UG=="FUND.COORD.DE APERF.DE PESSOAL NIVEL SUPERIOR")
