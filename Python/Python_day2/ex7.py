import math
inp=input("Enter 2 dates in format dd/mm/yyyy :" )
li=inp.split(' ')
date1=li[0].split('/')
date2=li[1].split('/')

d1=int(date1[0])
d2=int(date2[0])
m1=int(date1[1])
m2=int(date2[1])
y1=int(date1[2])
y2=int(date2[2])

c1=365*y1+(math.floor(y1/4))-(math.floor(y1/100))+(math.floor(y1/400))+(math.floor(((360*(m1))+5)/10))+(d1-1)
#
c2=365*y2+(math.floor(y2/4))-(math.floor(y2/100))+(math.floor(y2/400))+(math.floor(((360*(m2))+5)/10))+(d2-1)
#c3=abs((y1-y2)/4)
print(abs(c2-c1))

#28/09/2016 17/12/1903