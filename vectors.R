###### Working with vectors ###### 
# Every variable in R is vector even it has length 1
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) # create a vector of 10 numbers
x

x * 3 # 3  6  9 12 15 18 21 24 27 30
x + 2 # 3  4  5  6  7  8  9 10 11 12
x - 3 # -2 -1  0  1  2  3  4  5  6  7
x / 2 # 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0
x ^ 2 # 1 4 9 16 25 36 49 64 81 100
sqrt(x) # 1.000000 1.414214 1.732051 2.000000 2.236068 2.449490 2.645751 2.828427 3.000000 3.162278

1:10 # 1  2  3  4  5  6  7  8  9 10
10:1 # 10  9  8  7  6  5  4  3  2  1
5:-4 # 5  4  3  2  1  0 -1 -2 -3 -4


x <- 1:10
y <- -5:4

x + y # -4 -2  0  2  4  6  8 10 12 14
x - y # 6 6 6 6 6 6 6 6 6 6
x * y # -5 -8 -9 -8 -5  0  7 16 27 40
x / y # -0.2 -0.5 -1.0 -2.0 -5.0  Inf  7.0  4.0  3.0  2.5
x ^ y # 1.000000e+00 6.250000e-02 3.703704e-02 6.250000e-02 2.000000e-01 1.000000e+00 7.000000e+00 6.400000e+01 7.290000e+02 1.000000e+04

length(x) # returns length of x 

x + c(1, 2) # 2  4  4  6  6  8  8 10 10 12

x + c(1, 2, 3) # 2  4  6  5  7  9  8 10 12 11 with a WARNING

x <= 5 #  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
x > y # TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE

any(x < y) # returns TRUE if any of element wise operation returns TRUE
all(x < y) # returns TRUE if all of element wise operation returns TRUE

q <- c("Hockey", "Football", "Baseball", "Volleyball", 
       "Basketball", "Soccer", "TableTennis", "Tennis")
q

nchar(q) # 6  8  8 10 10  6 11  6
 
x[1] # in R the first element of vector is 1
x[1:4] # 1 2 3 4

data <- c(One="a", Two="b", Last="r") # vector element has names
data

w <- 1:3
w
names(w) <- c("A", "B", "C")
w

qq <- c(q, "Hockey") # Combines the whole vector q with element "Hockey"
qq

qq_factor <- factor(qq) # Create Levels which contains all unique values in vector
qq_factor
as.numeric(qq_factor) # map every element to an index (in sorted order)

# Non-information in R
NA # NA represents missing data 
NULL # NULL represents the absence of anything

z <- c(1, 2, NA, 3, 4, 5, NA)
z
is.na(z) # FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
z_char = c("Hockey", NA, "Football")
z_char
is.na(z_char) # FALSE  TRUE FALSE

z <- c(1, 2, NULL, 3, 4)
z # 1 2 3 4 (NULL is just ignored)
is.null(z) # returns FALSE 

