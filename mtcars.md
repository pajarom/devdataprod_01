mtcars multivariate linear regression
========================================================
author: Pablo Rojo
date: August 22, 2014
transition: rotate

Executive Summary
========================================================

This shiny tool was built to help the analysis of the relationship between a set of automobile design and performance variables and the miles per gallon (MPG) (outcome) with the primary focus being to answer the the following two questions:

- Is an automatic or manual transmission better for MPG?
- Quantify the MPG difference between automatic and manual transmissions?.

mtcars is a data frame with 11 variables:
========================================================

<small>

[, 1]  mpg   Miles/(US) gallon

[, 2]	 cyl	 Number of cylinders

[, 3]	 disp	 Displacement (cu.in.)

[, 4]	 hp	 Gross horsepower

[, 5]	 drat	 Rear axle ratio

[, 6]	 wt	 Weight (lb/1000)

</small>

***

<small>

[, 7]	 qsec	 1/4 mile time

[, 8]	 vs	 V/S

[, 9]	 am	 Transmission (0 = automatic, 1 = manual)

[,10]	 gear	 Number of forward gears

[,11]	 carb	 Number of carburetors

</small>

Variable pairs plot
========================================================

<center>
![plot of chunk unnamed-chunk-1](mtcars-figure/unnamed-chunk-1.png) 
</center>

Linear regression
========================================================

<small>

```

Call:
lm(formula = mpg ~ am - 1, data = mtcars)

Residuals:
   Min     1Q Median     3Q    Max 
 -9.39   2.58  13.80  17.88  24.40 

Coefficients:
   Estimate Std. Error t value Pr(>|t|)    
am    24.39       3.96    6.17  7.7e-07 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 14.3 on 31 degrees of freedom
Multiple R-squared:  0.551,	Adjusted R-squared:  0.536 
F-statistic:   38 on 1 and 31 DF,  p-value: 7.67e-07
```
</small>

mtcars Shiny Application
========================================================

In order to facilitate the analysis of the impact of multivariate linear regression the following tool is available in shinyapps.io:

- [http://pajarom.shinyapps.io/mtcars/](http://pajarom.shinyapps.io/mtcars/)

Just select the variables from mtcars to be included in the regression model for mpg on top of transmission (am).
