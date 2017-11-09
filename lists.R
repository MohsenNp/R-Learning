###### Working with lists ###### 
# list is general form of a vector
# each element can be in its own type

list <- list(1, 2, 3) # list with 3 elements
list

list2 <- list(c(1, 2, 3)) # list with 1 element
list2

list3 <- list(c(1, 2, 3), 10:20)
list3

df <- data.frame(1:10, 10:1)
list4 <- list(df, 1, 2, "Ali")
list4

list5 <- vector(mode = "list", length = 5) # Creates an empty list with NULL values in each elements
list5

names(list5) # returns NULL
names(list5) <- c(1, 2, 3 ,4 ,5)
names(list5)

list6 <- list(dataframe=df, interval=1:10, rev=10:1, theList=list4) # put names for each elems and call recursively
list6

list7 <- vector(mode = "list", length = 10)
list7[[1]] <- 15 # Access to first element of a list
names(list7) <- names(list5)
names(list7)


#NOTE: length() ,nrow and ... are also working on lists

list5[["NEW ELEMENT"]] <- 1:20 # Adding new element with name to list5
list5

