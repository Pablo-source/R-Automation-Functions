# 27 DPLYR filter rows IN and NOT IN.R
# 30/12/2022
# DPLYR: IN and NOT IN used with FILTER verb

# There is the IN verb in DPLYR used mainly to filter data including certain categories: 
# [How to use not in filter DPLYR]<https://www.statology.org/dplyr-filter-not-in/>
# [Does not contain DPLYR]<https://stackoverflow.com/questions/34444295/how-to-specify-does-not-contain-in-dplyr-filter>
# 1. Create Dummy data set
City <-c(replicate(2,'London'),replicate(4,'Valencia'),replicate(2,'Barcelona'))
Metric <-c(23,43,65,12,78,1,5,4)
Brand<-c(replicate(5,'TierA'),replicate(3,'TierB'))
Data <-cbind.data.frame(City,Metric,Brand)
Data

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
Data_sub_excl  <- Data %>% filter(!City %in% Subset)
Data_sub_excl  
# City Metric Brand
#1 Valencia     65 TierA
#2 Valencia     12 TierA
#3 Valencia     78 TierA
#4 Valencia      1 TierB

# This this allows us to combine NOT IN and IN filters
# Exclude London and Barcelona
# Include only Brand where value is "TierA"
Subset <-c("London","Barcelona")
Data_sub_excl_two  <- Data %>% filter(!City %in% Subset &
                                        Brand == "TierA")
Data_sub_excl_two  
#City Metric Brand
#1 Valencia     65 TierA
#2 Valencia     12 TierA
#3 Valencia     78 TierA
