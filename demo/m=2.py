m=3
n=3
d=2
s= m*n
if s%d==0:
    print (f'число домино = {s/d}')
elif s%d!=0:
    print (f'число домино = {(s-(s%d))/d}')
