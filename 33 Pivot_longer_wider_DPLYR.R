# PIVOT 
 
library(tidyverse)

# Create initial data set
Country <-c("Spain","France","India","Germany")
Views <-c(100,2261,6725,800)

data_views_a <-cbind.data.frame(Country,Views)
data_views_a

  Country Views
1   Spain   100
2  France  2261
3   India  6725
4 Germany   800


# 1. Pivot wider (tidyr, dplyr)
# pivot_wider(names_from = var1, values_from = var2)
data_wide <- data_views_a %>% 
                    pivot_wider(names_from = Country,
                                values_from =Views)
data_wide

> data_wide
# A tibble: 1 x 4
  Spain France India Germany
  <dbl>  <dbl> <dbl>   <dbl>
1   100   2261  6725     800
  
  
# 2. Pivot longer (tidyr, dplyr)
# pivot_longer(cols = 1:n, names_to = var1, values_to = var2)
Spain<-c(100)
France<-c(2261)
India<-c(6725)

data_views_b <-cbind.data.frame(Spain,France,India)
data_views_b

> data_views_b
  Spain France India
1   100   2261  6725

data_long <- data_views_b %>% 
               pivot_longer( cols = 1:3,
                             names_to = "country",
                             values_to = "views")
data_long


> data_long
# A tibble: 3 x 2
  country views
  <chr>   <dbl>
1 Spain     100
2 France   2261
3 India    6725