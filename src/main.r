setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")
shell("cls")

library(ggplot2)

# ----------------------- Preprocessing the Data ----------------------- #

source("preprocessing/main.r")

# -------------------------- Data Visualization ------------------------ #

source("Data Visualization/barGraph.r")
source("Data Visualization/pieChart.r")

# -------------------------- Hypothesis Testing ------------------------ #

source("Hypothesis Testing/main.r")

# -------------------- Principle Component Analysis -------------------- #

source("PCA/main.r")

# ------------------------- Correlation Testing ------------------------ #

source("Correlation/main.r")