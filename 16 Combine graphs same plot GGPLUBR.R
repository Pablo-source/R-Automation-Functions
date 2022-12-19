# 16 Multiple graphs on same plot
# ggpubr: Publication Ready Plots / Mix Multiple Graphs on The Same Page

# Combine three plots into a single output image
# We use ggpubr to combine three plots together
library(ggpubr)

# Plot 01
PLOT_mtype1  <-  Indic_type_FLAG %>% 
  select(Indic_type) %>% 
  ggplot(aes(Indic_type)) +
  geom_bar(fill = "darkorchid") +
  geom_text(stat='count',aes(label =..count..),vjust = -0.5) + 
  labs(title = "Metric by measure type on dataset", 
       subtitle = "Time period: 2020/21 FY")  

PLOT_mtype1 
# Plot 02
PLOT_mtype2  <-  Indic_type_FLAG %>% 
  select(Indic_type) %>% 
  ggplot(aes(Indic_type)) +
  geom_bar(fill = "royalblue1") +
  geom_text(stat='count',aes(label =..count..),vjust = -0.5) + 
  labs(title = "Metric by measure type on dataset", 
       subtitle = "Time period: 2020/21 FY")  

PLOT_mtype2 
# Plot 03
PLOT_mtype3 <-  Indic_type_FLAG %>% 
  select(Indic_type) %>% 
  ggplot(aes(Indic_type)) +
  geom_bar(fill = "slategray3") +
  geom_text(stat='count',aes(label =..count..),vjust = -0.5) + 
  labs(title = "Metric by measure type on dataset", 
       subtitle = "Time period: 2020/21 FY")  

PLOT_mtype3

# THEN we combine these three plots using  library(ggpubr)
# ggarrange to combine three ggplots in one image
# ARRANGE PLOT IN A 3 COLS BY 1 ROW MATRIX
ggarrange(PLOT_mtype1, PLOT_mtype2, PLOT_mtype3 + rremove("x.text"), 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1)

ggsave(paste0("Combined plot",".jpeg"),
       width = 30, height = 20, dpi = 150, units = "cm")
