# 19 DPLYR subset rows percentage IN.R
# filter() and str_detect() to subset rows using Regular Expressions 

library(dplyr)
 
df <- data.frame(ALdays = c(31, 21, 2, 5, 12, 31, 4, 3,12,18,21,22), 
                 name = c("Marc", "Ann", "Marc","Lisa","Ann","Tom","Chris", "Lisa", "Kyla", "Tom", "Lynn", "Lynn"))


# Subset rows  containing information for Marc and Ann
Subset <-c("Marc","Ann")

df_sel <- df %>% 
          filter(name %in% Subset)

df_sel