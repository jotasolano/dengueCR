library(shiny)
library(d3heatmap)
library(leaflet)
library(rCharts)

# fluidPage(
#   h1("A heatmap demo"),
#   selectInput("palette", "Palette", c("YlOrRd", "RdYlBu", "Greens", "Blues")),
#   checkboxInput("cluster", "Apply clustering"),
#   d3heatmapOutput("heatmap")
# )

bootstrapPage(mainPanel(width = 12, 
  div(class = "row",
      div(showOutput("heatmap", "d3heatmap"), class = "span6"),
      div(showOutput("geomap", "leaflet"), class = "span6")
  )
))