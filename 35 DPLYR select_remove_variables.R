# 35 DPLYR select_remove_variables
library(here)
library(tidyverse)
library(janitor)

# LEAFLET_MAPS_DATA.csv

# 1. When loading intial dataset
map_data  <-read.table(here("data", "LEAFLET_MAPS_DATA.csv"),
                            header =TRUE, sep =',',stringsAsFactors =TRUE) %>% 
            clean_names() 
map_data

names(map_data)

# [1] "x"          "country"    "lat"        "long"       "date"       "confirmed"  "recovered"  "deaths"     "year"      
# [10] "population"


# 2. Sometimes we want to omit certain variables
# As an example, let's exclude variables (x,recovered,deaths,year) from our original data set

# We use select(!c("x","recovered","deaths","year")), to remove these four variable("x","recovered","deaths","year")

data_subset  <-read.table(here("data", "LEAFLET_MAPS_DATA.csv"),
                       header =TRUE, sep =',',stringsAsFactors =TRUE) %>% 
  clean_names() %>% 
  select(!c("x","recovered","deaths","year"))  # Use select(!c("variable1","variable2",...))
data_subset

names(data_subset)
str(data_subset)
# We have excluded these variables from our final data frame

# Also, we can select several columns in one go using this select verb form:
# select(!(name:mass))

# [1] "country"    "lat"        "long"       "date"       "confirmed"  "population"

