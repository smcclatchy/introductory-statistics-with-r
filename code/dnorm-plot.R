library(tidyverse)

dnorm_plot <- ggplot(data.frame(x = c(-4, 4)), aes(x)) + 
  stat_function(fun = dnorm, args = list(mean = 0, sd = .5), col='#d95f02') +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 1), col='#1b9e77') +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 2), col='#7570b3') + 
  geom_label(label = "sd = 2", x = -2.5, y = .15, color = "#7570b3") + 
  geom_label(label = "sd = 1", x = -1.75, y = .2, color = "#1b9e77") + 
  geom_label(label = "sd = 0.5", x = -1.5, y = .35, color = "#d95f02") +
  labs(title = "Standard deviation shows the spread around the mean")

png("../fig/dnorm-plot.png")
dnorm_plot
dev.off()