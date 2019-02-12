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
