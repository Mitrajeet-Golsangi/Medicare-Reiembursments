setwd("D:/VIT Information/Second Year/1st Semester/Data Science/tutorial/HA/")

# ----------------- Function for calculation of mean of 2 columns ----------------- #

val_mean <- function(a, b) {
    df_temp <- data.frame(A = a, B = b)
    vect <- vector()

    for (i in 1:nrow(df_temp)) {
        m1 <- mean(c(df_temp[i, 1], df_temp[i, 2]))
        vect[i] <- m1
    }

    vect
}

# -------------------------------- Reading the data -------------------------------- #

df <- read.csv("data/state.csv")

# ------------------------------ Renaming the columns------------------------------- #

colnames(df) <- c(
    "State No",
    "State",
    "Medical Enrollees",
    "Medical1",
    "Medical2",
    "Hospital1",
    "Hospital2",
    "Physician1",
    "Physician2",
    "Outpatient1",
    "Outpatient2",
    "Home.Health1",
    "Home.Health2",
    "Hospice1",
    "Hospice2",
    "Durable1",
    "Durable2"
)

# ------------------------- Droping unused rows and columns ------------------------- #

df <- df[-c(1, 53), -c(3)]

# ------------------------------ Creating new Dataframe ----------------------------- #

df_cleaned <- data.frame(State = df$State)

# ---------------------------- Finding mean of each columns ------------------------- #

df$Medical1 <- as.integer(gsub(",", "", df$Medical1))
df$Medical2 <- as.integer(gsub(",", "", df$Medical2))
df_cleaned$Medical <- val_mean(df$Medical1, df$Medical2)

df$Hospital1 <- as.integer(gsub(",", "", df$Hospital1))
df$Hospital2 <- as.integer(gsub(",", "", df$Hospital2))
df_cleaned$Hospital <- val_mean(df$Hospital1, df$Hospital2)

df$Physician1 <- as.integer(gsub(",", "", df$Physician1))
df$Physician2 <- as.integer(gsub(",", "", df$Physician2))
df_cleaned$Physician <- val_mean(df$Physician1, df$Physician2)

df$Outpatient1 <- as.integer(gsub(",", "", df$Outpatient1))
df$Outpatient2 <- as.integer(gsub(",", "", df$Outpatient2))
df_cleaned$Outpatient <- val_mean(df$Outpatient1, df$Outpatient2)

df$Home.Health1 <- as.integer(gsub(",", "", df$Home.Health1))
df$Home.Health2 <- as.integer(gsub(",", "", df$Home.Health2))
df_cleaned$Home.Health <- val_mean(df$Home.Health1, df$Home.Health2)

df$Hospice1 <- as.integer(gsub(",", "", df$Hospice1))
df$Hospice2 <- as.integer(gsub(",", "", df$Hospice2))
df_cleaned$Hospice <- val_mean(df$Hospice1, df$Hospice2)

df$Durable1 <- as.integer(gsub(",", "", df$Durable1))
df$Durable2 <- as.integer(gsub(",", "", df$Durable2))
df_cleaned$Durable <- val_mean(df$Durable1, df$Durable2)

# ------------------- Writing the preprocessed Data into new CSV file ------------------ #

write.csv(df_cleaned, "data/preprocessed.csv", row.names = FALSE)
