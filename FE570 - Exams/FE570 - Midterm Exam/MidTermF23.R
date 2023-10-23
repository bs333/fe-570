library(xts)
library(highfrequency)
rm(list=ls())

#   load data set
options(digits.secs=3)
Sys.setenv(TZ='GMT')

load("taqdata_BTCUSD_20230419.RData")


head(tqdata,10)
tail(tqdata)

####################################################
# (i) summary statistics

n.trades <- length(tqdata$SIZE) 
n.trades

#####################################################

# (ii) for each transaction, compute the quoted spread and effective spread 
bids <- as.numeric(tqdata$BID)
asks <- as.numeric(tqdata$OFR)
p <- as.numeric(tqdata$PRICE)

mids <- 0.5*(bids + asks)


#####################################

# (iii) Roll's estimate  of the bid-ask spread 

dp <- diff(p)

# compute the covariance of the price changes, for the Roll model analysis
covdp <- acf(dp, lag.max=10, 
             type="covariance", plot=TRUE,
             main="Autocovariance of price changes")

gamma0 <- covdp$acf[1]
gamma1 <- covdp$acf[2]

#####################################

