library(tidyverse)

boxplots <- tumor_subset %>% 
  filter(Day == 0) %>% 
  ggplot(aes(as.factor(Group), Size)) + 
  geom_boxplot() + xlab("Group") + 
  ylab("Tumor size")

png("../fig/boxplots.png")
boxplots
dev.off()