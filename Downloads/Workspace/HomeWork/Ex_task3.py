# product_list =set()
# row_count = 0
# product_dict=dict()
# product_dict_rev=dict()
# product_id = 0
# Export = 'Export.csv'.strip()
# for line in open (Export, encoding='utf-8'):
#     mainline = line.strip().split(',')
#     product = mainline[28:58]
#     print (product)
#     break
# dirfile = r"C:\Users\95004\Downloads\Workspace\HomeWork\\"
# counter = 1
# for product in my_list:
#     product_dict[product_id] = product
#     product_dict_rev[product] = product_id
#     product_id += 1 
# products = open (dirfile+'products.csv','w')
# for i in product:
#    products.write(f"{counter}\t{i}\n")
#    counter +=1
# products.close()

# payment_method_list =set()
# row_count = 0
# payment_method_dict=dict()
# payment_method_dict_rev=dict()
# payment_method_id = 0
# Export = 'Export.csv'.strip()
# for line in open (Export, encoding='utf-8'):
#     pay = line.strip().split(',')
#     my_list = pay[23:28]
#     print (my_list)
#     print (type(pay))
#     break
# dirfile = r"C:\Users\95004\Downloads\Workspace\HomeWork\\"
# counter = 1
# for payment_method in my_list:
#     payment_method_dict[payment_method_id] = payment_method
#     payment_method_dict_rev[payment_method] = payment_method_id
#     payment_method_id += 1 
# payment_method = open(dirfile+'payment_method.csv', 'w')
# for i in my_list:
#     payment_method.write(f"{counter}\t{i}\n")
#     counter +=1
# payment_method.close()


countries_list =set()
row_count = 0
country_dict=dict()
country_dict_rev=dict()
country_id_counter = 0
Export = 'Export.csv'.strip()
for line in open (Export, encoding='utf-8'):
    if row_count ==0:
        row_count+=1
        continue
    mainline = line.strip().split(',')
    country = mainline[9].strip()
    countries_list.add(country)
my_list = list(countries_list)
print (my_list)
print(type(my_list))
dirfile = r"C:\Users\95004\Downloads\Workspace\HomeWork\\"
counter = 1
for country in my_list:
    country_dict[country_id_counter] = country
    country_dict_rev[country] = country_id_counter
    country_id_counter += 1 
#print (country_dict_rev)
countries = open (dirfile+'countries.csv','w')
for i in my_list:
    countries.write(f"{counter}\t {i}\n")
    counter +=1
countries.close()

state_city_list =set()
row_count = 0
state_city_dict=dict()
state_city_dict_rev=dict()
sity_state_id = 0
Export = 'Export.csv'.strip()
for line in open (Export, encoding='utf-8'):
    mainline = line.strip().split(',')
    state_city = None
    if len(mainline)>11:
        index = mainline[11].strip()
        state = mainline[10].strip()
        city = mainline[8].strip()
        state_city = f"{index}\t{country_id_counter}\t{state}\t{city}"
        country = mainline[9].strip()
    if state_city:
        state_city_list.add(state_city)
my_list = list(state_city_list)
print (my_list)
print(type(my_list))
dirfile = r"C:\Users\95004\Downloads\Workspace\HomeWork\\"
counter = 1
for state_city in my_list:
    state_city_dict[sity_state_id] = state_city
    state_city_dict_rev[state_city] = sity_state_id
    sity_state_id += 1 
state_cities = open (dirfile+'state_cities.csv','w')
for i in my_list:
    index, country, state, city = i.split('\t')
    country_id = country_dict_rev.get(country, -1)  
    state_cities.write(f"{i}\t{country_id}\n")
state_cities.close()

market_list =set()
Export = 'Export.csv'.strip()
for line in open (Export, encoding='utf-8'):
    mainline = line.strip().split(',')
    market = None
    country = mainline[9].strip()
    street = mainline[6].strip()
    #product = mainline[28:58]
    #my_list = pay[23:28]
    if len(mainline)>20:
        FMID = mainline[0].strip()
        market_name = mainline[1].strip()
        index = mainline[11].strip()
        lan = mainline[20].strip()
        lon = mainline[21].strip()
        markets = f"{FMID}\t{market_name}\t{street}\t{index}\t{lan}\t{lon}"
    
    if markets:
        market_list.add(markets)
my_list = list(market_list)
print (my_list)
print(type(my_list))
dirfile = r"C:\Users\95004\Downloads\Workspace\HomeWork\\"
markets = open (dirfile+'markets.csv','w')
for i in my_list:
   FMID,market_name,street, index,lan,lon = i.split('\t') 
   country_id = country_dict_rev.get(country, -1)
   #product_id = product_dict_rev.get(product, -1)
   #payment_method_id =  payment_method_dict_rev.get(i, -1)
   state_city_id = state_city_dict_rev.get(state_city, -1)
   markets.write(f"{FMID}\t{market_name}\t{street}\t{index}\t{lan}\t{lon}\t{country_id}\t{state_city_id}\n")  
markets.close()
