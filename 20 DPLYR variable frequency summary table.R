# Create variable values summary tables using DPLYR
# 20 DPLYR variable frequency summary table.R

# 0. Setup Dummy data set
library(dplyr)
library(tidyverse)
library(here)

Indic_ID <-c(replicate(5,"AF-Prev"),replicate(3,"Exercise"),
             replicate(7,"Education"),
             replicate(4,"Housing"))

Region <-c(replicate(4,"Midlands"),replicate(7,"London"),
           replicate(5,"North-west"),
           replicate(3,"Souoth-East"))

Indic_value <-c(123,21,54,21,43,
                76,87,43,48,65,
                47,51,23,56,98,
                41,57,12,19)

Mydata <-cbind.data.frame(Indic_ID,Region,Indic_value)
Mydata

names(Mydata)

> names(Mydata)
[1] "Indic_ID"   "Indic_Name" "Region" 

# 1. Get Frequency tables of each the data set metrics


# Frequency table for Metric 1: Indic_ID
# Variable 01-03 (Indic_ID)

ID_values <- Mydata %>% 
  select(Indic_ID)  %>%
  group_by(Indic_ID)  %>%
  summarize( freq = n()) %>% 
  arrange(desc(freq))
ID_values

# Variable 02-03 (Region)

Region_values <- Mydata %>% 
  select(Region)  %>%
  group_by(Region)  %>%
  summarize( freq = n()) %>% 
  arrange(desc(freq))
Region_values