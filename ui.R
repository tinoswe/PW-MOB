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

      selectInput("dataset", "Dati:",
                  choices = c("Tutti i dati",
                              "Maggio 2017",
                              "Giugno 2017")
      ),
      
      #checkboxGroupInput("sensors", "Sonde:",
      #                   choices = c("A" = "a_sens",
      #                               "B" = "b_sens",
      #                               "C" = "c_sens",
      #                               "D" = "d_sens"),
      #                   selected = c("A","B","C","D"),
      #                   inline = TRUE),
      
      width=2,
      selected="Tutti i dati"
    ),
    

  mainPanel(
      
      tabsetPanel(
      
        tabPanel("Dati", dataTableOutput('table'))
        ,
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