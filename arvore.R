
# Carregando o pacote
install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)
library(dplyr)

# Dados

druc16.pd <- druc16 %>%
  select(FUN,SFUN,PD)
druc16.actc <- druc16 %>%
  select(FUN,SFUN,ACTC)

druc16.pd<-as.data.frame(druc16.pd)
druc16.actc<-as.data.frame(druc16.actc)

# Split do dataset em treino e teste

prop.table(table(druc16.pd$PD)) * 100  ## verificando ditribuição de T/F nos dados

?createDataPartition ## pacote/biblioteca 'caret'
indice <- createDataPartition(y = druc16.pd$PD, p = 0.95, list = FALSE)
View(indice)
head(indice)
druc16.pd_treino <- druc16.pd[indice,]
druc16.pd_teste <- druc16.pd[-indice,]
class(druc16.pd_treino)
class(druc16.pd_teste)


prop.table(table(druc16.actc$ACTC)) * 100  ## verificando ditribuição de T/F nos dados


indice <- createDataPartition(y = druc16.actc$ACTC, p = 0.95, list = FALSE)
View(indice)
head(indice)
druc16.actc_treino <- druc16.actc[indice,]
druc16.actc_teste <- druc16.actc[-indice,]
class(druc16.actc_treino)
class(druc16.actc_teste)


# Criando o modelo
?rpart
?rpart.control
druc16.pd_tree <- rpart(PD ~ ., 
                     data = druc16.pd_treino, 
                     method = "class", 
                     parms = list(split = "information"), 
                     control = rpart.control(minsplit = 1))

druc16.actc_tree <- rpart(ACTC ~ ., 
                        data = druc16.actc_treino, 
                        method = "class", 
                        parms = list(split = "information"), 
                        control = rpart.control(minsplit = 1))

# Visualizando o ganho de informação para cada atributo
druc16.pd_tree

druc16.actc_tree

# Gerando o plot
# Plot
?prp
prp(druc16.pd_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)

prp(druc16.actc_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)


unique(druc16.actc$ACAO)
# Fazendo previsões com o modelo



# Vetor para selecionar as linhas 
response <- c(2, 20, 3, 33, 17, 4, 5) 

# Novos dados
novos_dados <- data.frame(clima[response,])
View(novos_dados)

# Previsões
?predict
predict(tennis_tree, novos_dados)

