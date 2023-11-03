# 17 Importing Excel files into R.R

# Importing excel files using relative paths

# Related project in the N drive
## 01 Get Excel data into R_new.R

# RIGHT WAY OF GETTING EXCEL DATA INTO R
# Load required libraries (readxl and here)
library(readxl)
library(here)
library(dplyr)
library(janitor)

Path <- here()
Path

# List excel files on Data sub-directory

# Step 01 03: Check files available in the data folder
list.files (path = "./data" ,pattern = "xlsx$")

[1] "My_Excel_input_file_2022.xlsx"

# Step 02 03: List tabs from above Excel file to know which tab to import
excel_sheets("./data/My_Excel_input_file_2022.xlsx")

[1] "Title Sheet"           "Notes and definitions" "Table 1"  

# Check Tab names to know which one to import
# This returns the number of tabs and we now know that we want to import the third sheet
 
# Step 03 04: import  data by using read_excel() main function alongside clean_names() function from janitor package
# Consider also using several of these arguments when importing Excel files into R using read_excel_function()
# range	
# A cell range to read from, as described in cell-specification. Includes typical Excel ranges like "B3:D87", possibly including the sheet name like "Budget!B2:G14", and more. Interpreted strictly, even if the range forces the inclusion of leading or trailing empty rows or columns. Takes precedence over skip, n_max and sheet.
# col_names	
# TRUE to use the first row as column names, FALSE to get default names, or a character vector giving a name for each column. If user provides col_types as a vector, col_names can have one entry per column, i.e. have the same length as col_types, or one entry per unskipped column.
# col_types	
# Either NULL to guess all from the spreadsheet or a character vector containing one entry per column from these options: "skip", "guess", "logical", "numeric", "date", "text" or "list". If exactly one col_type is specified, it will be recycled. The content of a cell in a skipped column is never read and that column will not appear in the data frame output. A list cell loads a column as a list of length 1 vectors, which are typed using the type guessing logic from col_types = NULL, but on a cell-by-cell basis.
# na	
# Character vector of strings to interpret as missing values. By default, readxl treats blank cells as missing data.
# trim_ws	
# Should leading and trailing whitespace be trimmed?
# skip	
# Minimum number of rows to skip before reading anything, be it column names or data. Leading empty rows are automatically skipped, so this is a lower bound. Ignored if range is given.

datan <- read_excel(here("data", "My_Excel_input_file_2022.xlsx"), sheet = 3) %>% 
         clean_names()
datan

# Get column names
names(datan)

> names(datan)
[1] "reporting_period"   "period_of_coverage" "breakdown"          "ons_code"           "level"              "level_description"  "indicator_value" 

# We have successfully imported our Excel file with the tidy column names selecting which tab we wanted the data from. 

> datan                                                                                                                                                               
# A tibble: 23 × 7
reporting_period period_of_coverage       breakdown ons_code  level    level_description                       indicator_value
<chr>            <chr>                    <chr>     <chr>     <chr>    <chr>                                             <dbl>
  1 2019/20          01/04/2019 to 31/03/2020 National  E92000001 National Registered patients in England                    100  
2 2018/19          01/04/2018 to 31/03/2019 National  E92000001 National Registered patients in England                    100  
3 2017/18          01/04/2017 to 31/03/2018 National  E92000001 National Registered patients in England                    100  
4 2016/17          01/04/2016 to 31/03/2017 National  E92000001 National Registered patients in England                    100  
5 2015/16          01/04/2015 to 31/03/2016 National  E92000001 National Registered patients in England                    100  
6 2014/15          01/04/2014 to 31/03/2015 National  E92000001 National Registered patients in England                    100  
7 2013/14          01/04/2013 to 31/03/2014 National  E92000001 National Registered patients in England                    100  
8 2012/13          01/04/2012 to 31/03/2013 National  E92000001 National Registered patients in England                    100  
9 2011/12          01/04/2011 to 31/03/2012 National  E92000001 National Registered patients in England                    100  
10 2019/20          01/04/2019 to 31/03/2020 CCG       E38000001 02N      NHS Airedale, Wharfedale and Craven CCG            88.5
