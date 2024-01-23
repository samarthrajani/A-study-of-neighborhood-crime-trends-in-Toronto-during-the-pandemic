#### Preamble ####
# Purpose: Cleans the raw crime data[...UPDATE THIS...]
# Author: Samarth Rajani [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

### Loading the data ###
raw_data <- read_csv("raw_data.csv")

### Cleaning the data

# Get rid of rate related columns
cleaned_data <- raw_data[,!grepl("*RATE",names(raw_data))]
cleaned_data <- cleaned_data[,!grepl("*HOOD",names(cleaned_data))]
cleaned_data <- cleaned_data[,!grepl("*id",names(cleaned_data))]
cleaned_data <- cleaned_data[,!grepl("*POPULATION",names(cleaned_data))]
cleaned_data <- cleaned_data[,!grepl("*geometry",names(cleaned_data))]

# Get rid of columns with data from 2014-218
cleaned_data <- cleaned_data[,!grepl("_2014$",names(cleaned_data))]
cleaned_data <- cleaned_data[,!grepl("_2015$",names(cleaned_data))]
cleaned_data <- cleaned_data[,!grepl("_2016$",names(cleaned_data))]
cleaned_data <- cleaned_data[,!grepl("_2017$",names(cleaned_data))]
cleaned_data <- cleaned_data[,!grepl("_2018$",names(cleaned_data))]



# Fill in missing values with the median of that column

list_na <- colnames(cleaned_data)[ apply(cleaned_data, 2, anyNA)]
list_na

cleaned_data$BIKETHEFT_2023[is.na(cleaned_data$BIKETHEFT_2023)]<- median(cleaned_data$BIKETHEFT_2023,na.rm = TRUE)

cleaned_data$HOMICIDE_2019[is.na(cleaned_data$HOMICIDE_2019)]<- median(cleaned_data$HOMICIDE_2019,na.rm = TRUE)
cleaned_data$HOMICIDE_2020[is.na(cleaned_data$HOMICIDE_2020)]<- median(cleaned_data$HOMICIDE_2020,na.rm = TRUE)
cleaned_data$HOMICIDE_2021[is.na(cleaned_data$HOMICIDE_2021)]<- median(cleaned_data$HOMICIDE_2021,na.rm = TRUE)
cleaned_data$HOMICIDE_2022[is.na(cleaned_data$HOMICIDE_2022)]<- median(cleaned_data$HOMICIDE_2022,na.rm = TRUE)
cleaned_data$HOMICIDE_2023[is.na(cleaned_data$HOMICIDE_2023)]<- median(cleaned_data$HOMICIDE_2023,na.rm = TRUE)

cleaned_data$ROBBERY_2021[is.na(cleaned_data$ROBBERY_2021)]<- median(cleaned_data$ROBBERY_2021,na.rm = TRUE)
cleaned_data$ROBBERY_2022[is.na(cleaned_data$ROBBERY_2022)]<- median(cleaned_data$ROBBERY_2022,na.rm = TRUE)
cleaned_data$ROBBERY_2023[is.na(cleaned_data$ROBBERY_2023)]<- median(cleaned_data$ROBBERY_2023,na.rm = TRUE)

cleaned_data$SHOOTING_2019[is.na(cleaned_data$SHOOTING_2019)]<- median(cleaned_data$SHOOTING_2019,na.rm = TRUE)
cleaned_data$SHOOTING_2020[is.na(cleaned_data$SHOOTING_2020)]<- median(cleaned_data$SHOOTING_2020,na.rm = TRUE)
cleaned_data$SHOOTING_2021[is.na(cleaned_data$SHOOTING_2021)]<- median(cleaned_data$SHOOTING_2021,na.rm = TRUE)
cleaned_data$SHOOTING_2022[is.na(cleaned_data$SHOOTING_2022)]<- median(cleaned_data$SHOOTING_2022,na.rm = TRUE)
cleaned_data$SHOOTING_2023[is.na(cleaned_data$SHOOTING_2023)]<- median(cleaned_data$SHOOTING_2023,na.rm = TRUE)

cleaned_data$THEFTOVER_2019[is.na(cleaned_data$THEFTOVER_2019)]<- median(cleaned_data$THEFTOVER_2019,na.rm = TRUE)
cleaned_data$THEFTOVER_2020[is.na(cleaned_data$THEFTOVER_2020)]<- median(cleaned_data$THEFTOVER_2020,na.rm = TRUE)
cleaned_data$THEFTOVER_2021[is.na(cleaned_data$THEFTOVER_2021)]<- median(cleaned_data$THEFTOVER_2021,na.rm = TRUE)
cleaned_data$THEFTOVER_2022[is.na(cleaned_data$THEFTOVER_2022)]<- median(cleaned_data$THEFTOVER_2022,na.rm = TRUE)
cleaned_data$THEFTOVER_2023[is.na(cleaned_data$THEFTOVER_2023)]<- median(cleaned_data$THEFTOVER_2023,na.rm = TRUE)

view(cleaned_data)

write_csv(cleaned_data, "analysis_data.csv")
