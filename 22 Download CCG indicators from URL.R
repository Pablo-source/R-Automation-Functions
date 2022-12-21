# 01 Get CCG outcomes indicator set from URL.R
library(sf)
library(here)
library(dplyr)
library(ggplot2)
library(readxl)
library(janitor)

# MAIN WEBSITE FOR THIS INDICATOR
https://digital.nhs.uk/data-and-information/publications/statistical/ccg-outcomes-indicator-set/march-2022

# Navigate to this file in the above website:
# Resources > 

# By hovering over the File, you will see the http location of the .zip file displayed on the bottom left corner of your screen.

# Check WD directory file system
CCGdata <- function() {
  
  if(!dir.exists("data")){dir.create("data")}
  # Download master.zip file 
  download.file(
    url = "https://files.digital.nhs.uk/48/4DB2CA/CCG_OIS_MAR_2022_Excels_Files.zip",
    destfile = "data/CCGoutcomes.zip"
  )
  # Unzip data to extract individual .xlsx files  
  unzip(zipfile = "data/CCGoutcomes.zip",
        exdir = "data",
        junkpaths = T
  ) 
}

CCGdata()
