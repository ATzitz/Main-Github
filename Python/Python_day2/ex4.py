a=input("Enter 10 digit Number :" )

la=list(x for x in a)
lz=[]
lm=[]
lk=[]
count=0
b,c,d,=0,0,0
for x in la:
     if int(x)%3==2:
        lz.append(x)
        strz = '   '.join(str(e) for e in lz)
     if int(x)%3==1:
        lm.append(x)
        strm = '   '.join(str(e) for e in lm)
     if int(x)%3==0:
        lk.append(x)
        strk = '   '.join(str(e) for e in lk)

print( strm, '\n ',strz, '\n  ', strk)