# 07 Read in and read out csv files using relative paths
# rad.table() function from utils library

library(here)
library(dplyr)

MY_COVID_DATA  <-read.table(here("data", "MY_COVID_DATA.csv"),
                           header =TRUE, sep =',',stringsAsFactors =TRUE)
MY_COVID_DATA

# 1. Subset data from PLOT_LEAFLET_MAPS  
MY_COVID_DATAsorted  <- MY_COVID_DATA %>% 
                        select(region,date,Confirmed,Deaths,Recovered) %>% 
                        arrange(region,date)
MY_COVID_DATAsorted

write.csv(MY_COVID_DATAsorted,here("data","MY_COVID_DATAsorted.csv"), row.names = TRUE)

# INCLUDE DATE FORMAT WHEN IMPORITNG .csv files

# 2. Include DATE format for date variables
library(here)
library(dplyr)
House_prices  <-read.table(here("data", "2022_House_prices.csv"),
                             header =TRUE, sep =',',stringsAsFactors =TRUE)
House_prices
# Introduce date format for DATE variables
House_prices_date <- House_prices %>% 
                  mutate(DATE = as.Date(Date,format = "%d/%m/%Y")) %>% 
                  select(DATE,BoE_Interest_rate)
House_prices_date

str(House_prices_date)

> str(House_prices_date)
'data.frame':	186 obs. of  2 variables:
$ DATE             : Date, format: "2022-01-04" "2022-01-05" "2022-01-06" "2022-01-07" ...
$ BoE_Interest_rate: num  0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 ...
