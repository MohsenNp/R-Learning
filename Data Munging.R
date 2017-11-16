######### Data Munging #########

######### Apply Function
# It needs a matrix (not a df or ...) (if use pass df or list or ... to it --> it will convert it to matrix)
theMatrix <- matrix(1:9, nrow = 3)
theMatrix

apply(theMatrix, MARGIN = 2, sum) # Sum of every column --> colSums(theMatrix)
apply(theMatrix, MARGIN = 1, sum) # Sum of every Row    --> rowSums(theMatrix)

theMatrix[2, 1] <- NA

apply(theMatrix, MARGIN = 2, sum, na.rm = TRUE) # ignores the Missing Values in theMatrix --> colSums(theMatrix, na.rm = TRUE)
apply(theMatrix, MARGIN = 1, sum, na.rm = TRUE) # ignores the Missing Values in theMatrix --> rowSums(theMatrix, na.rm = TRUE)


########## lapply and sapply Function --> For lists

theList = list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
theList

lapply(theList, sum) # returns a list which has the sum of each elements of elements (:D) of the list
sapply(theList, sum) # returns a vector with the same function of lapply

theNames <- c('Mohsen', 'Ali', 'Fatemeh')
sapply(theNames, nchar)

########### mapply function --> Great for iterating over multiple lists

firstList <- list(A = matrix(1:16, 2), B = matrix(1:8, 2), C = 1:5)
secondList <- list(A = matrix(1:16, 2), B = matrix(1:8, 4), C = 15:1)

mapply(identical, firstList, secondList) # The First Argument is the function you want to use 

simplefunc <- function(x, y){
  NROW(x) + NROW(y)
}

mapply(simplefunc, firstList, secondList)


########### The Aggregate Function --> EZ and Fast
require(ggplot2)
data(diamonds)
head(diamonds) # Shine bright like a diamond! :)
mean(diamonds$price)

aggregate(price ~ cut, diamonds, mean) # For each cut in data compute the mean(price)
aggregate(price ~ cut, diamonds, mean, na.rm = TRUE) # Skip NA Data

aggregate(price ~ cut + color, diamonds, mean) # For each combination of (cut, color) compute the mean(price)

aggregate(cbind(price, carat) ~ cut, diamonds, mean) # For each cut compute the mean(price) and mean(carat)
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean) # For each combination of (cut, color) compute the mean(price) and mean(carat)


########## plyr Package
require(plyr)
head(baseball)

baseball$sf[baseball$year < 1954] <- 0
baseball$hbp[is.na(baseball$hbp)] <- 0

baseball <- baseball[baseball$ab >= 50, ]

baseball$OBP <- with(baseball, (h + bb + hbp) / (ab + bb + hbp + sf)) # Instead of attaching and detaching from df
tail(baseball)

obp <- function(data) {
  c(obp = with(data, sum(h + bb + hbp) / sum(ab + bb + hbp + sf))) # We use '=' Operator because it will name the column OBP but '<-' doesn't do it!
}
# NOTE:# plyr functions take data from a data structure, splice it up according to some variable, operates on each dataset independantly and then recombines them all again into some data structure
# Split Apply Combine Paradigm --> SplicUp, Apply Some sort of transformation, combine them together
# Name format of plyr functions -->  1. type of Data Structure is coming from
#                                    2. type of Data Structure is going to
#                                    3. 'ply' is at the end of all of them

careerOBP <- ddply(baseball, .variables = "id", obp)  # dd --> dataframe to dataframe
# .variables is the variables that we're going to split the data up (must be in "") 
# 3rd parameter is the function that we are applying
head(careerOBP)

careerOBP <- careerOBP[order(careerOBP$obp, decreasing = TRUE), ] # Sort the obp column of careeOBP dataset
head(careerOBP)

theList
lapply(theList, sum)
llply(theList, sum)
identical(lapply(theList, sum), llply(theList, sum)) # TRUE

sapply(theList, sum) # return the colNames
laply(theList, sum) # doesn't return the colNames

head(diamonds)
aggregate(price ~ cut, diamonds, each(mean, median)) # For each level of cut compute the mean(price) and median(price)


colwise # This function apply some function to each column of our dataset

numcolwise(sum, na.rm = TRUE)(diamonds) # Function for numeric columns and sum them up
sapply(diamonds[, sapply(diamonds, is.numeric)], sum) # Instead of using numColwise!

# Plyr is generally slow --> dplyr is much faster version of it and available on github


########### Combine datasets 
Sport <- c("Football", "Basketball")
League <- c("Premier League", "NBA")
Cup <- c("League Cup", "NBA Cup")

Sports1 <- cbind(Sport, League, Cup) # Vector binding with colname consideration
Sports1

Sports2 <- data.frame(Sport = "Baseball", League = "NBL", Cup = "NBL Cup")
Sports2

Sports <- rbind(Sports1, Sports2) # Row Binding When all Cols are identical
Sports

########### Join Datasets
require(plyr)

codes <- read.table("./countryCodes.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(codes)
countries <- read.table("./GovType.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(countries)

# Using Merge function which is built-in function
countryMerged <- merge(x = codes, y = countries, by.x = "Country.name", by.y = "Country") # We have to sepcify the cols in both datasets
head(countryMerged)
View(countryMerged)

# Using join function which is in plyr and dplyr package (Columns Must have same name in both datasets)
# Renaming column of codes dataset...
codes <- rename(codes, c(Country.name = "Country"))

countryJoined <- join(x = codes, y = countries, by = "Country") # Joining 2 tables using Country Column
View(countryJoined)

############ 











