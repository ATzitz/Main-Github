import numpy as np

with open('input5.txt', 'r') as f:               # open the file
    n, k = [int(x) for x in next(f).split()]    # extract n and k
    if (k in range(0,700))and(n in range(k,2500)): # employ the limits
        array = []
        for line in f:
            array.append([int(x) for x in line.split()])    # create initial martix
        
data=[item for sublist in array for item in sublist]
indices = np.triu_indices(n-1)
A=np.zeros((n-1,n-1))
A[indices]=data                                   # matrix of all the elements in array form

def en(i,l,k): #Energy function. i is the substance put in each time, l is the first time (substance) that we changed bottle, k is the remaining empty bottles  
    if (k==1):
        return sum(i,n-1) #if k=1 then we put all the remaining substances into one bottle and we compute their reactions
    if (i==n-1):
        return 0
    if (n-i+1==k-1): #if n-i+1=k-1 that means that the remaining substances are equal with the remaining empty bottles and then we fill each of the remaining empty bottles with one substance
        return put(l,i)
    return min(put(l,i)+en(i+1,l,k), sum(l,i)+en(i+1,i+1,k-1))
    
def sum(l,i): # sum function which computes the total energies of all reactions of l, l+1, l+2,..., i substances
    sum=0
    if (l==i):
        return 0
    for m in range(l,i):
        for g in range(m,i):
            if A[m,g] in range(0,99):     # restriction 0<A<99
                sum=sum+A[m,g]
            else:
                g=g+1
    return sum
    
def put(l,i): #put function which gives us the energies from the reaction of i with l, l+1,... i-1
    sum=0
    for m in range(l, i):
        sum=sum+A[m,i]
    return sum
        
print (en(0,0,k)) #print the minimun energy that can be produced from all the substances.

