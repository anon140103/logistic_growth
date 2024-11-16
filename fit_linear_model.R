#Script to estimate the model parameters using a linear approximation

#library(dplyr)

library(dplyr)



# Scenario 1: When K >> N0 and t is small (early stage of growth)
#Create a data subset with filtered values of t<1250, and a log transformed y axis
data_subset1 <- growth_data %>% filter(t < 1250) %>% mutate(N_log = log(N)) 

# Fit a linear model on the log-transformed data for early growth
model1 <- lm(N_log ~ t, data = data_subset1)
summary(model1)

#The output of this will give you the value for r, the initial growth (the t estimate value), 
#and the natural log of the size of the population at t=0 (the Intercept estimate value)


# Create a new data subset with filtered values for t>2250
data_subset2 <- growth_data %>% filter(t > 2250)

# Define the linear model assuming N is constant around the carrying capacity (K)
model2 <- lm(N ~ 1, data_subset2)
summary(model2)

#The output of this will give an estimate for K (the Intercept estimate value)
