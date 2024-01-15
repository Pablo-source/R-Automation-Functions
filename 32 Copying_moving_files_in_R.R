# COPY FILES IN R

library(here)
library(tidyverse)

dir.create("Previous_stats")
dir.create("Current_stats")

here_i_am <-here()
here_i_am

# source directory (current_stats)
# target directory (previouis_stats)

source_dir <-"/home/pablo/Documents/Pablo_zorin/R_projects_Home/R_code_snippets/R_code_snippets/current_stats"
target_dir <-"/home/pablo/Documents/Pablo_zorin/R_projects_Home/R_code_snippets/R_code_snippets/previous_stats"

files <- base::list.files(source_dir,recursive = TRUE,
                                     include.dirs = FALSE,
                                     full.names = TRUE)
files

# [1] "/home/pablo/Documents/Pablo_zorin/R_projects_Home/R_code_snippets/R_code_snippets/current_stats/Figure_1__Average_UK_house_prices_were_little_changed_in_the_12_months_to_September_2023_(provisional_estimate)_.csv"

# COPYING FILES

file.copy(from = files, to = target_dir)


# MOVING FILES

# Using filesstrings library
# install.packages("filestrings", dependencies = TRUE)
library(filesstrings)

# Using file.move() function from {filesstrings}
file.move(files,"previous_stats",overwrite = TRUE)

files_target <- base::list.files(target_dir,recursive = TRUE,
                          include.dirs = FALSE,
                          full.names = TRUE)
files_target
#[1] "/home/pablo/Documents/Pablo_zorin/R_projects_Home/R_code_snippets/R_code_snippets/previous_stats/Figure_1__Average_UK_house_prices_were_little_changed_in_the_12_months_to_September_2023_(provisional_estimate)_.csv"