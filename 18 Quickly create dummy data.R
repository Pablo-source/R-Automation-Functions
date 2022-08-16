# 18 Quickly create dummy data.R

# Using replicate(),rnorm() functions

# Mydata2
# Use replicate to create new set of data with duplicated character values 
# Introduce National dummy data as reference

Indic2_n <-c(  replicate(2,"Knee Replacement"),
               replicate(2,"Hip Replacement"),
               replicate(2,"Falls and fractures")
)

Org2 <- c(
  replicate(2,"NHS Northumberland CCG"),
  replicate(2,"NHS Northumberland CCG"),
  replicate(2,"NHS Northumberland CCG")
)

value2 <-c(rnorm(3))

# Create for each Indicators two rows one for Org value and another for national value
Scope <- c(
  replicate(6,c("Org","national"))
  
)
Scope

MydataN <-cbind.data.frame(Indic2_n,Org2,value2,Scope)
MydataN
