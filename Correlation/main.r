setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")

library(ggbiplot)
library(corrplot)

cat("\n---------------------------------- Correlation ----------------------------------\n")

# ------------------------------ Reading the data frame ------------------------------- #

df <- read.csv("data/preprocessed.csv")

# ------------------------- Creating a matrix for correlation ------------------------- #

d <- as.matrix(df[, -c(1)])

# -------------------------- Summary for Correlation Object --------------------------- #

print(summary(cor(d)))

# -------------------- Plotting the Correlation between columns ----------------------- #

View(corrplot(cor(d), tl.col = "red", bg = "White", tl.srt = 35, 
         title = "\n\n Correlation Plot Of Medicare Reiembursments \n",
         addCoef.col = "black", type = "lower"))
