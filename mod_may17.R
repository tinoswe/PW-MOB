modify_may17 <- function(df){

  dtemp1 <- 4.5
  df[df$time > "2017-05-12 16:45:00", "A_T"] <- df[df$time > "2017-05-12 16:45:00", "A_T"] - dtemp1
  df[df$time > "2017-05-12 16:45:00", "B_T"] <- df[df$time > "2017-05-12 16:45:00", "B_T"] - dtemp1
  df[df$time > "2017-05-12 16:45:00", "C_T"] <- df[df$time > "2017-05-12 16:45:00", "C_T"] - dtemp1
  df[df$time > "2017-05-12 16:45:00", "D_T"] <- df[df$time > "2017-05-12 16:45:00", "D_T"] - dtemp1

  # df <- df_may17[df_may17$time > "2017-05-12 16:45:00",]
  # df$time <- seq(1,length(as.POSIXct(df$time)),by=1)
  # 
  # df <- df[,c(1,2)]
  # 
  # plot(df$time,
  #      df$A_T,
  #      type="l")
  # 
  # 
  # 
  # fit <- lm(df$A_T ~ df$time)  
  # 
  # lines(df$time,
  #       mean(df$A_T,na.rm=TRUE) + df$A_T - ( coefficients(fit)[1] + coefficients(fit)[2]*df$time ),
  #      col="red")

    
  return(df)
}

