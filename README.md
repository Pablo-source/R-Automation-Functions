# R-Automation-Functions
Set of  R functions and scripts to automate daily tasks such as creating project directory folders structure or binding several csv files into one master file

- **00.Setup project structure.R**
  - Build a function to be used across different projects
  - It creates a set of folders and sub-folders (data,Output,Shapefiles,Checks,Maps,Archive)
  - We make use of  here() function from here package, to **ensure** we use **relative paths** to the Project tolder 
  - The last action included in the function will create sub-folders based on pre-existing folders
  - This **project_setup** function has no argumentas as we want it to be the first step on ny given project
  
  
- 2. Combine several .csv files into a single master file
- 3. Buiild robust project oriented scripts using here package
  - The here package allows you to create paths relative to the top-level directory, defined by your project
  - It also allows you to build a path relative to the top-level project directory, to ease sharing read and write scripts among team members.
  -  https://here.r-lib.org/


- **01. Add columns to dataframe specific order.R**

- **02. Combine csv files into master one.R**

- **03. Install several packages at once.R**

- **04. Working with files and folders.R**

- **05. Relative pathas using HERE library.R**
