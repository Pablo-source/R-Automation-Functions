![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
![GitHub all releases](https://img.shields.io/github/downloads/Pablo-source/R-Automation-Functions/total?label=Downloads&style=flat-square)
![GitHub language count](https://img.shields.io/github/languages/count/Pablo-source/R-Automation-Functions)

# R-Automation-Functions
Set of  R functions and scripts to automate daily tasks such as creating project directory folders structure or binding several csv files into one master file

- **00.Setup project structure.R**
  - Build a function to be used across different projects
  - It creates a set of folders and sub-folders (data,Output,Shapefiles,Checks,Maps,Archive)
  - We make use of  here() function from here package, to **ensure** we use **relative paths** to the Project tolder 
  - The last action included in the function will create sub-folders based on pre-existing folders
  - This **project_setup** function has no argumentas as we want it to be the first step on ny given project
    

  **01. Add columns to dataframe specific order.R**

  **02. Combine csv files into master one.R**
  - How to read in several .csv files into R
  - How to append them to create a single combined file
  
  **03. Install several packages at once.R**

  **04. Working with files and folders.R**

  **05. Relative paths using HERE package.R**
  - Focus on building project oriented scripts using here package
  - Here package allows relative paths creation referred to the top-level directory, defined by your project folder.
  - Allowing to build a path relative to the top-level project directory, to ease shairng input and ouptut functions among team members.
  - Highlights the importance of working with project oriented workflows
  - https://rstats.wtf/project-oriented-workflow.html
  - Online references about Here package
  -   https://here.r-lib.org/
  -   https://www.tidyverse.org/blog/2017/12/workflow-vs-script/

- The here package creates paths relative to the top-level directory. The package displays the top-level of the current project on load or any time you call here():

here::i_am("README.Rmd")
#> here() starts at /home/kirill/git/R/here
here()
#> [1] "/home/kirill/git/R/here"
- You can build a path relative to the top-level directory in order to read or write a file:
here("inst", "demo-project", "data", "penguins.csv")

#> [1] "/home/kirill/git/R/here/inst/demo-project/data/penguins.csv"

readr::write_csv(palmerpenguins::penguins, here("inst", "demo-project", "data", "penguins.csv"))

- These relative paths work regardless of where the associated source file lives inside your project, like analysis projects with data and reports in different subdirectories. See the included demo project for an example.

**06. Read and write CSV files using relative paths**
There is a brief description of each script aim below the first initial comit label at the top

**DPLYR verbs folder**

Set of tricks and advanced data wrangling manipulation verbs using DPLYR, some of these scrips refer to data preparation whilst others refer to how to perform variable calculations or softs searhcs when using where statements.
