## 14 DPLYR recode long winding variable names 
# R script: 14 DPLYR recode variable.R
gimmeCaffeine <- gimmeCaffeine %>%
  mutate(origin = recode(origin, 
                         "colombia" = "Colombian", 
                         "ethiopia" = "Ethiopian",
                         "peru"     = "Peruvian"))


# Example of long variable names, how to recede them into shorter names
Data02_short <- Data02 %>% 
  mutate(
    Indic_name_sh = recode(
      Indic_name, 
      "Alcohol related liver disease - Admissions per 100,000 age-sex weighted population (excluding zero-day non-elective admissions)" = "Alcohol liver disease",
      "Cerebrovascular disease (10B) - Total spend per 1,000 age-sex weighted population" = "Cerebro",
      "Falls & fractures : Hip fractures per 100,000 age-sex weighted population aged 65-79" = "Falls"),
    
    Grogr_sh = recode(
      GeographyName,
      "HospitalA Longname" = "HospitalA",
      "HospitalB Longname" = "HospitalB",
      "HospitalC Longname" = "HospitalC",
      "HospitalD Longname" = "HospitalD",
      "HospitalE Longname" = "HospitalE",
      "HospitalF Longname"  = "HospitalF",
      "HospitalG Longname" = "HospitalG"
    )     
  ) %>% 
  select(Indic_name_sh,Grogr_sh,Value) 

Data02_short

Heatmap03 <- Data02_short %>% 
  ggplot(aes(Grogr_sh, Indic_name_sh, fill= Value)) + 
  geom_tile() +
  ggtitle("Alcohol, Cerebrovasular, and Fall and Fractures Indicators, Short label names") 
Heatmap03