library(tidyverse)
tumor_subset <- read_csv("../data/tumor_filtered.csv")

mean_tumor_size <- tumor_subset %>% 
  filter(Day == 0) %>% 
  summarise(tumor_size = mean(Size))

median_tumor_size <- tumor_subset %>% 
  filter(Day == 0) %>% 
  summarise(tumor_size = median(Size))

density_plot <- ggplot(filter(tumor_subset, Day == 0), aes(Size)) + 
  geom_histogram(aes(y=..density..), colour="gray", fill="white", bins = 12) + 
  geom_density() + 
  geom_vline(xintercept = mean_tumor_size[["tumor_size"]], color = "#1b9e77", lwd = .9) + 
  geom_vline(xintercept = median_tumor_size[["tumor_size"]], color = "#d95f02", lwd = .9) + 
  geom_label(label = "median = center\nhalf of data values\nabove, half below", x = median_tumor_size[["tumor_size"]] - 7, y = .01, color = "#d95f02") + 
  geom_label(label = "mean pulled\nto the right by\nlargest values", x = mean_tumor_size[["tumor_size"]] + 5, y = .01, color = "#1b9e77") + 
  theme(axis.text.y = element_blank()) + 
  labs(x = "Tumor size", y = NULL, title = "Distribution of Tumor Sizes",
       subtitle = "for Day 0",
       caption = "Mean and median describe different centers of data")

png("../fig/density-plot.png")
density_plot
dev.off()

