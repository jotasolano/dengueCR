library(dplyr)
library(d3heatmap)
library(RColorBrewer)
library(shiny)
library(leaflet)
library(rCharts)

function(input, output, session) {
  output$heatmap <- renderD3heatmap({
    
    #convert to df and drop total
    cases <- read.csv("casos_2015.csv") %>%
      select(-Total) %>%
      select(-Semana)
    
    
    d3heatmap(cases, scale = "row",
              dendrogram = "none",
              color = scales::col_quantile("Reds", NULL, 10),
              xaxis_font_size = "10px",
              show_grid = 0.2)
  })
  
  output$geomap <- renderPlot({
    data <- read.csv("cantones.csv")

    casos_popup <- paste0("<strong>Canton:  </strong>", data$canton,
                          "<br><strong>Cases:  </strong>", data$casos,
                          "<br><strong>Rate:  </strong>", signif(data$tasa, 3))

    m <- leaflet(data) %>%
      addProviderTiles("CartoDB.Positron") %>%
        addCircles(~lng,
                   ~lat,
                   popup = casos_popup,
                   radius = ~sqrt(casos) * 300,
                   weight = 1,
                   color = "red")
  })
}

#xn = names(cases_matrix[1,])


