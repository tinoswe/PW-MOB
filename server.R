library(shiny)
library(lubridate)
library(dygraphs)
library(xts)

source("make_day_frame.R")
df_080517 <- make_day_frame("080517")
df_090517 <- make_day_frame("090517")

df_all <- merge(x = df_080517, 
                y = df_090517, 
                all = TRUE)

df_all$date_time <- paste0(df_all$Day," ", df_all$Time)
df_all <- df_all[,c(ncol(df_all),1:(ncol(df_all)-1))]
df_all$date_time <- strptime(df_all$date_time,
                    format="%Y-%m-%d %H:%M:%S")



#df_all <- merge(x = df_080517, 
#                y = df_090517, 
#                by = "", 
#                all = TRUE)

function(input, output) {
  
  datasetInput <- reactive({
    
    switch(input$dataset,
           "08/05/2017" = df_080517,
           "09/05/2017" = df_090517,
           "Tutti i dati disponibili" = df_all)
  })
  
  output$plot <- renderPlot({
    library(ggplot2)
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, !grepl("_T" , names( data ) )]
    data_T$dtime <- strptime(paste(data_T$Day, data_T$Time, sep = " "),
                            format="%Y-%m-%d %H:%M:%S")
    data_T$Day <- c()
    data_T$Time <- c()
    d_t_t <- melt(data_T,  
                  id = "dtime")
    colnames(d_t_t) <- c("tt", "fact", "xx")
    ggplot(data = d_t_t, 
           aes(x = tt,
               y = xx)) + geom_line(aes(colour = fact)) + theme_bw()
  })
  
  output$table <- renderDataTable( #{

    dataset <- datasetInput(),
    options = list(pageLength = 25,
                   dom  = 'tip'))
    
  output$tgraph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, !grepl( "_T" , names( data ) )]
    data_T$dtime <- strptime(paste(data_T$Day, data_T$Time, sep = " "),
                             format="%Y-%m-%d %H:%M:%S")
    data_T$Day <- c()
    data_T$Time <- c()
    #d_t_t <- melt(data_T,  
    #              id = "dtime")
    #colnames(d_t_t) <- c("T", "LABEL", "Y")
    #filtered <- filter(d_t_t,
    #                   Variety == input$productname,
    #                   Count == input$count )
    #dygraph(d_t_t, main="") %>%
    #  dySeries(c("T", "LABEL", "Y"), label="" ) 
    xts(data_T[,names(data_T)!="dtime"], 
        strptime(data_T$dtime, format = "%Y-%m-%d %H:%M:%S")) %>%
    dygraph() %>%
      dyAxis("y", valueRange = c(10, 30), label="Temp [°C]") %>%
      dyLimit(as.numeric(15), color = "red") %>%
      dyLimit(as.numeric(25), color = "red")
    #dygraph(data_T, main = "test") %>%
    #  dyOptions(colors = RColorBrewer::brewer.pal(3, "Set2"))
    }
  )
  
  output$ugraph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, !grepl( "_T" , names( data ) )]
    data_HR$dtime <- strptime(paste(data_HR$Day, data_HR$Time, sep = " "),
                             format="%Y-%m-%d %H:%M:%S")
    data_HR$Day <- c()
    data_HR$Time <- c()
    xts(data_HR[,names(data_HR)!="dtime"], 
        strptime(data_HR$dtime, format = "%Y-%m-%d %H:%M:%S")) %>%
      dygraph() %>%
      dyAxis("y", valueRange = c(30, 65), label="HR [%]") %>%
      dyLimit(as.numeric(45), color = "red") %>%
      dyLimit(as.numeric(55), color = "red")
  })
    
}

