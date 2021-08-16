library(tidyverse)
tumor_subset <- read_csv("../data/tumor_filtered.csv")

mean_tumor_size <- tumor_subset %>% 
  filter(Day == 0) %>% 
  summarise(tumor_size = mean(Size))

sd_size <- tumor_subset %>% 
  filter(Day == 0) %>% 
  summarise(sd_size = sd(Size))

sd_plot <- ggplot(filter(tumor_subset, Day == 0), aes(Size)) + 
  geom_histogram(aes(y=..density..), colour="gray", fill="white", bins = 12) + 
  geom_density() + 
  geom_vline(xintercept = mean_tumor_size[["tumor_size"]], color = "#1b9e77", lwd = .9, alpha=0.5) + 
  geom_vline(xintercept = mean_tumor_size[["tumor_size"]] + sd_size[["sd_size"]], color = "#1f78b4", lty = 5) + 
  geom_vline(xintercept = mean_tumor_size[["tumor_size"]] - sd_size[["sd_size"]], color = "#1f78b4", lty = 5) + 
  geom_label(label = "one standard deviation\nabove and below mean", x = mean_tumor_size[["tumor_size"]], y = .01, color = "#1f78b4") + 
  theme(axis.text.y = element_blank()) + 
  labs(y=NULL)

png("../fig/sd-plot.png")
sd_plot
dev.off()
