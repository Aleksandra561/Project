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

        elif command == '0':  # Добавлено для выхода из главного меню
            print("Выход из главного меню.")
            break
        else:
            print("Неверный пункт меню. Пожалуйста, выберите из списка.")
    conn.close()