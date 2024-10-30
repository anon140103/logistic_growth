#Script to plot the logistic growth data


install.packages("ggplot2")
library(ggplot2)

growth_data <- read.csv("experiment.csv")

# Basic scatter plot of t vs N
ggplot(aes(x = t, y = N), data = growth_data) +  # Replace 't' and 'N' with actual column names
  geom_point() +
  xlab("t") +
  ylab("population") +
  theme_bw()


# Log-transformed plot of t vs N
ggplot(aes(x = t, y = N), data = growth_data) +  # Replace 't' and 'N' with actual column names
  geom_point() +
  xlab("t") +
  ylab("population") +
  scale_y_continuous(trans = 'log10') +
  theme_bw()
