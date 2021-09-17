heights <- c(2, 4, 4, NA, 6)
mean(heights)

max(heights)

mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

heights[!is.na(heights)]
na.omit(heights)

heights[complete.cases(heights)]

typeof(heights)
