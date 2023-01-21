
# 00 Setup project structure
# Updated on 24/06/2022
# AIM: At the start of any new report you design first you create a brand new Project Folder to host all the scripts alongside input and output files
#      Then the next action you take is to create a Folder structure within that Project folder to organise your workflow and R scripts

project_setup <-function(){
  
  if(!dir.exists("data")){dir.create("data")}
  if(!dir.exists("Output")){dir.create("Output")}
  if(!dir.exists("Shapefiles")){dir.create("Shapefiles")}
  if(!dir.exists("Checks")){dir.create("Checks")}
  if(!dir.exists("Maps")){dir.create("Maps")}
  if(!dir.exists("Archive")){dir.create("Archive")}
  #Create sub-folders within folders. This sub folder is nested under Archive folder
  if(dir.exists("Archive")){dir.create(("../Rprojects/Rwarehouse/Project/subfolder_new"))}

} 

# Run code below to use function and create folder structure
project_setup()


