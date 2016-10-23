a=input("Enter 10 digit Number :" )

la=list(x for x in a)
lz=[]
lm=[]
for x in la:
    if int(x)%2==0:
        lz.append(x)
        strz = ' '.join(str(e) for e in lz)
    if int(x)%2!=0:
        lm.append(x)
        strm = ' '.join(str(e) for e in lm)

print( strm, '\n',strz)