# 07 Read in and read out csv files
# rad.table() function from utils library

library(here)
library(dplyr)

MY_COVID_DATA  <-read.table(here("data", "MY_COVID_DATA.csv"),
                           header =TRUE, sep =',',stringsAsFactors =TRUE)
MY_COVID_DATA

# 2. Subset data from PLOT_LEAFLET_MAPS  
MY_COVID_DATAsorted  <- MY_COVID_DATA %>% 
                        select(region,date,Confirmed,Deaths,Recovered) %>% 
                        arrange(region,date)
MY_COVID_DATAsorted

write.csv(MY_COVID_DATAsorted,here("data","MY_COVID_DATAsorted.csv"), row.names = TRUE)

