# List files in a Sub-directory with specific file extension

# R Script: 21 List folder content by file type.R

# List excel files on Data sub-directory
list.files (path = "./Data" ,pattern = "xlsx$")

# List other file type in  Data folder
list.files (path = "./Data" ,pattern = "R$")
list.files (path = "./Data" ,pattern = "Rdata$")
list.files (path = "./Data" ,pattern = "txt$")