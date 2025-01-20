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
#mean value = 4.201754 kg

#b. What is the median penguin body mass (in kilograms)?
median <- median(df$body_mass_kg, na.rm = TRUE) 
cat("The median penguin body mass is", median, "kg.")
#median value = 4.05 kg

#c. What are the 5th and 95th percentile penguin body masses (in kilograms)?
quantile <- quantile(df$body_mass_kg, probs = c(0.05,0.95), na.rm = TRUE) 
cat("The 5th percentile penguin body mass is", quantile[1], "kg.")
cat("The 95th percentile penguin body mass is", quantile[2], "kg.")
#5th percentile = 3.15 kg
#95th percentile = 5.65 kg

#(2) Measures of spread----
#a. What is the range in penguin body mass (in kilograms)?
range_vals <- range(df$body_mass_kg, na.rm = TRUE)
range <- range_vals[2] - range_vals[1]
cat("The range in penguin body mass is", range, "kg.")
#range = 3.6 kg

#b. What is the standard deviation in penguin body mass (in kilograms)?
standard_dev <- sd(df$body_mass_kg, na.rm = TRUE)
cat("The standard deviation in penguin body mass is", standard_dev, "kg.")
#standard deviation = 0.8019545 kg

#c. What is the variance in penguin body mass (in kilograms)?
variance <- var(df$body_mass_kg, na.rm = TRUE)
cat("The variance in penguin body mass is", variance, "kg.")
#variance = 0.6431311 kg

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
       caption = "This Jitter plot shows the distribution of penguin body mass in kilograms 
       across three islands: Biscoe, Dream, and Torgersen. Three species are analyzed: 
       Adelie penguins (orange dots), Chinstrap penguins (purple dots),
      and Gentoo penguins (green dots).")+
  theme(plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5))

body_mass_fig

#Export plot
ggsave(body_mass_fig,
       filename = "assignment1.jpg",
       height = 12,
       width = 15,
       units = "cm") #units can also be in 'in', 'mm', and 'px'

#b. Write a figure caption describing the contents of the figure.
#Caption included in the plot and says:
#This Jitter plot shows the distribution of penguin body mass in kilograms 
#across three islands: Biscoe, Dream, and Torgersen. Three species are analyzed: 
#Adelie penguins (orange dots), Chinstrap penguins (purple dots),
#and Gentoo penguins (green dots).

#c. What do you notice about the species distribution across the islands?
#Biscoe has two species recorded, Adelie and Gentoo, with Gentoo predominantly 
#having higher body masses. On Dream Island, only Adelie and Chinstrap species 
#were recorded, and they have very similar body mass distributions. Finally, only 
#Adelie species were recorded on Torgersen Island. Across the three islands, 
#the Adelie species' body mass falls in a similar range.

#d. How do the raw values of penguin body mass compare to the mean penguin body 
#mass you calculated above?
#The calculated mean of 4.201754 kg lies slightly above the midpoint of the range 
#of the raw values. Many Adelie and some Chinstrap have body masses below the mean.
#Most Gentoo have body masses above the mean, making up most of the higher 
#end of the distribution. The Adelie and Chinstrap with their lower body masses overall
#bring the mean closer to 4.2 kg while the Gentoo, being heavier on average, push the 
#mean higher than it would otherwise be without them. Thus, the mean body mass for Dream Island 
#and Torgersen Island alone would probably be lower than 4.2 kg, as Gentoo penguins, which have 
#the highest body masses, are not on these islands. This value is calculated to check this
#statement: 
mean_dream_torgersen <- mean(df$body_mass_kg[df$island %in% c("Dream", "Torgersen")], na.rm = TRUE)
cat("The mean penguin body mass of just the two islands is", mean_dream_torgersen, "kg.")
#mean_dream_torgersen = 3.711 kg
