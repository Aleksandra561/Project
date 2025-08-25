import psycopg

conn = psycopg.connect(dbname="Farmers",
                        host="localhost",
                        user="postgres",
                        password="12345",
                        port="5432")
cur = conn.cursor()  # Создаем курсор

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
    submenu = '''
- Вывести все рынки по странично - 1
- Вывести отзывы по одному рынку - 2
- Вывести рейтинг ранка - 3 '''
    command = ''
    while command != '0':
        print (menu)
        command = input('выбери пункт меню: ')
        command = command.strip()
        if command =='4':
            zip_name = int (input ('Введите индекс: '))
            cur.execute(f"""select m.fmid,s.zip, c.country_name, s.state_name, s.city_name, m.market_name, m.street 
                            from markets.countries c, markets.state_city s, markets.markets m
                            where c.c_id = s.c_id and s.zip = m.zip and m.c_ig = s.c_id """)
            markets = cur.fetchall()
            found = False
            all_market_list=[]
            for fmid,zip, country_name, state_name, city_name, market_name, street in  markets:
                if zip==zip_name:
                    print (market_name)
                    found = True
                    all_market_list.append((fmid,zip, country_name, state_name, city_name, market_name, street))
            if not found:
                print ('Индекс не найден')
            else: 
                all_market_info = int (input ("Введите уникальный номер рынка для получения подробной информации: "))
                for fmid,zip,country_name,state_name, city, market_name, street in  all_market_list:
                    if fmid == all_market_info:
                        print (all_market_list)
            break
    