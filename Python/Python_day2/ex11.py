
inp=int(input("Enter limit:" ))
l=[]
i=0
for x in range(1,inp+1):
    l.append(x) 

for x in range(inp):
    if 2**x in l :
        a=l.index(2**x)
        l.pop(a)
           
print(l)        