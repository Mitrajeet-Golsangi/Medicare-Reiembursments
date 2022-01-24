setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")

library(ggplot2)

# ---------------------- Function for rounding decimal Accuracy -------------------- #

specify_decimal <- function(x, k) trimws(format(round(x, k), nsmall=k))

# -------------------------------- Reading the data -------------------------------- #

df <- read.csv("data/preprocessed.csv")

# ----------------------------------- Cleaning data -------------------------------- #

df <- df[-c(52:61), -c(1)]

# ----------------- Creating Vector for storing Mean of all columns ---------------- #

mean_of_categories <- c()

for (i in 1:ncol(df)) {
   mean_of_categories <- append(mean_of_categories, specify_decimal(mean(df[, i]), 3))
}

# --------------------- Creating Vector for storing column names ------------------- #

categories <- colnames(df)

# ---------------------------------- Creating Dataframe ---------------------------- #

df <- data.frame(categories, mean_of_categories)
df_pie<-cbind(categories, mean_of_categories)

# -------------------- Plotting the pie chart with attributes ---------------------- #

pie_plt <- ggplot(df, aes(x = "", y = mean_of_categories, fill = categories)) +
    geom_col(color = "black") +
    geom_bar(stat="identity", width=1, color="black")+
    geom_text(aes(label = mean_of_categories),
              position = position_stack(vjust = 0.5))+
    coord_polar(theta = "y", start =0)+
    theme_void()

View(pie_plt)

