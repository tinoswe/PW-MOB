modify_may17 <- function(df){

  dtemp1 <- 4.5
  df[df$time > "2017-05-12 16:45:00", "A_T"] <- df[df$time > "2017-05-12 16:45:00", "A_T"] - dtemp1
  df[df$time > "2017-05-12 16:45:00", "B_T"] <- df[df$time > "2017-05-12 16:45:00", "B_T"] - dtemp1
  df[df$time > "2017-05-12 16:45:00", "C_T"] <- df[df$time > "2017-05-12 16:45:00", "C_T"] - dtemp1
  df[df$time > "2017-05-12 16:45:00", "D_T"] <- df[df$time > "2017-05-12 16:45:00", "D_T"] - dtemp1

  dtemp2 <- 0.75
  df[df$time > "2017-05-27 05:30:00", "A_T"] <- df[df$time > "2017-05-27 05:30:00", "A_T"] - dtemp2
  df[df$time > "2017-05-27 05:30:00", "B_T"] <- df[df$time > "2017-05-27 05:30:00", "B_T"] - dtemp2
  df[df$time > "2017-05-27 05:30:00", "C_T"] <- df[df$time > "2017-05-27 05:30:00", "C_T"] - dtemp2
  df[df$time > "2017-05-27 05:30:00", "D_T"] <- df[df$time > "2017-05-27 05:30:00", "D_T"] - dtemp2
  
  dtemp3 <- 1.0
  df[df$time > "2017-05-27 07:00:00", "A_T"] <- df[df$time > "2017-05-27 07:00:00", "A_T"] - dtemp3
  df[df$time > "2017-05-27 07:00:00", "B_T"] <- df[df$time > "2017-05-27 07:00:00", "B_T"] - dtemp3
  df[df$time > "2017-05-27 07:00:00", "C_T"] <- df[df$time > "2017-05-27 07:00:00", "C_T"] - dtemp3
  df[df$time > "2017-05-27 07:00:00", "D_T"] <- df[df$time > "2017-05-27 07:00:00", "D_T"] - dtemp3
    
  return(df)
}

