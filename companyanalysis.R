     # RUGOGAMU NOELA COMPANY ANALYSIS PROEJCT
setwd("C:/Users/opg/Desktop/COMPANY ANALYSIS PROJECT")
getwd()
      
#INSTALLING REQUIRED PACKAGES
install.packages("ggthemes")
install.packages("lubridate")
#LOADING REQUIRED PACKAGES
library(tidyverse)
library(tidyselect)
library(dplyr)
library(readxl)
library(data.table)
library(ggplot2)
library(ggthemes)
library(lubridate)
library(scales)

#LOADING THE DATASET
df <- read_excel("Companies - Analysis.xlsx")

#SLIGHT VIEW OF OUR DATA
glimpse(df)
head(df)

#VIEW DATA STRUCTURE
str(df)
summary(df)

#HANDLIG MISSING DATA AND OUTLIERS
#Checking if the dataset has any missing values
sum(is.na(df))

#showing how many columns with how many missing values 
colSums(is.na(df))

#getting rid of missing values
# To drop that column that  was completely empty
df1 <- df[, colSums(is.na(df)) < nrow(df)]
#This was to prove and see if that column that was completely empty has been dropped
head(df1)

#Removing duplicates
# Remove duplicates
df2 <- df1 %>% distinct()

# 1. NOMINAL SHARE CAPITAL
ggplot(df2, aes(x=`Nominal Share Capital`))+
  geom_histogram(fill = "blue",bins = 30, color = "black")+
  labs(title = "Distribution of Nominal Share capital",
       x = "Nominal Share Capital", y = "Count")
#So since our plot is skewed we're gonna use median
#IMPUTING MISSING VALUES USING MEDIAN
df2$`Nominal Share Capital`[is.na(df2$`Nominal Share Capital`)] <- median(df2$`Nominal Share Capital`, na.rm = TRUE)

sum(is.na(df2$`Nominal Share Capital`))

# 2. LAST YEAR COMPANY FIELD RETURNS
ggplot(df2, aes(x=`Last Year Company Filed Returns`))+
  geom_histogram(fill = "green", bins = 30, color = "purple")+
  labs(title = "Distribution of last years company filed returns",
       x= "Last Year Company Filed Returns", y = "Count")
#IMPUTING MISSING VALUES USING MEDIAN
df2$`Last Year Company Filed Returns`[is.na(df2$`Last Year Company Filed Returns`)] <- median(df2$`Last Year Company Filed Returns`, na.rm = TRUE)

sum(is.na(df2$`Last Year Company Filed Returns`))

# 3. COUNTRY OF INCORPORATION
#So since this is a categoroical variable we're gonna compute missing values by
#replacing misisng values with a placeholder (e.g "Unknown")
df2$`Country Of Incorporation`[is.na(df2$`Country Of Incorporation`)] <- "Unknown"

sum(is.na(df2$`Country Of Incorporation`))

# 4. NUMBER OF SHARES
#First we visualize the column and know which method to use
ggplot(df2, aes(x=`Number Of Shares`))+
  geom_histogram(fill = "darkorange", bins = 30, color = "black")+
  labs(title = "Distribution of number of shares",
       x= "Number of Shares", y = "Count")
#IMPUTING MISSING VALUES USING MEDIAN
df2$`Number Of Shares`[is.na(df2$`Number Of Shares`)] <- median(df2$`Number Of Shares`, na.rm = TRUE)

sum(is.na(df2$`Number Of Shares`))

df3 <-






