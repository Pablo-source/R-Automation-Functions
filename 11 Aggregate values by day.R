# 11 Aggregate data by DAY
# Sum number of Confirmed cases by DAY
# Library DPLYR , functions (select,group_by,summarise)

library(here)
library(dplyr)

MY_COVID_DATA  <-read.table(here("data", "MY_COVID_DATA.csv"),
                            header =TRUE, sep =',',stringsAsFactors =TRUE)
MY_COVID_DATA
str(MY_COVID_DATA)

# poblem. date is imported as FACTOR 
# This is how you turn a factor into a DATE variable 
AUS_conf_data <- MY_COVID_DATA %>% 
                  select(region,date,Confirmed) %>% 
                  filter( region =="Australia") %>% 
                  mutate(DATE = as.Date(date, format = "%Y-%m-%d"))
AUS_conf_data


# Summarize data by DAY
AUS_conf_by_day <- AUS_conf_data %>% 
                  select(region,DATE,Confirmed) %>% 
                  group_by(region,DATE) %>% 
                  summarise("confirmed" = sum(Confirmed,na.rm = T))
AUS_conf_by_day

write.csv(AUS_conf_by_day,here("data","AUS_conf_by_day.csv"), row.names = TRUE)

