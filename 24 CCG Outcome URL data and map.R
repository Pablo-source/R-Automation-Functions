# 25 CCG Outcome indicators 

# AIM: Download CCG Outcome indicatos from NHS Website creating a map using GGPLOT2

library(sf)
library(here)
library(dplyr)
library(ggplot2)
library(readxl)
library(janitor)

# Check WD directory file system
here()
[1] "C:/Users/Pablo.Leonrodenas/OneDrive - NHS England/25 My R Scripts"

# Get CCG Outcomes Indicator set - March 2022 from: 
# Seach for the href HTML tab that will point to the original zipped file location in the website
# <a href="https://files.digital.nhs.uk/48/4DB2CA/CCG_OIS_MAR_2022_Excels_Files.zip" class="nhsd-a-box-link" onclick="logGoogleAnalyticsEvent('Download attachment',
# 'Publication', 'https://files.digital.nhs.uk/48/4DB2CA/CCG_OIS_MAR_2022_Excels_Files.zip')" onkeyup="return vjsu.onKeyUp(event)">

#   File: "CCG Outcomes indicator Set - March 2022:Excel files"

# 1. Download required file do Datasets folder
CCGdata <- function() {
  
  if(!dir.exists("data")){dir.create("data")}
  # Download master.zip file 
  download.file(
    url = "https://files.digital.nhs.uk/48/4DB2CA/CCG_OIS_MAR_2022_Excels_Files.zip",
    destfile = "data/CCGoutcomes.zip"
  )
  
  unzip(zipfile = "data/CCGoutcomes.zip",
        exdir = "data",
        junkpaths = T
  ) 
}

CCGdata()

# We will use the unzipped CCG shape file we downloaded from NHS website
here("Shapefiles","Clinical_Commissioning_Groups_(April_2021)_EN_BFC")

# 2. Load first indicator from unzipped Excel file

# INDICATOR 01
# CCG OIS Indicator 1.4 - Myocardial infarction, stroke, and stage 5 chronic kidney disease in people with diabetes
# Unzipped Excel file name: CCG_1.4_I00770_D.xlsx


# 2.1  List excel files on Data sub-directory
list.files (path = "./data" ,pattern = "xlsx$")

# This will provide us with all the available files for our map

> list.files (path = "./data" ,pattern = "xlsx$")
[1] "CCG_1.17_I01968_D.xlsx" "CCG_1.18_I01969_D.xlsx" "CCG_1.19_I01970_D.xlsx" "CCG_1.21_I01972_D.xlsx" "CCG_1.25_I02023_D.xlsx" "CCG_1.26_I02024_D.xlsx"
[7] "CCG_1.4_I00770_D.xlsx"  "CCG_2.2_I00782_D.xlsx"  "CCG_2.8_I00786_D.xlsx"  "CCG_3.2_I00760_D.xlsx"  "CCG_3.3_I00761_D.xlsx"  "CCG_3.5_I00792_D.xlsx" 
[13] "CCG_3.6_I00793_D.xlsx"  "CCG_3.7_I00794_D.xlsx"  "CCG_3.8_I00795_D.xlsx"  "CCG_3.9_I01977_D.xlsx" 

# LOAD INDICATORS FOR MAP

# 2.2 Load File "CCG_1.17_I01968_D.xlsx"
# List tabs from above Excel file to know which tab to import
excel_sheets("./data/CCG_1.17_I01968_D.xlsx")

# [1] "Title sheet"           "Notes and definitions" "Table 1"  

# Indicator "Myocardial_infarction" by CCG
# And we subset data from Tab called "Tab 1", it corresponds to Sheet 3

# Filter first 13 rows to read in correct variable names
# So clean names can be used 
Myocardial_infarction <- read_excel(here("data", "CCG_1.17_I01968_D.xlsx"), 
                                    sheet = 3, skip =13) %>% 
  clean_names()
Myocardial_infarction

# We want to filter out some variables

# Keep just a few variables and remove England as Level of description
# Only interested in "reporting_period","breakdown","ons_code","level","level_description" and "indicator_value"

Myocardial_infarction_sel <- Myocardial_infarction %>% 
  select("reporting_period","breakdown","ons_code","level","level_description","indicator_value") %>% 
  filter(level_description !="England")
Myocardial_infarction_sel

# Start Building  map

Path <-here()
# [1] "/home/pablo/Documents/Pablo_Desktop/R_warehouse/R_projects/Maps/R maps"

# 3. LOAD NHS CCG SHAPEFILE 
# /home/pablo/Documents/Pablo_Desktop/R_warehouse/R_projects/Maps/R maps/Shapefiles/Clinical_Commissioning_Groups_(April_2021)_EN_BFC
CCG_boundaries <- st_read(here("Shapefiles","Clinical_Commissioning_Groups_(April_2021)_EN_BFC","CCG_APR_2021_EN_BFC.shp"))


# Check Shapefiles output
CCG_map <- ggplot() +
  geom_sf(data = CCG_boundaries, size = 0.5, color = "black", fill ="coral") +
  ggtitle("CCG Boundaries plot. April 2021") +
  coord_sf()
CCG_map


# 4. Rename variable in metric data set prior to merge
#----------------------------------------------------
# 4-1. Shapefile
# File name: CCG_boundaries
# 4-2. Indicators
# File name: Myocardial_infarction_sel

# 4.1 Rename data sets to be merged
CCG_boundaries_MAP <- CCG_boundaries
names(CCG_boundaries_MAP)

# [1] "OBJECTID"   "CCG21CD"    "CCG21NM"    "BNG_E"      "BNG_N"      "LONG"       "LAT"        "SHAPE_Leng" "SHAPE_Area" "geometry"  

Myocardial_MAP <- Myocardial_infarction_sel
names(Myocardial_MAP)
# [1] "reporting_period"  "breakdown"         "ons_code"          "level"             "level_description" "indicator_value"  

# Rename from Myocordial_MAP data set "ons_code" variable as  CCG21NM to mach shape file column name

# We rename from Metrics data set varaible ons_code as CCG21NM
Myocardial_MAP_rename <- Myocardial_MAP %>% 
  select( reporting_period,
          breakdown,
          CCG21CD = ons_code,
          level,
          level_description,
          indicator_value
  )


# 5 NOW WE CAN JOIN BOTH DATA SETS BY CCG21NM
# We merge both shape file and metric data set using DPLYR
mapdata <- left_join(CCG_boundaries_MAP, Myocardial_MAP_rename, by = "CCG21CD") 

# 6 Transform coordinates
mapdata_coord <- st_transform(mapdata, "+init=epsg:4326")

# 7 Plot the map using GGPLOT2
names(mapdata_coord)
head(mapdata_coord)

Myocardial_map <- mapdata_coord %>% 
  ggplot() +
  aes(fill = indicator_value) +
  geom_sf() +
  scale_fill_gradientn(colours = rev(grDevices::topo.colors(10)), name = NULL) +
  labs(title = "CCG OIS Indicator 1.17 - Record of stage of cancer at diagnosis",
       subtitle = "Percentage of new cases of cancer for which a valid stage is recorded at the time of diagnosis,(95% CI)",
       caption = "Data source: NHS Digital National Disease Registration Service (NDRS)")
Myocardial_map
