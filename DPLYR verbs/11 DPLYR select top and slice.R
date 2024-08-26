library(tidyverse)

# Project: Shiny-app-using-COVID-data
#  File: 
# 26/08/2024
# \Checks\API_Obtain_countries_Lat_long_values.R

# DPLYR Select top and slice 
# Select top 8 rows (addresstype == "tourism")
geocoding_lat_long_32_41_subset_top <- head(geocoding_lat_long_32_41,8)
geocoding_lat_long_32_41_subset_top
# Select bottom 10,11 rows (We want to ommit row 9)
geocoding_lat_long_32_41_subset_bottom <- geocoding_lat_long_32_41 %>% 
  slice(10:11)