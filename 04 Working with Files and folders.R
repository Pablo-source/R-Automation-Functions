# 1. How to obtain a list of files on your project folder or sub-folders, based on their file extension

# Using list.files() function with several arguments: 
# 1.1 List all files on your project folder 
list.files()
# 1.2 List files based on their file extension
list.files (pattern = "R$")
list.files (pattern = "RData$")
list.files (pattern = "txt$")
list.files (pattern = "xlsx$")

# 1.3 List files in a Sub-directory with specific file extension
# List excel files on Data sub-directory
list.files (path = "./Data" ,pattern = "xlsx$")

list.files (path = "./Data" ,pattern = "R$")
list.files (path = "./Data" ,pattern = "Rdata$")
list.files (path = "./Data" ,pattern = "txt$")

# Some other resources found online below

#https://www.masterdataanalysis.com/r/working-with-files-and-folders-in-r/
#  Working with files and folders in R
# FacebookTwitter
# In this post I’ll cover how to work with files and folders in R.
# Working with the current directory
# Unless you specify it otherwise, all files will be read and saved into the working directory. Therefore, the first thing you need to know is how to get and setup your working directory.

#Get the working directory:
getwd()

#Setup the working directory:
setwd("C:/Documents and Settings/Folder name")

# If you want to setup the working directory to a subfolder within your current working directory you don’t have to specify the whole path. For example, let’s say you want to set the working directory to a subfolder called “Statistical Analysis”:
# Set the working directory to a subfolder within the current working directory

setwd(paste0(getwd(), "/Statistical Analysis"))

# Tip: If you are using RStudio you can use the shortcut Ctrl + Shift + H to browse to the desired directory.

# Creating a list of files and folders in a directory
# You might also want to create a list of all the files or folders in a directory

#list files in the workign directory
list.files()

#list files in a specific folder
list.files (path = "C:/Folder/Subfolder1/Subfolder2")

#list files in a browsed folder
list.files(path = choose.dir())

#list of subfolders and files within the subfolders
list.files(recursive = TRUE)

#get the full name (path and file name) of each file
list.files(full.name = TRUE)

# If you get a very long list, you can filter the results using the pattern argument of the list.files() function
#list all files that contain the word "Product"
list.files(pattern = "Product")


#list files that end with the word "csv"
list.files (pattern = "csv$")


#list files that start with the word "Product" followed by anything and ending with the word "xlsx":
list.files(pattern = "^Product(.*)xlsx$")

# If you’re wondering what are the symbols ^, ., *, $; these are called metacharacters in regular expressions. If you want to learn more about regular expressions you can watch these two videos: Regular Expressions in general and Regular Expressions in R.

# Checking if a file or folder exists
#Check if the file "raw data.csv" exists in the working directory
file.exists("filename.extension")


#Check if the folder "Data" exists in the current directory, if not creates it
ifelse(!dir.exists("Data"), dir.create("Data"), "Folder exists already")

# Time to practice!
#   Copy the code below and write the R code to complete the exercises in the lines highlighted
# Set the working directory to any folder in your computer
# Check if the folder "Raw Data" exists in the working directory, if it doesn't exists create it

# Generate 25 several csv files
number_of_rows = sample(100:500, size = 25, replace = FALSE)

save_file = function(n){
  
  df = data.frame(Var1 = rnorm(n, 100, 3),
                  Var2 = rpois(n, 100),
                  Var3 = rcauchy(n, 100),
                  Var4 = rweibull(n, 3.5, 111.1))
  
  write.csv(df, file = paste0("Raw_Data (", n, " rows).csv"), row.names = FALSE)
}

invisible(lapply(number_of_rows, save_file))

# Merge all the csv files into a single data frame
#    Hint: Use do.call(rbind, ...) or rbind_all from the dplyr package
#

