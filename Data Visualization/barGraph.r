setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")
# --------------------------- Reading the data frame -------------------------- #

df <- read.csv("data/state.csv")

# -------------------------- Cleaning the data frame -------------------------- #

df <- df[-c(1, 53), ]

# ------------------- Creating the data frame for box graph ------------------- #

d <- data.frame(State = df$State)

# --------------------- Converting string data to integer --------------------- #

d$Medicare.enrollees <- as.integer(gsub(",", "", df$Medicare.enrollees)) / 10^4
d <- d[-c(1), ]

# --------------------------- PLotting the Bar Graph -------------------------- #
plt <- ggplot(
    d,
    aes(x = State, y = Medicare.enrollees)
) +
    geom_bar(stat = "identity") +
    coord_flip()

View(plt)