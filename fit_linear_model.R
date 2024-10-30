#Script to estimate the model parameters using a linear approximation

#library(dplyr)

library(dplyr)



# Case 1: When K >> N0 and t is small (early stage of growth)
# Replace the placeholder value in t < ??? with a suitable threshold for the early stage, 1500 so that there are enough point
data_subset1 <- growth_data %>% filter(t < 1500) %>% mutate(N_log = log(N))  # Replace "some_threshold" with an appropriate value

# Fit a linear model on the log-transformed data for early growth
model1 <- lm(N_log ~ t, data = data_subset1)
summary(model1)

#the output of this will give you the value for r, the initial growth, it is the t estimate value


# Case 2: When N(t) is close to K (late stage of growth, where N approaches carrying capacity)
# Replace the placeholder value in t > ??? with a suitable threshold for the late stage
data_subset2 <- growth_data %>% filter(t > 2000)  # Replace "some_threshold2" with an appropriate value



# Fit a linear model assuming N is constant around the carrying capacity (K)
model2 <- lm(N ~ 1, data = data_subset2)
summary(model2)