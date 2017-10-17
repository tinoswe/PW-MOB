modify_jun17 <- function(df){
  
  dtemp1 <- 4.5
  df[, "A_T"] <- df[, "A_T"] - dtemp1
  df[, "B_T"] <- df[, "B_T"] - dtemp1
  df[, "C_T"] <- df[, "C_T"] - dtemp1
  df[, "D_T"] <- df[, "D_T"] - dtemp1
  
  dtemp2 <- 4.0
  df[df$time < "2017-06-05 07:00:00", "A_T"] <- df[df$time < "2017-06-05 07:00:00", "A_T"] - dtemp2
  df[df$time < "2017-06-05 07:00:00", "B_T"] <- df[df$time < "2017-06-05 07:00:00", "B_T"] - dtemp2
  df[df$time < "2017-06-05 07:00:00", "C_T"] <- df[df$time < "2017-06-05 07:00:00", "C_T"] - dtemp2
  df[df$time < "2017-06-05 07:00:00", "D_T"] <- df[df$time < "2017-06-05 07:00:00", "D_T"] - dtemp2
  
  return(df)
}

