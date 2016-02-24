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
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),


  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidPage(
                d3heatmapOutput("heatmap")
              )
      ),
                
      
      # Second tab content
      tabItem(tabName = "widgets",
              fluidPage(
                leafletOutput("geomap")
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