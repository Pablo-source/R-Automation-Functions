# 06 DPLYR filter rows IN and NOT IN.R

# 30/12/2022. Updated 01/01/2023
# DPLYR: IN and NOT IN used with FILTER verb

# There is the IN verb in DPLYR used mainly to filter data including certain categories: 
# [How to use not in filter DPLYR]<https://www.statology.org/dplyr-filter-not-in/>
# [Does not contain DPLYR]<https://stackoverflow.com/questions/34444295/how-to-specify-does-not-contain-in-dplyr-filter>
# 1. Create Dummy data set
City <-c(replicate(2,'London'),replicate(4,'Valencia'),replicate(2,'Barcelona'))
Metric <-c(23,43,65,12,78,1,5,4)

Brand <-c(replicate(5,'TierA'),replicate(3,'TierB'))
Dates <- c('12/02/2021','01/11/2021','20/07/2021','30/01/2022','14/02/2022','04/03/2022','18/06/2022','11/11/2022')
Date <- as.Date(Dates,"%d/%m/%Y")
Mydata <-cbind.data.frame(City,Metric,Brand,Date)
Mydata

str(Mydata)

# 1-1. Using IN to include a subset of categories 
# Create vector with category (London) we want to retain 
library(dplyr)
Subset <-c("London")

Data_sub  <- Data %>% filter(City %in% Subset)
Data_sub

#City Metric Brand
#1 London     23 TierA
#2 London     43 TierA

# 1-2. Using IN with category negation symbol to exclude a set of categories 

# Declare Cities you want to include
# A %in% returns a logical vector T,F we can negate the logical statement using !
# Exclude London and Barcelona
# We have to place the negation symbol ! before the variable in the %in% statement to make it negative
library(dplyr)
# We only have to include in the line below all categories we want to exclude
Subset <-c("London","Barcelona")
Data_sub_excl  <- Mydata %>% filter(!City %in% Subset)

Data_sub_excl  
# City Metric Brand
#1 Valencia     65 TierA
#2 Valencia     12 TierA
#3 Valencia     78 TierA
#4 Valencia      1 TierB

# This this allows us to combine NOT IN and IN filters
# Exclude London and Barcelona
# Include only Brand where value is "TierA"

# Subset data for Barcelona city and retain just two dates from original data set (2021-02-12,2022-01-30)
Subset <-c("Barcelona")
Data_sub_excl  <- Mydata %>% filter(!City %in% Subset &
                                              Date == "2021-02-12" |
                                              Date == "2022-01-30")
Data_sub_excl
str(Data_sub_excl) 
                                        
# Excluding dates and City values from main dataset 
Subset <-c("Barcelona")
Exbrand <- c("TierB")
                                      
Data_sub_excl  <- Mydata %>% filter(!City %in% Subset &
                                              !Brand %in% Exbrand) 
Data_sub_excl
                                        
> Data_sub_excl

City Metric Brand       Date
1   London     23 TierA 2021-02-12
2   London     43 TierA 2021-11-01
3 Valencia     65 TierA 2021-07-20
4 Valencia     12 TierA 2022-01-30
5 Valencia     78 TierA 2022-02-14
                                        
  # Code below to exclude dates from dataframe (declare dates to exclude outside, and define them as dates)
Subset <-c("Barcelona")
Exbrand <- c("TierB")
Excdates <-c('12/02/2021','01/11/2021')
Datexl<- as.Date(Excdates,"%d/%m/%Y")

Data_sub_excld  <- Mydata %>% filter(!City %in% Subset &
                                         !Brand %in% Exbrand) %>% 
                                 filter(!Date %in% Datexl)
Data_sub_excld
  
> Data_sub_excld
City Metric Brand       Date
1 Valencia     65 TierA 2021-07-20
2 Valencia     12 TierA 2022-01-30
3 Valencia     78 TierA 2022-02-14
  
# This would allow us to pick and choose which dates to remove as well any other variable value

  
