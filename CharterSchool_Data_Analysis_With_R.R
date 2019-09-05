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
#My data analysis:

summary(selected_Girls_Prep_Data)
plot_str(selected_Girls_Prep_Data)
plot_missing(selected_Girls_Prep_Data) #shows that there is no missing data
plot_histogram(selected_Girls_Prep_Data)
plot_bar(selected_Girls_Prep_Data)
 