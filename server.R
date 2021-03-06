library(dplyr)
library(d3heatmap)
library(RColorBrewer)
library(shiny)
library(leaflet)
library(rCharts)

# ---------- DATA ---------- #

#convert to df and drop total
cases <- read.csv("casos_2015.csv") %>%
  select(-Total) %>%
  select(-Semana)

data <- read.csv("cantones.csv")


# ---------- CHARTS ---------- #

function(input, output, session) {
  #heatmap
  output$heatmap <- renderD3heatmap({
    d3heatmap(cases, scale = "row",
              dendrogram = "none",
              color = scales::col_quantile("Reds", NULL, 10),
              xaxis_font_size = "10px",
              show_grid = 0.2)
  })
  
  #map
  output$geomap <- renderLeaflet({
    casos_popup <- paste0("<strong>Canton:  </strong>", data$canton,
                          "<br><strong>Cases:  </strong>", data$casos,
                          "<br><strong>Rate:  </strong>", signif(data$tasa, 3))

    m <- leaflet(data) %>%
      addProviderTiles("CartoDB.Positron") %>%
        #Overlay groups
        addCircles(~lng,
                   ~lat,
                   popup = casos_popup,
                   radius = ~sqrt(casos) * 300,
                   weight = 1,
                   color = "red",
                   group = "Cases") %>%
      
      addCircles(~lng,
                 ~lat,
                 popup = casos_popup,
                 radius = ~sqrt(tasa) * 300,
                 weight = 1,
                 color = "orange",
                 group = "Rate") %>%
      
      #Layers control
      addLayersControl(
        overlayGroups = c("Cases", "Rate"),
        options = layersControlOptions(collapsed = FALSE)
      )
  })
}


