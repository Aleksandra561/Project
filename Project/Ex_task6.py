import psycopg
import getpass
pwd =  getpass.getpass('Введите пароль: ')
conn = psycopg.connect(dbname= "Farmers",               
                        host= "localhost",
                        user="postgres",
                        password=pwd,
                        port="5432")
cur = conn.cursor()  # Создаем курсор
def find_markets_by_city(cur, city_name):
    """
    Ищет рынки в базе данных по названию города.

    Args:
        cur: Курсор базы данных psycopg2.
        city_name: Название города для поиска.

    Returns:
        Список кортежей с информацией о рынках, найденных в городе, или None, если ничего не найдено.
    """
    cur.execute("""
        SELECT m.fmid, s.zip, c.country_name, s.state_name, s.city_name, m.market_name, m.street
        FROM markets.countries c
        JOIN markets.state_city s ON c.c_id = s.c_id
        JOIN markets.markets m ON s.zip = m.zip AND m.c_ig = s.c_id
        WHERE s.city_name = %s
    """, (city_name,))
    market_list = cur.fetchall()
    return market_list if market_list else None
def find_market_by_state(cur, state_name):
    cur.execute("""
        SELECT m.fmid, s.zip, c.country_name, s.state_name, s.city_name, m.market_name, m.street
        FROM markets.countries c
        JOIN markets.state_city s ON c.c_id = s.c_id
        JOIN markets.markets m ON s.zip = m.zip AND m.c_ig = s.c_id
        WHERE s.state_name = %s
    """, (state_name,))
    market_list = cur.fetchall()
    return market_list if market_list else None
def find_index(cur, zip):
    cur.execute("""select m.fmid,s.zip, c.country_name, s.state_name, s.city_name, m.market_name, m.street 
                            from markets.countries c, markets.state_city s, markets.markets m
                            where c.c_id = s.c_id and s.zip = m.zip and m.c_ig = s.c_id and s.zip = %s """, (zip,))
    market_list = cur.fetchall()
    return market_list if market_list else None
def find_reiting_rewiew (cur, market_number):
    cur.execute("""SELECT  r.fmid, m.market_name, r.text, r.owner,rat.mark, r.date
	                FROM markets.markets m, markets.reviews r, markets.ratings rat where m.fmid = r.fmid and r.fmid = rat.fmid
	                and rat.owner = r.owner and m.fmid = %s""" ,  (market_number,))
    review = cur.fetchall()
    return review if review else None

#функция авторизации

def autoauthorization(default_owner = ''):
    owner = input (f'Авторизуйтесь (если оставите пусто, будет авторизация по умолчанию {default_owner}): ')
    if not owner:
        return default_owner
    return owner

def display_market_details (market_list, all_market_info):
    for fmid,zip,country_name,state_name, city, market_name, street in  market_list:
        if fmid==all_market_info:
            print(f"FMID: {fmid}\n Zip: {zip}\n Country: {country_name}\n State: {state_name}\n City: {city}\n Market: {market_name}\n Street: {street}")
            return True
    return False
#Ф-ция вставки рецензии:
def review_insert (market_number, market_review, owner):
    try:
       cur.execute( """INSERT INTO markets.reviews (fmid, text, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)""", (market_number, market_review, owner,))
       conn.commit()
       return True, None  # Возвращаем True, если успешно
    except psycopg.Error as e:
        conn.rollback()  # Откатываем изменения в случае ошибки
        return False, str(e)  # Возвращаем False и сообщение об ошибке


 #Ф-ция вставки рейтинга:
def reiting_insert (market_number,mark, owner):
    try:
        cur.execute( """INSERT INTO markets.ratings(fmid, mark, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)""", (market_number, mark, owner,))
        conn.commit()
        return True, None  # Возвращаем True, если успешно
    except psycopg.Error as e:
        conn.rollback()  # Откатываем изменения в случае ошибки
        return False, str(e)  # Возвращаем False и сообщение об ошибке

# #Ф-ция ввода рейтинга:
# def get_value_integer_input(prompt):
#     while True:
#         try:
#             value = int(input())
#             return (value)
#         except  ValueError:
#             print("Ошибка: Введите целое число.")

mein_menu = input ('''Добро пожаловать в приложение. Здесь есть много информации о рынках США.\n 
 Сделайте ваш выбор y/n: ''')
if mein_menu == 'n':
    print('Спасибо, что зашли!')
