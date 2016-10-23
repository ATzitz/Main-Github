import math
y=int(input("Enter year :" ))


a=y%4
b=y%7
c=y%19
d=(19*c+15)%30
e=(2*a+4*b-d+34)%7
month=math.floor(((d+e+114)/31))
day=((d+e+114)%31)+14
if (month==3 or month==5) and day>32:
            day=day-31
            month=month+1
elif (month==4 and day>30):
            day=day-30
            month=month+1

print("Day: ", day, "Month:", month)