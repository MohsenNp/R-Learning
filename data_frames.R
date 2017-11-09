###### Working with data.frames ###### 
# One of the Best data structures in R
# It is a rectangular data like a spreadsheet(table)
# Every col has its own type
# NOTE: in vector, every element must be in the same element

x <- 1:5
y <- -2:2
letter <- c("A", "B", "C", "D", "E")
df <- data.frame(x, y, letter) # Create dataframe with these cols
df
df <- data.frame(first=x, second=y, letter=letter)
df

class(df$letter) # how to access to each column using name and '$'

df <- data.frame(first=x, second=y, letter=letter, stringsAsFactors = FALSE) # do not convert character to factor

#NOTE: to clear console --> ctrl + l

nrow(df) # how many rows does df have
ncol(df) # how many cols does df have
dim(df) # dimension of df


NROW(df) # More flexible than nrow (works on vectors which do not have rows (just 1 row))
names(df) # col names of df
names(df)[3]
rownames(df) # row names of df (default is 1:n)

rownames(df) <- NULL # change it back to the default

head(df, n = 2) # prints first rows (10 by default)

tail(df) # opposite of head()

df$first # Access to one specific col in df
df[c(1, 4), 2]
df[2, 3] # Access to an specific element in df --> [row, col]
df[2:4, 3]
df[, 2] # select the entire col(s)
df[, 2, drop = FALSE] # do not return a vector --> data.frame with 1 column 

df[2, ] # this is data.frame

df[, "first"] # it gives the specified columns in order you type them (not by the order of dataframe)

df["first"]

df["first"] # returns the specified column

