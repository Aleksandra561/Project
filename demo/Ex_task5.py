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
        if command =='1':
            print (submenu)
            subcommand = input ('выберите пункт подменю: ')
            subcommand = subcommand.strip()
            if subcommand == '1':
                cur.execute(f"""SELECT market_name FROM markets.markets limit 10;""") 
                markets = cur.fetchall()
                for market_name in markets:
                    print (market_name[0])
            elif subcommand =='2':
                cur.execute(f""" select m.market_name, r.text  from markets.markets m,markets.reviews r
                                where m.fmid = r.fmid and r.fmid = 1021464;""")
                market_reviews = cur.fetchmany(5) #получаем список кортежей
                if market_reviews:
                    for market_name, text in market_reviews:
                        print (f"Название рынка: {market_name}, Отзыв: {text}")
                    # print (f"Для рынка: {market_name} - нет отзывов, но вы можете его оставить")        
            elif subcommand=='3':
                cur.execute(f"""select m.market_name, avg (r.mark) from markets.markets m, markets.ratings r
                                where m.fmid = r.fmid and r.fmid = 1021464
                                group by m.market_name""" )
                market_rating = cur.fetchmany(1) #получаем кортеж
                if market_rating:
                    for market_name, mark in market_rating:
                        print (f"Название рынка: {market_name}, Рейтинг: {mark}")
                #else: print  (f"Для рынка {market_name} - нет рейтинга, но вы можете его оставить")