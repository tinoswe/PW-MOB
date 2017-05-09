dat = read.csv("Data/080517/Report.csv", 
               sep=";",
               skip=4,
               strip.white=TRUE,
               stringsAsFactors = FALSE)
colnames(dat) <- c("time",
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

df_cella <- data.frame(time=dat$time,
                       temp=dat$cella_T,
                       hr=dat$cella_HR)
df_cella <- df_cella[complete.cases(df_cella),]
plot(df_cella$time,
     df_cella$temp,
     type="l")