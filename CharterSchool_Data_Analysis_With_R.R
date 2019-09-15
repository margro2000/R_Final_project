#Analysis of Charter School Data for Open R Minimester Course
#Author: Margarita Groisman (margarita.groisman@gatech.edu)
#2019-09-14

install.packages("tidyverse")
install.packages('DataExplorer')
library(DataExplorer)
library(tidyverse)
getwd()
setwd("/Users/mg/repos")
df <- read.csv("2013-2017_Charter_School_Math_Results_-_All.csv", header = FALSE)
colnames(df)
rownames(df)
summary(df)
plot(df)

filter(df)

#My data transformations:

#This provides data for just the school with DBN "84M330", the GIRLS PREPARATORY CHARTER SCHOOL OF NEW YORK
filter(df, V1=="84M330")
#set this into variable
Girls_Prepatory_Data <- filter(df, V1=="84M330")

#Select only useful columns and create new Var
selected_Girls_Prep_Data <- select(Girls_Prepatory_Data, "V1", "V3", "V6":"V17")

#now this specific school with specific set of data has been filteres and selected and is ready for analysis

#My explatory data analysis:

summary(selected_Girls_Prep_Data)
plot_str(selected_Girls_Prep_Data)

plot_missing(selected_Girls_Prep_Data) #shows that there is no missing data
plot_histogram(selected_Girls_Prep_Data)
plot_bar(selected_Girls_Prep_Data)

#My decision tree data model

summary(selected_Girls_Prep_Data)

selected_Girls_Prep_Data <- selected_Girls_Prep_Data %>% filter(!is.na(V1))


set.seed(4034)

grade <- createDataPartition(y=selected_Girls_Prep_Data$V1, p=0.8, list=F)
training <- selected_Girls_Prep_Data[grade,] 
testing <- selected_Girls_Prep_Data[grade,]

decisionTree <- rpart(V1 ~ . , data = training, cp=0.12)

#Visualize my model
View(decisionTree)
fancyRpartPlot(decisionTree)

