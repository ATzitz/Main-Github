b=input("Enter Binary Number :" )


bitun=b[0:7]
count=0
for x in bitun:
    if int(x) %2 ==0:
        continue
    if int(x) %2 !=0:
        count+=1

if count%2==int(b[7])%2:
    print ("Parity Check ok")
else:
    print ("Parity Check not ok")

#bp=b.split(sep=None, maxsplit=len(b))
#
#sum,a,i=0,0,0
#ones=bp.count(1)
#print(ones)

#for x in tinun:
#    i+=1    
#    a=(int(x))*(2**(9-int(i)))
#    sum=sum +a
#rem= sum % 11
#if (rem % 10 == int(tin[8])):
#    print("Tax identification Number is Valid")
#else:
#    print("Tax identification Number is not Valid")