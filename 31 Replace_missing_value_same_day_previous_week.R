# Replace missing value by same day previuos week value

# Rscript name:
# 31 Replace_missing_value_same_day_previous_week.R

## AIM: Given a data frame with one Date variable and a numeric varible with several
##      missing values, replace those missing values by same day previous week values.
##      Using ifelse() and lag() functions.
## Custom function to replace missing values by same value previous week

# Create dummy data set
library(tidyverse)

Date <-as.Date(c("2023-12-06","2023-12-07","2023-12-08","2023-12-09","2023-12-10",
                 "2023-12-11","2023-12-12","2023-12-13","2023-12-14","2023-12-15"),
               format = "%Y-%m-%d")
Values <-c(1138652,1150728,1163143,1111295,1159204,
           1133881,1053707,NA, 1197213,NA)
length(Date)
length(Values)
Test_data <- cbind.data.frame(Date,Values)  
Test_data

#> Test_data
#Date  Values
#1  2023-12-06 1138652
#2  2023-12-07 1150728
#3  2023-12-08 1163143
#4  2023-12-09 1111295
#5  2023-12-10 1159204
#6  2023-12-11 1133881
#7  2023-12-12 1053707
#8  2023-12-13      NA
#9  2023-12-14 1197213
#10 2023-12-15      NA

# 1-2, Set of transforamations required to replace missing value by same day 
# previous week value.
Test_data_input <- Test_data %>%  
  # Display weekday (assuming week starts on Monday )
  mutate(
    weekday = wday(Date, week_start=1),
    weekday_label = wday(Date, week_start=1,label = TRUE)) %>% 
  # Input missing values by same day previos week
  # Day of the week assumes week starts on Monday (Monday=1)
  mutate(Values_fill = ifelse(is.na(Values),
                              lag(Values,n=7),Values))
Test_data_input

# 2-2 Turn above code into a function
Input_prev_week <- function(){
  Inputted <- Test_data %>%  
    # Display weekday (assuming week starts on Monday )
    mutate(weekday = wday(Date, week_start=1)) %>% 
    # Input missing values by same day previos week (7 days before current date)
    # Day of the week assumes week starts on Monday (Monday=1)
    mutate(Values_fill = ifelse(is.na(Values),
                                lag(Values,n=7),Values))
  Inputted
}  

# Apply function on Test_data data set
# Assumming we have a data set called Test_data
# Made of two variables "Date" on first column and "Values" on second column
Input_prev_week()

# > Input_prev_week()
# Date  Values weekday weekday_label Values_fill
# 1  2023-12-06 1138652       3         mi\\.     1138652
# 2  2023-12-07 1150728       4         ju\\.     1150728
# 3  2023-12-08 1163143       5         vi\\.     1163143
# 4  2023-12-09 1111295       6         sá\\.     1111295
# 5  2023-12-10 1159204       7         do\\.     1159204
# 6  2023-12-11 1133881       1         lu\\.     1133881
# 7  2023-12-12 1053707       2         ma\\.     1053707
# 8  2023-12-13      NA       3         mi\\.     1138652
# 9  2023-12-14 1197213       4         ju\\.     1197213
# 10 2023-12-15      NA       5         vi\\.     1163143
