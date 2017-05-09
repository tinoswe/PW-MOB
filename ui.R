library(dygraphs)

fluidPage(
  titlePanel('Monitoraggio temperatura e umidità'),
  sidebarLayout(
    
    sidebarPanel(
    
      selectInput("dataset", "Choose a dataset:",
                  choices = c("Jan 16",
                              "Feb 16",
                              "Mar 16",
                              "Apr 16",
                              "May 16",
                              "Jun 16",
                              "Jul 16",
                              "Aug 16",
                              "Sep 16",
                              "Oct 16",
                              "Nov 16",
                              "Dec 16")
    )
    ),
    
    mainPanel(
      tabsetPanel(
      
        tabPanel("Data", dataTableOutput('table')),
        #tabPanel("Charts", plotOutput("plot")),
        tabPanel("T Chart",dygraphOutput("tgraph")),
        tabPanel("HR Chart",dygraphOutput("ugraph"))
        
        )
    )
    
  )
)