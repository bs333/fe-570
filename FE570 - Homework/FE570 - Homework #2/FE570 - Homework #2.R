library(xts)
library(highfrequency)


#   load data set
options(digits.secs=3)

load("sampleTQdata.RData")

# loads a file called tqdata

Sys.setenv(TZ='GMT') # added to remove warnings about time zone mismatch

head(tqdata)
tail(tqdata)

n.trades <- length(tqdata$SIZE) 
#####################################################

# 1. Explore data

#####################################################

# 2. Count how many trades take place: i) within the spread, ii) at bid, iii) at ask

####################################################

#3. i) Tick test.

#3. ii) Lee-Ready test.

##############################################################
# get Trade direction using Lee, Ready. Implement the Lee-Ready method independently

td <- getTradeDirection(tqdata)



#############################################################


