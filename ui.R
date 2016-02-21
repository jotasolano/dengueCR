# library(shiny)
# library(d3heatmap)
# library(leaflet)
# library(rCharts)

# fluidPage(
#   h1("A heatmap demo"),
#   selectInput("palette", "Palette", c("YlOrRd", "RdYlBu", "Greens", "Blues")),
#   checkboxInput("cluster", "Apply clustering"),
#   d3heatmapOutput("heatmap")
# )

# bootstrapPage(mainPanel(width = 12, 
#   div(class = "row",
#       div(d3heatmapOutput("heatmap"), class = "span6"),
#       div(leafletOutput("geomap"), class = "span6")
#   )
# ))

fluidPage(
  
  titlePanel("Dengue Incidence in CR"),
  
  fluidRow(
    column(6,
      d3heatmapOutput("heatmap")
           ),
 
    column(6,
           leafletOutput("geomap")
           )
  )
)