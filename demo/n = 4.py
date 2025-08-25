n = 4
print (n)
my_list = ['word', 'localization', 'internationalization', 'pneumonoultramicroscopicsilicovolcanoconiosis']
for i in my_list:
    if len(i)<=10:
        print(i)
        pass
    elif len(i)>10:
        print (i[:1] + '10'+ i[-1])