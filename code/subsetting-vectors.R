animals <- c("mouse", "rat", "dog", "cat")
animals[1]
animals[3]

animals[c(2,3)]

more_animals <- animals[c(1, 2, 3, 2, 1, 4)]
more_animals

weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, TRUE, FALSE, FALSE)]
weight_g

weight_g > 50
weight_g[weight_g > 50]

weight_g[weight_g > 30 & weight_g < 50]
weight_g[weight_g <= 40 | weight_g == 55]

animals <- c("mouse", "rat", "dog", "cat", "cat")
animals[animals == "cat" | animals == "rat"]

animals %in% c("rat", "cat", "dog", "duck", "goat")
animals[animals %in% c("rat", "cat", "dog", "duck", "goat")]


