
inp=input("Enter number sequence:" )
l=len(inp)
sum,i=0,0
li=[x for x in inp]

for x in range(1,(len(li)),2):
    i+=1
    if i==1:
        sum=int(li[0])
    if i%2==0:
        sum=sum + (int(li[i])*(int(li[i-1])))
    else:
        sum=sum+int(li[i-1])
       
print( sum)