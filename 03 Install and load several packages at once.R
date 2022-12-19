# Installing new required packages for "02 Parallel processing.Rmd"

# 1-2 Install several packages at once
install.packages(c("dimRed","Rspectra","igraph"),dependencies = TRUE)

# 2-2 Load severa packages at once 
my_packages <- c("dimRed", "Rspectra", "igraph")
lapply(my_packages, require, character.only = TRUE)    # Load multiple packages

# A MORE EFFICIENT WAY USING pacman package to load seral libraries at once
# Another efficient way is using PACMAN package we can Load
# several packages at nce using p_load() function
# use p_load() to list in this function the set of required packages for your project
pacman::p_load(here,dplyr,sf,raster,mapdata,ggplot2)
