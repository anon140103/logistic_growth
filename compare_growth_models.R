
install.packages("ggplot2")
library(ggplot2)

# Define parameters based on model
N0 <- exp(6.888e+00)  # Initial population size derived from estimates
r <- 1.002e-02        # Estimated growth rate
K <- 5.979e+10        # Carrying capacity estimate

# Define the logistic growth function
logistic_fun <- function(t) {
  (N0 * K * exp(r * t)) / (K - N0 + N0 * exp(r * t))
}

# Define the exponential growth function
exp_fun <- function(t) {
  N0 * exp(r * t)
}

# Generate a sequence of time points for model predictions
time_points <- seq(0, 5000, by = 10)

# Create a data frame with predictions for both models
model_data <- data.frame(
  Time = time_points,
  Logistic = sapply(time_points, logistic_fun),
  Exponential = sapply(time_points, exp_fun)
)

ggplot() +
  # Add logistic growth model as a line
  geom_line(aes(x = Time, y = Logistic), data = model_data, color = "#17BECF", size = 1.2) +
  
  # Add exponential growth model as a line
  geom_line(aes(x = Time, y = Exponential), data = model_data, color = "#FF33CC", size = 1.2) +
  
  # Add label for the logistic model
  geom_text(
    aes(x = 2500, y = logistic_fun(1000), 
        label = "Logistic model"), 
    color = "#17BECF", 
    vjust = -0.5, 
    hjust = -0.25, 
    size = 6  
  ) +
  
  # Add label for the exponential model
  geom_text(
    aes(x = 1700, y = exp_fun(1500), 
        label = "Exponential model"), 
    color = "#FF33CC", 
    vjust = -5, 
    hjust = 0.6, 
    size = 6  
  ) +
  
  # Apply log scale to y-axis
  scale_y_continuous(trans = 'log10') +
  
  # Customise plot 
  theme_minimal() +
  labs(
    title = "Comparison of Logistic and Exponential Growth Models",
    x = "Time (minutes)", 
    y = "Population Size (Log N)"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)
  )

# Save the plot as an image file
ggsave("growth_model_comparison.png", width = 10, height = 6)
