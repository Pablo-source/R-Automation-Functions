# This is a script just to list any files in a specific folder (Better to be used inside your project folder)

# 1. Get list of contents on your project folder
Folder_contents  <- list.files()


# 2. Then explore individual file types on each sub-folder

# 2.1 Example on how to list all R files. 
Imp_dash <- list.files (path = "./02 02 Improvement dash" ,pattern = "R$")

Imp_dash
> Imp_dash
 [1] "00 01  Project setup.R"                   
 [2] "00 02 Data wrangling MHS_data_v10.R"      
 [3] "00 03 DATA SETS prep Plots MHS_data_v10.R"
 [4] "02 01 CCG plot01.R"                       


# 3. These are different file extensions to search for on each individual folder
# List files extensions in a project folder 
filenames <- Sys.glob("*.dbf")
# List R files
filenames <- Sys.glob("*.R")
# List .xlsx  files
filenames <- Sys.glob("*.xlsx")
# List .csv  files
filenames <- Sys.glob("*.csv") 
