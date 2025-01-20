#ENV710 Week 1 Assignment
#Jessalyn Chuang
#1/15/25

library(palmerpenguins)
library(tidyverse)
library(ggplot2)

df <- penguins
g_to_kg <- 1/1000
#Create new column for body mass in kg to avoid converting everytime
df$body_mass_kg <- df$body_mass_g * g_to_kg

#(1) Measures of location----
#a. What is the mean penguin body mass (in kilograms)?
mean <- mean(df$body_mass_kg, na.rm = TRUE) 
cat("The mean penguin body mass is", mean, "kg.")

#b. What is the median penguin body mass (in kilograms)?
median <- median(df$body_mass_kg, na.rm = TRUE) 
cat("The median penguin body mass is", median, "kg.")

#c. What are the 5th and 95th percentile penguin body masses (in kilograms)?
quantile <- quantile(df$body_mass_kg, probs = c(0.05,0.95), na.rm = TRUE) 
cat("The 5th percentile penguin body mass is", quantile[1], "kg.")
cat("The 95th percentile penguin body mass is", quantile[2], "kg.")

#(2) Measures of spread----
#a. What is the range in penguin body mass (in kilograms)?
range_vals <- range(df$body_mass_kg, na.rm = TRUE)
range <- range_vals[2] - range_vals[1]
cat("The range in penguin body mass is", range, "kg.")

#b. What is the standard deviation in penguin body mass (in kilograms)?
standard_dev <- sd(df$body_mass_kg, na.rm = TRUE)
cat("The standard deviation in penguin body mass is", standard_dev, "kg.")

#c. What is the variance in penguin body mass (in kilograms)?
variance <- var(df$body_mass_kg, na.rm = TRUE)
cat("The variance in penguin body mass is", variance, "kg.")

#(3) Visualize Data----
#a. Make a scatterplot of penguin body mass (in kilograms, on the y axis) by 
#island (on the x axis) and color the points by species. Use geom_jitter() 
#instead of geom_point() to spread the points out and better see their distribution
body_mass_fig <- ggplot(data = df,
                        aes(x = island,
                            y = body_mass_kg,
                            color = species)) +
  geom_jitter() +
  scale_color_manual(values = c("darkorange",
                                "purple",
                                "green")) +
  labs(x = "Island",
       y = "Body Mass (kg)",
       title = "Penguin Body Mass by Island",
       color = "Species",
       caption = "This figure shows how ")

body_mass_fig

#Export plot
ggsave(body_mass_fig,
       filename = "assignment1.jpg",
       height = 12,
       width = 15,
       units = "cm") #units can also be in 'in', 'mm', and 'px'

#b. Write a figure caption describing the contents of the figure.
#See figure above

#c. What do you notice about the species distribution across the islands?

#d. How do the raw values of penguin body mass compare to the mean penguin body 
#mass you calculated above?