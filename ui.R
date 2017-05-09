library(dygraphs)

fluidPage(
  titlePanel('Monitoraggio temperatura e umidità'),
  sidebarLayout(
    
    sidebarPanel(
    
      selectInput("dataset", "Giornata:",
                  choices = c("08/05/2017",
                              "09/05/2017",
                              "Tutti i dati disponibili")
    )
    ),
    
    mainPanel(
      tabsetPanel(
      
        tabPanel("Dati", dataTableOutput('table')),
        #tabPanel("Charts", plotOutput("plot")),
        tabPanel("Grafico temperatura",dygraphOutput("tgraph")),
        tabPanel("Grafico umidità relativa",dygraphOutput("ugraph"))
        
        )
    )
    
  )
)