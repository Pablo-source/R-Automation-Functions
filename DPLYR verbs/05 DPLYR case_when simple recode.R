# DPLYR using case_when() verb 

# 05 DPLYR case_when simple recode.R

# 1.Setup a dummy data set
Indic2_n <-c(replicate(2,"Knee Replacement"),
             replicate(2,"Hip Replacement"),
             replicate(2,"Falls and fractures"))
Org2 <- c( replicate(2,"NHS Northumberland CCG"),
           replicate(2,"NHS East Berkshire CCG"),
           replicate(2,"NHS Rotherham CCG"))
value2 <-c(rnorm(3))

# Create for each Indicators two rows one for Org value and another for national value
Scope <- c(replicate(6,c("Org","national")))

# 1. Bind vectors into a single data frame
str(Indic2_n)
str(value2)

MydataN <-cbind.data.frame(Indic2_n,Org2,value2,Scope)

# WE can create a nee variable to recode vars
table(Org2)

Dataset <- MydataN
library(dplyr)

Dataset %>% dplyr::mutate(
              Org_Name = dplyr::case_when(
    Org2 == "NHS Rotherham CCG" ~ "Rotherham CCG",
    Org2 == "NHS East Berkshire CCG" ~ "East Berkshire CCG",
    Org2 == "NHS Northumberland CCG" ~ "Northumberland CCG"
  )
)

# DPLYR case_when verb : 
# The case_when() function includes inside the parenthesis two components
# separated by a tilde (~): 

# a) In the left side there is a condition that is evaluated as TRUE
# b) In the right side of the tilde there is the value of the output if the condition is evaluated as TRUE
# We use case_when in this instance to create a new column in the data frame
# We use case_when to implement a logic that test for a single condition, outputting a value if that condition is evaluated as TRUE.







