
# 00 Setup project structure
# Updated on 24/06/2022
# AIM: At the start of any new report you design first you create a brand new Project Folder to host all the scripts alongside input and output files
#      Then the next action you take is to create a Folder structure within that Project folder to organise your workflow and R scripts


# FUNCTION: SETUP Folders and Sub Folders in a new brand PROJECT




# Updated scripts to include here() function

# I have created these two files using relative paths (if you execute this code in your machine,
# (after creating a project and also executing the function below): It will work on any laptop 

library(here)

project_setup <-function(){
  
  if(!dir.exists("data")){dir.create(here::here("data"))}
  if(!dir.exists("Output")){dir.create(here::here("Output"))}
  if(!dir.exists("Shapefiles")){dir.create(here::here("Shapefiles"))}
  if(!dir.exists("Checks")){dir.create(here::here("Checks"))}
  if(!dir.exists("Maps")){dir.create(here::here("Maps"))}
  if(!dir.exists("Archive")){dir.create(here::here("Archive"))}
  #Create sub-folders within folders. This sub folder is nested under Archive folder
  if(dir.exists("Archive")){dir.create(here::here("/home/pablo/Documents/Pablo/Rprojects/Rwarehouse/Archive/subfolder_new"))}

} 

# Run code below to use function and create folder structure
project_setup()


