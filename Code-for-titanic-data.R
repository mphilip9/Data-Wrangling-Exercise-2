library(dplyr)
library(tidyr)

tbl_df(titanic)

# Checking for NA values in embarked column
titanic %>% filter(is.na(titanic$embarked))

#Replacing NA values in embarked column
titanic$embarked[is.na(titanic$embarked)] <- "S"

#Checking for NA values in Age column
titanic %>% filter(is.na(titanic$age))

#Converting age to num, replacing NA values with mean
titanic$age <- as.numeric(as.character(titanic$age))

titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm = TRUE)

#checking for NA values in boat column
titanic %>% filter(is.na(titanic$boat))

#replacing missing values in boat column with "NA" string
titanic$boat[is.na(titanic$boat)] <- "NA"

#missing cabin numbers could possibly mean that the person did not purchase a room. NA values should be converted to a str in order to analyze the column
titanic$cabin[is.na(titanic$cabin)] <- "NA"
titanic_clean <- titanic %>% mutate(has_cabin_number = ifelse(cabin == "NA", 0, 1))

write.csv(titanic_clean, 'titanic_clean.csv')
write.csv(titanic, 'titanic_original.csv')
