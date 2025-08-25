import psycopg

# ... (Ваш код подключения к базе данных) ...

page_size = 10  # Количество рынков на одной странице
current_page = 0

while command != '0':
    print (menu)
    command = input('выбери пункт меню: ')
    command = command.strip()

    if command == '1':
        while True: # Внутренний цикл для пагинации
            offset = current_page * page_size
            cur.execute(f"""SELECT market_name FROM markets.markets limit {page_size} offset {offset};""")
            markets = cur.fetchall()

            if not markets:
                print("Больше нет страниц.")
                if current_page > 0:
                  current_page -= 1 # Вернуться на предыдущую страницу, если мы случайно вышли за пределы
                break  # Выход из внутреннего цикла пагинации

            my_set = {market[0] for market in markets}
            print(f"Страница {current_page + 1}:")
            print(my_set)

            page_command = input("Введите 'n' для следующей страницы, 'p' для предыдущей, 'q' для выхода: ").lower()

            if page_command == 'n':
                current_page += 1
            elif page_command == 'p':
                if current_page > 0:
                    current_page -= 1
                else:
                    print("Вы на первой странице.")
            elif page_command == 'q':
                break # Выход из внутреннего цикла пагинации
            else:
                print("Неверная команда. Пожалуйста, введите 'n', 'p' или 'q'.")

    # ... (другие пункты меню) ...