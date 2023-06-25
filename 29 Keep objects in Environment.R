# 29 Keep objects in environment.R

# When working with R, specially when building models, you might want to keep just a few objects
# in your workspace, specially after several data wrangling steps

# For instance in "CCG OIS Indicators maps.R" script on the Maps project, I only
# want to retain the final cancer data sets for each year and the shapefile used to draw
# CCGs maps

# Remove previous data sets from environment
# Just keep CCG_boundaries and indicator data sets for each year (2013,2019)

# Use the right side of the %in% operator to list data sets you want to keep

rm(list=ls()[! ls() %in% c("CCG_boundaries","cancer_data_2013","cancer_data_2014",
                           "cancer_data_2015","cancer_data_2016","cancer_data_2017",
                           "cancer_data_2018","cancer_data_2019")])

 
# Example
ID <-c(23,21,43,53)
Profit <-c(24323,24521,43453,53315)
Shop <-c("ShopA","ShopA","ShopA","ShopA")

Shopd <- cbind.data.frame(ID,Profit,Shop)
Shopd_copy <- Shopd

ID <-c("ID23","ID72","ID12","ID43")
Value <-c(8,3,4,5)
Desc <-c("Notebook","Pencil","Ballpen","Ruler")

Items <- cbind.data.frame(ID,Value,Desc)
Items_copy <- Items

# Using piece of code at the start of this scrip to keep just two outcome data sets
rm(list=ls()[! ls() %in% c("Shopd","Items")])



