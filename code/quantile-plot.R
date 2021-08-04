library(tidyverse)
tumor_subset <- read_csv("../data/tumor_filtered.csv")

median_tumor_size <- tumor_subset %>% 
  filter(Day == 0) %>% 
  summarise(tumor_size = median(Size))

q1_size <- tumor_subset %>% 
  filter(Day == 0) %>% 
  summarise(q1 = quantile(Size, probs = .25))

quantile_plot <- ggplot(filter(tumor_subset, Day == 0), aes(Size)) + 
  geom_histogram(aes(y=..density..), colour="gray", fill="white", bins = 12) + 
  geom_density() + 
  geom_vline(xintercept = q1_size[["q1"]], color = "#7570b3", lwd = .9) + 
  geom_vline(xintercept = median_tumor_size[["tumor_size"]], color = "#d95f02", lwd = .9) + 
  geom_label(label = "first quartile\nof data values", x = q1_size[["q1"]] - 1.5, y = .02, color = "#7570b3") + 
  geom_label(label = "median = 50th\npercentile", x = median_tumor_size[["tumor_size"]] + 5, y = .01, color = "#d95f02") + 
  theme(axis.text.y = element_blank()) + 
  labs(y=NULL)

png("../fig/quantile-plot.png")
quantile_plot
dev.off()

