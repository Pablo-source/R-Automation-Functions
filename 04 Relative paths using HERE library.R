# HOW TO USE HERE LIBRARY
# Topics: coding best practices, using relative paths
# Updated 20/06/2022 

library(datasets)
library(here)

# I have created these two files using relative paths (if you execute this code in your machine,
# (after creating a project and also executing the function below): It will work on any laptop 

here::i_am("RmdFolder/coding_best_practices.Rmd")

# 01 Create folder structure making use of HERE package 

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
