library(dplyr)
library(d3heatmap)
library(RColorBrewer)

#convert to df and drop total
cases <- read.csv("casos_2015.csv") %>%
    select(-Total) %>%
    select(-Semana)

#xn = names(cases_matrix[1,])

d3heatmap(cases, scale = "row",
          dendrogram = "none",
          color = scales::col_quantile("Reds", NULL, 10),
          xaxis_font_size = "10px",
          show_grid = 0.2)


