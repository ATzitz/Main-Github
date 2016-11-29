library(xlsx)
library(nortest)
library(fitdistrplus)

set.seed(1)

# Read the data. Quite slow due to the xlsx format of the provided data.
# On other occassions, exporting the data to a .csv will be preffered.
# .xlsx2 is an order of magnitude faster than .xlsx. This is becasue it does more 
# work in java

w<-read.xlsx2("Assignment_2_Data.xlsx", sheetName ="W", colIndex = 16, header = T,colClasses="numeric")
colnames(w)<-"w_tzitzeras"
x<-read.xlsx2("Assignment_2_Data.xlsx", sheetName ="X", colIndex = 16, header = T,colClasses="numeric")
colnames(x)<-"x_tzitzeras"
y<-read.xlsx2("Assignment_2_Data.xlsx", sheetName ="Y", colIndex = 16, header = T,colClasses="numeric")
colnames(y)<-"y_tzitzeras"
z<-read.xlsx2("Assignment_2_Data.xlsx", sheetName ="Z", colIndex = 16, header = T,colClasses="numeric")
colnames(z)<-"z_tzitzeras"

par(mfrow=c(2,2))

barplot(table(w$w_tzitzeras), main="W data"); box();
barplot(table(x$x_tzitzeras), main="X data"); box();
hist(y$y_tzitzeras, main="Y data"); box();
hist(z$z_tzitzeras, main="Z data"); box();

qqnorm(w$w_tzitzeras, main="Normal Q-Q Plot W data"); qqline(w$w_tzitzeras);
qqnorm(x$x_tzitzeras, main="Normal Q-Q Plot X data"); qqline(x$x_tzitzeras);
plot(ecdf(w$w_tzitzeras),main="ECDF - W data")
plot(ecdf(x$x_tzitzeras),main="ECDF - X data")

# plot of continious distributions

qqnorm(y$y_tzitzeras, main="Normal Q-Q Plot Y data"); qqline(y$y_tzitzeras);
qqnorm(z$z_tzitzeras, main="Normal Q-Q Plot Z data"); qqline(z$z_tzitzeras);

plot(ecdf(y$y_tzitzeras),main="ECDF - Y data")
plot(ecdf(z$z_tzitzeras),main="ECDF - Z data")


par(mfrow=c(1,1))
# Initial guesses of the the distribution types
# W=discrete, poiss or nbinom
# X=discrete, geom
# Y=continious, lnormal, cant be beta as it lives in [0,1]
# Z=continious, normal
#======== Descriptive statistics ======#
# Organize samples in dataframe
samples<-data.frame(w,x,y,z)

# Find mean,sd,medians,IQR of the sample data with sapply
means<-sapply(samples, mean)
sds<-sapply(samples, sd)
medians<-sapply(samples, median)
IQRs<-sapply(samples, IQR)
min<-sapply(samples,min)
max<-sapply(samples,max)
quant<-sapply(samples,quantile, probs=c(0.25,0.5,0.75))

dfqa<-data.frame(means,sds,medians,IQRs,min,max)
dfqb<-data.frame(quant)



#======== test W sample ========#

# additional visualisation
plot(fitdist(w$w_tzitzeras, "pois"))

#======== test X sample ========#

# additional visualisation
plot(fitdist(x$x_tzitzeras, "geom"))


#======== test Y sample ========#
# cannot be beta distribution as it has values outside [0,1]

# additional visualisation
plot(fitdist(y$y_tzitzeras, "lnorm"))

#======== test Z sample ========#

# additional visualisation
plot(fitdist(z$z_tzitzeras, "norm"))


#===================================#
# MLE AND MoM
mle_wp<-mledist(w$w_tzitzeras,"pois")$estimate
mme_wp<-mmedist(w$w_tzitzeras,"pois")$estimate

W_statistics_pois<-data.frame(mle_wp,mme_wp)
colnames(W_statistics_pois)<-c("MLE","MoM")


mle_xg<-mledist(x$x_tzitzeras,"geom")$estimate
mme_xg<-mmedist(x$x_tzitzeras,"geom")$estimate
X_statistics_geom<-data.frame(mle_xg,mme_xg)
colnames(X_statistics_geom)<-c("MLE","MoM")

mle_yln<-mledist(y$y_tzitzeras,"lnorm")$estimate
mme_yln<-mmedist(y$y_tzitzeras,"lnorm")$estimate
Y_statistics_lnorm<-data.frame(mle_yln,mme_yln)
colnames(Y_statistics_lnorm)<-c("MLE","MoM")

mle_zn<-mledist(z$z_tzitzeras,"norm")$estimate
mme_zn<-mmedist(z$z_tzitzeras,"norm")$estimate
Z_statistics_norm<-data.frame(mle_zn,mme_zn)
colnames(Z_statistics_norm)<-c("MLE","MoM")

mle<-c(mle_wp,mle_xg,mle_yln,mle_zn)
mme<-c(mme_wp,mme_xg,mme_yln,mme_zn)

 
#======== test W sample ========#

# test W sample, Poisson distribution? cannot reject null hypothesis
w_pois_sample<-rpois(n = 1000,lambda =mean(w$w_tzitzeras))
chisq.test(table(w$w_tzitzeras),table(w_pois_sample)[0:length(table(w$w_tzitzeras))])


#======== test X sample ========#

x_geom_sample<-rgeom(n = 1000,prob =0.25 )
chisq.test(table(x$x_tzitzeras),table(x_geom_sample)[0:length(table(x$x_tzitzeras))]) 

#======== test Y sample ========#

# cannot have negative mean! MLE is wrong!
y_lnorm_sample<-rlnorm(1000,meanlog =-8.7 ,sdlog =6.4 )
y_lnorm_sample2<-rlnorm(1000,meanlog = 0.8726,sdlog =2.356 ) # rejected later on, MoM inaccurate

ks.test(y$y_tzitzeras,"plnorm",mean(log(y$y_tzitzeras)),sd(log(y$y_tzitzeras)))
ks.test(y$y_tzitzeras,"plnorm",0.8726,2.356) # reject the hypothesis


#======== test Z sample ========#

# normal distribution? cannot reject the hypothesis p<0.05

shapiro.test(z$z_tzitzeras)#cannot reject hypothesis
ad.test(z$z_tzitzeras)     #cannot reject hypothesis
qqnorm(z$z_tzitzeras)
qqline(z$z_tzitzeras)      #cannot reject hypothesis
