setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")

# ---------------------------------- Reading the Data --------------------------------- #

df <- read.csv("data/state.csv")

# --------------------------- Droping unused rows and columns ------------------------- #

df <- df[-c(1, 53)]

# ------------------------------- Creating New Dataframe ------------------------------ #

d <- data.frame(State = df$State)

# ---------------------------- Converting column to Numeric --------------------------- #

d$Medicare.enrollees <- as.integer(gsub(",", "", df$Medicare.enrollees)) / 10^4
d <- d[-c(1), ]

# ------------------------ Finding the Mean of Required Column ------------------------ #

m <- mean(d$Medicare.enrollees, na.rm = TRUE)
cat("\nThe mean of the column is\t\t:", m)

# -------------------- Finding the Std. Deviation of Required Column ------------------- #

sd <- sd(d$Medicare.enrollees)
cat("\nStandard deviation is\t\t\t:", sd)

# -------------------- Finding the Number of Rows of Required Column ------------------- #

n <- nrow(d)
cat("\n The number of observations is\t\t:", n)

# ------------------------- Finding the probability of success ------------------------- #

p <- pnorm(m, 33, sd / sqrt(n), lower.tail = FALSE) * 2
cat("\n  p-value is\t\t\t\t:", p)

# ------------------- Condition for accepting the null hypothesis ---------------------- #

if (p >= 0.05) {
    cat("\n   Accept Null Hypothesis")
} else {
    cat("\n   Reject Null Hypothesis")
}