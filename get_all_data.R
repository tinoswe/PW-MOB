source("make_day_frame_2.R")

home_dir <- "/Users/olivo.martino/Code/RStudio/Projects/PW-MOB/Data"
setwd(home_dir)

folders <- list.dirs(full.names = TRUE)
list_df <- list()
i <- 0
for (d in folders[-1]){
  i <- i + 1
  setwd(home_dir)
  f <- list.files(d)
  df <- make_day_frame(as.character(basename(d)))
  list_df[[i]] <- df
  }

df_all <- Reduce(function(x, y) merge(x, y, all=TRUE), list_df)

