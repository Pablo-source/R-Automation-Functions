# month.name() function in R with Example
# The month.name is the English name for the months of the year. Sometimes date vector for months is recorded in numeric form

# 15 Month name function.R
# 0. Setup Dummy data set
library(dplyr)
library(tidyverse)
library(here)
library(maps)

# 1-2. Load vaccines data 

data <- read.csv("https://opendata.ecdc.europa.eu/covid19/nationalcasedeath_eueea_daily_ei/csv", na.strings = "", fileEncoding = "UTF-8-BOM")

datac <- data %>% 
  select(
    dateRep,day,                     
    month, year,                    
    cases,  deaths,                  
    country = countriesAndTerritories,   
    geoId,                   
    countryterritoryCode,      
    popData2020,             
    continentExp      
  )

head(datac)

# 1-2 Load geographical data from ggplot2 package
# unique() unique returns a vector, data frame or array like x but with duplicate elements/rows removed.
worldmap_countries <- map_data("world")


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
D_month <-c(1,2,3,4,5,6,7,8,9,9,
            10,11,12,12,1,2,3,4,5)
D_year <-rep(c(2022:2022), 19)
D_year

Myndata <-cbind.data.frame(Indic_ID,Region,Indic_value,
                           D_month,D_year)
Myndata_name <- Myndata %>% 
                mutate(month.name[D_month])
Myndata_name
    





