# 17 Importing Excel files into R.R

# Related project in the N drive
## 01 Get Excel data into R_new.R

# RIGHT WAY OF GETTING EXCEL DATA INTO R
# Load required libraries (readxl and here)
library(readxl)
library(here)
library(dplyr)
library(ggplot2)
library(janitor)

Path <- here()
Path

# Original Excel file "WTL-Data-202021-(20220526)-v1.13.xlsx", saved in data folder
# in our R Project

# Step 01 02: read_excel() function from readxl package
# Step 02 02: import  data by using clean_names() function from janitor() package
datan <- read_excel(here("data", "My_Excel_input_file_2022.xlsx"), sheet = 1) %>% 
  clean_names()
datan

# Get column names
names(datan)