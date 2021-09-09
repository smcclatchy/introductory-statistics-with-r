library(tidyverse)

groupMeans <- tumor_subset %>%
  filter(Day == 0) %>%
  group_by(Group) %>%
  summarize(avg_size = mean(Size),
            std_dev = sd(Size)
            )

sd_bar_plot <- ggplot(groupMeans, aes(x = Group, y = avg_size)) +
  geom_bar(position=position_dodge(), 
           stat="identity", fill = "lightblue", color = "gray") +
  geom_errorbar(aes(ymin=avg_size-std_dev, ymax=avg_size+std_dev),
                size=.3, width=.2) +
  ylab("Mean tumor size") +
  ggtitle("Mean tumor size and standard deviations of four experimental groups")

png("../fig/sd-bar-plot.png")
sd_bar_plot
dev.off()
  
