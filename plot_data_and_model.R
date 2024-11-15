#Script to plot data and model



# Define the logistic growth function
logistic_fun <- function(t) {
  N <- (N0 * K * exp(r * t)) / (K - N0 + N0 * exp(r * t))
  return(N)
}

# Set parameters for the logistic model
N0 <- 879       # Initial population (from excel file)
r <- 0.0100086        # Growth rate (0.0100086, taken from the initial linear model)
K <- 5.979e+10       # Carrying capacity, from the second linear model, gives you the intercept, which is the number of individuals at carrying capacity

# Plot the data and the logistic model
ggplot(aes(x = t, y = N), data = growth_data) +  # Replace 't' and 'N' with your actual column names
  geom_function(fun = logistic_fun, colour = "red") +
  geom_point() +
  xlab("Time") +
  ylab("Population")


# Uncomment the following line if you want to use a log scale on the y-axis
scale_y_continuous(trans = 'log10')


