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
 - Просмотр и добавление рейтинга и рецензии - 5
 - Удаление отзыва - 6
 - Выход - 0)'''
    submenu = '''
- Вывести все рынки по странично - 1
- Вывести отзывы по одному рынку - 2
- Вывести рейтинг рынка - 3
 '''
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
        if command =='2':
            city_name = input ('Введите название города: ')
            cur.execute(f"""select m.fmid,s.zip, c.country_name, s.state_name, s.city_name, m.market_name, m.street 
                            from markets.countries c, markets.state_city s, markets.markets m
                            where c.c_id = s.c_id and s.zip = m.zip and m.c_ig = s.c_id 
                        """)
            state_city = cur.fetchall()
            found = False
            market_list = []
            for fmid,zip,country_name,state_name, city, market_name, street in  state_city:
                if city==city_name:
                    print (market_name)
                    found = True
                    market_list.append((fmid,zip,country_name,state_name, city, market_name, street))
            if not found:
                print ('Город не найден')
            else: 
                all_market_info = int (input ("Введите уникальный номер рынка для получения подробной информации: "))
                for fmid,zip,country_name,state_name, city, market_name, street in  market_list:
                    if fmid == all_market_info:
                        print(f"FMID: {fmid}\n Zip: {zip}\n Country: {country_name}\n State: {state_name}\n City: {city}\n Market: {market_name}\n Street: {street}")
            break
        if command =='3':
            country_name_r = input ('Введите название штата: ')
            cur.execute(f"""select m.fmid,s.zip, c.country_name, s.state_name, s.city_name, m.market_name, m.street 
                            from markets.countries c, markets.state_city s, markets.markets m
                            where c.c_id = s.c_id and s.zip = m.zip and m.c_ig = s.c_id """)
            countries = cur.fetchall()
            found = False
            market_country_list = []
            for fmid,zip, country_name, state_name, city_name, market_name, street  in  countries:
                if country_name==country_name_r:
                    print (market_name)
                    found = True
                    market_country_list.append((fmid,zip, country_name, state_name, city_name, market_name, street))
            if not found:
                print ('Штат не найден')
            else: 
                all_market_info = int (input ("Введите уникальный номер рынка для получения подробной информации: "))
                for fmid,zip,country_name,state_name, city, market_name, street in  market_country_list:
                     if fmid == all_market_info:
                       print(f"FMID: {fmid}\n Zip: {zip}\n Country: {country_name}\n State: {state_name}\n City: {city}\n Market: {market_name}\n Street: {street}")  # Печатаем информацию о рынке
            break
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
                        print(f"FMID: {fmid}\n Zip: {zip}\n Country: {country_name}\n State: {state_name}\n City: {city}\n Market: {market_name}\n Street: {street}")
            break
        if command =='5':
            review_list=[]
            while True:
                try:
                    market_number = int (input ("Введите уникальный номер рынка и мы покажем отзывы и рейтинг: "))
                    break
                except ValueError:
                    print ('Введен некорректный уникальный номер, это только цифра')
                continue
            sql = """SELECT  r.fmid, m.market_name, r.text, r.owner,rat.mark, r.date
	                FROM markets.markets m, markets.reviews r, markets.ratings rat where m.fmid = r.fmid and r.fmid = rat.fmid
	                and rat.owner = r.owner and m.fmid = %s"""  
            cur.execute(sql, (market_number,))  
            review = cur.fetchall()
            if review:
                for fmid, market_name, text, owner, mark, date in review:
                    review_list.append((fmid, market_name, text, owner, mark, date))
                    print (f"FMID: {fmid} market_name:{market_name} text:{text} owner:{owner}, mark{mark}, date {date} \n")
                add_newreview = input ("На ваш рынок уже есть отзывы, давай добавим ваше мнение (y/n): ")
                if add_newreview.lower() =='y':
                    market_newreview = input ('Введите ваш отзыв: ')
                    market_reiting = input ('Введите оценку: ')
                    owner = input ('Авторизуйтесь: ')
                    try:
                        mark = int( market_reiting)
                    except ValueError:
                        print ("Ошибка: Рейтинг должен быть числом.")
                        continue
                    insert_sqlr = """INSERT INTO markets.reviews (fmid, text, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
                    insert_sql = """INSERT INTO markets.ratings(fmid, mark, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
                    print(f"Вставляем отзыв: market_number={market_number}, market_newreview={market_newreview}, owner={owner}")
                    cur.execute(insert_sqlr, (market_number, market_newreview, owner))
                    print(f"Вставляем рейтинг: market_number={market_number}, mark={mark}, owner={owner}")
                    cur.execute(insert_sql,(market_number, mark, owner))
                    conn.commit()
                    print("Отзыв и рейтинг успешно добавлен!")
                    
                else: 
                    market_newreview = print ('Введите пожалуйста рейтинг, это очень важно для нас: ')
                    market_reiting = input ('Введите оценку: ')
                    owner = input ('Авторизуйтесь: ')
                    try:
                        mark = int (market_reiting)
                    except ValueError:
                        print ("Ошибка: Рейтинг должен быть числом.")
                    insert_sql = """INSERT INTO markets.ratings(fmid, mark, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
                    print(f"Вставляем рейтинг: market_number={market_number}, mark={mark}, owner={owner}")
                    cur.execute(insert_sql, (market_number, mark, owner))
                    conn.commit()
                    print("Рейтинг успешно добавлен!")


            else: 
                add_review = input("Для вашего рынка пока нет отзывов. Хотите добавить отзыв? (y/n): ")
                if add_review =='y':
                    market_review = input ('Введите ваш отзыв: ')
                    owner = input ('Авторизуйтесь: ')
                    try:
                        unic_number = int (input('Введите номер рынка для отзыва: '))
                    except ValueError:
                        print ("Ошибка: Номер должен быть числом.")
                    insert_sql = """INSERT INTO markets.reviews (fmid, text, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
                    cur.execute(insert_sql, (unic_number, market_review, owner))
                    conn.commit()
                    print("Отзыв успешно добавлен!")
        if command =='6':
            review_list=[]
            while True:
                try:
                    market_number = int (input ("Введите уникальный номер рынка и мы покажем отзывы: "))
                    break
                except ValueError:
                    print ('Введен некорректный уникальный номер, это только цифра')
                continue
            sql = """SELECT  r.fmid, m.market_name, r.text, r.owner, r.date
                        FROM markets.markets m, markets.reviews r where m.fmid = r.fmid and m.fmid = %s"""  
            cur.execute(sql, (market_number,))  
            review = cur.fetchall()
            if review:
                for fmid, market_name, text, owner, date in review:
                    review_list.append((fmid, market_name, text, owner,  date))
                    print (f"FMID: {fmid} market_name:{market_name} text:{text} owner:{owner},  date {date} \n")
                del_review = input ("Вы будете удалять Ваш отзыв? y/n: ")
                if del_review.lower()=='y':
                    owner  = input ('Авторизуйтесь: ')
                    sql = """DELETE FROM markets.reviews
	                    WHERE fmid = %s and owner = %s"""
                    cur.execute(sql, (market_number, owner))
                    conn.commit()
                    print ('Отзыв успешно удален')
                else: 
                    print('Отзыв удален не будет')
        else:
            print("Неверный пункт меню. Пожалуйста, выберите из списка.")
#finally:
if 'conn' in locals() and conn:  # Проверяем, было ли установлено соединение
    cur.close()
    conn.close()
    print("Соединение с базой данных закрыто.")