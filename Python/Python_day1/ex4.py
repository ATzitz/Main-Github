import math

a=int(input("Input a :" ))
b=int(input("Input b :" ))
c=int(input("Input c :" ))

if (b**2)-4*a*c<0:
    print("No real values exist")
else:
   x1=(-b + math.sqrt((b**2)-4*a*c))/2*a
   x2=(-b - math.sqrt((b**2)-4*a*c))/2*a
   print(" The solutions are x1 :", x1, "and x2 :", x2)
