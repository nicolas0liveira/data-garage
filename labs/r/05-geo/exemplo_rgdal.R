## Arquivo: EXEMPLO_RGDAL.R

#########################################################
#### Estat�stica Espacial - turma Bras�lia T8        ####
#### MBA Business Analytics e Big Data - 2o Sem 2020 ####
#### Eduardo de Rezende Francisco                    ####
#########################################################

########################################################################
###      Exemplo de Explora��o de Mapas com a extens�o MAPTOOLS    ###
########################################################################

# carrega a extens�o RGDAL

#install.packages("maptools")
#require(maptools)
install.packages("rgdal")
require(rgdal)

# carrega o shapefile AREACENS.SHP

# m�todo anterior, baseado no package "mapping"
# ac <- readShapePoly("c:/temp/areacens_sp.shp")

# m�todo baseado no package rgdal
#dsn <- system.file("c:/temp/areacens_sp.shp", package = "rgdal")[1]
ac <- rgdal::readOGR(dsn="c:/temp",layer="areacens_sp")
plot(ac)

# seleciona as áreas com renda média menor ou igual a R$ 1000
# e desenha de vermelho
ac_ate1000 <- ac[ac$RENDA <= 1000,]
plot(ac_ate1000,col="red",add=T)
