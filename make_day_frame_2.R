make_day_frame <- function(day_ID){
  
  df <- read.csv(file=paste("Data/", day_ID,"/Report.csv", sep=""),
                 sep=";",
                 skip=4,
                 strip.white=TRUE,
                 stringsAsFactors = FALSE,
                 header=FALSE)
  df$V1 <- as.POSIXct(df$V1,
                      format="%Y/%m/%d %H:%M:%S",
                      tz="Europe/Rome")
  colnames(df) <- c("time",
                    "cella_T",
                    "cella_HR",
                    "A_T",
                    "A_HR",
                    "B_T",
                    "B_HR",
                    "C_T",
                    "C_HR",
                    "D_T",
                    "D_HR")
  #df_day <- df[month(df$time)=="5",] 
  #df_day$Day <- as.character(date(df_day$time))
  #df_day$Time <- paste(sprintf("%02d", hour(df_day$time)),
  #                        sprintf("%02d", minute(df_day$time)),
  #                        sprintf("%02d", second(df_day$time)),
  #                        sep=":")
  #df_day$time <- c()
  #df <- na.omit(df)
  
  return(df)
  
}

#df_080517 <- make_day_frame("080517")

make_day_frame_NEW <- function(home_path,
                               data_path,
                               fname){
  
  df <- read.csv(file=paste(home_path, 
                            data_path,
                            fname,
                            sep="/"),
                 sep=";",
                 skip=4,
                 strip.white=TRUE,
                 stringsAsFactors = FALSE,
                 header=FALSE)
  df$V1 <- strptime(df$V1,
                    format="%Y/%m/%d %H:%M:%S")
  colnames(df) <- c("time",
                    "cella_T",
                    "cella_HR",
                    "A_T",
                    "A_HR",
                    "B_T",
                    "B_HR",
                    "C_T",
                    "C_HR",
                    "D_T",
                    "D_HR")
  #df_day <- df[month(df$time)=="5",] 
  #df_day$Day <- as.character(date(df_day$time))
  #df_day$Time <- paste(sprintf("%02d", hour(df_day$time)),
  #                        sprintf("%02d", minute(df_day$time)),
  #                        sprintf("%02d", second(df_day$time)),
  #                        sep=":")
  #df_day$time <- c()
  #df <- na.omit(df)
  
  return(df)
  
}



