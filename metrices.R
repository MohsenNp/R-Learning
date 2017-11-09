###### Working with metrices ###### 
# They are similar to dataframes

A <- matrix(1:10, nrow = 5)
A

B <- matrix(21:30, nrow = 5)
B

C <- matrix(21:40, nrow = 2)
C

nrow(A)
ncol(A)
dim(A)

A + B # Elementwise Addition
A - B # Elementwise Subtraction
A * B # Elementwise Multiplication
A / B # Elementwise Division
A ^ B # Elementwise Power(ai, bi)
A == B # Elementwise

t(A) # Taking transpose of Matrix A

A %*% t(B) # Matrix Product A * B

colnames(A) # returns NULL 
rownames(A) # returns NULL

LETTERS # gives the whole English Alphabet in Upper case
letters # gives the whole English Alphabet in Lower case


