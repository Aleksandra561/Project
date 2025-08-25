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
 - Просмотр и добавление рецензии - 5
 - Выход - 0)'''
    submenu = '''
- Вывести все рынки по странично - 1
- Вывести отзывы по одному рынку - 2
- Вывести рейтинг рынка - 3 '''
    command = ''
    while command != '0':
        print (menu)
        command = input('выбери пункт меню: ')
        command = command.strip()
        if command =='1':
            page_size = 10
            current_page = 0
            while True:
                offset = current_page * page_size
                cur.execute(f"""SELECT market_name FROM markets.markets LIMIT {page_size} OFFSET {offset};""")
                markets = cur.fetchall()
                print(f"Страница {current_page + 1}:")
                if not markets:
                    print("Больше нет страниц.")
                else:
                    for market_name in markets:
                        print (market_name[0])

                page_command = input("Введите 'n' для следующей страницы, 'p' для предыдущей, 'q' для выхода: ").lower()

                if page_command == 'n':
                    current_page += 1
                elif page_command == 'p':
                    if current_page > 0:
                        current_page -= 1
                    else:
                        print("Вы на первой странице.")
                elif page_command == 'q':
                    break  # Выход из внутреннего цикла пагинации
                else:
                    print("Неверная команда. Пожалуйста, введите 'n', 'p' или 'q'.")

                if not markets and current_page > 0 and page_command != 'q':
                    current_page -=1
                    print ("Вы вернулись на предыдущую страницу")
                    continue

                if not markets and current_page == 0:
                    print ("Больше нет страниц")
                    break
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
                                where m.fmid = r.fmid;""")
                market_reviews = cur.fetchmany(5) #получаем список кортежей
                if market_reviews:
                    for market_name, text in market_reviews:
                        print (f"Название рынка: {market_name}, Отзыв: {text}")
                    # print (f"Для рынка: {market_name} - нет отзывов, но вы можете его оставить")        
            elif subcommand=='3':
                cur.execute(f"""select m.market_name, avg (r.mark) from markets.markets m, markets.ratings r
                                where m.fmid = r.fmid 
                                group by m.market_name""" )
                market_rating = cur.fetchmany(1) #получаем кортеж
                if market_rating:
                    for market_name, mark in market_rating:
                        print (f"Название рынка: {market_name}, Рейтинг: {mark}")
                #else: print  (f"Для рынка {market_name} - нет рейтинга, но вы можете его оставить")
            break