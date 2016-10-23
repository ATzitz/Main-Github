tin=input("Enter Tax Identification Number :" )

tinun=tin[0:8]
sum,a,i=0,0,0
for x in tinun:
    i+=1    
    a=(int(x))*(2**(9-int(i)))
    sum=sum +a
rem= sum % 11
if (rem % 10 == int(tin[8])):
    print("Tax identification Number is Valid")
else:
    print("Tax identification Number is not Valid")