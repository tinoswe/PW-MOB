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
df_140517 <- make_day_frame("140517")
df_150517 <- make_day_frame("150517")
df_160517 <- make_day_frame("160517")
df_170517 <- make_day_frame("170517")
df_180517 <- make_day_frame("180517")
df_190517 <- make_day_frame("190517")
df_200517 <- make_day_frame("200517")
df_210517 <- make_day_frame("210517")
df_220517 <- make_day_frame("220517")
df_230517 <- make_day_frame("230517")

#function that returns the list of frame names!!
all_frames <- list(df_080517,
                   df_090517,
                   df_100517,
                   df_110517,
                   df_120517,
                   df_130517,
                   df_140517,
                   df_150517,
                   df_160517,
                   df_170517,
                   df_180517,
                   df_190517,
                   df_200517,
                   df_210517,
                   df_220517,
                   df_230517)

df_all <- Reduce(function(x, y) merge(x, y, all=TRUE), all_frames)


function(input, output) {
  
  datasetInput <-   reactive({
  
     switch(input$dataset,
            "Tutti i dati" = df_all,
            "08/05/2017" = df_080517,
            "09/05/2017" = df_090517,
            "10/05/2017" = df_100517,
            "11/05/2017" = df_110517,
            "12/05/2017" = df_120517,#taratura sonde
            "13/05/2017" = df_130517,
            "14/05/2017" = df_140517,
            "15/05/2017" = df_150517,
            "16/05/2017" = df_160517,
            "17/05/2017" = df_170517,
            "18/05/2017" = df_180517,
            "19/05/2017" = df_190517,
            "20/05/2017" = df_200517,
            "21/05/2017" = df_210517,
            "22/05/2017" = df_220517)
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
      dyAxis("y", valueRange = c(13, 32), label="Temp [°C]") %>% 
      dyLimit(as.numeric(16), color = "red") %>%
      dyLimit(as.numeric(24), color = "red") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 23:59:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom")
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
      dyAxis("y", valueRange = c(20, 80), label="HR [%]") %>%
      dyLimit(as.numeric(45), color = "red") %>%
      dyLimit(as.numeric(55), color = "red") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 23:59:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom")
  })

  output$ulab_graph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, grepl( "time" , names( data ) ) | grepl( "A_HR" , names( data ) ) | grepl( "B_HR" , names( data ) ) | grepl( "C_HR" , names( data ) ) | grepl( "D_HR" , names( data ) )]  #!grepl( "_T" , names( data ) )
    xts(data_HR[,names(data_HR)!="time"],
        strptime(data_HR$time, format = "%Y-%m-%d %H:%M:%S")) %>%
      dygraph() %>%
      dyAxis("y", valueRange = c(20, 80), label="HR [%]") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 23:59:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom")
  })
  
      
}

