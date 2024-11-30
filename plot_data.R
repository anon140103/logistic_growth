
install.packages("ggplot2")
library(ggplot2)

growth_data <- read.csv("experiment.csv")

# Basic scatter plot of t vs N
ggplot(aes(x = t, y = N), data = growth_data) + 
  geom_point() +
  xlab("Time (minutes)") +
  ylab("Population Size (N)") +
  theme_bw()


# Log-transformed plot of t vs N
ggplot(aes(x = t, y = N), data = growth_data) +  
  geom_point() +
  xlab("Time (minutes)") +
  ylab("Population Size (N)") +
  scale_y_continuous(trans = 'log10') +
  theme_bw()
