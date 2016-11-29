# Probability and Statistics for Data Analysis- Assignment 1

# Generate small sample of Poisson distribution (Xn)

set.seed(100)
n<-100
N<-1000
lambda_pois<-4
Xn<-rpois(n,lambda_pois)
barplot(table(Xn),main="Poisson distribution lambda=4, N=100")
# Generate large sample of Poisson distribution (XN)

set.seed(100)
XN<-rpois(N,lambda_pois)
barplot(table(XN),main="Poisson distribution lambda=4, N=1000")

### Y=EXP
# Generate small sample of exponential distribution (Yn)

set.seed(100)
lambda_exp<-0.5
Yn<-rexp(n,lambda_exp)
hist(Yn,main="Exponential distribution lambda=0.5, N=100")

#Check that they match with the theoretical
curve(dexp(x,lambda_exp),from=0,to=8,main="Exponential distribution lambda=0.5, N=100")
par(new=TRUE)

# Generate large sample of exponential distribution (YN)
set.seed(100)
YN<-rexp(N,lambda_exp)
hist(YN,breaks=20,main="Exponential distribution lambda=0.5, N=1000")

#Check that they match with the theoretical
par(new=TRUE)
curve(dexp(x,lambda_exp),from=0,to=8,main="Exponential distribution lambda=0.5, N=1000 ")


#Question B


# Organize samples in dataframe
samples<-data.frame(Xn,XN,Yn,YN)

# Find mean,sd,medians,IQR of the sample data with sapply
means<-sapply(samples, mean)
sds<-sapply(samples, sd)
medians<-sapply(samples, median)
IQRs<-sapply(samples, IQR)

# Find theoretical means
TPois_mean<-lambda_pois
TExp_mean<-1/lambda_exp

# Evaluate means,sds,medians,IQRs for theoretical distribution
TPois<-c(TPois_mean,sqrt(TPois_mean),qpois(0.5,lambda_pois),qpois(0.75,lambda_pois)-qpois(0.25,lambda_pois))
TExp<-c(TExp_mean,TExp_mean,qexp(0.5,lambda_exp),qexp(0.75,lambda_exp)-qexp(0.25,lambda_exp))

dfqb<-data.frame(means,sds,medians,IQRs)
dfqbT<-t(data.frame(TPois,TExp))

#Question C

#Evaluate the sample regions
aregionXn<- c(min(mean(Xn),median(Xn)),max(mean(Xn),median(Xn)))
aregionXN<- c(min(mean(XN),median(XN)),max(mean(XN),median(XN)))
aregionYn<- c(min(mean(Yn),median(Yn)),max(mean(Yn),median(Yn)))
aregionYN<- c(min(mean(YN),median(YN)),max(mean(YN),median(YN)))

#Organize to dataframe
dfqcR<-data.frame(aregionXn,aregionXN,aregionYn,aregionYN)

#Find the proportion of samples in the region
Region_Proportion_Xn<-(sum(aregionXn[1]<=Xn & Xn<=aregionXn[2]))/length(Xn)
Region_Proportion_XN<-(sum(aregionXN[1]<=XN & XN<=aregionXN[2]))/length(XN)
Region_Proportion_Yn<-(sum(aregionYn[1]<=Yn & Yn<=aregionYn[2]))/length(Yn)
Region_Proportion_YN<-(sum(aregionYN[1]<=YN & YN<=aregionYN[2]))/length(YN)

#Organize to dataframe
dfqcP<-t(data.frame(Region_Proportion_Xn,Region_Proportion_XN,Region_Proportion_Yn,Region_Proportion_YN))

# Find the theoretical region and proportion
TRegion_Poission<-c(min((TPois_mean),qpois(0.5,lambda_pois)),max((qpois(0.5,lambda_pois)),TPois_mean))
TPpois<-dpois(TRegion_Poission[2],lambda_pois)

TRegion_Exp<-c(min((TExp_mean),qexp(0.5,lambda_exp)),max((qexp(0.5,lambda_exp)),TExp_mean))
TPexp<-pexp(TRegion_Exp[2],lambda_exp)-pexp(TRegion_Exp[1],lambda_exp)
dfqcPT<-t(data.frame(TPpois,TPexp))

#Question D

qXn<-quantile(Xn,0.01)            # Compute lower 1% quantile for small sample X
qXN<-quantile(XN,0.01)            # Compute lower 1% quantile for large sample X
qTpois<-qpois(0.01,lambda_pois)   # Compute theoretical lower quantile for X
qYn<-quantile(Yn,0.01)            # Compute lower 1% quantile for small sample Y
qYN<-quantile(YN,0.01)            # Compute lower 1% quantile for large sample Y
qTexp<-qexp(0.01,lambda_exp)      # Compute theoretical higher quantile for Y

dfqd<-t(data.frame(qXn,qXN,qYn,qYN)) 
q1T<-t(data.frame(qTpois,qTexp))


# Question E

QXn<-quantile(Xn,0.99)             # Compute higher 1% quantile for small sample X
QXN<-quantile(XN,0.99)             # Compute higher 1% quantile for large sample X
QTpois<-qpois(0.99,lambda_pois)    # Compute theoretical higher quantile for X

QYn<-quantile(Yn,0.99)             # Compute higher 1% quantile for small sample Y
QYN<-quantile(YN,0.99)             # Compute higher 1% quantile for large sample Y
QTexp<-qexp(0.99,lambda_exp)       # Compute theoretical higher quantile for X

dfqe<-t(data.frame(QXn,QXN,QYn,QYN))  
Q99T<-t(data.frame(QTpois,QTexp))

dfqde<-data.frame(dfqd,dfqe)      # data frames for visualisation in Word
dfqdeT<-data.frame(q1T,Q99T)      # data frames for visualisation in Word

# Question G

#Define function to find mode for the discrete distribution
Mode <- function(x) {
  vartable <- table(x)
  as.numeric(names(vartable)[which.max(vartable)])
}
Mode_Xn<-Mode(Xn)
Mode_XN<-Mode(XN)
Mode_Yn<-Mode(Yn)
Mode_YN<-Mode(YN)

# Organize data
dfqg<-data.frame(Mode_Xn,Mode_XN,Mode_Yn,Mode_YN) 

# Mean is a better predictor for the exponential distribution
best_predictor_Yn<-mean(Yn)
best_predictor_YN<-mean(YN)
