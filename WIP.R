## Loading the data is trivial ##
data(mtcars)
## The column am contains the determination of automatic/manual transmission
## it is a numeric column containing either 0=automatic or 1=manual.
## Create a boxplot? with am as a factor.
boxplot(mpg~am, data=mtcars, names=c("Automatic","Manual"),ylab="Miles per Gallon", main="MPG as a Function of Transmission")
## This may be a useful aside ...
boxplot(wt~am, data=mtcars, names=c("Automatic","Manual"),ylab="Weight/1000s lbs")
## Since MPG vs. wt is a confounding factor.
plot(mpg~wt,data=mtcars,col=mtcars$am+2, type="p",pch=mtcars$am+15)
## Creates a very cute plot.
## So I need to extract the difference in MPG due to transmission, excluding other factors.
## I think we could find relations for MPG vs. cylinders, vs. weight (which may be identical), 
## and for displacement(?).  I suspect the 1/4-mile time is irrelevant as is V/S.  How do I do
## this properly without automatic variable selection?
## I think we need to find correlation coefficients for each variable with mpg and go from 
## there.  I believe I can do anything I want to this data for this assignment.