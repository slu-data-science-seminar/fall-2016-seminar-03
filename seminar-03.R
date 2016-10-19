# ==========================================================================

# DATA SCIENCE SEMINAR, FALL 2016, WEEK 02

# ==========================================================================

# set your working directory
# examples:
# Mac OSX = setwd("/Users/jdoe/Desktop")
# Windows, Personal = setwd("C:/Users/jdoe/Desktop")
# Windows, SLU Labs = setwd("E:/Users/jdoe/Desktop")

setwd("~/Documents/SLU/R Group/Fall 2016")

# ==========================================================================

# file name - seminar-03.R

# project name - data science seminar, fall 2016

# purpose - week 03 examples, exploring ggplot2's grammar

# created - 13 Oct 2016

# updated - 13 Oct 2016

# author - CHRISTY

# ==========================================================================

# full description - this file contains the code for...

# updates - none

# ==========================================================================
# ==========================================================================

# 1. import data from your CSV file

# ==========================================================================

#before you import your data, make sure ggplot2 is installed and loaded

datasetname <- read.csv("XXX.csv") 
# as long as it is in the same working directory (folder), all you need is the file name to open in Rstudio


# ==========================================================================

# 2. exploring/ploting your own data

# ==========================================================================

print(head()) # print list of first six observations
print(tail()) # print list of last six observations
summary()

#histogram
hist() #(dataset$variable)

#plot with continuous variables -- scatter plot w/ correlation line
plot(dataset$contvariable1,dataset$contvariable2)
fit=lm(dataset$contvariable1~dataset$contvariable2)
abline(fit)

#plot with categorical variable -- barplot
plot(dataset$catvariable)

#plot with one categorical, one continuous -- boxplot
plot(dataset$catvariable, dataset$contvariable)

#same types of plots stylized with qplot
qplot(dataset$catvariable)
qplot(dataset$contvariable)
qplot(dataset$contvariable, binwidth=50) #change the binwidth
qplot(dataset$catvariable, dataset$contvariable)

# ==========================================================================

# 3. basics of ggplot2

# ==========================================================================

#for these examples, we'll use the mpg dataset that comes with ggplot2
#it contains EPA fuel economy data for popular car models in 1999 and 2008
summary(mpg)

#three basics of gglplot2 (will not work unless all three specified):
#1. data -- name of dataset you would like to plot from (WHAT DATA)
#data: mpg
#specified within ggplot() command
ggplot(mpg,     )


#2. aesthetics -- mapping between data and visual properties (WHICH VARIABLES TO PLOT & AESTHETIC FEATURES)
#What is the relationship between engine size (displ) and fuel economy (hwy)?
#x axis is mapped to displ, y is mapped to hwy
#specified within ggplot() command
ggplot(mpg, aes(x = displ, y = hwy))


#3. geoms -- layers that describe how to render the plot (HOW TO PLOT - WHAT KIND OF PLOT)
#layer: points -> scatterplot
#specified outside of main command with +
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

#most plots will have x and y so you can leave these terms out and ggplot will assume
#the first is x and the second is y
ggplot(mpg, aes(displ, hwy)) + geom_point()

#options for geoms
#geom_point(), geom_histogram(), geom_bar(), geom_boxplot(), geom_line()
ggplot(mpg, aes(hwy)) + geom_histogram(binwidth=2)
ggplot(mpg, aes(manufacturer)) + geom_bar()
ggplot(mpg, aes(drv, hwy)) + geom_boxplot()
#geom_line() would be used for time series data, which we don't have in this dataset (for instance unemployment over time)

#added features: geom_smooth - smooth curve with confidence interval
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth()
#line of best fit with linear model
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth(method="lm")

# ==========================================================================


# ==========================================================================





