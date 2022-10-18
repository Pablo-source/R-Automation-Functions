## 26 Format %B %Y dates in R 
library(readr)
library(tidyverse)

BOE_rate <- read_csv("Quoted Interest Rates New Vis_data.csv")

str(BOE_rate)

spec_tbl_df [381 × 4] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
$ Month of Date: chr [1:381] "March 2012" "April 2012" "May 2012" "June 2012" ...
$ Name         : chr [1:381] "Bank rate" "Bank rate" "Bank rate" "Bank rate" ...
$ Max. Value   : num [1:381] 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...
$ Value (copy) : num [1:381] 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...

names(BOE_rate)

Rates <- BOE_rate %>% select(Date = 'Month of Date',
                             Name,
                             Rate = 'Max. Value')
Rates

plot(Rates)

# %b abbreviated month Jan
# %B unabbreviated month	 January
# %Y Four digits YEar 2013	 January

# Prepending 1 to the characters worked! as.Date("1 January 2008", "%d %B %Y")
Rates_date <- Rates %>% 
                   mutate(DATED = paste0(1," ",Date)) 
Rates_date

# Formatted date
Rates_fmtd <- Rates_date %>% 
              mutate(
                DATE = as.Date(DATED,format = "%d %B %Y") 
              ) %>% 
              select(DATE,Name,Rate)
Rates_fmtd

str(Rates_fmtd)

> str(Rates_fmtd)
tibble [381 × 3] (S3: tbl_df/tbl/data.frame)
$ DATE: Date[1:381], format: "2012-03-01" "2012-04-01" "2012-05-01" "2012-06-01" ...
$ Name: chr [1:381] "Bank rate" "Bank rate" "Bank rate" "Bank rate" ...
$ Rate: num [1:381] 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...