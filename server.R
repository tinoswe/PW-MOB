library(shiny)
library(lubridate)
library(dygraphs)
library(xts)

source("make_day_frame.R")
df_080517 <- make_day_frame("080517")
df_090517 <- make_day_frame("090517")
df_100517 <- make_day_frame("100517")
df_110517 <- make_day_frame("110517")
df_120517 <- make_day_frame("120517")
df_130517 <- make_day_frame("130517")

frames <- list(df_080517,
               df_090517,
               df_100517,
               df_110517,
               df_120517,
               df_130517)

df_all <- Reduce(function(x, y) merge(x, y, all=TRUE), frames)

#head(df_all[, grepl( "time" , names( df_all ) ) | grepl( "cella_HR" , names( df_all ) )])
#head(df_all[, grepl( "time" , names( df_all ) ) | grepl( "A_HR" , names( df_all ) ) | grepl( "B_HR" , names( df_all ) )])

#head(df_all)
#df_all$Day_Time <- paste(df_all$Day, " ", df_all$Time,
#                         sep="")
#head(df_all)
#df_all$Day_Time <- strptime(df_all$Day_Time,
#                            format="%Y-%m-%d %H:%M:%S")
#head(df_all)
#df_all$Day <- c()
#df_all$Time <- c()
#head(df_all)
#df_all<-df_all[,c(ncol(df_all),1:(ncol(df_all)-1))]
#head(df_all)

function(input, output) {
  
  datasetInput <- reactive({
    
    switch(input$dataset,
           "08/05/2017" = df_080517,
           "09/05/2017" = df_090517,
           "10/05/2017" = df_100517,
           "11/05/2017" = df_110517,
           "12/05/2017" = df_120517,#taratura sonde
           "13/05/2017" = df_130517,
           "Tutti i dati disponibili" = df_all)
  })
  
  # output$plot <- renderPlot({
  #   library(ggplot2)
  #   library(reshape)
  #   data <- datasetInput()
  #   data_T <- data[, !grepl( "_HR" , names( data ) )]
  #   data_HR <- data[, !grepl("_T" , names( data ) )]
  #   data_T$dtime <- strptime(paste(data_T$Day, data_T$Time, sep = " "),
  #                           format="%Y-%m-%d %H:%M:%S")
  #   data_T$Day <- c()
  #   data_T$Time <- c()
  #   d_t_t <- melt(data_T,  
  #                 id = "dtime")
  #   colnames(d_t_t) <- c("tt", "fact", "xx")
  #   ggplot(data = d_t_t, 
  #          aes(x = tt,
  #              y = xx)) + geom_line(aes(colour = fact)) + theme_bw()
  # })
  
  output$table <- renderDataTable( #{

    dataset <- datasetInput(),
    options = list(pageLength = 25,
                   dom  = 'tip',
                   autoWidth = TRUE,
                   columnDefs = list(list(width = '150px', targets = c(0)))))
                   
    
  output$tgraph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, !grepl( "_T" , names( data ) )]
    xts(data_T[,names(data_T)!="time"],
        strptime(data_T$time, format = "%Y-%m-%d %H:%M:%S")) %>%
    dygraph() %>%
      dyAxis("y", valueRange = c(13, 27), label="Temp [°C]") %>% 
      dyLimit(as.numeric(15), color = "red") %>%
      dyLimit(as.numeric(25), color = "red") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 18:00:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom")
    }
  )
  
  output$uc_graph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, grepl( "time" , names( data ) ) | grepl( "cella_HR" , names( data ) )]
    xts(data_HR[,names(data_HR)!="time"],
        strptime(data_HR$time, format = "%Y-%m-%d %H:%M:%S")) %>%
      dygraph() %>%
      dyAxis("y", valueRange = c(40, 60), label="HR [%]") %>%
      dyLimit(as.numeric(45), color = "red") %>%
      dyLimit(as.numeric(55), color = "red") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 18:00:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom")
  })

  output$ulab_graph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, grepl( "time" , names( data ) ) | grepl( "A_HR" , names( data ) ) | grepl( "B_HR" , names( data ) ) | grepl( "C_HR" , names( data ) ) | grepl( "D_HR" , names( data ) )]  #!grepl( "_T" , names( data ) )
    xts(data_HR[,names(data_HR)!="time"],
        strptime(data_HR$time, format = "%Y-%m-%d %H:%M:%S")) %>%
      dygraph() %>%
      dyAxis("y", valueRange = c(30, 65), label="HR [%]") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 18:00:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom")
  })
  
      
}

