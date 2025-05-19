     # RUGOGAMU NOELA COMPANY ANALYSIS PROEJCT
setwd("C:/Users/opg/Desktop/COMPANY ANALYSIS PROJECT")
getwd()
      
#LOADING REQUIRED PACKAGES
library(tidyverse)
library(tidyselect)
library(dplyr)
library(readxl)
library(data.table)
library(ggplot2)

#LOADING THE DATASET
df <- read_excel("Companies - Analysis.xlsx")

#SLIGHT VIEW OF OUR DATA
glimpse(df)
head(df)

#HANDLIG MISSING DATA AND OUTLIERS
#Checking if the dataset has any missing values
sum(is.na(df))

