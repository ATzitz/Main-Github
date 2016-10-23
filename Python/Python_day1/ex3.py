import math

a=int(input("Input length of side a :" ))
b=int(input("Input length of side b :" ))
c=int(input("Input length of side c :" ))

A=(1/4)*(math.sqrt((a+b+c)*(-a+b+c)*(a-b+c)*(a+b-c)))
print("The area of the triangle is", A)
