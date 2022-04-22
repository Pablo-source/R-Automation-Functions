# 02 Combine several .csv files into one single file

# 24/03/2022
# FUNCTION TO EASY LOADING DATA FROM SEVERAL .CSV FILES
##                                       ##
# CREATE DUMMY DATA from PENGUINS DATASET #
#                                         #

# 1 Install and load required libraries
install.packages("here")
library(readr)
library(here)
library(dplyr)
library(purrr)

# 2 Create data folder to store original dataset
if(!dir.exists("data")){dir.create("data")}

# 3 Write data set content into /data newly created folder, using here() function
write_csv(palmerpenguins::penguins,here("data","penguins.csv"))
list.files("data/",".csv")

# 4 Split penguin main dataset into three files
Mypenguins <- palmerpenguins::penguins
Total_rows <-nrow(Mypenguins)

#Indexing data [rows,cols]
# Slice the first 100 rows into a new dataset
nrow(Mypenguins)
Peng1 <-Mypenguins[1:100,]
Peng2 <-Mypenguins[101:201,]
Peng3 <-Mypenguins[202:344,]

# 5 Create a SUB folder
if(!dir.exists(".data/SINGLEF")){dir.create("data/SINGLEF")}

# 6 Write individual files we have previousli sliced into SINGLEF new folder
write_csv(Peng1,here("data/SINGLEF","penguins1.csv"))
write_csv(Peng2,here("data/SINGLEF","penguins2.csv"))
write_csv(Peng3,here("data/SINGLEF","penguins3.csv"))

# 7 FINAL SCRIPT TO READ AND COMBINE ALL FILES IN A DIRECTORY
# PACKAGE::FUNCTION Using the PURR PACKGE (FOR THE map_df() function)

cobined_DATA <- list.files(path = "data/SINGLEF/",
                         pattern="*.csv",
                        full.names = T) %>%
map_df(~read_csv(.))

save.image("~/Documents/R desktop/R Warehouse/Data wrangling/Data wrangling/Combine several files into single one DONE.RData")


## Further changes: TURN above code into a function




# This would be the content of the whole function
# 1. List all files in any given directory
# (Run this first of step 2)
ALLFIES <-list.files("data/SINGLEF/",".csv")
ALLFIES

NFILES <-length(list.files("data/SINGLEF/",".csv"))
NFILES

# 2 Load individual files on your workspace
# myfile_Name <-c("penguins1.csv","penguins2.csv","penguins3.csv")
for(i in 1:NFILES) {  
  assign(ALLFIES[i],
         read_csv(paste0("data/SINGLEF/",ALLFIES[i]))
  )
}

# 3. Then we combine them using list.files and map_df functions
combined_DATA <- list.files(path = "data/SINGLEF/",
                            pattern="*.csv",
                            full.names = T) %>%
  
map_df(~read_csv(.))

write_csv(cobined_DATA,here("data/SINGLEF","cobined_DATA.csv"))

# JUST FOR TESTING PURPOSES. (REMOVE APPENDEN FILE)
file.remove('data/SINGLEF/cobined_DATA.csv')

# THEN WE ONLY HAVE TO WRTAP IT UP INTO A FUNCTION
combfiles <- function() {
  # PLACE ALL CODE FROM LINE 31 TO 65 IN HERE
}

