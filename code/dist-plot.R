n = 500

# bimodal
y1 = rnorm(n, mean = 2, sd = 1)
y2 = rnorm(n, mean = 8, sd = 1)  # same SD
w = rbinom(n, 1, .5)                     
x2 = w*y1 + (1-w)*y2         

# uniform
unif <- runif(n, min = min(x2), max = max(x2))

# standard normal
stdNorm <- rnorm(n, mean = mean(x2), sd = 1)

png("../fig/dist-plot.png")
par(mfrow=c(1,3))
hist(x2, col="skyblue2",
     xlim=c(min(x2), max(x2)),
     main=NULL, 
     xlab = "A",
     ylab = NULL)
hist(unif, col="skyblue2",
     xlim=c(min(x2), max(x2)),
     main=NULL, 
     xlab = "B",
     ylab = NULL)
hist(stdNorm, col="skyblue2",
     xlim=c(min(x2), max(x2)),
     main=NULL, 
     xlab = "C",
     ylab = NULL)
par(mfrow=c(1,1))
dev.off()