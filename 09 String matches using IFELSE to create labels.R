# 3 Split main dataset by organisaion types (CCG, TRUST, STP)
# 
# The grepl() stands for “grep logical”. 
# In R it is a built-in function that searches for matches 
# of a string or string vector. The grepl() method takes a pattern (we define that string pattern in our search)
# and data and returns TRUE if a string contains the pattern, otherwise FALSE.

# We use ifelse() nested conditions to flag each sting match provided by grepl function
# and assign it the corresponding organisation label description

Torgrc <- IMPRDASH %>% 
  select(OrgName) %>% 
  mutate(
    ORGTYPE = ifelse(grepl('CCG',OrgName),'CCG',
                     (ifelse(grepl('Trust',OrgName),'TRUST',
                             (ifelse(grepl('STP',OrgName),'STP',0)))))
  )
IMPRDASI <-IMPRDASH %>% 
  select(OrgName,OrgType,Measure,SubCompartment,Value,ReportingDate,Frequency,Quarter,STPCode) %>% 
  mutate(
    ORGTYPE = ifelse(grepl('CCG',OrgName),'CCG',
                     (ifelse(grepl('Trust',OrgName),'TRUST',
                             (ifelse(grepl('STP',OrgName),'STP',0)))))
  )
IMP_STP <- IMPRDASI %>% filter(ORGTYPE=='STP')
IMP_CCG <- IMPRDASI %>% filter(ORGTYPE=='CCG')
IMP_TRUST <- IMPRDASI %>% filter(ORGTYPE=='TRUST')
