# 13 DPLYR
# filter() and str_detect() to subset rows using Regular Expressions and soft matching searches

# https://stackoverflow.com/questions/43227088/how-can-i-apply-dplyrs-select-starts-with-on-rows-not-columns

Metric_Name  <-c("Cerebrovascular disease (10B) - Total spend per 1,000 age-sex weighted population",
                 "Falls & fractures : Hip fractures per 100,000 age-sex weighted population aged 65-79",
                 "Alcohol related liver disease - Admissions per 100,000 age-sex weighted population (excluding zero-day non-elective admissions)" )
Indic_value <-c(123,21,5)

Long_names <-cbind.data.frame(Metric_Name,Indic_value)
Long_names

# Filter long names by using 
library(tidyverse)

Mydata_subset <- Long_names %>% 
                 filter(str_detect(Metric_Name, "^Cerebrovascular"))

Mydata_subset  

> Mydata_subset
Metric_Name Indic_value
1 Cerebrovascular disease (10B) - Total spend per 1,000 age-sex weighted population         123
