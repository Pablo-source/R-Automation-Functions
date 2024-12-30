# Union dataframes using DPLYR
# File: 12 DPLYR union datraframes.R

# UNION all datasets 
# DPLYR using "bind_rows" function 
library(dplyr)


# We append rows from dataframes with same column names
Data <- c(1,2,3)
Org <- c("ShopA","ShopB","ShopC")
Region <-c("North","North","North")

NData <-cbind.data.frame(Data,Org,Region)
nrow(NData)
# [1] 3

Data <- c(14,22,33)
Org <- c("ShopA","ShopB","ShopC")
Region <-c("South","South","South")

SData <-cbind.data.frame(Data,Org,Region)
nrow(SData)
# [1] 3

Data <- c(14,22,33)
Org <- c("ShopA","ShopB","ShopC")
Region <-c("East","East","East")

EData <-cbind.data.frame(Data,Org,Region)
nrow(EData)
# [1] 3

# 1. Union all datraframes into single one appending rows

# using bind_rows() function

All_data <- bind_rows(NData,SData,EData)
All_data

nrow(All_data)
# [1] 9

# Output
> All_data
Data   Org Region
1    1 ShopA  North
2    2 ShopB  North
3    3 ShopC  North
4   14 ShopA  South
5   22 ShopB  South
6   33 ShopC  South
7   14 ShopA   East
8   22 ShopB   East
9   33 ShopC   East