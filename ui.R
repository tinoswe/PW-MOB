library(dygraphs)
#install.packages("shinythemes")
library(shinythemes)

fluidPage(
  theme = shinytheme("cosmo"),#  
  titlePanel('Monitoraggio temperatura e umidità'),
  sidebarLayout(
    
    sidebarPanel(
    
      selectInput("dataset", "Giornata:",
                  choices = c("08/05/2017",
                              "09/05/2017",
                              "10/05/2017",
                              "11/05/2017",
                              #"12/05/2017",#taratura sonde!
                              "13/05/2017",
                              "Tutti i dati disponibili")
    ),
    width=2
    ),
    
    mainPanel(
      
      tabsetPanel(
      
        tabPanel("Dati", dataTableOutput('table')),
        tabPanel("Grafico temperatura (cella + lab)",dygraphOutput("tgraph")),
        tabPanel("Grafico umidità relativa (cella)",dygraphOutput("uc_graph")),
        tabPanel("Grafico umidità relativa (lab)",dygraphOutput("ulab_graph"))
        
        
        )
    )
    
  )
)