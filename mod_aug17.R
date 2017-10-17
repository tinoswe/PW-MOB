modify_aug17 <- function(df){
  
  dtemp1 <- 4.5
  df[, "A_T"] <- df[, "A_T"] - dtemp1
  df[, "B_T"] <- df[, "B_T"] - dtemp1
  df[, "C_T"] <- df[, "C_T"] - dtemp1
  df[, "D_T"] <- df[, "D_T"] - dtemp1
  
  return(df)
}

