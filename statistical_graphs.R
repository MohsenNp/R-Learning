######### Statistical Graphs #########
require(ggplot2)
data("diamonds")
head(diamonds)

hist(diamonds$carat) # histogram of one column
hist(diamonds$carat, main = "Carat Histogram", xlab = "carat") # Adding title and axis-x title


plot(x = diamonds$carat, y = diamonds$price) # Scatter plot of 2 columns
plot(price ~ carat, data = diamonds) # Scatter plot price wrt carat (y ~ x)
plot(diamonds$carat, diamonds$price, main = "Price vs Carat", xlab = "Carat", ylab = "Price") # title of plot and axes


boxplot(diamonds$carat) # boxplot

######### ggplot2 ######### 
# Use layers (built up layer by layer)
require(ggplot2)
ggplot(data)
gemo_point
geom_histogram
geom_line
aes(x, y) # Map function --> map variable to x, y and so on (axis, shape and etc)
ggplot(data) + geom_point(aes(x, y)) # layers seperate with '+' operation


ggplot(data = diamonds) + geom_histogram(aes(x = diamonds$carat)) # default number of bins is assigned (30)
ggplot(data = diamonds) + geom_histogram(aes(x = diamonds$carat), binwidth = .1) # bid_width is manually assigned (30)

ggplot(data = diamonds) + geom_density(aes(x = diamonds$carat)) # density function
ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "grey50") # density function with color option

ggplot(diamonds, aes(x = carat, y = price)) + geom_point() # Scatter plot of data
g <- ggplot(diamonds, aes(x = carat, y = price))
g # There is no layer in g
g + geom_point() # get the same plot
g + geom_point(aes(color = color)) # set color to distinguish the points (create a legend) (color code based on diamonds' color column)
g + geom_point(aes(color = color, shape = clarity)) # add shape based on clarity column in diamonds dataset (> 6 shapes)
# ggplot does not distinguish more than 6 shapes So it does not make shape for VVS1 and IF (WARNING!)
g + geom_point(aes(color = color, shape = cut)) # add shape based on cut (less than 6 shapes) So we have not warning


ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot() # Drawing boxPlot in ggplot2 (x = 1)
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot() # for every kind of values in cut col in diamonds we draw boxplot


ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin() # Drawing violin for every cut in diamonds

g <- ggplot(diamonds, aes(y = carat, x = cut))
g + geom_point() + geom_violin() # Working with layers!
g + geom_violin() + geom_point() # See the difference between this and previous line

g + geom_jitter() + geom_violin() # jitter spreads the points better than geom_point 


head(economics) # dataset in ggplot
ggplot(economics, aes(x = date, y = pop)) + geom_line() # line plots

require(lubridate)
economics$year <- year(economics$date) #adding year column with year of date using lubridate year() function
economics$month <- month(economics$date) #adding month column with month of date using lubridate month() function
head(economics)

econ2000 <- economics[which(economics$year >= 2000), ] # select data which year is greater than or equal 2000
head(econ2000)

econ2000$month <- month(econ2000$date, label = TRUE) # converting month numbers to January, ...
head(econ2000)

require(scales)
g <- ggplot(econ2000, aes(x = month, y = pop))
g <- g + geom_line(aes(color = factor(year), group = year)) # grouped by year
g

g <- g + scale_color_discrete(name = "Year") # setting name of color legend
g <- g + scale_y_continuous(labels = comma) # seperating every 3 digits of y to make it more readable
g <- g + labs(title = "Population Growth", x = "Month", y = "Population")
g

g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1)) # For rotating x texts (hjust move them to the right(vjust))
g
 

g <- ggplot(diamonds, aes(x = carat, y = price))
g <- g + geom_point(aes(color = color)) + facet_wrap(~color) # break up the plot for discrete units one for each level of color and form these into a grid
g

g <- g + geom_point(aes(color = color)) + facet_grid(cut~clarity) # break up based on cut and clarity and color in each plot
g # each pane is combination of cut and clarity

ggplot(diamonds, aes(x = carat, color = color)) + geom_histogram() + facet_wrap(~color)


ggplot(diamonds, aes(x = carat, y = price, color = color, shape = cut, size = depth)) + geom_point() # Scatter Plot


###### Adding Themes to ggplot ########
require(ggthemes)
g <- ggplot(diamonds, aes(x = carat, y = price, color = color)) + geom_point()
g
g + theme_wsj() # wallstreet journal Theme
g + theme_economist() + scale_color_economist() # Adding Theme Economist with scale that color the points better (legend is at up)
g + theme_tufte() # very barebones graph
g + theme_excel() + scale_color_excel() # Plot graph like excel
#NOTE: For every theme we have its own color in scale library
 





