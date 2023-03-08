# Script:  Using assign function.R
if(!dir.exists("04 assign")){dir.create("04 assign")}

# AIM: Sometimes we want to assign specific names to objects we create and 
# store in our workspace 

# This is an exmaple on how to use assign() function to obtain custom
# object names when slicing and dicing our original input data set

# 1. Setup initial data frame

A <-c("ID1","ID2","ID3","ID4","ID5")
B <-c(replicate(2,"Good"),replicate(3,"Bad"))
C <-c(1000,2000,700,820,520)
D <-c(1,2,3,4,5)

MydataA <-cbind.data.frame(A,B,C,D)
str(MydataA)

A <-c("ID1","ID2","ID3","ID4","ID5")
E <-c(replicate(2,"Good"),replicate(3,"Bad"))
G <-c(1500,2060,750,450,900)
H <-c(1,2,3,4,5)

MydataB <-cbind.data.frame(A,E,G,H)
str(MydataB)

# 2. Merge both data sets

New_data <- merge(MydataA, MydataB, all = TRUE)
New_data

# 3. How to solve the problem described below:
# Avoiding what we see below. Data set are overwritten for each new column
cols <-ncol(New_data) 
cols

# THere is a problem with this code below
# Every thime the scrip run, object gets written over 
for (i in 1:cols){
  Object <- as.data.frame(New_data[,i])
  print(Object)
  print(Object_name)
  File_name <-paste0("New_data","_","Column","_",i)
  print(File_name)
  
  # Let's fix this ssue in the next step 
}

# 4. THIS IS how we solve it
# Using the assign function

# Assign function allows us to combine giving a name to the new data subset
# from our original data set, and also slice our data. 

for (i in 1:cols){
  
  # 1. Create different data frames for each column
  assign(paste0("New_data_Column",i),data.frame(New_data[,i]))

  # 2. Create new data set where we keep the ID columns as first col
  assign(paste0("Data_col_ID",i),
         cbind.data.frame(data.frame(New_data[,1]),
                          data.frame(New_data[,i]))
  )
  # The next step would be to assign meaningful col names
  # to the newly Data_col_ID set of data sets created
}
  