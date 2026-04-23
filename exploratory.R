# Load necessary packages
library(rethinking)

## Load data
d <- read.csv('data/NHANES_Final_Adults_Cleaned.csv')

## rename all variables to lowercase 
names(d) <- tolower(names(d))

## histogram of `blood_pressure`
## distribution is right-skewed, few outliers, fairly smooth
hist(d$Blood_Pressure, xlab = "Blood Pressure", main = "Histogram of Blood Pressure")

## side-by-side boxplots of `blood_pressure` vs. `sex`
## sexes are centered roughly in the same area with similar spread
## high number of outliers (above) in each group
boxplot(blood_pressure ~ gender_label, data = d, xlab = "Sex", ylab = "Blood Pressure")

## side-by-side boxplots of `blood_pressure` vs. `sex`
## similar results for smoker/non-smoker
boxplot(blood_pressure ~ smoker_label, data = d, xlab = "Smoker", ylab = "Blood Pressure")

## scatterplot of `blood_pressure` vs. `age`
## age is truncated at 20 and 80 (participants had to be 18+, difficulty in finding adults over 80?)
## might be a slight positive association between the two, but blood pressure is all over the place at 80
plot(d$age, d$blood_pressure, xlab = "Age", ylab = "Blood Pressure")


## side-by-side boxplots of `blood_pressure` vs. `education_level`
boxplot(blood_pressure ~ education_label, data = d)

## pairwise correlation plots for numeric variables
## does not seem to be evidence of much collinearity, except for `weight_kg` and `bmi` (by definition)
pairs(d[,c("age", "blood_pressure", "weight_kg", "bmi")])

## what variables could be missing? income (education our best proxy), exercise (bmi our best proxy)
