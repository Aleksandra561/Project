CREATE TABLE "markets".countries (
	c_id int GENERATED ALWAYS as identity NOT NULL,
	country_name varchar(100)  NULL,
	CONSTRAINT country_pk PRIMARY KEY (c_id)
	);

	CREATE TABLE "markets".state_city (
		zip int  NOT NULL,
		c_id int NOT NULL,
		state_name varchar(100)  NULL,
		city_name varchar(100)  NULL,
		PRIMARY KEY (zip),
		foreign key (c_id) REFERENCES "markets".countries
	);
	CREATE TABLE "markets".products
	(
		p_id int GENERATED ALWAYS as identity NOT NULL,
		product_name varchar NULL,
		PRIMARY KEY (p_id)
	);

	CREATE TABLE "markets".payment_methods
	(
		pay_id int GENERATED ALWAYS as identity NOT NULL,
		methods_name varchar NULL,
		PRIMARY KEY (pay_id)
	);

	CREATE TABLE "markets".markets (
		FMID int NOT NULL,
		market_name varchar NULL,
		street varchar NULL,
		c_id int not null,
		p_id int not null,
		pay_id int not null,
		zip int not NULL,
		lat float NULL,
		lon float NULL,
		CONSTRAINT FMID_pk PRIMARY KEY (FMID),
		CONSTRAINT country_fk FOREIGN KEY (c_id) REFERENCES "markets".countries (c_id),
		CONSTRAINT zip_fk FOREIGN KEY (zip) REFERENCES "markets".state_city (zip),
		CONSTRAINT p_id_fk FOREIGN KEY (p_id) REFERENCES "markets".products(p_id),
		CONSTRAINT pay_id_fk FOREIGN KEY (pay_id) REFERENCES "markets".payment_methods(pay_id)
		)


	CREATE TABLE "markets".markets_products (
	market_product_id int4 NOT NULL,
	market_id int NOT NULL,
	product_id int NOT NULL,
	CONSTRAINT market_product_pk PRIMARY KEY (market_product_id),
	CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES "markets".products(p_id),
	CONSTRAINT markets_fk FOREIGN KEY (market_id) REFERENCES "markets".markets(FMID)
	)

	CREATE TABLE "markets".markets_payments (
	market_payments_id int4 NOT NULL,
	market_id int4 NOT NULL,
	payment_id int4 NOT NULL,
	CONSTRAINT market_payments_pk PRIMARY KEY (market_payments_id),
	CONSTRAINT markets_fk FOREIGN KEY (market_id) REFERENCES "markets".markets(FMID),
	CONSTRAINT markets_categories_markets_fk FOREIGN KEY (payment_id) REFERENCES "markets".payment_methods(pay_id)
	)





	




	


