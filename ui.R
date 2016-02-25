library(shiny)
library(shinydashboard)
library(d3heatmap)
library(leaflet)
library(rCharts)


# bootstrapPage(mainPanel(width = 12, 
#   div(class = "row",
#       div(d3heatmapOutput("heatmap"), class = "span6"),
#       div(leafletOutput("geomap"), class = "span6")
#   )
# ))

dashboardPage(skin = "black",
  dashboardHeader(title = "Dengue in Costa Rica"),
  dashboardSidebar(
    sidebarMenu(

      menuItem("Map distribution", tabName = "widgets", icon = icon("th")),
      menuItem("Year Incidence", tabName = "dashboard", icon = icon("calendar"))
    )
  ),


  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidPage(
                fluidRow(
                  tags$head(tags$style(HTML('
                                            .col-sm-6 {
                                            width: 100%;
                                            }
                                            '))),
                  
                  box(title = "Incidence by week",
                    d3heatmapOutput("heatmap")
                )
              )
              )
      ),
                
      
      # Second tab content
      tabItem(tabName = "widgets",
              fluidPage(
                fluidRow(
                  tags$head(tags$style(type = "text/css",'
                                            #geomap {
                                            height: 80vh !important;
                                            }
                                            ')),
                  box(title = "Geographical distribution",
                    leafletOutput("geomap")
                  )
                )
              )
      )
    )
  )
)


  
  
    
#   dashboardBody(
#     fluidPage(
#       # titlePanel("Dengue Incidence in CR"),
#       
#       fluidRow(
#         column(6,
#                d3heatmapOutput("heatmap")
#         ),
#         
#         column(6,
#                leafletOutput("geomap")
#         )
#       )
#     )
#   )
  
# )

# fluidPage(
#   
#   titlePanel("Dengue Incidence in CR"),
#   
#   fluidRow(
#     column(6,
#       d3heatmapOutput("heatmap")
#            ),
#  
#     column(6,
#            leafletOutput("geomap")
#            )
#   )
# )