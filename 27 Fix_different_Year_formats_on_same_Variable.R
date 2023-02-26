## 01 ONS Earnings
# 27 Fix_different_

# 1 Load required libraries
pacman::p_load(readxl,here,dplyr,janitor)

# Project folder
# > here()
#[1] "/media/pablo/SSD 480GB/Sociology studies/Husing_market/04 ONS Earnings"

# LOADING ONS DATA ON MEDIAN INCOME YEAR ENDING 2022

# 2 Import xls file into R from data folder
# 2.1 First get the File name we want to import
Excel_file <-list.files (path = "./data" ,pattern = "xls$")
Excel_file

# 2.2 Then get the Tab names to choose which one to import (with multi tab files)
Excel_tabs <- excel_sheets("./data/Figure_2__Median_income_has_increased_during_the_10_years_leading_up_to_financial_year_ending_2022.xls")
Excel_tabs

[1] "data"

# 2.3 Choose the sheet we want to import 
here()
# [1] "/media/pablo/SSD 480GB/Sociology studies/Husing_market/04 ONS Earnings"
EARNINGS_Data <- read_excel(here("data","Figure_2__Median_income_has_increased_during_the_10_years_leading_up_to_financial_year_ending_2022.xls"),sheet = "data")
EARNINGS_Data


# 2.4 Add argument to skip first 10 rows of data
# Skip first six rows of data
EARNINGS_Data <- read_excel(here("data","Figure_2__Median_income_has_increased_during_the_10_years_leading_up_to_financial_year_ending_2022.xls"),
                            sheet = "data",
                            skip = 6)
EARNINGS_Data

# 2.5 This file has not got any missing values
# Data <- read_excel(here("data","RTT_TS_data.xlsx"),sheet = "Full Time Series",
#                       skip = 10 , na = "-")
# Data

# 2.6  Use Janitor package to get clear names using "clear_names()"function
# THis file worked fine and solves:
# a. Importing null values from origingal file defined as "-"
# b. Cleaning original variable names using clean_names() function from Janitor package
EARNINGS_Data <- read_excel(here("data","Figure_2__Median_income_has_increased_during_the_10_years_leading_up_to_financial_year_ending_2022.xls"),
                            sheet = "data",
                            skip = 6) %>% 
                 clean_names()
EARNINGS_Data


# USE CASE_WHEN to recode years
#
# Usage: How to re code set of different year formats from ONS income data such as 1977 and 1994/95
#  
# 1. Create a new condition using case_when for each row where date variable "year" is in FY format  ex: 1994/95
# 2. For the remaining records where "year" is in single year format, keep it that way ex: 1997
# 3. Using TRUE ~ argument from case_when formula, assign 

# create a case_when statement for each FY row 1994/95 all the way up to 2021/22 
Distinctv <- EARNINGS_Data %>% 
              select(year) %>% 
              distinct()


head(Distinctv)
tail(Distinctv)

> head(Distinctv)
# A tibble: 6 × 1
year 
<chr>
  1 1977 
2 1978 
3 1979 
4 1980 
5 1981 
6 1982 

> tail(Distinctv)
# A tibble: 6 × 1
year   
<chr>  
  1 2016/17
2 2017/18
3 2018/19
4 2019/20
5 2020/21
6 2021/22


# How to use case_when to fix this mix of date variable formats in a data frame:
# From row 18 to 25 from Distinctv data frame, we have FY we want to convert into YYYY date format  

# 1994/95
# 1995/96
# 1996/97
# 1997/98
# 1998/99
# 1999/00
# 2000/01
# 2001/02
# 2002/03
# 2003/04
# 2004/05
# 2005/06
# 2006/07
# 2007/08
# 2008/09
# 2009/10
# 2010/11
# 2011/12
# 2012/13
# 2013/14
# 2014/15
# 2015/16
# 2016/17
# 2017/18
# 2018/19
# 2019/20
# 2020/21
# 2021/22


EARNING_clean <- EARNINGS_Data %>% 
                mutate(
                  Year = case_when( year == '1994/95' ~ 1994, 
                                    year == '1995/96' ~ 1995,
                                    year == '1996/97' ~ 1996,
                                    year == '1997/98' ~ 1997,
                                    year == '1998/99' ~ 1998,
                                    year == '1999/00' ~ 1999,
                                    year == '2000/01' ~ 2000,
                                    year == '2001/02' ~ 2001,
                                    year == '2002/03' ~ 2002,
                                    year == '2003/04' ~ 2003,
                                    year == '2004/05' ~ 2004,
                                    year == '2005/06' ~ 2005,
                                    year == '2006/07' ~ 2006,
                                    year == '2007/08' ~ 2007,
                                    year == '2008/09' ~ 2008,
                                    year == '2009/10' ~ 2009,
                                    year == '2010/11' ~ 2010,
                                    year == '2011/12' ~ 2011,
                                    year == '2012/13' ~ 2012,
                                    year == '2013/14' ~ 2013,
                                    year == '2014/15' ~ 2014,
                                    year == '2015/16' ~ 2015,
                                    year == '2016/17' ~ 2016,
                                    year == '2017/18' ~ 2017,
                                    year == '2018/19' ~ 2018,
                                    year == '2019/20' ~ 2019,
                                    year == '2020/21' ~ 2020,
                                    year == '2021/22' ~ 2021,
                                    TRUE ~ as.numeric(year))
                )
EARNING_clean


# Before applying the fix  
# mean
EARNINGS_plot <- EARNINGS_Data %>% 
  ggplot(X = year, Y = mean, aes()) + 
  geom_line()
EARNINGS_plot
# median

# After applying the fix
EARNINGS_plot_clean <- EARNING_clean %>% 
  ggplot(X = Year, Y = mean, aes()) + 
  geom_line()
EARNINGS_plot_clean


Distinct_Year <- EARNING_clean %>% 
  select(Year) %>% 
  distinct()
Distinct_Year

# Now the Year format is standardized across all years 
# 1977
# 1978
# 1979
# 1980
# 1981
# 1982
# 1983
# 1984
# 1985
# 1986
# 
# 2015
# 2016
# 2017
# 2018
# 2019
# 2020
# 2021

# Online resources
https://www.sharpsightlabs.com/blog/case-when-r/#example-3
https://www.sharpsightlabs.com/blog/case-when-r/
  