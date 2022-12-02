a = [1,2,1,3,2]
u = []
u.append(a[0])
# u =[[a[0]]
for i in range(1,len(a)):
    unikalus = True
    for j in range(len(u)):
        if a[i]==u[j]:
            unikalus=False
            break
    if unikalus:
            u = u +[a[i]]
            print(u)
print(u)
            
        
