# Arquivo: EXEMPLO_TMAP_FINAL.R

#########################################################
#### Estat�stica Espacial - turma Bras�lia T8        ####
#### MBA Business Analytics e Big Data - 2o Sem 2020 ####
#### Eduardo de Rezende Francisco                    ####
#########################################################

################################################
###      Exemplo de Uso da Extens�o tmap     ###
################################################

#install.packages("rgdal")
#install.packages("tmap")
#install.packages("tmaptools")
#install.packages("shinyjs")
require(rgdal)
require(tmap)
require(shinyjs)
#require(tmaptools)

# carrega o shapefile AREACENS.SHP
ac <- rgdal::readOGR(dsn="c:/temp",layer="areacens_sp")

# explora a extens�o tmap
qtm(ac)

# mapa de renda
tmap_style("classic")
tmap_style("watercolor")
qtm(ac, fill="RENDA")
qtm(ac, fill="RENDA", style="albatross")

# sofisticando...
qtm(ac, fill="ENERGIA", fill.n=10,
    fill.title="Consumo Energia", fill.style="quantile")
qtm(ac, fill="ENERGIA", fill.n=10,
    fill.title="Consumo Energia", fill.style="equal")


# carrega o shapefile DISTRITOS
distritos <- rgdal::readOGR(dsn="c:/temp",layer="distritos_sp")

# mapa coropl�tico estilo atlas escolar
qtm(distritos, fill="MAP_COLORS", legend.show=FALSE)

#mapas mais divertidos

#explorando a paleta de cores
tmaptools::palette_explorer()

# outros exemplos

tm_shape(ac) + tm_fill("RENDA", style="quantile", palette=get_brewer_pal("Oranges", n=5)) +
  tm_legend(outside = TRUE, outside.position = "bottom", stack = "horizontal") +
  tm_borders()

tm_shape(ac) + tm_fill(c("RENDA","RENDA"), style=c("quantile","equal"), n=10,
                       palette=get_brewer_pal("Blues", n=5)) + tm_borders() +
 tm_legend(position = c("right","bottom"), stack = "horizontal")

tm_shape(ac) +
  tm_fill("MOR_DOM", style="kmeans", palette = get_brewer_pal("Blues", n = 5, contrast = c(0.1, 1))) +
  tm_borders() +
  tm_bubbles(size="RENDA", col="magenta", perceptual=FALSE, border.col = "dark red", border.lwd=.5) +
  tm_layout("S�o Paulo - Renda x Moradores por Domic�lio")


mapa_renda <- tm_shape(ac) +
  tm_polygons("RENDA", n=4, palette="YlOrRd") +
  tm_layout("Munic�pio de S�o Paulo: Renda",
            inner.margins=c(0,0,.1,0),title.size=.99) +
  tm_compass(type="8star", position = c("right", "bottom"))

mapa_energia <- tm_shape(ac) +
  tm_polygons("ENERGIA", n=4, palette="YlOrRd") +
  tm_layout("Munic�pio de S�o Paulo: Energia",
            inner.margins=c(0,0,.1,0),title.size=.99) +
  tm_compass(type="8star", position = c("right", "bottom"))

require(tmaptools)
tmap_arrange(mapa_renda, mapa_energia)


