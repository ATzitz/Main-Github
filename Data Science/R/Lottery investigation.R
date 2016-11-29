library(xlsx)
set.seed(1)

# Read the data. Quite slow due to the xlsx format of the provided data.
# On other occassions, exporting the data to a .csv will be preffered.
# xlsx2 is used, as it is much faster than xlsx (10 times faster)
data_unstacked<-read.xlsx2("Assignment_2_Data.xlsx", sheetName = "Lottery_Data", colClasses=rep("numeric",5))
data<-stack(data_unstacked) # Stacking the observation vertically in a column

 
#=========================================================#
# Question 7 a

# Plot Lottery Data
hist(data$"values",breaks=c(0:30),col=rgb(1,0,0,0.9),main="Lottery Data")
box()
# Plot a discrete uniform dataset
rdu<-sample(1:30,49995,replace=T)
hist(rdu,breaks=c(0:30),counts=4,main="Lottery Data",col=rgb(0,0,1,0.5),add=T)
# Add legend outside plot area
legend("topright", inset=c(0,-0.7),xpd = TRUE, c("Unif_Disc", "Lottery Data"), col=c("blue", "red"), lwd=10)
plot(ecdf(data$values),main="ECDF - Lottery data")

# Conduct tests

# Chi-squared test ---> Reject null hypothesis
tbl<-(cbind(table(data$values),table(rdu)))
chisq.test(tbl)#default prob is the discrete uniform

# Different test, Compare lottery data with a uniformly distributed data
qqnorm(data$values); qqline(data$values);

#=========================================================#
# Question 7 b

# Favorite numbers, the ones with the highest number of appearances

sorted_table<-sort(table(data$values),decreasing=TRUE)
favorite_nums<-head(sorted_table,5)
#=========================================================#
# Question 7 c
# 100
data_100<-stack(data.frame(data_unstacked[0:100,]))

# Plot Lottery Data
hist(data_100$values,breaks=c(0:30),col=rgb(1,0,0,0.9),main="Lottery Data, 100 draws")
box()
# Plot a discrete uniform dataset
rdu_100<-sample(1:30,500,replace=T)
hist(rdu_100,breaks=c(0:30),counts=4,main="Lottery Data",col=rgb(0,0,1,0.5),add=T)
# Add legend outside plot area
legend("topright", inset=c(0,-0.7),xpd = TRUE, c("Unif_Disc_100", "Lottery Data_100"), col=c("blue", "red"), lwd=10)
plot(ecdf(data_100$values),main="ECDF - Lottery data, 100 draws")

# Conduct tests

# Chi-squared test ---> Cannot reject null hypothesis
tbl_100<-(cbind(table(data_100$values),table(rdu_100)))
chisq.test(tbl_100)  #default prob is the discrete uniform

qqnorm(data_100$values, main="Normal Q-Q Plot, 100 draws"); qqline(data_100$values);


# 1000
data_1000<-stack(data.frame(data_unstacked[0:1000,]))

# Plot Lottery Data
hist(data_1000$values,breaks=c(0:30),col=rgb(1,0,0,0.9),main="Lottery Data, 1000 draws")
box()
# Plot a discrete uniform dataset
rdu_1000<-sample(1:30,5000,replace=T)
hist(rdu_1000,breaks=c(0:30),counts=4,main="Lottery Data",col=rgb(0,0,1,0.5),add=T)
# Add legend outside plot area
legend("topright", inset=c(0,-0.7),xpd = TRUE, c("Unif_Disc_1000", "Lottery Data_1000"), col=c("blue", "red"), lwd=10)
plot(ecdf(data_1000$values),main="ECDF - Lottery data, 1000 draws")

# Conduct tests

# Chi-squared test ---> Reject null hypothesis
tbl_1000<-(cbind(table(data_1000$values),table(rdu_1000)))
chisq.test(tbl_1000)  #default prob is the discrete uniform

qqnorm(data_1000$values, main="Normal Q-Q Plot, 1000 draws"); qqline(data_1000$values);

