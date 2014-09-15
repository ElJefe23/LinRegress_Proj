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

## I think this is an ANOVA question, so I'll build three models (or so), and see what happens.
## Probably need some plots to show what correlates with mpg, then cor matrix to justify 
## why I am choosing the variables I am.
model1<-lm(mpg~am, data=mtcars)
## Coeff on am = 7.24, p-value 2.85 e-04
model2<-update(model1,mpg~am + wt)
## Coeff on am = -0.024, p-value=0.9!-> not distinguishable from zero.
model3<-update(model1,mpg~am + wt + cyl)
## Coeff on am = 0.176, p-value=0.9!-> not distinguishable from zero.
model4<-update(model1,mpg~am + wt + cyl + hp)
## Coeff on am = 1.48, p-value=0.3!-> not distinguishable from zero.
model5<-update(model1,mpg~am + wt + cyl + hp + carb)
## Coeff on am = 2.08, p-value=0.2!-> not distinguishable from zero.
anova(model1, model2, model3, model4, model5)
## Shows that past model 3, it is insignifcant to add terms.

## Current problem is to figure out how to do panel plot with only a single variable 
## for the y-axis.
par(mfrow=c(3,3))
plot(mpg~cyl, data=mtcars)
plot(mpg~disp, data=mtcars)
plot(mpg~hp, data=mtcars)
plot(mpg~drat, data=mtcars)
plot(mpg~wt, data=mtcars)
plot(mpg~vs, data=mtcars)
plot(mpg~am, data=mtcars)
plot(mpg~gear, data=mtcars)
plot(mpg~carb, data=mtcars)
##  That'll play.  Ugh. 
cor(mtcars)
## Gives top-correlating single variables and rationale for choosing cyl vs. disp