import psycopg


conn = psycopg.connect(dbname="Farmers",
                        host="localhost",
                        user="postgres",
                        password="12345",
                        #password="SQLServer7",
                        port="5432")

cur = conn.cursor()

cur.execute("""select * from markets.markets ;""")
res = cur.fetchall()
print(res)
