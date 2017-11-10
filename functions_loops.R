###### Functions, Basics of R ########
say.hello <- function(){
  print("Hello, World!")
}

say.hello # prints the whole function implemetation
say.hello() # prints hello world

########################################

sprintf("hello, %s", "Mohsen!") # just like printf in C/C++

hello.person <- function(name){
  print(sprintf("hello, %s", name)) # print() is not necessary in this code
}

hello.person("Mohsen!!!")
hello.person(name = "Ali") # it's like python

hello.person <- function(first, last){
  print(sprintf("Hello %s %s", first, last))
}

hello.person(last = "Naghipourfar", "Mohsen") # Automatically assigns Mohsen for 'first' parameter


hello.person <- function(first, last = "Naghipour"){ # Use a default value for last
  print(sprintf("Hello %s %s", first, last))
}

hello.person("Mohsen")
hello.person("Mohsen", lol = "Ali") # Error!
hello.person("Mohsen", "Ali", "Mohammad") # Error!


hello.person <- function(first, last = "Naghipour", ...){
  print(sprintf("Hello %s %s", first, last))
}

hello.person("Mohsen")
hello.person("Mohsen", lol = "Ali") # Ali is ignored
hello.person("Mohsen", "Ali", "Mohammad") # Mohammad is ignored too


double.num <- function(x){ #NOTE: R will automatically returns the last line of the function
  x * 2 
}

double.num(12)

double.num <- function(x){ #NOTE: R will automatically returns the last line of the function
  return(x * 2)
  a = 2 # Does not get executed!
  print("Hello!") # Does not get executed!
}

double.num(10)


########## do.call ##############

hello.person <- function(name, lastname="Naghipourfar", ...){
  sprintf("Hello %s %s", name, lastname)
}

do.call(hello.person, args = list(name = "Mohsen", last = "Naghipour")) # hello.person can be in "" (we need a named list for arguments)

# Passing Function as a parameter of another function

new_func <- function(x, func = mean){
  do.call(func, args = list(x))
}

new_func(1:10)
new_func(1:10, sum)
new_func(1:10, sd) # Standard Deviasion :)


####### Switch Statement #######
use.switch <- function(x){
  switch(x, 
         "a" = "first",
         "b" = "second",
         "z" = "last",
         "other")
}

use.switch("a")
use.switch("n")
use.switch("z")
use.switch(1) # returns first --> positional setting
use.switch(2) # returns second
use.switch(3) # returns last
use.switch(4) # returns other
use.switch(10) # nothing returns because after 4 there is no element in switch
is.null(use.switch(199)) # returns TRUE

#NOTE:
ifelse(1 == 1, "Yes", "No!")
ifelse(1 == 2, "yes", "no!")
##################################################

vec <- c(1, 0, 1, 1, 1, 0, 1, 0, 0) 
ifelse(vec == 1, "Yes", "No") # elementwise check on vectors
ifelse(vec == 1, vec * 3, vec) # elementwise check on vectors
ifelse(vec == 1, vec * 3, "zero") # elementwise check on vectors (All of elements will be in character type)

vec[2] <- NA
ifelse(vec == 1, vec*3, "Zero") # it does not change NA to "Zero"
ifelse(vec == NA, NULL, vec) # does not work

ifelse(vec == 1, vec, ifelse(x == 2, "Hi", "Bye!")) # Nested ifelse statements

na_arr <- rep(NA, length(vec))
na_arr 

####### For Loop ########
l = letters
for (a in l){
  print(a)
}

x = 1:10
for(i in x) {
  if (i == 3){
    next # Similar to continue in C/C++
  }
  if (i == 8){
    break
  }
  print(i)
}








