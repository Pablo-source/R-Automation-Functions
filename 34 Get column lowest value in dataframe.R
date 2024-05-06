# 04 Function to return columns with lowest VALUE 

# function: APPLY {base}

# AIM: In a given data frame, return the column (name) with the MAX or MIN value.

# Column names with minimum value in them
# APPLY function with MARGIN parameter
# Row names with minumum value in them
# MARGIN 
apply(MARGIN)

# apply function from {base}
# X	 an array, including a matrix.
# MARGIN: 	a vector giving the subscripts which the function will be applied over. E.g., 
#           for a matrix 1 indicates rows, 2 indicates columns, c(1, 2) indicates rows and columns. 
#            Where X has named dimnames, it can be a character vector selecting dimension names.
# FUN: the function to be applied: see ‘Details’. In the case of functions like +, %*%, etc., the function name must be backquoted or quoted.

# apply(df, MARGIN =1) rows
# apply(df, MARGIN =2) columns


# 1. GENERAL APPLY function application

# apply() function examples below: 

# Get minimum COLUMN values MARGIN = 2 COLUMNS
names(df)[which.min(apply(df,MARGIN = 2,min))]

# Get minimum value ROW NAMES, MARGIN = 1 ROWS
rownames(df)[which.min(apply(df,MARGIN = 1,min))]

# 2. Example using apply function

# Build data frame with several RMSE values and how each model perform
RMSE <-c("East Coast","West Coast")
ARIMA <-c(49,23)
ENSAMBLE <-c(9,6)
ETS <-c(61,24)
HYBRID <-c(43,19)
TBATS <-c(49,23)


Data <-cbind.data.frame(RMSE,ARIMA,ENSAMBLE,HYBRID,TBATS)
Data

# AIM: 
# 1.We want to be able to select the COLUMN with the LOWEST RMSE values from the dataframe
# 2.We want to be able to select the COLUMN with the HIGHEST RMSE values from the dataframe

#> Data
#           RMSE ARIMA ENSAMBLE HYBRID TBATS
# 1 East Coast    49        9     43    49
# 2 West Coast    23        6     19    23


# 2.1 We want to be able to select the COLUMN with the LOWEST RMSE values from the dataframe

# Get column name with LOWEST RMSE value from Data dataframe 
# columns (MARGIN = 2)
# Min value which.min(min)

min_col_value <- colnames(Data)[which.min(apply(Data,MARGIN = 2,min))]
min_col_value

# min_col_value
# [1] "ENSAMBLE"


# 2.2 We want to be able to select the COLUMN with the HIGHEST RMSE values from the dataframe

# # Get column name with HIGHEST RMSE value from Data dataframe 
# columns (MARGIN = 2)
# Max value which.max(max)

max_col_value <- colnames(Data)[which.max(apply(Data,MARGIN = 2,max))]
max_col_value

# > max_col_value
# [1] "ARIMA"

# 3. Turn get column with lowest value into a function

col_lowestv <- function (input_data) {
  
  min_col_value <- colnames(input_data)[which.min(apply(input_data,MARGIN = 2,min))]
  min_col_value
  
  return(min_col_value)
}

# Test this generic function with our dataset Data
col_lowestv(Data)

