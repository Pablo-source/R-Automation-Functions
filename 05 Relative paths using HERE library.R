# HOW TO USE HERE LIBRARY
# Topics: coding best practices, using relative paths
# Date: 20/06/2022 
# Last update 03/10/2024


# 1. At the start of your script, use here() function from {here} package to build relative paths on your project directory:

# This is template on how to use "where_am_i" object with here() function
where_am_i <- here::here()

excel_file <- list.files(paste0(where_am_i,"/ggplot2-visualizations/data"),pattern = "xlsx$")
excel_file

excel_tabs <- excel_sheets(paste0(where_am_i,"/ggplot2-visualizations/data/RTT_TS_data.xlsx"))
excel_tabs

# 2. Two examples on how to read in .csv file with read.table() and write out .csv files using write.csv() function 
# read_in_test  <-read.table(here("data", "data.csv"),
#                          header =TRUE, sep ='\t',stringsAsFactors =TRUE)

# write.csv(aq,here("data","sample","write_out_test.csv"), row.names = TRUE)

# See code snippets at the end of this script
library(datasets)
library(here)

# I have created these two files using relative paths (if you execute this code in your machine,
# (after creating a project and also executing the function below): It will work on any laptop 

here::i_am("RmdFolder/coding_best_practices.Rmd")

# 01 Create folder structure making use of HERE package.
# This ensures we define new folder using relative paths

project_setup <-function(){
  
  if(!dir.exists("Data")){dir.create(here::here("Data"))}
  if(!dir.exists("Test")){dir.create(here::here("Test"))}
  if(!dir.exists("Report")){dir.create(here::here("Report"))}
  if(!dir.exists("Model")){dir.create(here::here("Model"))}
  
}

# Execute function
project_setup()

# Check available build-in data sets in R
data()

# Load air quality data set from R
aq <- data.frame(airquality)

colnames(aq)
head(aq)
str(aq)

# Classic WRITE CSV files into R
#write.csv(aq,"./data/data.csv", row.names = TRUE)

# Classic READ CSV files into R
# Mydata <-read.csv("./data/data.csv",sep = ",")

# Produce some data to use it with here function
aq <- data.frame(airquality)

# Read and write using here() function

path <- here()
path

# Write out (.csv) file using here()

# I assume that you work always using PROJECTS, so the here library writes file path relative to your project folder
# a) Save output in a sub_folder of your main project folder directory
# Saving .csv file in a directory sub_folder called "data"
# /data
write.csv(aq,here("data","write_out_test.csv"), row.names = TRUE)

# b) Save output in a deeper sub_folder of your main project folder directory
# /data/sample/

write.csv(aq,here("data","sample","write_out_test.csv"), row.names = TRUE)

# Read in (.csv) file using here()
read_in_test  <-read.table(here("data", "data.csv"),
                           header =TRUE, sep ='\t',stringsAsFactors =TRUE)
