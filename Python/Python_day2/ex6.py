a=input("Enter 3 single, 3 double and 3 triple digit numbers :")

lis=a.split()
b=[]
c=[]
d=[]
for x in lis:
    if int(x)<10:
        b.append(x)
        i=len(b)
        print("  ",b[i-1],"+",end="\n", sep="")
    if int(x)<100 and int(x)>=10:
        c.append(x)
        j=len(c)
        print("  ",c[j-1],"+",end="\n", sep="")
    if int(x)<1000 and int(x)>=100:
        d.append(x)            
        k=len(d)
        print("  ",d[k-1],"+",end="\n", sep="")


