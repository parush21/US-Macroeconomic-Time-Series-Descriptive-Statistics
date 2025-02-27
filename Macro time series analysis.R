library("mFilter")
library("ggplot2")
library("ggfortify")
library("zoo")


## Uploading and Transforming Data
data = read.csv("C:/Users/arora/Desktop/Second Year/Quarter 3/Macroeconomics 3/HW1/Final Data.csv")

## data for Y
loggdp = round(log(data[,2]/data[,9]),2) ## log of GDP per capita 
tloggdp = ts(loggdp, start = c(1960,1),frequency = 4) ## transforming into a time series
hpgdp = hpfilter(tloggdp) ## applying hp filter
Yc = hpgdp$cycle*100 ## cyclical part obtain from HP filter

## data for C
pce = round(log(data[,3]/(data[,8]*data[,9])),2) ## transforming personal expenditure data
tpce = ts(pce, start = c(1960,1),frequency = 4) ## transforming into a time series
hppce = hpfilter(tpce) ## applying hp filter
Cc = hppce$cycle*100 ## cyclical part obtain from HP filter

## data for I
inv = round(log(data[,4]/(data[,9])),2) ## transforming investment data
tinv = ts(inv, start = c(1960,1),frequency = 4) ## transforming into a time series
hpinv = hpfilter(tinv) ## applying hp filter
Ic = hpinv$cycle*100 ## cyclical part obtain from HP filter

## data for H
hours = round(log(data[,5]*10000/(data[,9])),2) ## transforming number of hours data
thours = ts(hours, start = c(1960,1),frequency = 4) ## transforming into a time series
hphours = hpfilter(thours) ## applying hp filter
Hc = hphours$cycle*100 ## cyclical part obtain from HP filter

## data for W
comp = round(log(data[,6]),2) ## transforming compensation per hour data
tcomp = ts(comp, start = c(1960,1),frequency = 4) ## transforming into a time series
hpcomp = hpfilter(tcomp) ## applying hp filter
Wc = hpcomp$cycle*100 ## cyclical part obtain from HP filter

## data for A
tech = round(log(data[,7]),2) ## transforming compensation per hour data
ttech = ts(tech, start = c(1960,1),frequency = 4) ## transforming into a time series
hptech = hpfilter(ttech) ## applying hp filter
Ac = hptech$cycle*100 ## cyclical part obtain from HP filter

Y = data.frame(Y=as.matrix(Yc), date=time(Yc))
C = data.frame(C=as.matrix(Cc), date=time(Cc))
I = data.frame(I=as.matrix(Ic), date=time(Ic))
H = data.frame(H=as.matrix(Hc), date=time(Hc))
W = data.frame(W=as.matrix(Wc), date=time(Wc))
A = data.frame(A=as.matrix(Ac), date=time(Ac))

### Plot 
autoplot(ts( cbind(Y=Y[,1],C= C[,1],I=I[,1],H=H[,1],W=W[,1],A=A[,1])  , start = c(1960,1), frequency = 4 ),
          xlab ="Time", ylab = "Macroeconomic Tiem Series", facets = FALSE,size = 1)
 
### Table

## Autocorrelations
autoY = cor(Y[1:nrow(Y)-1,1],Y[2:nrow(Y),1])
autoC = cor(Y[1:nrow(C)-1,1],Y[2:nrow(C),1])
autoI = cor(Y[1:nrow(I)-1,1],Y[2:nrow(I),1])
autoH = cor(Y[1:nrow(H)-1,1],Y[2:nrow(H),1])
autoW = cor(Y[1:nrow(W)-1,1],Y[2:nrow(W),1])
autoA = cor(Y[1:nrow(A)-1,1],Y[2:nrow(A),1])

## Correlations


