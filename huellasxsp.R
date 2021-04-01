library(tidyverse)
library(skimr)
guess_encoding("huellas sp.csv", n_max = 1000)

# huellas El Cuadro únicamente
huellas <- read_csv("huellas sp.csv")

datos <- huellas %>% 
  mutate(mes= factor(mes,unique(mes))) %>% 
  mutate(spmuestreo=factor(spmuestreo, levels = c("c","g"))) %>% 
  mutate(estacion=recode(mes, 
                    `10`="prim",
                    `9`="prim",
                    `4`="oto"))


  
plot(datos$largo, datos$ancho)

ggplot(datos,aes(x= ancho, y = largo , colour = spmuestreo))+
  geom_point(size=2)+
  theme_light()

ggplot(datos,aes(x= ancho, y = largo , colour = spmuestreo))+
  geom_point()+
  facet_grid(estacion ~ .)
  

levels(huellas$mes)
