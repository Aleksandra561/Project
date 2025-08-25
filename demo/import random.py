import random 
n = random.randint(1, 10)
people = 3
count = 0
print (n)
my_list1 = []
my_list2 = []
my_list3 = []
for i in range (n):
    petya = random.randint(0, 1)
    vasya  = random.randint(0, 1)
    tonya = random.randint(0, 1)
    my_list1.append(petya)
    my_list2.append(vasya)
    my_list3.append(tonya)
    if petya + vasya + tonya >= 2:
            count +=1
print (*my_list1)
print (*my_list2)
print (*my_list3)
    
print (count)
        
       
