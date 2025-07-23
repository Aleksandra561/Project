my_list = [ 
{'FMID':'1018261','MarketName':'Caledonia Farmers Market Association - Danville', 'city':'Danville', 'State':'Vermont', 'zip':'05828'} ,
{'FMID':'1009994','MarketName':'18th Street Farmer\'s Market', 'city':'Scottsbluff', 'State':'Nebraska', 'zip':'69361'},
{'FMID':'1000709','MarketName':'26th Annual Highlands Business Partnership\'s Farmers Market', 'city':'Highlands', 'State':'New Jersey', 'zip':'07732'}
]
Export = input("Enter the name of thefile ==> ").strip()
print('Вы хотите узнать больше о ранках нашей страны:выберите соответсвующий пункт меню:')
print('нажмите 1, если "Да" нажмите 0, если "Выход"')
mein_menu = input ('Сделайте ваш выбор: ')
if mein_menu == '0':
    print('Спасибо, что зашли!')
elif mein_menu == '1':
    print('выбери интересующий пункт меню: ')
    menu = '''
 - Вывести все рынки - 1
 - Поиск рынка по названию города - 2
 - Поиск рынка по названию штата - 3
 - Поиск рынка по индексу - 4
 - Выход - 0)'''
    command = ''
    while command != '0':
        print (menu)
        command = input('выбери пункт меню: ')
        command = command.strip()
        if command =='1':
             for line in open (Export, encoding= "utf-8") :
                 market = line.strip().split('|')
                 market_name = market[1].strip()
                 print (market_name)
                 break
        elif command =='2':
            city_name = input ('Введите название города: ')
            city_name = city_name.strip().lower()
            found = False
            for market in my_list:
                if city_name== market.get('city').strip().lower():
                    found = True
                    market_found = market.get('MarketName')
                    print (market_found)
                    break
            if not found:
                print ('Такой город не найден')
        elif command =='3':
             state_name = input ('введите штат: ')
             state_name = state_name.strip().lower()
             found = False
             for market in my_list:
                 if state_name == market.get('State').strip().lower():
                     found = True
                     state_found = market.get('MarketName')
                     print (state_found)
                     break
             if not found:
                  print ('Такой штат не найден')

        elif command =='4':
            index = input('Введите индекс: ')
            index = index.strip()
            found = False
            for market in my_list:
                if index == market.get('zip').strip():
                    found = True
                    index_found = market.get('MarketName')
                    print (index_found)
                    break
            if not  found:
                print ('Такой индекс не найден')
                 
        elif command =='0':
             break
        else: print ('Введены некорректные значения')