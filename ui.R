library(dygraphs)
#install.packages("shinythemes")
library(shinythemes)
#install.packages("shinyTime")
library(shinyTime)

fluidPage(
  theme = shinytheme("cosmo"),#  
  titlePanel('Monitoraggio temperatura e umidità'),
  sidebarLayout(
    
    sidebarPanel(

      selectInput("dataset", "Giornata:",
                  choices = c("Tutti i dati",
                              "08/05/2017",
                              "09/05/2017",
                              "10/05/2017",
                              "11/05/2017",
                              "12/05/2017",#taratura sonde!
                              "13/05/2017",
                              "14/05/2017",
                              #"Settimana 19",
                              "15/05/2017",
                              "16/05/2017",
                              "17/05/2017",
                              "18/05/2017",
                              "19/05/2017",
                              "20/05/2017",
                              "21/05/2017")
    ),
    width=2,
    selected="Tutti i dati"
    ),
    
    
    
    mainPanel(
      
      tabsetPanel(
      
        tabPanel("Dati", dataTableOutput('table')),
        tabPanel("Grafico temperatura (cella + lab)",dygraphOutput("tgraph",
                                                                   width="100%")),
        tabPanel("Grafico umidità relativa (cella)",dygraphOutput("uc_graph",
                                                                  width="100%")),
        tabPanel("Grafico umidità relativa (lab)",dygraphOutput("ulab_graph",
                                                                width="100%"))
        
        
        )
    )
    
  )
)