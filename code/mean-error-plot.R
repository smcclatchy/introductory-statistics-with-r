library(tidyverse)

groupMeans <- tumor_subset %>%
  filter(Day == 0) %>%
  group_by(Group) %>%
  summarize(avg_size = mean(Size),
            std_dev = sd(Size)
  )

mean_error_plot <- ggplot(groupMeans, aes(x = Group, y = avg_size)) +
  geom_point(color = "lightblue") +
  geom_errorbar(aes(ymin=avg_size-std_dev, ymax=avg_size+std_dev),
                size=.3, width=.2, color = "gray") +
  ylab("Mean tumor size") +
  theme_minimal() +
  ggtitle("Mean tumor size and standard deviations of four experimental groups")

png("../fig/mean-error-plot.png")
mean_error_plot
dev.off()

