
install.packages(ggplot)
library("ggplot2")

# Define the logistic growth function
logistic_fun <- function(t) {
  N <- (N0 * K * exp(r * t)) / (K - N0 + N0 * exp(r * t))
  return(N)
}

# Set parameters for the logistic model
N0 <- exp(6.888e+00)      # Initial population size (From Scenario 1)
r <- 1.002e-02       # Growth rate (From Scenario 1)
K <- 5.979e+10       # Carrying capacity (From Scenario 2)

# Plot the data and the logistic model
ggplot(aes(x = t, y = N), data = growth_data) +  
  geom_function(fun = logistic_fun, colour = "red") +
  geom_point() +
  scale_y_continuous(trans = 'log10') + 
  xlab("Time (Minutes)") +
  ylab("Population Size (N)")





