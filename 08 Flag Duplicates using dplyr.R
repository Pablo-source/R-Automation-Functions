# 08 Find duplicates Read in and read out csv files
# Using duplicated() function from base library 
# Using filter() function from DPLYR package  
# wrap function steps using dplyr verbs

library(here)
library(dplyr)

MY_COVID_DATA  <-read.table(here("data", "MY_COVID_DATA.csv"),
                            header =TRUE, sep =',',stringsAsFactors =TRUE)
MY_COVID_DATA

# 1 Flag duplicates
# We want to flag duplicates in our date variable 
COVID_DATA_flag_dups <- MY_COVID_DATA %>% 
                    group_by(region) %>% 
                    mutate(dup_value = duplicated(date)) %>% 
                    ungroup()

COVID_DATA_flag_dups

write.csv(COVID_DATA_flag_dups,here("data","COVID_DATA_flag_dups.csv"), row.names = TRUE)

# Find if there are any duplicated dates
# Then we can isolate them by chooosing TRUE to include them or FALSE to exclude them

COVID_DATA_dups <- MY_COVID_DATA %>% 
                  group_by(region) %>% 
                  mutate(dup_value = duplicated(date)) %>% 
                  ungroup() %>% 
                  filter(dup_value=="TRUE")
COVID_DATA_dups

write.csv(COVID_DATA_dups,here("data","COVID_DATA_dups.csv"), row.names = TRUE)

COVID_DATA_no_dups <- MY_COVID_DATA %>% 
                      group_by(region) %>% 
                      mutate(dup_value = duplicated(date)) %>% 
                      ungroup() %>% 
                      filter(dup_value=="FALSE")
COVID_DATA_no_dups

write.csv(COVID_DATA_no_dups,here("data","COVID_DATA_no_dups.csv"), row.names = TRUE)

