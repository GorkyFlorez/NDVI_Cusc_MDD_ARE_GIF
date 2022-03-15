# Instalar rtools---------------------------------------------------------
library(magick)
library(rgee)
library(sf)
library(rgeeExtra)
Peru    <- getData('GADM', country='Peru', level=1) %>%st_as_sf()  
mask <- st_read("SHP/arequipa.shp")%>%  sf_as_ee()

source("NDVI_GIF.R")
# Arequipa---------------------------------------------------------
animation <- ee_utils_gif_creator(rgbVis, gifParams, mode = "wb")
animation %>%
  ee_utils_gif_annotate(text = "NDVI: MODIS/006/MOD13A2", size = 15, color = "white",
    location = "+10+10") %>%
  ee_utils_gif_annotate(text = dates_modis_mabbr,size = 30,location = "+290+350",
    color = "white",font = "arial",boxcolor = "#000000" )  %>%
  ee_utils_gif_annotate(text = "Ing.Gorky Florez Castillo",size = 15,location = "+10+350",
    color = "white",font = "arial",boxcolor = "#000000") %>%
  ee_utils_gif_annotate(text = "Madre de Dios",size = 15,location = "+520+10",
    color = "white",font = "arial",boxcolor = "#000000") -> animation_wtxt
ee_utils_gif_save(animation_wtxt, path = "GIF/raster_MDD.gif")

# Madre de Dios---------------------------------------------------------
mask    <- subset(Peru, NAME_1  == "Madre de Dios")%>%  sf_as_ee()
source("NDVI_GIF.R")

animation <- ee_utils_gif_creator(rgbVis, gifParams, mode = "wb")
animation %>%
  ee_utils_gif_annotate(text = "NDVI: MODIS/006/MOD13A2", size = 15, color = "white",
                        location = "+10+10") %>%
  ee_utils_gif_annotate(text = dates_modis_mabbr,size = 30,location = "+500+10",
                        color = "white",font = "arial",boxcolor = "#000000" )  %>%
  ee_utils_gif_annotate(text = "Ing.Gorky Florez Castillo",size = 15,location = "+10+550",
                        color = "white",font = "arial",boxcolor = "#000000") %>%
  ee_utils_gif_annotate(text = "Madre de Dios",size = 15,location = "+500+550",
                        color = "white",font = "arial",boxcolor = "#000000") -> animation_wtxt

ee_utils_gif_save(animation_wtxt, path = "GIF/raster_MDD.gif")

# Madre de Dios---------------------------------------------------------
mask    <- subset(Peru, NAME_1  == "Cusco")%>%  sf_as_ee()
source("NDVI_GIF.R")

animation <- ee_utils_gif_creator(rgbVis, gifParams, mode = "wb")
animation %>%
  ee_utils_gif_annotate(text = "NDVI: MODIS/006/MOD13A2", size = 15, color = "white",
                        location = "+370+10") %>%
  ee_utils_gif_annotate(text = dates_modis_mabbr,size = 30,location = "+30+400",
                        color = "white",font = "arial",boxcolor = "#000000" )  %>%
  ee_utils_gif_annotate(text = "Ing.Gorky Florez Castillo",size = 15,location = "+10+550",
                        color = "white",font = "arial",boxcolor = "#000000") %>%
  ee_utils_gif_annotate(text = "Cusco",size = 20,location = "+370+100",
                        color = "white",font = "arial",boxcolor = "#000000") -> animation_wtxt

ee_utils_gif_save(animation_wtxt, path = "GIF/raster_Cusco.gif")

