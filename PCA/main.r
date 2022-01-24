setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")

library(ggbiplot)

cat("\n-------------------------- Principle Component Analysis -------------------------\n")

# ----------------------------- Reading the preprocessed data ---------------------- #

df <- read.csv("data/preprocessed.csv")

# -----------------------------Creating a dataframe for PCA ------------------------ # 

df_pca <- df[, -c(1)]

# ----------------------------Generating components for PCA ------------------------ #

pca <- prcomp(df_pca,
    scale = TRUE,
    center = TRUE, retx = T
)
print(summary(pca))
# 4 pca components for 93.062% variance

# ------------------------------ Plotting the PCA ---------------------------------- #

plt <- ggbiplot(pca)

View(plt)

