library(shiny)
library(lubridate)
library(dygraphs)
library(xts)

df <- read.csv(file="Data/080517/Report.csv",
               sep=";",
               skip=4,
               strip.white=TRUE,
               stringsAsFactors = FALSE,
               header=FALSE)

df$V1 <- strptime(df$V1,
                   format="%Y/%m/%d %h:%m:%s")

names(df) <- c("DateTime",
               "2 - T",
               "3 - T",
               "4 - T",
               "5 - T",
               "2 - HR",
               "3 - HR",
               "4 - HR",
               "5 - HR")

#year(df$XT2[2000])
#month(df$XT2[2000])
#day(df$XT2[2000])
#hour(df$XT2[2000])
#minute(df$XT2[2000])
#second(df$XT2[2000])
#d_years <- unique(year(df$XT2))
#d_months <- unique(month(df$XT2))
#d_days <- unique(day(df$XT2))
#d_hours <- unique(hour(df$XT2))
#df[, grepl( "- T" , names( df ) )]

#jan16
df_jan16 <- df[month(df$DateTime)=="1",] 
df_jan16$Day <- as.character(date(df_jan16$DateTime))
df_jan16$Time <- paste(sprintf("%02d", hour(df_jan16$DateTime)),
                 sprintf("%02d", minute(df_jan16$DateTime)),
                 sprintf("%02d", second(df_jan16$DateTime)),
                 sep=":")
df_jan16$DateTime <- c()
df_jan16 <- df_jan16[,c(9,10,1,2,3,4,5,6,7,8)]
#df_jan16<-df_jan16[2:10,]
#tail(df_jan16,
#     n=20)
df_jan16 <- na.omit(df_jan16)

#feb16
df_feb16 <- df[month(df$DateTime)=="2",] 
df_feb16$Day <- as.character(date(df_feb16$DateTime))
df_feb16$Time <- paste(sprintf("%02d", hour(df_feb16$DateTime)),
                       sprintf("%02d", minute(df_feb16$DateTime)),
                       sprintf("%02d", second(df_feb16$DateTime)),
                       sep=":")
df_feb16$DateTime <- c()
df_feb16 <- df_feb16[,c(9,10,1,2,3,4,5,6,7,8)]
df_feb16 <- na.omit(df_feb16)

#mar16
df_mar16 <- df[month(df$DateTime)=="3",] 
df_mar16$Day <- as.character(date(df_mar16$DateTime))
df_mar16$Time <- paste(sprintf("%02d", hour(df_mar16$DateTime)),
                       sprintf("%02d", minute(df_mar16$DateTime)),
                       sprintf("%02d", second(df_mar16$DateTime)),
                       sep=":")
df_mar16$DateTime <- c()
df_mar16 <- df_mar16[,c(9,10,1,2,3,4,5,6,7,8)]
df_mar16 <- na.omit(df_mar16)

#apr16
df_apr16 <- df[month(df$DateTime)=="4",] 
df_apr16$Day <- as.character(date(df_apr16$DateTime))
df_apr16$Time <- paste(sprintf("%02d", hour(df_apr16$DateTime)),
                       sprintf("%02d", minute(df_apr16$DateTime)),
                       sprintf("%02d", second(df_apr16$DateTime)),
                       sep=":")
df_apr16$DateTime <- c()
df_apr16 <- df_apr16[,c(9,10,1,2,3,4,5,6,7,8)]
df_apr16 <- na.omit(df_apr16)

#may16
df_may16 <- df[month(df$DateTime)=="5",] 
df_may16$Day <- as.character(date(df_may16$DateTime))
df_may16$Time <- paste(sprintf("%02d", hour(df_may16$DateTime)),
                       sprintf("%02d", minute(df_may16$DateTime)),
                       sprintf("%02d", second(df_may16$DateTime)),
                       sep=":")
df_may16$DateTime <- c()
df_may16 <- df_may16[,c(9,10,1,2,3,4,5,6,7,8)]
df_may16 <- na.omit(df_may16)

#jun16
df_jun16 <- df[month(df$DateTime)=="6",] 
df_jun16$Day <- as.character(date(df_jun16$DateTime))
df_jun16$Time <- paste(sprintf("%02d", hour(df_jun16$DateTime)),
                       sprintf("%02d", minute(df_jun16$DateTime)),
                       sprintf("%02d", second(df_jun16$DateTime)),
                       sep=":")
df_jun16$DateTime <- c()
df_jun16 <- df_jun16[,c(9,10,1,2,3,4,5,6,7,8)]
df_jun16 <- na.omit(df_jun16)

#jul16
df_jul16 <- df[month(df$DateTime)=="7",] 
df_jul16$Day <- as.character(date(df_jul16$DateTime))
df_jul16$Time <- paste(sprintf("%02d", hour(df_jul16$DateTime)),
                       sprintf("%02d", minute(df_jul16$DateTime)),
                       sprintf("%02d", second(df_jul16$DateTime)),
                       sep=":")
df_jul16$DateTime <- c()
df_jul16 <- df_jul16[,c(9,10,1,2,3,4,5,6,7,8)]
df_jul16 <- na.omit(df_jul16)

