n=int(input("Enter number of triangle numbers :" ))

for i in range(1,n+1):
    T=i*(i+1)/2
    print(int(T), end=" ")
    i +=1
