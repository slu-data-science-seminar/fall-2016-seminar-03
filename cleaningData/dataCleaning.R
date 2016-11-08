# ==========================================================================

# DATA SCIENCE SEMINAR, FALL 2016, WEEK 03

# ==========================================================================

library("ggplot2")
library("tidyr")
library("dplyr")

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

# created - 07 Nov 2016

# updated - 08 Nov 2016

# author - Chris

# ==========================================================================

# full description - this file contains code for illustrating data cleaning
# techniques using base R, tidyr, and dplyr.

# updates - 
# 08 Nov 2016 - updated variable names to reflect trimmed dataset
# 08 Nov 2016 - added examples for 

# ==========================================================================
# ==========================================================================

# 1. import data from your CSV file

df <- read.csv("clinicData.csv", stringsAsFactors = FALSE)

# ==========================================================================

# 2.redefine condition as a factor variable (without value labels)

df$condition <- as.factor(df$condition)

# ==========================================================================

# 3. redefine gender as a factor variable (with value labels)

df$gender <- factor(df$gender, 
                    levels = c(1,2), 
                    labels = c("male", "female"))

# ==========================================================================

# 4. redefine preAtt1 as an ordered factor (without value labels)

df$preAtt1 <- as.ordered(df$preAtt1)

# ==========================================================================

# 5. redefine preAtt2 as an ordered factor (with value labels)

df$preAtt2 <- ordered(df$preAtt2, 
                        levels = c(1,2,3,4), 
                        labels = c("none", "low", "moderate", "high"))

# ==========================================================================

# 6. split site into two variables, convert new variables to factors

df <- separate(df, site, c("type", "facility"), sep = " ", remove = FALSE)
df$type <- as.factor(df$type)
df$facility <- as.factor(df$facility)

# ==========================================================================

# 7. recode site into binary variable for private hospital

df <- mutate(df, pvtHosp = ifelse(site == "Private Hospital", TRUE, FALSE))

# ==========================================================================

# 8. recode base heartrate into a binary variable

df <- mutate(df, highHeart = ifelse(meanHeart > 71.95, TRUE, FALSE))

# ==========================================================================

# 9. reorder columns
df <- df[, c(1,2,3,4,11,5,6,7,8,9,12,10)]

# ==========================================================================

# x. plots from Seminar-03 using current data

# scatterplot
ggplot(df, aes(baseHeart, meanHeart)) + 
  geom_point()

# scatterplot with smoothed line
ggplot(df, aes(baseHeart, meanHeart)) + 
  geom_point() + 
  geom_smooth()

# scatterplot with linear regression line
ggplot(df, aes(baseHeart, meanHeart)) + 
  geom_point() + 
  geom_smooth(method="lm")

# histogram
ggplot(df, aes(baseHeart)) + 
  geom_histogram(binwidth=1)

# bar plot
ggplot(df, aes(preAtt2)) + geom_bar()

# box plot
ggplot(df, aes(preAtt2, baseHeart)) + geom_boxplot()

# ==========================================================================
