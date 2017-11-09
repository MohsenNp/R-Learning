###### Working With Packages ######
install.packages(c("ggplot2", "coefplot")) # this is for installing several packages
# The c() function is concatenation function (Use help(c) to see what does it do!)

library(ggplot2) # load package in R (if "" is used, it'll work either)
require(coefplot) # Does the same as library() function

install.packages("useful")

require(useful) # it'll include the dependant packages too! (useful --> ggplot2)




