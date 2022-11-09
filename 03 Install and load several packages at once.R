# Installing new required packages for "02 Parallel processing.Rmd"

# Install several packages at once
install.packages(c("dimRed","Rspectra","igraph"),dependencies = TRUE)

# Load severa packages at once 
my_packages <- c("dimRed", "Rspectra", "igraph")
lapply(my_packages, require, character.only = TRUE)    # Load multiple packages