library(tidyverse)
library(skimr)
guess_encoding("huellas sp.csv", n_max = 1000)

huellas <- read_csv("huellas sp.csv")

datos <- huellas %>% 
  mutate(mes= factor(mes,unique(mes))) %>% 
  mutate(spmuestreo=factor(spmuestreo, levels = c("c","g")))

datos

plot(datos$largo, datos$ancho)

ggplot(datos,aes(x= ancho, y = largo , colour = spmuestreo))+
  geom_point()

levels(huellas$mes)
