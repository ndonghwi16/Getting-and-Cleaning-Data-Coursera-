# Getting and Cleaning Data - Quiz 1

# Question 1
setwd("C:/Users/dongh/Desktop/R 공부/Coursera")
quiz_1<-read.csv("getdata_data_ss06hid.csv")
value<-quiz_1$VAL
value_new<-value[!is.na(value)]
sum(value_new)
# My Answer:53

# Question 2
# My Answer: FES variable measures the family type and their economic status.
# This may violate the tidy data principle of 'one variable should 
# represent one type of information"

# Question 3
library(openxlsx)
dat<-read.xlsx("getdata_data_DATA.gov_NGAP.xlsx",cols=7:15, rows=18:23)
sum(dat$Zip*dat$Ext,na.rm=T)
# My Answer: 36534720

# Question 4
library(XML)
URL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
quiz_4<-xmlTreeParse(URL, useInternal=TRUE)
rootNode<-xmlRoot(quiz_4)
xmlName(rootNode)
names(rootNode)
xmlValue(rootNode)
xmlSApply(rootNode,xmlValue)
zipcode<-xpathSApply(rootNode,"//zipcode",xmlValue)b
zipcode_21231<-zipcode=="21231"
sum(zipcode_21231)
# My Answer: 127

# Question 5
install.packages("data.table")
library(data.table)
DT<-fread(file="getdata_data_ss06pid.csv",header=TRUE)
system.time(DT<-fread(file="getdata_data_ss06pid.csv",header=TRUE))
system.time(ex<-read.csv(file="getdata_data_ss06pid.csv"))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
# My Answer: there are multiple answers.. Maybe my computer is too fast :)