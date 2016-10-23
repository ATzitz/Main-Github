library(sjPlot)
library(ggplot2)
library(car)
library(vioplot)
library(hexbin)

data<-read.csv2(file="alldata_onlinenews_01.csv", header = TRUE, sep = ';', na.strings = "", blank.lines.skip = FALSE)
data<-data[-1]  # Read data and remove the 1st col
cat<-c(data[14:19],data[32:39]) # data channels and weekdays
summary(cat)
num<-c(data[4:13],data[20:31],data[40:60])
summary(num)

write.csv(data, file = "data.csv")
apply(is.na(data),2,sum)
colSums(is.na(data))   # find missing values i.e NA in data
sapply(data, function(x) sum(is.nan(x))) # other method to find missing values

data_channel<-paste(data[[14]],data[[15]],data[[16]],data[[17]],data[[18]], data[[19]], sep="") # Combine the columns to make the data_channel


data_channel<-gsub("000000","NoTag",data_channel)   # replace 000000 to NoTag for items not containing any of the other categories (is this maybe the missing data?)
data_channel<-gsub("000001","Lifestyle",data_channel) # replace the 000001 with lifestyle 
data_channel<-gsub("000010","Entertainment",data_channel)
data_channel<-gsub("000100","Business",data_channel)
data_channel<-gsub("001000","Socmed",data_channel)
data_channel<-gsub("010000","Tech",data_channel)
data_channel<-gsub("100000","World",data_channel)
data_channel<-as.data.frame(data_channel)   # makte it a data frame for ease of usage
#frenquency Table Q6a,b

fqtb<-sjt.frq(data_channel, ignore.strings = F, altr.row.col = TRUE, ,CSS = list(css.caption= "Question a",css.caption = '+color:red;', css.table = 'border:2px solid red;',css.colnames = '+color:green', css.summary = 'font-weight:bold;')) 
summary(data_channel)

#pie and bar plot Q6c

barplot(table(data_channel))
pie(table(data_channel))

#Q 6e
lifestyle<-data[(data$is_weekend==1 & data$data_channel_is_lifestyle),]
percent<-(nrow(lifestyle))/(nrow(data[(data$data_channel_is_lifestyle),]))

#Q 6f
d2<-stack(data[61]) # adjust to "long" format as required by ggplot
ggplot(d2, aes(values)) +
  geom_density() # type of  geometry/plot shape
qplot(values, data=d2[1], geom ="density") # same graph with qplot(different command)

#Q 6g characteristics of this post
row<-data[which.max(data$shares),]
row

#q 6h mean and medias
mean(d2$values)# or colMeans(data[61])  
median(d2$values)
sd(d2$values)

#Q 6k histogram and descriptive values
d3<-stack(data[47])
qplot(values, data=d3,geom = "histogram", bins)
histoplot<-qplot(values, data=d3,geom = "histogram")
summary(d3)
sd(d3$values)

#Q 6l mean,sd and range (also medians) of variables
medians<-lapply(num,2,FUN=median)
means<-lapply(num,2,FUN=mean)
sds<-lapply(num,2,FUN=sd)
ranges<-lapply(num,2,FUN=range)

#Q 6m Z transformation
ztrans<-lapply(num,2,FUN=scale)
zmeans<-lapply(ztrans,2,FUN=mean)
zsds<-lapply(ztrans,2,FUN=sd)
zranges<-lapply(ztrans,2,FUN=range)

#Q 6p
#data[(data$is_weekend==1),]
mond<-(data[(data$weekday_is_monday==1),])
mmond<-mean(mond$shares)
tuesd<-(data[(data$weekday_is_tuesday==1),])
mtuesd<-mean(tuesd$shares)
wed<-(data[(data$weekday_is_wednesday==1),])
mwed<-mean(wed$shares)
thurs<-(data[(data$weekday_is_thursday==1),])
mthurs<-mean(thurs$shares)
frid<-(data[(data$weekday_is_friday==1),])
mfrid<-mean(frid$shares)
sat<-(data[(data$weekday_is_saturday==1),])
msat<-mean(sat$shares)
sun<-(data[(data$weekday_is_sunday==1),])
msun<-mean(sun$shares)

mweek<-c(mmond,mtuesd,mwed,mthurs,mfrid,msat,msun)
week<-c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")

barplot(mweek, xlab = "Days from Monday to Sunday", ylab= "Mean Number of Shares")

#Q 6q
t.test(mweek)
#Q 6r boxplot and vioplot
boxplot(mond$shares,tuesd$shares,wed$shares,thurs$shares,frid$shares,sat$shares,sun$shares)

vioplot
weekshare<-c(mond$shares, tuesd$shares, wed$shares, thurs$shares, frid$shares, sat$shares, sun$shares)
vioplot(mond$shares,tuesd$shares,wed$shares, thurs$shares, frid$shares, sat$shares, sun$shares, drawRect = F, names=c("monday","tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"), col="gold" )

# q6 t
shares<-(data$shares)
pcont<-data$global_rate_positive_words
scatterplot(pcont,shares)
# q6 v
abline(lm(pcont~shares))
lines(lowess(pcont,shares))

bin<-hexbin( pcont, shares, xbins=100)
plot(bin, main="Hexagonal Binning")

#q 7 select the data, conduct normality tests, then proceed wtih ttest

weekend<-data[(data$is_weekend==1),]
pend<-weekend$global_rate_positive_words
weekday<-data[(data$is_weekend!=1),]
pday<-weekday$global_rate_positive_words
shapiro.test(pend)
shapiro.test(pday)# large size error
qqnorm(pday)

t.test(pend,pday)

#Q 8 ANOVA test

#fit<-lm(data$shares~pcont, data=data)
#summary(fit)

aovmon <- aov(data$weekday_is_monday ~ data$global_rate_positive_words, data=data)
aovtue <- aov(data$weekday_is_tuesday ~ data$global_rate_positive_words, data=data)
aovwed <- aov(data$weekday_is_wednesday ~ data$global_rate_positive_words, data=data)
aovthu <- aov(data$weekday_is_thursday ~ data$global_rate_positive_words, data=data)
aovfri <- aov(data$weekday_is_friday ~ data$global_rate_positive_words, data=data)
aovsat <- aov(data$weekday_is_saturday ~ data$global_rate_positive_words, data=data)
aovsun <- aov(data$weekday_is_sunday ~ data$global_rate_positive_words, data=data)

#aov<- data.frame(c(aovmon, aovtue, aovwed,aovthu,aovfri,aovsat,aovsun))

summary(aovmon)
#fit<-aovDAY
summary(fit) # show results
coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics
# diagnostic plots 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)
#q9 regression
fit<-lm(data$shares~pcont, data=data)
summary(fit)

#summary(data_channel)
#mapply(data.frame, (data[14],data[15]))
#write.csv(numerics, file="nums")
#write.csv(categorical, file="cat")
#q 10
plot(as.data.frame(num))