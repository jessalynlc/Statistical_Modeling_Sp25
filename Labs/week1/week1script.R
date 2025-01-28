#ENV710 Lab Week 1 Script
#Jessalyn Chuang
#1/15/25

#Intro-----------------------------------------------------------------------
pizza <- 10
pasta <- 2
italian <- pizza*pasta

#install.packages("palmerpenguins")

library(tidyverse)
library(palmerpenguins)
library(ggplot2)

#load data
df <- penguins

#inspect data
View(df)

#Data Exploration------------------------------------------------------------

#How many different kinds of penguin species are there?
unique(df$species)

#What are the minimum and maximum bill lengths (in millimeters)?
#Use na.rm = TRUE to remove NAs from a dataset
min(df$bill_length_mm, na.rm = TRUE)
max(df$bill_length_mm, na.rm = TRUE)

#What is their mean bill length (in millimeters)?
mean(df$bill_length_mm, na.rm = TRUE)

#What is their median bill depth (in millimeters)?
median(df$bill_length_mm, na.rm = TRUE)

#What is the standard deviation in flipper length (in millimeters)?
sd(df$flipper_length_mm, na.rm = TRUE)

#Column names:species (qualitative, discrete), island (qualitative, discrete), 
#bill_length_mm (quantitative, continuous), bill_depth_mm (quantitative, continuous), 
#flipper_length_mm (quantitative, discrete), body_mass_g (quantitative, discrete), 
#sex (qualitative, binary), year (quantitative, discrete)

#Create a scatterplot.
fig1 <- ggplot(data = df, #specify data
               aes(x= bill_length_mm, #x axis
                   y = bill_depth_mm, #y axis
                   color = species)) + #and coloration to create base plot
  geom_point() + #add points
  scale_color_manual(values = c("darkorange",
                                "purple",
                                "cyan4")) + #customize colors
  labs(x = "Bill Length(mm)", 
       y = "Bill Depth (mm)", color = "Species",
       title = "Penguin Data from Antarctica LTER") + #add labels
  theme_bw() #remove gray background

#Print plot
fig1

#Export plot
ggsave(fig1, #reference the plot you are exporting
       filename = "penguin_plot.jpg", #figure filename
       height = 12,
       width = 15,
       units = "cm") #units can also be in 'in', 'mm', and 'px'
