###### Reading data into R ###### 

###### CSV ######
# Comma Seperated Values file
download_link <- "www.jaredlander.com/data/TomatoFirst.csv"
download.file(url = download_link, destfile = "./TomatoFirst.csv")
tomato <- read.table(file = "./TomatoFirst.csv", header = TRUE, sep = ",") # Instead of read.csv, a bit faster
# tomato <- read.csv(file = "./TomatoFirst.csv", header = TRUE)
head(tomato)

class(tomato$Tomato) # returns factor

tomato <- read.table(file = "./TomatoFirst.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE) # Instead of read.csv
class(tomato$Tomato) # returns character

save(tomato, file = "./Tomato.rdata")
rm(tomato)
load("./Tomato.rdata")
head(tomato)

###### SAVING INTO .RDATA ######
x <- 20
y <- 10:100
w <- data.frame(x, y)

save(x, y, w, file = "./test.rdata")
rm(x, y, w)
load("./test.rdata")

###### process Data ######
require(ggplot2)
data("diamonds") # import dataset diamonds in variable called diamonds
head(diamonds)
data("tips", package = "reshape2") # read dataset called tips from package reshape2
head(tips)

##### read data from HTML page #####
require(XML)
URL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowl_game <- readHTMLTable(URL, which = 1, header = FALSE) # which means which table to grab (header is FALSE because table has no headers)
bowl_game

###### Databases ######
install.packages("RODBC")
require(RODBC)
db <- odbcConnect("QV Training") # Connect to a Database
db

ordersTable <- sqlQuery(channel = db, query = "SELECT * FROM orders")
head(ordersTable)

detailsTable <- sqlQuery(channel = db, query = "SELECT * FROM [orders Details]")
head(detailsTable)

# ...



