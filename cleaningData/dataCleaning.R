# ==========================================================================

# DATA SCIENCE SEMINAR, FALL 2016, WEEK 03

# ==========================================================================

library("ggplot2")

# ==========================================================================

# set your working directory
# examples:
# Mac OSX = setwd("/Users/jdoe/Desktop")
# Windows, Personal = setwd("C:/Users/jdoe/Desktop")
# Windows, SLU Labs = setwd("E:/Users/jdoe/Desktop")

setwd("/Users/herb/Desktop")

# ==========================================================================

# file name - seminar-03-dataClean.R

# project name - data science seminar, fall 2016

# purpose - week 03 examples - getting data ready for plotting

# created - 7 Nov 2016

# updated - 7 Nov 2016

# author - Chris

# ==========================================================================

# full description - this file contains the code for...

# updates - none

# ==========================================================================
# ==========================================================================

# 1. import data from your CSV file

df <- read.csv("Example_Dataset_NMS.csv", stringsAsFactors = FALSE)

# ==========================================================================

# 2.redefine condition as a factor variable (without value labels)

df$Condition <- as.factor(df$Condition)

# ==========================================================================

# 3. redefine gender as a factor variable (with value labels)

df$Gender <- factor(df$Gender, 
                    levels = c(1,2), 
                    labels = c("male", "female"))

# ==========================================================================

# 4. redefine Pre_Att_1 as an ordered factor (without value labels)

df$Pre_Att_1 <- as.ordered(df$Pre_Att_1)

# ==========================================================================

# 5. redefine Pre_Att_2 as an ordered factor (with value labels)

df$Pre_Att_2 <- ordered(df$Pre_Att_2, 
                        levels = c(1,2,3,4), 
                        labels = c("none", "low", "moderate", "high"))

# ==========================================================================

# 6. plots from Seminar-03 using current data

# scatterplot
ggplot(df, aes(Baseline_Heart, Mean_Heart)) + 
  geom_point()

# scatterplot with smoothed line
ggplot(df, aes(Baseline_Heart, Mean_Heart)) + 
  geom_point() + 
  geom_smooth()

# scatterplot with linear regression line
ggplot(df, aes(Baseline_Heart, Mean_Heart)) + 
  geom_point() + 
  geom_smooth(method="lm")

# histogram
ggplot(df, aes(Baseline_Heart)) + 
  geom_histogram(binwidth=1)

# bar plot
ggplot(df, aes(Pre_Att_2)) + geom_bar()

# box plot
ggplot(df, aes(Pre_Att_2, Baseline_Heart)) + geom_boxplot()

# ==========================================================================
