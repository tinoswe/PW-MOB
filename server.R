library(shiny)
library(lubridate)
library(dygraphs)
library(xts)
library(lubridate)

source("get_all_data.R")

df_may17 <- df_all[month(df_all$time)==5,]
df_jun17 <- df_all[month(df_all$time)==6,]
df_jul17 <- df_all[month(df_all$time)==7,]

function(input, output) {
  
  datasetInput <-   reactive({
  
     switch(input$dataset,
            "Tutti i dati" = df_all,
            "Maggio 2017" = df_may17,
            "Giugno 2017" = df_jun17,
            "Luglio 2017" = df_jul17)
   })

  output$table <- renderDataTable( #{

    dataset <- datasetInput(),
    options = list(pageLength = 25,
                   dom  = 'tip',
                   autoWidth = TRUE,
                   columnDefs = list(list(width = '150px', 
                                          targets = c(0))
                                     )
                   )
    )
                   
    
  output$tgraph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, !grepl( "_T" , names( data ) )]
    xx<-xts(data_T[,names(data_T)!="time"],
            strptime(data_T$time, format = "%Y-%m-%d %H:%M:%S"),
            tz="GMT") 
    dygraph(xx) %>%
      dyOptions(useDataTimezone = FALSE,
                connectSeparatedPoints = FALSE) %>%
      dyAxis("y", valueRange = c(13, 40), label="Temp [°C]") %>% 
      dyLimit(as.numeric(16), color = "red") %>%
      dyLimit(as.numeric(24), color = "red") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 23:59:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom") %>%
      dyEvent(c("2017-06-05 07:00:00"), c("Chiller ON"), labelLoc = "bottom") %>%
      dyEvent(c("2017-06-06 14:45:00"), c("Switched off due to heavy rain"), color="grey", labelLoc = "top", strokePattern="dashed") %>%
      dyEvent(c("2017-06-07 06:45:00"), c("Switched on after heavy rain"), labelLoc = "top", strokePattern="dashed", color="grey") %>%
      dyEvent(c("2017-06-28 09:00:00"), c("New door opened and not closed"), labelLoc = "top", strokePattern="dashed", color="grey")
    }
  )
  
  output$uc_graph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, grepl( "time" , names( data ) ) | grepl( "cella_HR" , names( data ) )]
    xx<-xts(data_HR[,names(data_HR)!="time"],
        strptime(data_HR$time, format = "%Y-%m-%d %H:%M:%S"),
        tz="GMT") 
      dygraph(xx) %>%
        dyOptions(useDataTimezone = FALSE) %>%
      dyAxis("y", valueRange = c(20, 80), label="HR [%]") %>%
      dyLimit(as.numeric(45), color = "red") %>%
      dyLimit(as.numeric(55), color = "red") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 23:59:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom") %>%
      dyEvent(c("2017-06-05 07:00:00"), c("Chiller ON"), labelLoc = "bottom")%>%
        dyEvent(c("2017-06-06 14:45:00"), c("Switched off due to heavy rain"), color="grey", labelLoc = "top", strokePattern="dashed") %>%
        dyEvent(c("2017-06-07 06:45:00"), c("Switched on after heavy rain"), labelLoc = "top", strokePattern="dashed", color="grey") %>%
        dyEvent(c("2017-06-28 09:00:00"), c("New door opened and not closed"), labelLoc = "top", strokePattern="dashed", color="grey")
  })

  output$ulab_graph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "_HR" , names( data ) )]
    data_HR <- data[, grepl( "time" , names( data ) ) | grepl( "A_HR" , names( data ) ) | grepl( "B_HR" , names( data ) ) | grepl( "C_HR" , names( data ) ) | grepl( "D_HR" , names( data ) )]  #!grepl( "_T" , names( data ) )
    xx <- xts(data_HR[,names(data_HR)!="time"],
        strptime(data_HR$time, format = "%Y-%m-%d %H:%M:%S"),
        tz = "GMT") 
    dygraph(xx) %>%
      dyOptions(useDataTimezone = FALSE) %>%
      dyAxis("y", valueRange = c(20, 80), label="HR [%]") %>%
      dyEvent(c("2017-05-12 07:30:00", "2017-05-12 23:59:00"), c("Inizio taratura", "Fine taratura"), labelLoc = "bottom") %>%
      dyEvent(c("2017-06-05 07:00:00"), c("Chiller ON"), labelLoc = "bottom")%>%
      dyEvent(c("2017-06-06 14:45:00"), c("Switched off due to heavy rain"), color="grey", labelLoc = "top", strokePattern="dashed") %>%
      dyEvent(c("2017-06-07 06:45:00"), c("Switched on after heavy rain"), labelLoc = "top", strokePattern="dashed", color="grey") %>%
      dyEvent(c("2017-06-28 09:00:00"), c("New door opened and not closed"), labelLoc = "top", strokePattern="dashed", color="grey")
  })
  
      
}

#data <- df_all
#data_T <- data[, !grepl( "_HR" , names( data ) )]
#data_HR <- data[, !grepl( "_T" , names( data ) )]
#xx<-xts(data_T[,names(data_T)!="time"],
#        strptime(data_T$time, format = "%Y-%m-%d %H:%M:%S"))
#indexTZ(xx) <- "Europe/Rome"
#tail(xx)