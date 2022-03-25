# this script explore descriptive statistics of the tumor growth data

# load the library and the data
library(tidyverse)

tumor <- read_csv("../data/medicaldata_tumorgrowth.csv")

# subset the data to include only days 0 and 13
filtered <- tumor %>%
  select(Group, ID, Day, Size) %>%
  filter(Day == 0 | Day == 13)

# write out the data subset to the data directory
write_csv(filtered, file = "../data/tumor_filtered.csv")

# now read it in again
tumor_subset <- read_csv(file = "../data/tumor_filtered.csv")
tumor_subset

tumor_subset$Group %>%
  unique()

tumor_subset %>%
  count(Group)

tumor_subset$Day %>%
  unique()

tumor_subset %>%
  count(Day)

tumor_subset %>%
  count(Group, Day)

tumor_subset$Size %>%
  mean()

tumor_subset$Size %>%
  range()

tumor_subset %>%
  filter(Day == 0) %>%
  pull(Size) %>%
  mean()

tumor_subset %>%
  filter(Group == 1, Day == 0) %>%
  pull(Size) %>%
  mean()

tumor_subset %>%
  filter(Day == 0) %>%
  pull(Size) %>%
  sd()

tumor_subset %>%
  filter(Day == 13) %>%
  pull(Size) %>%
  sd()

tumor_subset %>%
  filter(Day == 0) %>%
  pull(Size) %>%
  hist(main = "Histogram of tumor size on day 0")

tumor_subset %>%
  filter(Day == 13) %>%
  pull(Size) %>%
  hist(main = "Histogram of tumor size on day 13")

tumor_subset %>%
  filter(Day == 0) %>%
  group_by(Group) %>%
  summarize(avg_size = mean(Size),
            std_dev = sd(Size))

tumor_subset %>%
  filter(Day == 0) %>%
  summarize(quartile_1 = quantile(Size, probs = .25))

tumor_subset %>%
  group_by(Group) %>%
  filter(Day == 0) %>%
  summarize(avg_size = mean(Size),
            sd_size = sd(Size),
            median_size = median(Size),
            quartile_1 = quantile(Size, probs = .25)
  )





