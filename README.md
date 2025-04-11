# 📊 Stack Overflow Trends Analysis

This project performs an in-depth analysis of programming language trends on Stack Overflow from 2008 onwards using R. It includes data cleaning, statistical testing, time series visualization, and exploration of language popularity over time.

---

## 🔍 Overview

Stack Overflow is one of the largest Q&A communities for programmers. This analysis focuses on understanding how the popularity of different programming languages has evolved over the years by examining the number of questions posted for each language.

---

## 🛠️ Technologies & Libraries Used

- **R Language**
- Libraries:
  - `tidyverse`
  - `lubridate`
  - `ggplot2`
  - `dplyr`
  - `forecast`
  - `readr`

---

## 📁 Dataset

The dataset used contains monthly counts of Stack Overflow questions for several programming languages from early 2008. The CSV file includes columns like `Date`, `Python`, `JavaScript`, `PHP`, `SQL`, `Java`, etc.

---

## 📈 Key Analyses Performed

### 1. **Data Cleaning**
- Checked and removed missing values
- Renamed and formatted date columns
- Filtered data from 2008 onwards

### 2. **Trend Visualization**
- Line plots showing trends of language popularity over time
- Year-wise and month-wise breakdown of question frequency

### 3. **Statistical Analysis**
- T-tests to assess the impact of specific timeframes (e.g., before/after June 2020)
- Hypothesis testing for early years (2008 vs 2009)
- Linear regression to detect trend direction for Python questions

### 4. **Exploratory Data Analysis**
- Pie chart showing distribution of total questions per language
- Bar chart comparing total question volume by language
- Histogram and density plots for specific languages
- Boxplots for cross-language comparison
- Scatter plots and regression lines for correlation (e.g., Python vs JavaScript)

---

## 📊 Visualizations Included

- 📈 Time Series Plots
- 📊 Bar Charts
- 📦 Boxplots
- 🧠 T-Test & Hypothesis Testing Results
- 📉 Linear Regression Summary
- 🥧 Pie Charts
- 📚 Histograms & Density Plots
- 🔁 Correlation Analysis via Scatter Plots

---

## 🧪 Notable Insights

- Python has consistently grown in popularity and leads in question volume.
- JavaScript and SQL also maintain high levels of engagement.
- Some older languages like Perl and Objective-C show decline over time.
- Clear shift in question trends before and after 2020 (possibly due to ChatGPT or remote learning trends).

---

## 🚀 How to Run

1. Clone the repository
2. Ensure you have R installed with the listed libraries
3. Update the path to the dataset in the `file_path` variable
4. Run the script to generate all insights and visualizations

---

## 📬 Contact
linkedin.com/in/ayesha-zahid-4a9046301/
For questions or feedback, feel free to reach out!
