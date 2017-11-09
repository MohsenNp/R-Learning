###### Operations on vectors ###### 

x <- 1:10
mean(x) # computes the mean of x --> 5.5
sum(x) # sum of elements --> 55
nchar(x) # elementwise operation

##### MEAN ######
arr = c(1, 2, NA, 1:20)
mean(x = arr, na.rm = TRUE) # na.rm is what should be done if NA observed (remove or not)
mean(x = arr, trim = 0.1, na.rm = TRUE) # trim
# if you call mean() on arr without na.rm = TRUE --> returns NA