#aug16
df_aug16 <- df[month(df$DateTime)=="8",] 
df_aug16$Day <- as.character(date(df_aug16$DateTime))
df_aug16$Time <- paste(sprintf("%02d", hour(df_aug16$DateTime)),
                       sprintf("%02d", minute(df_aug16$DateTime)),
                       sprintf("%02d", second(df_aug16$DateTime)),
                       sep=":")
df_aug16$DateTime <- c()
df_aug16 <- df_aug16[,c(9,10,1,2,3,4,5,6,7,8)]
df_aug16 <- na.omit(df_aug16)

#sep16
df_sep16 <- df[month(df$DateTime)=="9",] 
df_sep16$Day <- as.character(date(df_sep16$DateTime))
df_sep16$Time <- paste(sprintf("%02d", hour(df_sep16$DateTime)),
                       sprintf("%02d", minute(df_sep16$DateTime)),
                       sprintf("%02d", second(df_sep16$DateTime)),
                       sep=":")
df_sep16$DateTime <- c()
df_sep16 <- df_sep16[,c(9,10,1,2,3,4,5,6,7,8)]
df_sep16 <- na.omit(df_sep16)

#oct16
df_oct16 <- df[month(df$DateTime)=="10",] 
df_oct16$Day <- as.character(date(df_oct16$DateTime))
df_oct16$Time <- paste(sprintf("%02d", hour(df_oct16$DateTime)),
                       sprintf("%02d", minute(df_oct16$DateTime)),
                       sprintf("%02d", second(df_oct16$DateTime)),
                       sep=":")
df_oct16$DateTime <- c()
df_oct16 <- df_oct16[,c(9,10,1,2,3,4,5,6,7,8)]
df_oct16 <- na.omit(df_oct16)

#nov16
df_nov16 <- df[month(df$DateTime)=="11",] 
df_nov16$Day <- as.character(date(df_nov16$DateTime))
df_nov16$Time <- paste(sprintf("%02d", hour(df_nov16$DateTime)),
                       sprintf("%02d", minute(df_nov16$DateTime)),
                       sprintf("%02d", second(df_nov16$DateTime)),
                       sep=":")
df_nov16$DateTime <- c()
df_nov16 <- df_nov16[,c(9,10,1,2,3,4,5,6,7,8)]
df_nov16 <- na.omit(df_nov16)

#dec16
df_dec16 <- df[month(df$DateTime)=="12",] 
df_dec16$Day <- as.character(date(df_dec16$DateTime))
df_dec16$Time <- paste(sprintf("%02d", hour(df_dec16$DateTime)),
                       sprintf("%02d", minute(df_dec16$DateTime)),
                       sprintf("%02d", second(df_dec16$DateTime)),
                       sep=":")
df_dec16$DateTime <- c()
df_dec16 <- df_dec16[,c(9,10,1,2,3,4,5,6,7,8)]
df_dec16 <- na.omit(df_dec16)

function(input, output) {
  
  datasetInput <- reactive({
    
    switch(input$dataset,
           "Jan 16" = df_jan16,
           "Feb 16" = df_feb16,
           "Mar 16" = df_mar16,
           "Apr 16" = df_apr16,
           "May 16" = df_may16,
           "Jun 16" = df_jun16,
           "Jul 16" = df_jul16,
           "Aug 16" = df_aug16,
           "Sep 16" = df_sep16,
           "Oct 16" = df_oct16,
           "Nov 16" = df_nov16,
           "Dec 16" = df_dec16)
  })
  
  output$plot <- renderPlot({
    library(ggplot2)
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "- HR" , names( data ) )]
    data_HR <- data[, !grepl( "- T" , names( data ) )]
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
    data_T <- data[, !grepl( "- HR" , names( data ) )]
    data_HR <- data[, !grepl( "- T" , names( data ) )]
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
      #dyAxis("y", valueRange = c(10, 30), label="Temp [°C]") %>%
      dyLimit(as.numeric(15), color = "red") %>%
      dyLimit(as.numeric(25), color = "red")
    #dygraph(data_T, main = "test") %>%
    #  dyOptions(colors = RColorBrewer::brewer.pal(3, "Set2"))
    }
  )
  
  output$ugraph <- renderDygraph({
    library(reshape)
    data <- datasetInput()
    data_T <- data[, !grepl( "- HR" , names( data ) )]
    data_HR <- data[, !grepl( "- T" , names( data ) )]
    data_HR$dtime <- strptime(paste(data_HR$Day, data_HR$Time, sep = " "),
                             format="%Y-%m-%d %H:%M:%S")
    data_HR$Day <- c()
    data_HR$Time <- c()
    xts(data_HR[,names(data_HR)!="dtime"], 
        strptime(data_HR$dtime, format = "%Y-%m-%d %H:%M:%S")) %>%
      dygraph() #%>%
      #dyAxis("y", valueRange = c(0, 100), label="Temp [°C]") #%>%
      #dyLimit(as.numeric(0), color = "red") %>%
      #dyLimit(as.numeric(100), color = "red")
  })
    
}

