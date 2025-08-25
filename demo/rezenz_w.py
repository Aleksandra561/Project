import psycopg

conn = psycopg.connect(dbname="Farmers",
                        host="localhost",
                        user="postgres",
                        password="12345",
                        port="5432")
cur = conn.cursor()  # Создаем курсор
def find_review(cur, market_number):
    cur.execute("""SELECT  r.fmid, m.market_name, r.text, r.owner,rat.mark, r.date
	                FROM markets.markets m, markets.reviews r, markets.ratings rat where m.fmid = r.fmid and r.fmid = rat.fmid
	                and rat.owner = r.owner and m.fmid = %s""", (market_number,)) 
    review_list = cur.fetchall()
    return review_list if review_list else None
def insert_reiting(cur, market_number, mark, owner):
    cur.execute("""INSERT INTO markets.ratings(fmid, mark, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)""", 
                   (market_number, mark, owner))
    conn.commit()
    return True

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
        command = input ('выбери пункт меню: ')   
        command = command.strip()
        if command =='5':
            while True:
                try:
                    market_number = int (input ("Введите уникальный номер рынка (или 0 для выхода): "))
                    if market_number ==0:
                       break
                    review_list = find_review(cur, market_number)
                    if review_list is None:
                        add_review = input ('Для этого рынка нет отзывов, хотите ввести: y/n  ')
                        if add_review.lower() =='y':
                            market_review = input ('Введите ваш отзыв: ')
                            owner = input ('Авторизуйтесь: ')
                            insert_sql = """INSERT INTO markets.reviews (fmid, text, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
                            cur.execute(insert_sql, (market_number, market_review, owner))
                            conn.commit()
                            print("Отзыв успешно добавлен!")
                            break
                        else:
                            print ('Отзыв не добавлен')
                    else:
                        for fmid, market_name, text, owner,mark,date in review_list:
                            print((f"FMID: {fmid}, market_name:{market_name}, text:{text}, owner:{owner}, mark:{mark}, date: {date} \n"))
                            break
                        add_newreview = input('Оставьте свой отзыв: y/n ')
                        if add_newreview.lower() == 'y':
                            market_review = input ('Введите свой отзыв: ')
                            owner = input ('Авторизуйтесь: ')
                            insert_sql = """INSERT INTO markets.reviews (fmid, text, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
                            cur.execute(insert_sql, (market_number, market_review, owner))
                            conn.commit()
                            print ('Отзыв успешно добавлен')
                        elif add_newreview.lower()=='n':
                            market_number = int (input ("Нужно оценить работу рынка, Введите уникальный номер рынка: "))
                            mark = int (input('Поставьте оценку: ')) 
                            owner = input('Авторизуйтесь: ')
                            add_mark = insert_reiting(cur, market_number, mark, owner)
                            if market_number is None:
                                print ('Такого рынка нет')
                            else:
                                print ('Ваша оценка добавлена')
                            break

                except ValueError:
                    print ('Ошибка: Номер должен быть числом.')
                        #elif add_review.lower()=='n':




                    
    #     except ValueError:
    #         print ('Введен некорректный уникальный номер, это только цифра')
    #     continue
    #     if market_number is None:
    #         add_review = input("Для вашего рынка пока нет отзывов. Хотите добавить отзыв? (y/n): ")
    #     if add_review =='y':
            
    # else:
    #     print (f"FMID: {fmid}, market_name:{market_name}, text:{text}, owner:{owner}, mark:{mark}, date: {date} \n")
    #     add_newreview = input ("На ваш рынок уже есть отзывы, давай добавим ваше мнение (y/n): ")
    #     if add_newreview.lower() =='y':
    #         market_newreview = input ('Введите ваш отзыв: ')
    #         market_reiting = input ('Введите оценку: ')
    #         owner = input ('Авторизуйтесь: ')
    #         try:
    #             mark = int(market_reiting)
    #         except ValueError:
    #             print ("Ошибка: Рейтинг должен быть числом.")
    #         continue
    #     insert_sqlr = """INSERT INTO markets.reviews (fmid, text, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
    #     insert_sql = """INSERT INTO markets.ratings(fmid, mark, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
    #     print(f"Вставляем отзыв: market_number={market_number}, market_newreview={market_newreview}, owner={owner}")
    #     cur.execute(insert_sqlr, (market_number, market_newreview, owner))
    #     print(f"Вставляем рейтинг: market_number={market_number}, mark={mark}, owner={owner}")
    #     cur.execute(insert_sql,(market_number, mark, owner))
    #     conn.commit()
    #     print("Отзыв и рейтинг успешно добавлен!")
    #     elif add_newreview.lower() =='n': 
    #     market_newreview = print ('Введите пожалуйста рейтинг, это очень важно для нас: ')
    #     market_reiting = input ('Введите оценку: ')
    #     owner = input ('Авторизуйтесь: ')
    #     try:
    #         mark = int (market_reiting)
    #     except ValueError:
    #         print ("Ошибка: Рейтинг должен быть числом.")
    #         insert_sql = """INSERT INTO markets.ratings(fmid, mark, owner, date) VALUES (%s, %s,%s, CURRENT_DATE)"""
    #         print(f"Вставляем рейтинг: market_number={market_number}, mark={mark}, owner={owner}")
    #         cur.execute(insert_sql, (market_number, mark, owner))
    #         conn.commit()
    #         print("Рейтинг успешно добавлен!")
    #     if command =='6':
    #         review_list=[]
    #         while True:
    #             try:
    #                 market_number = int (input ("Введите уникальный номер рынка и мы покажем отзывы: "))
    #                 break
    #             except ValueError:
    #                 print ('Введен некорректный уникальный номер, это только цифра')
    #             continue
    #         sql = """SELECT  r.fmid, m.market_name, r.text, r.owner, r.date
    #                     FROM markets.markets m, markets.reviews r where m.fmid = r.fmid and m.fmid = %s"""  
    #         cur.execute(sql, (market_number,))  
    #         review = cur.fetchall()
    #         if review:
    #             for fmid, market_name, text, owner, date in review:
    #                 review_list.append((fmid, market_name, text, owner,  date))
    #                 print (f"FMID: {fmid} market_name:{market_name} text:{text} owner:{owner},  date {date} \n")
    #             del_review = input ("Вы будете удалять Ваш отзыв? y/n: ")
    #             if del_review.lower()=='y':
    #                 owner  = input ('Авторизуйтесь: ')
    #                 sql = """DELETE FROM markets.reviews
	#                     WHERE fmid = %s and owner = %s"""
    #                 cur.execute(sql, (market_number, owner))
    #                 conn.commit()
    #                 print ('Отзыв успешно удален')
    #             else: 
    #                 print('Отзыв удален не будет')

                    
                

           

                    
                
        
          
                