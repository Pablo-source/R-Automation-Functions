# 10 Subset data by DATE RANGE.R
# We simple use filter function from DPLYR package to subset data for a specific day       
# filter(DATE >= "2021-04-21" & DATE <= "2021-04-23")

library(here)
library(dplyr)

MY_COVID_DATA  <-read.table(here("data", "MY_COVID_DATA.csv"),
                            header =TRUE, sep =',',stringsAsFactors =TRUE)
MY_COVID_DATA
str(MY_COVID_DATA)

# poblem. date is imported as FACTOR
AUS_conf_test <- MY_COVID_DATA %>% 
               select(region,date,Confirmed)
AUS_conf_test

str(AUS_conf_test)
> str(AUS_conf_test)
'data.frame':	264228 obs. of  3 variables:
  $ region   : Factor w/ 199 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
$ date     : Factor w/ 908 levels "2020-01-22","2020-01-23",..: 1 2 3 4 5 6 7 8 9 10 ...
$ Confirmed: num  0 0 0 0 0 0 0 0 0 0 ...

# This is how you turn a factor into a DATE variable 
AUS_conf_data <- MY_COVID_DATA %>% 
          select(region,date,Confirmed) %>% 
          filter( region =="Australia") %>% 
          mutate(DATE = as.Date(date, format = "%Y-%m-%d"))
AUS_conf_data

str(AUS_conf_data)

> str(AUS_conf_data)
'data.frame':	7264 obs. of  4 variables:
  $ region   : Factor w/ 199 levels "Afghanistan",..: 10 10 10 10 10 10 10 10 10 10 ...
$ date     : Factor w/ 908 levels "2020-01-22","2020-01-23",..: 1 1 1 1 1 1 1 1 2 2 ...
$ Confirmed: num  0 0 0 0 0 0 0 0 0 0 ...
$ DATE     : Date, format: "2020-01-22" "2020-01-22" "2020-01-22" ...

write.csv(AUS_conf_data,here("data","AUS_conf_data.csv"), row.names = TRUE)


# We can filter further to filter dat aby specific dates
# NOW that DATE is in the right format, we can filter for specific dates
AUS_conf_3D <- AUS_conf_data %>% 
               select(region,Confirmed,DATE) %>% 
              filter(DATE >= "2021-04-21" & DATE <= "2021-04-23")
AUS_conf_3D

write.csv(AUS_conf_3D,here("data","AUS_conf_3D.csv"), row.names = TRUE)
