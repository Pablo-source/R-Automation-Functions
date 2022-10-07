## 25 NHS stats URL download automation.R 

# AIM: 
# Download NHS Excel or Zip files from public  URLs for current or FUTURE statical releases.
# A function will check whether the file exists on the URL location. If so, it will download it to your folder

# Function upgrade: Use this function alongside taskcheduler package to run it on a server 24/7, so you will 
#  manage to dowload any public statistical release as soon as they become available
# 
# 1 Install taskschedulerR package  
# install.packages("taskscheduleR")
# 2 Load library 
# library("taskscheduleR")  
# 3 Open taskcheduler menu
# taskscheduleR:::taskschedulerAddin()

# Basic function: Check whether file is available in websie to download it from its URL
library(here)

Mydirectory <-here()

# Check Project  directory file system


# 01 01 Download Excel files 

PHC_files <- function() {
  
  if(!dir.exists("08_Download_URL_files")){dir.create("08_Download_URL_files")}
  # We can introduce here a check to see whether the file is available on NHS website 
  # Download master.zip file 
  download.file(
    url = "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2022-23.xlsx",
    destfile = "08_Download_URL_files/Physical-Health-Checks-SMI-Q1-2022-23.xlsx"
  )
  
}

PHC_files()

# 02 02 Download compressed Excel files as a ZIP files (And extract compressed files)

CCG_files <- function() {
  
  if(!dir.exists("08_Download_URL_files")){dir.create("08_Download_URL_files")}
  # We can introduce here a check to see whether the file is available on NHS website 
  # Download master.zip file 
  download.file(
    url = "https://files.digital.nhs.uk/48/4DB2CA/CCG_OIS_MAR_2022_Excels_Files.zip",
    destfile = "08_Download_URL_files/CCG_files.zip"
  )
  # Unzip data to extract individual .xlsx files  
  unzip(zipfile = "08_Download_URL_files/CCG_files.zip",
        exdir = "08_Download_URL_files",
        junkpaths = T) 
}

CCG_files()


# 03 Check whether a file exists

# Using  HEAD request. In R it's available in package httr.

library(httr)

urlFileExist <- function(url){
  HTTP_STATUS_OK <- 200
  hd <- httr::HEAD(url)
  status <- hd$all_headers[[1]]$status
  list(exists = status == HTTP_STATUS_OK, status = status)
}

# We need to provide a URL address to urlFileExists function

Output <- urlFileExist("https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2022-23.xlsx")
Output

> Output
$exists
[1] TRUE

$status
[1] 200

# Access each element
Output[1]

# DOWNLOAD ZIP FILE

# 1 Check for file exists in the URL
# 2 Then downloads it to your folder

# Function to use to download automatically .ZIP or Excel files from NHS websites. 
# This is an example when a file does NOT EXISTS
File_exists <- function() {
  
  if(!dir.exists("data")){dir.create("data")}
  
  Output <- urlFileExist("https://files.digital.nhs.uk/48/4DB2CA/CCG_OIS_MAR_2022_Excels_Files.zip")
  Output
  
  if (Output[1]=='TRUE'){print("File Exists!")}
  if (Output[1]!='TRUE'){print("File NOT available")}
  if (Output[1]=='TRUE'){download.file(
    url = "https://files.digital.nhs.uk/48/4DB2CA/CCG_OIS_MAR_2022_Excels_Files.zip",
    destfile = "data/08_Download_URL_files/CCG_files.zip"
  )}
}

File_exists()

# This is an example when the file DOES exist and we download it 


# DOWNLOAD EXCEL FILE

# 1 Check for file exists in the URL
# 2 Then downloads it to your folder 

# https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2022-23.xlsx

File_exists <- function() {
  
  if(!dir.exists("data")){dir.create("data")}
  
  Output <- urlFileExist("https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2022-23.xlsx")
  Output
  
  if (Output[1]=='TRUE'){print("File Exists!")}
  if (Output[1]!='TRUE'){print("File NOT available")}
  if (Output[1]=='TRUE'){
    download.file(
      url = "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2022-23.xlsx",
      destfile = "data/08_Download_URL_files/Physical-Health-Checks-SMI-Q1-2022-23.xlsx"
    )}
}

File_exists()

# How this can be used...

# Provide a bunch of actual and future statistics to be published, and the function will do the rest for you

# FILES currently ready to be downloaded using above function
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2020-21.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q2-2020-21.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q2-2020-21.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q2-2020-21.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2022-23.xlsx

# Future files ready to be downloaded when available 
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q4-2022-23.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q1-2023-24.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q2-2023-24.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q3-2023-24.xlsx
https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/08/Physical-Health-Checks-SMI-Q4-2023-24.xlsx