elif mein_menu == 'y':
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
            print(submenu)
            subcommand = input('выберите пункт подменю: ')
            subcommand = subcommand.strip()
            if subcommand == '1':
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
                        page_command = input("Введите 'n' -  для следующей страницы, 'p' - для предыдущей, 'q' -  для выхода в главное меню: ").lower()
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

            elif subcommand =='2':
                    market_found = input ('Введите название рынка по которому хотите увидеть отзыв: ')
                    cur.execute(f""" select m.market_name, r.text  from markets.markets m,markets.reviews r
                                            where m.fmid = r.fmid and  m.market_name = %s ;""", (market_found,))
                    market_reviews = cur.fetchall() 
                    if market_found:
                        for market_name, text in market_reviews:
                            print(f"Название рынка: {market_name}, Отзыв: {text}")
                    else:
                        print("Нет отзывов для отображения.")       
            elif subcommand=='3':
                    cur.execute(f"""select m.market_name, avg (r.mark) from markets.markets m, markets.ratings r
                                            where m.fmid = r.fmid 
                                            group by m.market_name""" )
                    market_rating = cur.fetchone()  # Используем fetchone(), т.к. ожидаем одну запись
                    if market_rating:
                        market_name, avg_rating = market_rating
                        print(f"Рейтинг рынка {market_name}: {avg_rating:.2f}") #Форматирование вывода
                    else:
                        print("Рейтинг для рынков не найден.")
        elif command =='2': 
            city_name = input ('Введите название города: ')
            market_list = find_markets_by_city(cur, city_name)
            if market_list is None:
                print ('Город не найден')
            else: 
                for fmid,zip,country_name,state_name, city, market_name, street in  market_list:
                    print(market_name)
                try:
                    all_market_info = int (input ("Введите уникальный номер рынка для получения подробной информации: "))
                    if not display_market_details(market_list, all_market_info):
                        print("Рынок с таким номером не найден.")
                except ValueError:
                    print("Некорректный ввод.  Введите целое число.")

            break # Выход
        elif command =='3':
            state_name = input ('Введите название штата: ')
            market_list = find_market_by_state(cur, state_name) 
            if market_list is None:
                print ('Штат не найден')
            else: 
                for fmid,zip,country_name,state_name, city, market_name, street in  market_list:
                    print(market_name)
                try:
                    all_market_info = int (input ("Введите уникальный номер рынка для получения подробной информации: "))
                    if not display_market_details(market_list, all_market_info):
                        print("Рынок с таким номером не найден.")
                except ValueError:
                    print("Некорректный ввод.  Введите целое число.")

            break # Выход
        elif command =='4':
            zip = int (input ('Введите индекс: '))
            market_list = find_index(cur, zip)
            if market_list is None:
                print ('Индекс не найден')
            else:
                for fmid,zip, country_name, state_name, city_name, market_name, street in  market_list:
                    print (market_name)
                try: 
                    all_market_info = int (input ("Введите уникальный номер рынка для получения подробной информации: "))
                    if not display_market_details(market_list, all_market_info):
                        print("Рынок с таким номером не найден.")
                except ValueError:
                    print("Некорректный ввод.  Введите целое число.")

            break # Выход
        elif command =='5':
            review_list=[]
            try:
                market_number = int (input ("Введите уникальный номер рынка и мы покажем отзывы и рейтинг: "))
            except ValueError:
                print ('Введен некорректный уникальный номер, это только цифра')
                continue
            review_list = find_reiting_rewiew(cur, market_number)
            if  review_list:
                for fmid, market_name, text, owner, mark, date in  review_list:
                    print (f"FMID: {fmid} market_name:{market_name} text:{text} owner:{owner}, mark{mark}, date {date} \n")
                    add_review = input ("На ваш рынок есть отзывы, давай добавим ваше мнение (y/n): ")
                    if add_review.lower() =='y':
                        market_review = input ('Введите ваш отзыв: ')
                        market_reiting = input ('Введите оценку: ')
                        owner = autoauthorization('default_owner')
                        print(f"Авторизованный пользователь: {owner}")
                        #mark = get_value_integer_input(prompt=5)
                        insert_sqlr = review_insert (market_number, market_review, owner)
                        insert_sql = reiting_insert (market_number,market_reiting,owner)
                        print(f"Вставляем отзыв: market_number={market_number}, market_review={market_review}, owner={owner}")
                        print(f"Вставляем рейтинг: market_number={market_number}, mark={market_reiting}, owner={owner}")
                        print("Отзыв и рейтинг успешно добавлен!")
                        break
                    elif add_review.lower() =='n':
                        market_reiting = input ('Введите оценку: ')
                        owner = autoauthorization('default_owner')
                        print(f"Авторизованный пользователь: {owner}") 
                        #mark = int(input('Введите оценку: '))
                        insert_sql = reiting_insert (market_number,market_reiting,owner)
                        print(f"Вставляем рейтинг: market_number={market_number}, mark={market_reiting}, owner={owner}")
                        print("Рейтинг успешно добавлен!")
                        break
                    else:
                            print("Некорректный ввод. Пожалуйста, введите 'y' или 'n'.")
            else:
                newreview_list = input ('Для Вашего рынка нет ни отзывов, ни рецензий. Хотите ввести y/n: ')
                if newreview_list.lower()=='y':
                    market_review = input ('Введите ваш отзыв: ')
                    market_reiting = input ('Введите оценку: ')
                    owner = autoauthorization('default_owner')
                    print(f"Авторизованный пользователь: {owner}") 
                    #mark = get_value_integer_input(prompt=5)
                    insert_sqlr = review_insert (market_number, market_review, owner)
                    insert_sql = reiting_insert (market_number,market_reiting,owner)
                    print(f"Вставляем отзыв: market_number={market_number}, market_review={market_review}, owner={owner}")
                    print(f"Вставляем рейтинг: market_number={market_number}, mark={market_reiting}, owner={owner}")
                    print("Отзыв и рейтинг успешно добавлен!")
                    #break
                elif newreview_list.lower() =='n':
                    market_reiting = input ('Введите оценку: ')
                    owner = autoauthorization('default_owner')
                    print(f"Авторизованный пользователь: {owner}") 
                    #mark = get_value_integer_input(prompt)
                    insert_sql = reiting_insert (market_number,market_reiting,owner)
                    print(f"Вставляем рейтинг: market_number={market_number}, mark={market_reiting}, owner={owner}")
                    print("Рейтинг успешно добавлен!")
                    #break
                else:
                    print("Некорректный ввод. Пожалуйста, введите 'y' или 'n'.")
        elif command =='6':
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
        elif command=='0':
            print ('Выход')
            break
        else:
            print("Неверный пункт меню. Пожалуйста, выберите из списка.")
#finally:
if 'conn' in locals() and conn:  # Проверяем, было ли установлено соединение
    cur.close()
    conn.close()
    print("Соединение с базой данных закрыто.")