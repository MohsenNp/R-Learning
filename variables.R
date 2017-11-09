###### Working with variables ###### 
# R is drived from language called S (<- operation is from S)
# R is case sensitive
# R is dynamically typed --> single variable can be integer and after a while be string!

a <- b <- 7

assign("i", 20) # Assign a value to a variable called i
i

rm(i) # Remove a variable
i # Error: object 'i' not found

###### Numeric Data ###### 

x <- 2 # numeric data
class(x) # gives the type of x : numeric
is.numeric(x)

x <- 5L # Integer Variable
class(x)
is.numeric(x) # returns TRUE because Integer is subset of numeric type

a <- 4L * 2.8 # returns 11.2
class(a) # a is numeric
class(5L/2L) # numeric --> 2.5

###### Character Data ###### 

x <- "data"
class(x) # character type of data --> string data

y <- factor("data") # Factor is another type in R
y

nchar(x) # length of string x
nchar(32) # returns 2
#NOTE: nchar() does not work on factors

###### Time based Data ###### 
date1 = as.Date("2017-04-12") # in format Year-Month-Day
date1
as.numeric(date1) # number of days since 1970 (UNIX Epic(???))

date2 <- as.POSIXct("2017-04-12 16:59")
date2
as.numeric(date2) # number of hours since the noticed time

 
###### Booleans(Logical) ###### 
TRUE # also known as 1 --> EX: 5 * TRUE = 5
FALSE # also known as 0 --> EX: 5 * FALSE = 0

k <- TRUE 
class(k) # Logical type of variables
is.logical(k)
T # is also TRUE
F # is also FALSE
T <- 2
class(T) # returns numeric (We change T type from logical to numeric)

2 == 3
2 != 3
2 < 3
2 <= 3
2 > 3
2 >= 3

"stat" == "data"
"data" < "stat"
