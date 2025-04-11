#Stack Overflow Trends Analysis

#Load Libraries and Dataset
# Install necessary packages (run once)
install.packages(c("tidyverse", "lubridate", "ggplot2", "dplyr", "forecast", "readr"))

# Load required libraries
library(tidyverse)
library(lubridate)
library(ggplot2)
library(dplyr)
library(forecast)

# Specify the file path to your dataset
file_path <- "D:/7th-Sem/prob/dataset.csv"

# Load the dataset
data <- read.csv(file_path)

# Preview data structure
head(data)
str(data)

# Check for missing values
cat("Total missing values:", sum(is.na(data)), "\n")

# Remove missing values if any
data_clean <- na.omit(data)

# Rename 'Month' column to 'Date' 
colnames(data)[colnames(data) == "Month"] <- "Date"

# Convert 'Date' column to Date type
data$Date <- as.Date(data$Date, format = "%Y-%m-%d")

#Filter Data and Select Relevant Columns
# Filter for data from 2008 onward and select relevant columns
data <- data %>%
  filter(as.numeric(format(Date, "%Y")) >= 2008) %>%
  select(Date, Python, Javascript, PHP, TypeScript, Swift, Ruby, Go, SQL, Kotlin, Scala, Shell, C, HTML, Objective.C, Perl, Matlab, R, Java)

# Check structure after filtering
str(data)

# Verify missing values for a specific column
cat("Missing values in 'Python':", sum(is.na(data$Python)), "\n")

#Plot Total Questions Over Time
ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Python, color = "Python")) +
  geom_line(aes(y = Javascript, color = "JavaScript")) +
  geom_line(aes(y = PHP, color = "PHP")) +
  labs(title = "Total Questions Over Time",
       x = "Date",
       y = "Total Questions",
       color = "Languages") +
  theme_minimal()

#Statistical Analysis (T-Test)
# Split data into pre- and post-June 2020
before_chatgpt <- data %>% filter(Date < "2020-06-01")
after_chatgpt <- data %>% filter(Date >= "2020-06-01")

# Calculate column means
mean_before <- colMeans(before_chatgpt[,-1], na.rm = TRUE)
mean_after <- colMeans(after_chatgpt[,-1], na.rm = TRUE)

# Perform T-Test for Python
t_stat <- t.test(before_chatgpt$Python, after_chatgpt$Python)
print(t_stat)

#Total Questions by Language
# Sum total questions for each language
total_questions_per_lang <- colSums(data[,-1], na.rm = TRUE)

# Plot bar chart for total questions
barplot(sort(total_questions_per_lang, decreasing = TRUE),
        col = rainbow(length(total_questions_per_lang)),
        main = "Total Questions Per Programming Language",
        las = 2)

#Yearly Trends by Language
# Add a Year column
data$Year <- year(data$Date)

# Aggregate by year
yearly_data <- data %>%
  group_by(Year) %>%
  summarise(across(-Date, sum, na.rm = TRUE))

# Convert to long format for plotting
yearly_data_long <- yearly_data %>%
  pivot_longer(-Year, names_to = "Language", values_to = "Total_Questions")

# Plot yearly trends
ggplot(yearly_data_long, aes(x = Year, y = Total_Questions, color = Language)) +
  geom_line() +
  labs(title = "Yearly Trends of Programming Languages",
       x = "Year",
       y = "Total Questions") +
  theme_minimal()

#Distribution of Questions
# Pie chart for language distribution
pie(total_questions_per_lang,
    labels = names(total_questions_per_lang),
    col = rainbow(length(total_questions_per_lang)),
    main = "Distribution of Total Questions by Language")

#Monthly Average Questions
# Extract month from date
data$Month <- month(data$Date, label = TRUE)

# Calculate monthly averages
monthly_avg <- data %>%
  group_by(Month) %>%
  summarise(across(-c(Date, Year), mean, na.rm = TRUE))

# Plot monthly averages for Python
ggplot(monthly_avg, aes(x = as.numeric(Month), y = Python)) +
  geom_line(color = "blue") +
  scale_x_continuous(breaks = 1:12, labels = month.abb) +
  labs(title = "Monthly Average Questions (Python)",
       x = "Month",
       y = "Average Questions") +
  theme_minimal()

print(monthly_avg)

#Histogram
ggplot(data, aes(x = Python)) +
  geom_histogram(binwidth = 500, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Python Questions",
       x = "Number of Questions",
       y = "Frequency") +
  theme_minimal()

#Boxplot
data_long <- data %>%
  pivot_longer(cols = -c(Date, Year, Month), names_to = "Language", values_to = "Questions")

ggplot(data_long, aes(x = Language, y = Questions, fill = Language)) +
  geom_boxplot() +
  coord_flip() +
  labs(title = "Boxplot of Questions by Language",
       x = "Programming Language",
       y = "Number of Questions") +
  theme_minimal()

#Scatter Plot (Correlation)
ggplot(data, aes(x = Python, y = Javascript)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Correlation Between Python and JavaScript Questions",
       x = "Python Questions",
       y = "JavaScript Questions") +
  theme_minimal()

#Density Plot for Python Questions
ggplot(data, aes(x = Python)) +
  geom_density(fill = "purple", alpha = 0.5) +
  labs(title = "Density Plot of Python Questions",
       x = "Number of Questions",
       y = "Density") +
  theme_minimal()

#Hypothesis Testing (T-Test)
# Filter data for specific years
data_filtered <- data %>% filter(Year %in% c(2008, 2009))

# Perform T-Test
t_test_result <- t.test(Python ~ Year, data = data_filtered)
print(t_test_result)

#Linear Regression is 
model <- lm(Python ~ Year, data = data)
summary(model)































