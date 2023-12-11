# 01 Source all files from R folder 

# AIM: Inside your Rproject, there is a folder called "R" containing all 
# your adhoc functions and R scripts for any given specific ongoing project.

# Description: The function below will source() and run all those
#              individual R scripts when invoked. 

files <- list.files(here::here("R"),
                    full.names = TRUE,
                    pattern = "R$")

# Function 01: Source all files from R folder

source_all <-function(path = "R"){
  files <- list.files(here::here(path),
                      full.names = TRUE,
                      pattern = "R$")
  suppressMessages(lapply(files,source))
  invisible(path)
}

# Invoke this source_all() adhoc function to run all R scripts
source_all()
