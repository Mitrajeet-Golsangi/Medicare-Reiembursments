setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")

library(ggbiplot)
library(corrplot)

df <- read.csv("data/preprocessed.csv")

d <- as.matrix(df[, -c(1)])

print(summary(cor(d)))

View(corrplot(cor(d), tl.col = "red", bg = "White", tl.srt = 35, 
         title = "\n\n Correlation Plot Of Medicare Reiembursments \n",
         addCoef.col = "black", type = "lower"))
