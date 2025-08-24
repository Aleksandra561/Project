--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: markets; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA markets;


ALTER SCHEMA markets OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: countries; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.countries (
    c_id integer NOT NULL,
    country_name character varying(255)
);


ALTER TABLE markets.countries OWNER TO postgres;

--
-- Name: countries_c_id_seq; Type: SEQUENCE; Schema: markets; Owner: postgres
--

ALTER TABLE markets.countries ALTER COLUMN c_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME markets.countries_c_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: markets; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.markets (
    fmid integer NOT NULL,
    market_name character varying,
    street character varying,
    zip integer,
    lat double precision,
    lon double precision,
    c_ig integer NOT NULL
);


ALTER TABLE markets.markets OWNER TO postgres;

--
-- Name: markets_payments; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.markets_payments (
    market_payments_id integer NOT NULL,
    market_id integer NOT NULL,
    payment_id integer NOT NULL
);


ALTER TABLE markets.markets_payments OWNER TO postgres;

--
-- Name: markets_products; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.markets_products (
    market_product_id integer NOT NULL,
    market_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE markets.markets_products OWNER TO postgres;

--
-- Name: payment_methods; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.payment_methods (
    pay_id integer NOT NULL,
    methods_name character varying
);


ALTER TABLE markets.payment_methods OWNER TO postgres;

--
-- Name: payment_methods_pay_id_seq; Type: SEQUENCE; Schema: markets; Owner: postgres
--

ALTER TABLE markets.payment_methods ALTER COLUMN pay_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME markets.payment_methods_pay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.products (
    p_id integer NOT NULL,
    product_name character varying
);


ALTER TABLE markets.products OWNER TO postgres;

--
-- Name: products_p_id_seq; Type: SEQUENCE; Schema: markets; Owner: postgres
--

ALTER TABLE markets.products ALTER COLUMN p_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME markets.products_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ratings; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.ratings (
    id integer NOT NULL,
    fmid integer NOT NULL,
    mark integer NOT NULL,
    owner character varying(255),
    date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_mark CHECK (((mark >= 1) AND (mark <= 10)))
);


ALTER TABLE markets.ratings OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: markets; Owner: postgres
--

CREATE SEQUENCE markets.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE markets.ratings_id_seq OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: markets; Owner: postgres
--

ALTER SEQUENCE markets.ratings_id_seq OWNED BY markets.ratings.id;


--
-- Name: reviews; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.reviews (
    id integer NOT NULL,
    fmid integer NOT NULL,
    text text,
    owner character varying(255),
    date timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE markets.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: markets; Owner: postgres
--

CREATE SEQUENCE markets.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE markets.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: markets; Owner: postgres
--

ALTER SEQUENCE markets.reviews_id_seq OWNED BY markets.reviews.id;


--
-- Name: state_city; Type: TABLE; Schema: markets; Owner: postgres
--

CREATE TABLE markets.state_city (
    zip integer NOT NULL,
    c_id integer NOT NULL,
    state_name character varying(100),
    city_name character varying(100)
);


ALTER TABLE markets.state_city OWNER TO postgres;

--
-- Name: ratings id; Type: DEFAULT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.ratings ALTER COLUMN id SET DEFAULT nextval('markets.ratings_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.reviews ALTER COLUMN id SET DEFAULT nextval('markets.reviews_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.countries (c_id, country_name) FROM stdin;
2	 Crow Wing
3	 Crawford
4	 Santa Barbara
5	 Dodge
6	 Big Horn
7	 Volusia
8	 Mesa
9	 Wolfe
10	 Ottawa
11	 Cobb
12	 Payette
13	 Santa Clara
14	 Chenango
15	 McHenry
16	 Kealakekua
17	 Crystal Lake
18	 Jenkins
19	 Little River
20	 Jefferson
21	 AR
22	 Prince George's
23	 Attleboro
24	 University City
25	 Schoolcraft
26	 Faulkner
27	 Steelville
28	 Philadelphia
29	 Portsmouth
30	 Bucks
31	 Ripley
32	 Kings
33	 Walla Walla
34	 Green
35	 Cerro Gordo
36	 Fleming
37	 Allegheny
38	 Catawba
39	 NC
40	 Matanuska-Susitna
41	 Woodbury
42	 Winona
43	 Furnas
44	 Sussex
45	 Guilford
46	 Nye
47	 Benewah
48	 Pottstown
49	 Converse
50	 Decatur
51	 Oldham
52	 McLean
53	 Vanderburgh
54	 Grand Isle
55	 Bamberg
56	 Gentry
57	 Champaign
58	 Windham
59	 Knox
60	 California
61	 Fountain
62	 McDowell
63	 Allegan
64	 Dyer
65	 Queens
66	 Boone
67	 Meigs
68	 Gregg
69	 Pope
70	 Mouteka
71	 Yakima
72	 Williamson
73	 Hunterdon
74	 Leesburg
75	 Humacao
76	 Livingston
77	 Northumberland
78	 Floyd
79	 McCook
80	 Clatsop
81	 El Paso
82	 Rapides
83	 Chippewa
84	 NY
85	 Howard
86	 Sierra
87	 Sanders
88	 Rockland
89	 Delaware
90	 St. Clair
91	 Penobscot
92	 Bell
93	 Harford
94	 Blanco
95	 Brunswick
96	 Houston
97	 Shawnee
98	 Lapeer
99	 Stokes
100	 Calaveras
101	 Valley
102	 Menominee
103	 Plymouth
104	 Bristol
105	 Stark
106	 Alexandria
107	 Door
108	 Vernon
109	 Apache
110	 Whatcom
111	 San Luis Obispo
112	 Westmoreland
113	 Puyallup
114	 Hancock
115	 Lenoir
116	 Carroll
117	 Cooke
118	 Neosho
119	 Sumter
120	 Lafayette
121	 Snohomish
122	 Fresno
123	 Gooding
124	 Posey
125	 Crittenden
126	 Park
127	 North Adams
128	 Grant
129	 Osage
130	 Huntingdon
131	 Hendricks
132	 Lexington
133	 Chowan
134	 Laurel
135	 Ocean
136	 701 Cedar
137	 Bernalillo
138	 Midland
139	 Minneapolis
140	 Wabasha
141	 Chester
142	 Stevens
143	 Schoharie
144	 Carteret
145	 Prince George
146	 Nevada
147	 Cass
148	 Duval
149	 Baltimore City
150	 Burbank
151	 Lawrence
152	 Lancaster
153	 Hennepin
154	 Morris
155	 Jessamine
156	 Chesterfield
157	 Westchester
158	 Dolores
159	 Buchanan
160	 Humboldt
161	 
162	 Waukesha
163	 Spring Run
164	 Tuolumne
165	 Washoe
166	 Orange
167	 Maury
168	 Bronx
169	 Joplin
170	 McKenzie
171	 Benton
172	 Barbour
173	 Putnam
174	 Hart
175	 Sebastian
176	 Charleston
177	 Delray Beach
178	 Hingham
179	 St. Joseph
180	 Cayuga
181	 Clearfield
182	 Highland
183	 Sangamon
184	 Barnstable
185	 Santa Cruz
186	 Rockingham
187	 Eaton
188	 Montezuma
189	 Rensselaer
190	 Kalamazoo
191	 Kent
192	 Pike
193	 Rowan
194	 Harrison
195	 Gallatin
196	 Lynchburg
197	 Sumner
198	 420 Field Street
199	 Nash
200	 Richmond
201	 Smyth
202	 Boyd
203	 Winnebago
204	 Watertown
205	 New London
206	 Sauk
207	 Napa
208	 San Bernardino
209	 Contra Costa
210	 Ventura
211	 Newton
212	 Sioux
213	 Merced
214	 IA
215	 Iosco
216	 Loudoun
217	 Hanover
218	 Kootenai
219	 Berks
220	 Teton
221	 Nueces
222	 Allegany
223	 WI
224	 Palo Alto
225	 Fairfield
226	 Greenbrier
227	 St. Croix
228	 Wynne
229	 Pacifica
230	 Craighead
231	 Providence
232	 McLennan
233	 Wagoner
234	 Belmont
235	 Weston
236	 at  2 Brookfield Rd
237	 Rutherford
238	 Ocean City
239	 Avoyelles
240	 Clarkston
241	 Austin
242	 Charles Town
243	 Alamosa
244	 Barrow
245	 Orland Park
246	 Cape Girardeau
247	 Alameda
248	 Scotts Bluff
249	 Lamoille
250	 Lincoln
251	 Colusa
252	 Lucas
253	 Stearns
254	 Onslow
255	 Albany
256	 Lac qui Parle
257	 Platte
258	 Washtenaw
259	 Downtown Janesville
260	 Miller
261	 Caledonia
262	 Finney
263	 Boulder
264	 Vigo
265	 Monterey
266	 Salt Lake City
267	 Sullivan
268	 Garrard
269	 St. Tammany
270	 Gwinnett
271	 Oakland
272	 Cameron
273	 Harris
274	 Collier
275	 Hood River
276	 Chelan
277	 Williamsburg
278	 District of Columbia
279	 Ferguson
280	 Sheridan
281	 Montrose
282	 Martin
283	 New York
284	 North Creek
285	 Anderson
286	 Camden
287	 DC 20008
288	 Wise
289	 Hardin
290	 Ida
291	 Davidson
292	 Warrick
293	 Missaukee
294	 Saunders
295	 Marinette
296	 Frederick
297	 Salt Lake
298	 Goshen
299	 Woodward
300	 Elliott
301	 Charles
302	 Sandoval
303	 Hillsborough
304	 Clearwater
305	 Utica
306	 Clare
307	 Henrico
308	 Wyandot
309	 Cattaraugus
310	 Dakota
311	 Monmouth
312	 DeKalb
313	 Durham
314	 Caddo
315	 Suffolk
316	 Bexar
317	 Charlevoix
318	 CA 94611
319	 Talbot
320	 Birmingham
321	 ID
322	 Kenai Peninsula
323	 Felton
324	 Osceola
325	 MO
326	 Greenville
327	 Dane
328	 Henderson
329	 Searcy
330	 White Bear Lake
331	 Louisiana
332	 Gage
333	 Alger
334	 Saline
335	 Clarence
336	 Miami
337	 Curry
338	 Johnson
339	 Hampshire
340	 Collin
341	 Kenton
342	 Roanoke
343	 Sanilac
344	 Santa Rosa
345	 Sitka
346	 King
347	 Tarrant
348	 Taos
349	 Pima
350	 Carson City
351	 Somerset
352	 Carter
353	 Elkhart
354	 Montgomery
355	 Marquette
356	 Webster
357	 Ada
358	 Wallowa
359	 Medina
360	 Mercer
361	 Lane
362	 Burleigh
363	 Smith
364	 Woodford
365	 Kershaw
366	 Linn
367	 Arkansas
368	 Worcester
369	 Iberia
370	 Timnath
371	 DuPage
372	 Blair
373	 King George
374	 Petersburg
375	 St. Mary's
376	 Siskiyou
377	 Ohio
378	 Norfolk
379	 Victoria
380	 Wayne
381	 Maui
382	 Spencer
383	 El cajon
384	 Pendleton
385	 Dawson
386	 Baltimore
387	 Bedford
388	 Clifton Park
389	 Parkville
390	 Rock
391	 Evansville
392	 Columbia
393	 Garrett
394	 Licking
395	 Wood
396	 Broome
397	 Republic
398	 Greene
399	 Fort Bend
400	 Owen
401	 Florence
402	 Spotsylvania
403	 Westcliffe
404	 St. Louis
405	 Pulaski
406	 Hampden
407	 Cheshire
408	 Cumberland
409	 Bastrop
410	 Hamilton
411	 Rock Island
412	 Payson
413	 Larimer
414	 Fall River
415	 Waynesboro
416	 IN
417	 San Mateo
418	 Steubenville
419	 Maricopa
420	 Kewaunee
421	 Shannon
422	 Mobile
423	 Chemung
424	 Allen
425	 Ulster
426	 Yavapai
427	 Cherokee
428	 Clark
429	 Meade
430	 Lake Oswego
431	 Androscoggin
432	 Lake
433	 Van Buren
434	 Bibb
435	 Wapello
436	 York
437	 Dubuque
438	 Navajo
439	 Manistee
440	 Pine
441	 Iowa
442	 KY
443	 Passaic
444	 Marathon
445	 Buncombe
446	 El Dorado
447	 Grand Traverse
448	 Butte
449	 Botetourt
450	 Antioch
451	 Lemont
452	 Webster Towne Center
453	 Hudson
454	 Slippery Rock
455	 Albemarle
456	 Wilkes
457	 Solano
458	 Chisago
459	 Tillamook
460	 Lyme
461	 Madison
462	 DeSoto
463	 Manitowoc
464	 Kitsap
465	 Watonwan
466	 Wright
467	 Middlesex
468	 Greenwood
469	 Christian
470	 Grundy
471	 Tolland
472	 Lubbock
473	 Leelanau
474	 Mason
475	 De Baca
476	 Kauai
477	 Kenosha
478	 Anchorage
479	 Natrona
480	 Yell
481	 Custer
482	 Ruther Glen
483	 Barron
484	 Sandusky
485	 Itasca
486	 Yardley borough
487	 Polk
488	 Erie
489	 Vance
490	 Carolina
491	 Los Angeles
492	 Jackson
493	 Santa paula
494	 Clayton
495	 Marion
496	 Juneau
497	 GA
498	 Billboard
499	 Yolo
500	 Forsyth
501	 Riverside
502	 Addison
503	 Randolph
504	 Wells
505	 Dare
506	 Bottineau
507	 Orleans
508	 Newport
509	 Breathitt
510	 Seneca
511	 Shawano
512	 Turners Falls
513	 Gregory
514	 Lowell
515	 Adair
516	 Exeter
517	 Minnehaha
518	 Comal
519	 Bonneville
520	 San Miguel
521	 Tippecanoe
522	 Hall
523	 Oklahoma
524	 AVON
525	 Brown
526	 Spartanburg
527	 Plumas
528	 Chatham
529	 Modoc
530	 Dutchess
531	 Mineral
532	 Eagle
533	 Rusk
534	 Butler
535	 Lee
536	 Athens
537	 Orangeburg
538	 Sonoma
539	 Jasper
540	 Washington
541	 Walton
542	 Whitley
543	 Jo Daviess
544	 IL 62920
545	 Gas City
546	 Goodhue
547	 Coos Bay
548	 Stanly
549	 Hawaii
550	 Weber
551	 Clay
552	 Marshall
553	 Brazoria
554	 Pennington
555	 New Jersey
556	 Burke
557	 La Plata
558	 Macomb
559	 Hartford
560	 Logan
561	 Marin
562	 Bluemont
563	 Adams
564	 Cooper
565	 Sevier
566	 Green Lake
567	 Galveston
568	 TX
569	 Gantry parking lot
570	 Rio Arriba
571	 Pitt
572	 Ionia
573	 Monroe
574	 Churchill
575	 Poweshiek
576	 Lackawanna
577	 Sherburne
578	 Cook
579	 Richland
580	 Tuscaloosa
581	 Honolulu
582	 Lewis
583	 San Diego
584	 Van Zandt
585	 Clermont
586	 Etowah
587	 Calhoun
588	 Mackinac
589	 San Juan
590	 Litchfield
591	 Madras
592	 New Haven
593	 Allamakee
594	 Beltrami
595	 Nassau
596	 Calloway
597	 Oceana
598	 Horry
599	 Northampton
600	 Lehigh
601	 Blount
602	 Grayson
603	 Missoula
604	 New Hanover
605	 Miami-Dade
606	 Thurston
607	 Weakley
608	 Douglas
609	 Schuyler
610	 Lyon
611	 Seward
612	 Bennington
613	 Winneshiek
614	 Strafford
615	 Dearborn
616	 Isabella
617	 Ward
618	 Chittenden
619	 St. Louis City
620	 Box Elder
621	 Milwaukee
622	 Halifax
623	 Muncie
624	 Franklin
625	 Wasatch
626	 Shoshone
627	 Los Ranchos
628	 Ste
629	 Grays Harbor
630	 Portland
631	 Weld
632	 Sedgwick
633	 Scott
634	 Wake
635	 Gratiot
636	 Menifee
637	 Whiteside
638	 Penn Yan
639	 Mingo
640	 Fulton
641	 Ware
642	 Outagamie
643	 Saginaw
644	 Kane
645	 Racine
646	 Morgan
647	 Spokane
648	 Campbell
649	 Pittsburg
650	 Petersburg
651	 Warren
652	 Huntington
653	 Deer Lodge
654	 Indiana
655	 Cuyahoga
656	 Denton
657	 Carbon
658	 East Baton Rouge
659	 Simpson
660	 Bethany Beach
661	 Shelby
662	 Jones
663	 Travis
664	 Summit
665	 Garland
666	 medina
667	 Pierce
668	 Amherst
669	 Silver Bow
670	 Leon
671	 Canyon
672	 Hampton
673	 RI
674	 Idaho
675	 Wythe
676	 Perry
677	 Mecklenburg
678	 Essex
679	 Beaufort
680	 Burt
681	 Appomattox
682	 off Beavercreek Rd
683	 NM
684	 Georgetown
685	 Fond du Lac
686	 Kendall
687	 Belknap
688	 McCracken
689	 Clackamas
690	 behind Sears & Dillard's
691	 Augusta
692	 Fayette
693	 San Francisco
694	 Ellis
695	 Will
696	 Dallas
697	 Fairfax
698	 Atchison
699	 Dona Ana
700	 Pinellas
701	 Rutland
702	 Oneida
703	 Ingham
704	 Mi
705	 Broward
706	 Alachua
707	 Bullitt
708	 Pleasants
709	 Nottoway
710	 Skagit
711	 Superior
712	 Granville
713	 Luna
714	 Fort Pierce
715	 Whitman
716	 Portage
717	 Hernando
718	 Nelson
719	 Huerfano
720	 Chautauqua
721	 Panola
722	 Denmark
723	 Union
724	 Roanoke City
725	 Multnoma
\.


--
-- Data for Name: markets; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.markets (fmid, market_name, street, zip, lat, lon, c_ig) FROM stdin;
1011995	Palos Verdes Farmers Market	27118 Silver Spur Road	90274	-118.373725	33.779336	490
1019725	New Baltimore Farmers Market	On Washington Street between Main & Front Streets in Historic Downtown	48047	-82.737607	42.68546	557
1019337	Williamson Farmers Market	54 3rd. Ave. W.	25661	-82.277984	37.674029	638
1021200	Pajaro Valley CFM	Peck and Union st.	95076	-121.755366	36.910275	184
1019705	Farmers Market North Scottsdale	8711 E Pinnacle Peak Road	85252	-111.893119	33.697831	418
1019774	Kalamazoo Farmers Market	1204 Bank Street	49001	-85.588501	42.275163	189
1010975	Cottage House Youth Market	47 Doster Road	36311	-85.674054	31.64705	171
1018138	South East Area Farmers' Market	900 Fuller Ave SE	49506	-85.6394126	42.9464659	190
1021411	Downtown Rogers Farmers Market	Railyard Park	72756	-94.116	36.332762	170
1019706	Main Street Farmers Market	1030 Main Street	18431	-75.257553	41.57517	379
1018601	Silverdale Farmers Market	2222 Bucklin Hill Rd	98383	-122.668607	47.651931	463
1019088	Grow Baton Rouge Farmers Market	4000 Gus Young Ave	70802	-91.1491139	30.4617557	657
1020111	Dorey Park Farmers Market	2999 Darbytown Road	23231	-77.405887	37.5380571	306
1018157	Davenport Farmers' Market	North Park Mall east entrance	52804	-90.571154	41.562863	632
1019956	29 Palms Farmers' Market	73484 Twentynine Palms Hwy	92277	-116.058946	34.13576	207
1019628	St. Maries Farmers Market	\N	83861	-116.586445	47.318286	46
1019702	Culver Farmers' Market	107 N Main Street	46511	-86.422907	41.216815	551
1019317	Onslow County Farmers Market	4024 RIchlands Hwy	28540	-77.49326	34.782418	253
1021258	Weymouth Farmers Market	1 Wildcat Way	2190	-70.941897	42.181987	377
1021264	Kamuela Farmers Market	67-139 Pukalani Road	96727	-155.66266	20.017794	548
1020057	CFFMA - River Park Farmers Market - Saturday	SE Corner Blackstone and Nees	93720	-119.789099	36.849327	121
1002768	Leland Farmers Market	River Street	49654	-85.759459	45.022857	472
1019343	Omaha Farmers Market - Old Market	11th & Jackson Street	68102	-96.041927	41.264675	607
1012203	Saranac Lake Village Farmers Market	Riverside Park	12983	-74.131251	44.32463	623
1019103	Lake Barrington Farmer's Market	28214 West Northwest Highway	60010	-88.183818	42.180694	431
1020007	Franklin Street Bazaar	2000 W. Franklin Street	47710	-87.594742	37.980191	52
1019094	East Side Farmers' Market	760 E Water St Elmira	14901	-76.794875	42.088757	422
1009663	Homewood Farmers Market	Martin Ave and Chestnut Rd	60430	-87.666231	41.562264	577
1018418	Livonia Wilson Barn Farmers Market	29350 W. Chicago	48150	-83.331995	42.362596	379
1002843	Rexburg Farmers Market	118 College Ave.	83440	-111.782405	43.823218	460
1008953	Bucksport Bay Farmers' Market	99 Main Street	4416	-68.796497	44.572636	113
1019234	Heritage Market	418 Main Street	85938	-109.281673	34.1324115	108
1005940	CitySeed Edgewood Park Farmers Market	corner of Whalley Ave. and West Rock Ave.	6515	-72.958562	41.325348	591
1019032	Downtown Farmers Market	101 North Main Street	29720	-80.770914	34.721099	151
1005255	Kaumualii Street (People's Open Market)	700 Kalihi Street	96819	-157.877976	21.327407	580
1004380	Ivanhoe Farmers Market	North end of Main Street	56142	-96.246607	44.465197	249
1019182	Vernon County Farmers Market	PO Box 873	64772	-94.340102	37.843772	107
1019819	Hoodland Farmers Market	67212 E. HWY 26	97067	-121.960918	45.349594	688
1005253	Kaneohe District Park (People's Open Market)	45-660 Keaahala Road	96788	-157.810103	21.409789	580
1021416	General Store Market	1327 S. 18th Street	54812	-91.844351	45.402192	482
1019058	Marion Ohio Market	Main and Church	43302	-83.122972	40.593304	494
1020173	Rockford Midtown Market	503 Seventh Street	61104	-89.08098	42.262526	202
1021577	Saturday Market at Steele	4350 Thomas Drive	95435	-122.875318	38.992994	431
1021722	Paducah Homegrown Farmer's Market-Tuesday Market	300 N. 30th St	42001	-88.637149	37.074367	687
1021487	Virginia Highland Farmers Market	1017 North Highland Avenue NE	30306	-84.354177	33.782208	639
1018965	61st Street Farmers Market	6100 S. Blackstone Ave	60637	-87.5905914	41.784079	577
1021595	Farmers Market Partners	5855 Sienna Springs Way	77459	-95.543858	29.533266	398
1020185	Santa Clara Farmers' Market	Jackson Street at Homestead Road	95050	-121.967934	37.364613	12
1005559	Mosinee Farm Market	1101 Main Street	54455	-89.708626	44.797421	443
1009867	Easton Farmers' Market	128 Larry Holmes Drive	18042	-75.206274	40.689778	598
1019398	Empire Market	931 E 4th St	64801	-94.502691	37.087883	538
1019450	Lawrenceville Farmers Market	250 40th Street	15201	-79.961092	40.467011	36
1019056	Hunterdon Land Trust Farmers Market	111 Mine Street	8822	-74.871267	40.505223	72
1021547	Hollidaysburg Farmers Market	Montgomery and Allegheny Street (near the Diamond)	16648	-78.394591	40.429065	371
1019866	Market of Life	3510 W 15th Ave	46404	-87.344853	41.595883	431
1018316	BOISE FARMERS MARKET	516 S. 8th Street	83702	-116.19193	43.60798	356
1021225	Atwater Village Farmers' Market	3528 Larga Ave	90039	-118.260151	34.117828	490
1016792	Down to Earth Ossining Farmers Market	Near the corner of Spring & Main Streets	10562	-73.86341	41.160793	156
1012717	East Point Farmers Market	2757 East Point St.	30344	-84.442141	33.679488	639
1002101	The Orange Farmers Market	135 East Main st	1364	-72.3033449	42.590734	623
1006651	Carnation Farmers Market	Corner of Bird and Stossel	98014	-121.912419	47.648587	345
1018451	Stowe Farmers' Market	1799 Mountain Road	5672	-72.712004	44.473531	248
1011300	Lincoln Heights Certified Farmers Market	N. Broadway & Sichel	90031	-118.213092	34.07348	490
1021332	Knox County Farmers Market	107 N 4th St	63537	-92.172403	40.167824	58
1004988	Saline Farmers Market	S. Ann Arbor Street	48176	-83.781146	42.165956	257
1021639	Cornelius Farmers Market	1370 N Adair St	97113	-123.055169	45.521314	539
1010960	Down to Earth Rye Farmers Market	Parking lot off Theodore Fremd Ave.	10580	-73.686043	40.983895	156
1019223	Oakcrest Farmers Market	1300 Capitol Heights Blvd	20743	-76.9185759	38.8708398	21
1019822	Perry Lecompton Farmers Market	2115 Ferguson Rd.	66073	-95.392324	39.08143	19
1021514	Farm to Fork Farmers' Market	120 S Kimball Ave	83605	-116.688851	43.666163	670
1018449	Sanford Farmers' Market	919 Main St	4073	-70.774653	43.438711	435
1019330	Historic Downtown Farmers Market	121 Orange Street	71901	-93.050943	34.504886	664
1016908	West Town Health & Farmers Market	2233 W Division St	60622	-87.684396	41.902872	577
1021703	Hyde Park Farmers' Market	2700 Erie Avenue	45208	-84.442416	39.139569	409
1019912	Woonsocket Farmers Market	450 Clinton St	2895	-71.504321	42.007654	230
1018933	Trout Creek Farmers Market	Trout Creek Park	59874	-115.587957	47.832429	86
1011673	East End Market	2600 Navigation Blvd.	77003	-95.342978	29.757511	272
1020106	Jackson County Farmers Market	1296South Main St.	40447	-83.988324	37.430289	491
1018131	Farmers Market at St. John's	750 Aurora Avenue	60540	-88.159755	41.767594	370
1021211	Heathsville Farmers Market	73 Monument Place	22473	-76.473204	37.916391	76
1019495	Artisan Alley Farmers and Makers Market	Artisan Alley	32720	-81.304341	29.027562	6
1010997	South Miami Farmers Market	6130 Sunset Dr	33143	-80.291066	25.704072	604
1009027	Wolfeboro Area Farmers Market	233 South Main St	3894	-71.202747	43.580593	115
1003588	Square Market	Public Square	38606	-89.952098	34.316885	720
1018831	Gardner Farmers Market	136 E Washington St	66030	-94.925777	38.812999	337
1019377	Harvest Home Hunts Point Market	E. 163rd btwn Southern & Bruckner Boulevards	\N	-73.890698	40.820779	167
1021344	North End Farmers Market	311 Bowman St.	44903	-82.523336	40.766123	578
1018477	Portland Farmers Market - King	NE 7th and Wygant	97211	-122.658982	45.557097	724
1020125	Harrison County Farmers Market - Wednesday	111 S Main St	\N	-84.297879	38.390005	193
1021286	Hendricks Farmers Market	Main Street	56136	-96.426422	44.508647	249
1003977	Downtown Newport Farmers Market	Corner of Hwy 101 & Angle St	72112	-91.234721	35.6268	491
1012345	Duvall Farmers Market	16201 Main St. NE at Taylor Landing	98019	-121.986419	47.744679	345
1016822	Silver Valley Farmers Market	10 Station Ave	83837	-116.120504	47.536412	625
1019154	Hardy’s Farm Market	4525 Knoll Rd	46809	-85.2011808	41.0359345	423
1004602	Plymouth Farmers Market	Garro St.	46563	-86.307641	41.34065	551
1021229	Hollywood Farmers' Market	1600 Ivar Ave	90028	-118.328191	34.099639	490
1008573	Gladstone Farmers' Market	602 NE 70th Street	64118	-94.5730016	39.2214548	550
1019828	Oak Creek Farmers Market	Drexel Town Square	53154	-87.917781	42.899242	620
1019315	Quincy Farmer's Market	128 N. 5th St.	62301	-91.409173	39.932754	562
1021745	Travelers Rest Farmers Market	235 Trailblazer Lane	29690	-82.442632	34.955543	325
1019236	INDEPENDENCE UPTOWN MARKET	211 W. Truman Rd.	64050	-94.418179	39.093845	491
1019036	Sumter Farmers Market	200 Miller road	29153	-80.373	33.9324793	118
1019925	Union County Farmers' Market	115 Durham Drive	37807	-83.8228	36.237614	722
1005266	Waipahu District Park (People's Open Market)	94-230 Paiwa Street	96767	-157.999449	21.387839	580
1019016	Wayne County Farmers Market	Center & Main	84775	-111.42089	38.299219	379
1018242	Juneau Farmers Market and Local Food Festival	350 Whittier	99801	-134.4136031	58.29985	495
1019544	The East End Farmer’s Market	13060 Factory Lane	40245	-85.508543	38.286927	19
1012179	Shorewood Farmers Market	3400 Estabrook Parkway	53211	-87.898448	43.091905	620
1011229	Way Green Local Fare Market	1460 n Augusta Ave	31503	-82.3818511	31.235752	640
1019294	Nicholasville Farmers Market	717 N. Main Street	40356	-84.56655	37.893076	154
1010485	Millen Produce Market	Cotton Avenue	30442	-81.936127	32.802685	17
1020032	Kingwood Farmers Market	2814 Town Center Circle	77339	-95.184629	30.047327	272
1019205	Boyne City Farmers Market	319 N. Lake St	49712	-85.015378	45.21685	316
1021247	Growing Augusta Pop-Up Market	3647 Karleen Rd	30815	-82.11834	33.387808	199
1005263	Waiau District Park (People's Open Market)	98-1650 Kaahumanu Street	96782	-157.952992	21.402403	580
1020060	Andover Farmers Market	41 Central Street	1810	-71.143138	42.653616	677
1019221	Whittier Farmers Market	2608 Blaisdell Ave S	55408	-93.280032	44.955321	152
1003199	Matthys Farm Market	57754 Crumstown Hwy	46619	-86.35873	41.65516	178
1020019	Playa Vista Farmers' Market	12775 W. Millennium	90094	-118.416626	33.975922	490
1019308	Delmar Farmers Market	332 Kenwood Ave	12054	-73.825895	42.619919	254
1018852	Urbana Farmers' Market	102 Capitol Ave	52345	-91.873662	42.223981	170
1021467	Morris County Winter Farmers' Market	6 Normandy Heights Rd	7960	-74.448694	40.796595	153
1012576	Rockville Farmers Market	Route 28 & Monroe Street	20850	-77.1492295	39.0819115	353
1019483	Columbus Farmers Market	14 st and 26 Ave	68601	-97.36036	41.430012	256
1021599	Pahrump Saturday Farmers' Market	900 E Hwy 372	89048	-115.997901	36.205326	45
1020017	Natick Winter Market	Common Street	1760	-71.341206	42.290237	466
1019657	West Plains Area Farmers' Market	1380 Bill Virdon Blvd.	65775	-91.835774	36.723987	465
1020085	Montgomery County Farmers' Market	153 South Maysville Street	40353	-83.941302	38.054333	353
1020190	Marshall County Farmers Market	1933 Mayfield Highway	42025	-88.378744	36.842165	551
1020128	Chico Certified Farmers Market - Chico Saturday	2nd and Wall Streets	95927	-121.838323	39.730823	447
1019047	The Ballpark Farmers & Artisan Market	7 Ballpark way	4064	-70.391653	43.514488	435
1019411	Redland Community Farm and Market	12690 SW 280th Street	33033	-80.39582	25.506957	604
1018159	East Atlanta Village Farmers Market	572 Stokeswood Avenue	30316	-84.344531	33.738679	639
1019373	Harvest Home Brower Park Market	Brooklyn Avenue & Prospect Place	\N	-73.94453	40.674043	31
1021591	Delridge Farmers Market	9421 18th Ave SW	98106	-122.358129	47.518781	345
1019969	Manchester's Spruce Street Market	163 Spruce St.	6040	-72.518324	41.781503	558
1008606	Chesterfield County Farmers Market	near 6701 Mimms Loop	23832	-77.504419	37.376728	155
1001604	Barnegat Farmers Market	14 Birdsall St.	8005	-74.221654	39.753903	134
1019816	Menominee Historic Downtown Farmers Market  Association	800 1st Street & 8th Avenue	49858	-87.603938	45.105926	101
1019990	Huguenot-Robious Farmers Market @ The Great Big Greenhouse	2051 Huguenot Road	23235	-77.610901	37.519378	155
1019673	Hamilton's Historic Farmers Market	345 High Street	45011	-84.565522	39.394328	533
1004754	Chelsea Farmers' Market	Corner of Rte 110 and Rte 113	5038	-72.44747	43.98878	165
1012777	Oxnard Farmers Market	500 South C Street	93030	-119.18027	34.19798	209
1021235	The 'Whee Market	113 Market Street	28723	-83.18569	35.301188	491
1019440	Bluffton Farmers' & Artisans' Market	360 N Main St	46714	-85.172111	40.743479	503
1019069	Wild West Farmers Market	8116 19th St	79407	-101.99615	33.578343	471
1019641	Welcome Center Farmers Market	2931 Monroe Avenue	51555	-95.848181	41.583893	193
1008375	Kaiser Permanente Fresno Farmers Market	7300 N. Fresno Street	93720	-119.781524	36.843017	121
1005252	Kalihi Valley District Park (People's Open Market)	1911 Kam IV Road	96819	-157.8698	21.344726	580
1019538	Livingston Farmers Market	Miles Band Shell Park	59047	-110.556707	45.654254	125
1018991	Mount Hope Farmers Market	250 Metacom Ave	2809	-71.256882	41.669478	103
1019715	RVCC Winter Market	Rockfish School Lane	22920	-78.886752	37.7874422	717
1021243	North Canton Farmers' Market	1447 North Main Street	44720	-81.409572	40.892548	104
1019984	Brockton Farmers Market	45 School St	2301	-71.018866	42.082799	102
1005834	Chatham Farmer's Market	1652 Main Street Rte 28	2633	-69.962249	41.676615	183
1019825	Saint Mary Farmers Market	700 s third st	43206	-82.994617	39.948137	623
1021434	North Canton Farmers' Market	1000 West Maple St	44720	-81.417769	40.875871	104
1018455	North St. Mary's County Farmers Market	37600 New Market Turner Road	20622	-76.77563	38.473539	374
1012621	Ida Area Farmers' Market	2nd Street	51445	-95.470874	42.345173	289
1010445	South Milwaukee Downtown Market	11th and Milwaukee Avenues	53172	-87.862688	42.9107287	620
1019168	BESSEMER FARMERS MARKET	1st Avenue N and 19th Street	35020	-86.95137	33.40113	19
1018284	Riverside Arts Market	715 Riverside Avenue	32204	-81.6762903	30.3164943	147
1018310	Manson Farmers Market	\N	50563	-94.539507	42.527104	586
1021277	Red Stick Farmers Market - Saturday Downtown Year Round	5th Street and Main Street	70801	-91.185787	30.45195	657
1009895	Down to Earth Park Slope Farmers Market	4th Street at 5th Avenue	11215	-73.983867	40.672303	31
1021709	Weaver Library Farmers' Market	41 Grove Avenue	2914	-71.37757	41.818333	230
1021644	Sustainable Food Center Farmers' Market Sunset Valley	3200 Jones Rd	78745	-97.807494	30.230977	662
1021488	White Mountains Market	1501 W White Mountain Blvd	85929	-109.970749	34.146798	437
1019662	Arlington Village Farmers Market	3904 VT-7A	5250	-73.146078	43.072884	611
1011972	Market on Military Summer	Military Avenue and West Mason Street	54303	-88.06464	44.52221	524
1021451	Running Springs Farmers Market and Artisan Faire	2645 Whispering Pines Drive	92382	-117.104915	34.206855	207
1021630	Beaverdale Farmers Market	4801 Franklin Avenue	50310	-93.68471	41.612479	486
1012308	Festival Farmers Market	942 Main Street	12043	-74.4669868	42.6792512	142
1019608	Get Moving Houston Farmers Market - Sunnyside	9314 Cullen St. 77051	77051	-95.356477	29.656412	95
1019218	Buckroe Beach Farmers Market	100 N. First Street	23664	-76.291807	37.041273	671
1011044	Silver Lake CFM	1500 Griffith Park Blvd	90026	-118.277386	34.090541	490
1018628	The Petaluma East Side Farmers' Market	320 N McDowell Blvd	94954	-122.630899	38.252337	537
1021249	Hillsdale Farmers' Market	1405 SW Vermont St	97219	-122.692801	45.477581	724
1012100	STCC Farmers' Market	One Armory Square	1102	-72.581067	42.108668	405
1008118	Kamehameha Community Park (People's Open Market)	1400 Kalihi Street	96822	-157.872454	21.335165	580
1021251	Vizcaya Village Farmers Market	3250 S. Miami Ave	33129	-80.212735	25.747026	604
1003628	Dexter Farmers Market	3233 Alpine	48130	-83.889459	42.339503	257
1020183	Cambrian Park Farmers' Market	Camden Avenue and Union Avenue	95124	-121.819306	37.296867	12
1019200	Ocean Pines Farmers & Artisans Market	239 Ocean Parkway	21811	-75.160072	38.3992566	367
1019366	Harvest Home Co-Op City Market	Asch Loop & Aldrich Street	\N	-73.831007	40.870274	167
1021562	Titusville Open Air Market	11652 Hydetown Road	16354	-79.701982	41.636919	2
1019079	East Greenbush Library & YMCA Farmers Market	Between 10 and 20 Community Way in parking lot	12061	-73.695566	42.618063	188
1020142	Certified Farmers' Market Palm Springs - Indoor	401 S. Pavilion Way	92262	-116.525258	33.817078	500
1008827	The Woodland Farmers Market at Woodland Healthcare	Corner of Cottonwood and Gibson Rd	95695	-121.793045	38.663686	498
1019638	Treasure Lake Farmers Market and Artisan Faire	95 Coral Reef	15801	-78.704999	41.201813	180
1008980	Holden MO Farmer's Market	101 S Market St.	64040	-93.9908869	38.7186566	337
1019166	The Farmers Market at Maryland	3900 Campus Drive	20742	-76.947513	38.985968	21
1021328	Woolery Farmers' Market	2250 W Sunstone Dr	47403	-86.559788	39.138753	572
1020084	Anderson County Farmers Market	1505 US-127 N	40342	-84.917629	38.076447	284
1021607	4 Veggies & 3 Fruits Farmer’s Market	140 W 62nd Street	60621	-87.629595	41.781896	577
1019444	Westerville Saturday Farmers Market	21 South State Street	43081	-82.913324	40.123435	623
1021414	East Boston Farmers On-line Market - Winter/Spring	250 Sumner street	2128	-71.076514	42.3313532	314
1019821	Coastal Growers Market	2325 Boston Neck Rd	2874	-71.423632	41.512	539
1000021	Mid-Town Farmers Market	700 North Lamar Blvd.	38655	-89.516816	34.373647	119
1019688	Hillsboro Farmers Market	5137 Glade Chapel Road	63050	-90.566655	38.232278	19
1012253	Goshen Farmers Market	South Church and Main Street	10924	-74.322899	41.401966	165
1002808	CMS Farmers Market	7500 Security Blvd.	21244	-76.764414	39.316055	385
1019186	Fairfax Community Farmers' Market	10500 Page Avenue	22030	-77.308647	38.846056	696
1019298	Franklin County Farmers Market	404 Wilkinson Blvd.	40601	-84.88021	38.201613	623
1004384	Ionia Farmers' Market	South Steele Street and Adams Street	48846	-85.0677261	42.9814841	571
1021564	Champlain Islands Farmers' Market-Saturday	185 US Route 2	5458	-73.294874	44.7968758	53
1019492	Burke	5671 Roberts Parkway	22015	-77.263568	38.776991	696
1019512	Lenexa Farmers Market	17201 W. 87th St. Pkwy	66219	-94.803914	38.965267	337
1021458	Metuchen Farmers Market	New Street and Pearl Street	8840	-74.363008	40.541112	466
1019833	Goodhue Farmers Market	411 Rosie Park Way	55027	-92.624672	44.403334	545
1020122	Harrison County Farmers Market - Saturday	364 Oddville Ave	\N	-84.286978	38.394075	193
1020123	La Grange Farmers' Market & Artisans	100 East Main Street	40031	-85.379458	38.407465	50
1019868	Purcellville Farmers' Market	717 E Main Street	20132	-77.703843	39.136603	215
1020176	St. Matthews Farmers Market	4100 Shelbyville Rd	40207	-85.646194	38.251785	19
1018953	Durango Farmers Market	259 W 9th Street	81301	-107.882758	37.273063	556
1018312	St. Johns Farmers Market	N.Lombard and N.Philidelphia	97203	-122.7544853	45.5901096	724
1019209	Hampton Blvd Farmers Market	7400 Hampton Blvd.	23505	-76.305582	36.912352	377
1021357	Menominee Historic Downtown Farmers Market  Association	\N	49858	-87.604562	45.107233	101
1020037	Port Townsend Farmers Market	600 Block Tyler St	98368	-122.760304	48.11702	19
1021534	AUSTIN FARMERS MARKET	9607 RESEARCH BLVD	78759	-97.741448	30.387094	662
1020075	Knox County Farmers' Market	34 Bond Hill Rd	40906	-83.867633	36.849364	58
1011233	Lower Valley Farmers Market	Main street	97885	-117.528643	45.570355	357
1019454	Pedernales Farmers Market	23526 TX-71	78669	-98.084871	30.387133	93
1002521	Lakewood Earth and Food (LEAF) Community Farmers' Market	15425 Detroit	44107	-81.804266	41.484539	654
1021515	Brookville Farmer's Market	116 Main Street	47012	-85.012083	39.412804	623
1019699	The Fresh MARTA Market - Five Points Rail Station   Fridays  3:00-7:00p.m.	30 Alabama Street SW	30303	-84.390574	33.755202	639
1019646	Olympia Farmers' Market	700 Capitol Way N	98501	-122.902519	47.050425	605
1019452	Spotsylvania Farmers Market - VDOT Commuter Parking Lot	12150 Gordon Road	22407	-77.563047	38.29038	401
1020092	Franklin Simpson Farmers' Market	304 N Main St	42134	-86.577261	36.724368	658
1021444	Galena KS Farmer's Market	210 W 7th St	66739	-94.635517	37.075194	426
1009659	Old Stadium Park (People's Open Market)	2237 South King Street	\N	-157.827323	21.292322	580
1021468	San Antonio Food Bank Farmers' Market	5200 Enrique M. Barrera Pkwy	78227	-98.59179	29.418102	315
1012297	Village Market- Slavic Village	5106 Fleet Ave	44105	-81.654595	41.455724	654
1019025	Oshkosh Farmers Market - Winter	108 W New York Ave	54901	-88.540004	44.03325	202
1020150	Alturas Farmers Market	108 S Main St	96101	-120.542201	41.483907	528
1003684	Heritage Harvest Certified Farmers Market @Victoria	12505 N Main St   91739	91739	-117.532318	34.110872	207
1021645	Santa Rosa Certified Farmers Market	50 Mark West Springs Rd.	95403	-122.75197	38.495737	537
1018771	Silver City Farmers' Market Downtown	901 N Pope ST	88061	-108.276185	32.774517	127
1019607	Get Moving Houston Farmers Market - Southwest	6400 High Star Dr.	77074	-95.496227	29.711246	95
1019504	The Market at Long Valley	66 East Mill Road	7853	-74.770016	40.784492	153
1020196	Beverly Hills Farmers Market	9300 Civic Center Dr	90210	-118.398746	34.073685	490
1021715	Navarro Farm	22155 S.104th Ave.	60423	-87.867562	41.488007	694
1004865	North Prairie Farmers Market - Minot	Corner of 3rd Ave SW and Broadway	58701	-101.295598	48.233564	616
1021635	Hwy 80 Produce	903 E. US Hwy 80	75693	-94.8938	32.528217	67
1011337	Woodward Farmers' Market Association	13th St. and Locust Ave.	73801	-99.3957807	36.4314963	298
1005218	Manzanita Farmers Market	36465 N Hwy 101	97131	-123.894248	45.719007	458
1012560	Morganton Farmer's Market	111 North Green Street	28655	-81.688488	35.7466269	555
1019757	Helen Albert Certified Farmers' Market	1200 N. Vista St.	90046	-118.351434	34.094113	490
1019716	Minnetrista Farmers Market	1200 North Minnetrista Pkwy	47303	-85.393346	40.198978	88
1016793	Down to Earth Mamaroneck Winter Farmers Market	Harbor Island Park	10543	-73.730404	40.944797	156
1020080	Farmers Market on the Square	105 Merchant Street	42728	-85.307537	37.103437	514
1019823	Clinton Farmers Market	20 West Park Row	13323	-75.378462	43.048866	701
1001763	Chilhowie Farmer's Market	East Lee Highway between Chestnut and Pine Avenues (Warrior Park)	24319	-81.676633	36.80295	200
1018172	Seacoast Eat Local Winter Farmers' Market - Wentworth Greenhouses	141 Rollins Road	3869	-70.8601023	43.2155618	613
1020141	Certified Farmers' Market Palm Springs - Outdoor	2300 E. Baristo Rd	92262	-116.521181	33.820251	500
1018317	Morgan County Farmers' Market Association	Monroe & Main St.	46158	-86.3796098	39.612806	645
1021397	Siloam Springs Farmers Market	205 Jefferson Street	72761	-94.541074	36.181621	170
1019792	Zelienople-Harmony Farmer's Market	Beaver Street and South Division Street	16063	-80.130181	40.792698	533
1001316	Bemidji's Natural Choice Farmers Market	Union Square Parking Lot--2nd Street & Paul Bunyan Drive	56601	-94.880609	47.469337	593
1019604	Get Moving Houston Farmers Market - Hiram Clarke	3810 W. Fuqua St.	77045	-95.43355	29.614043	95
1019857	Murrysville Farmers' Market	3235 Sardis Road	15668	-79.696788	40.430121	111
1001526	Boulder Farmers and Artisan's Market	304 N. Main Street	59632	-112.117592	46.239153	19
1018939	Missoula Farmers' Market	Circle Square (by the XXXXs)	\N	-113.992113	46.87474	602
1021541	Come Thru Market	831 SE Salmon St	97214	-122.657252	45.514708	724
1021454	Milwaukee Winter Farmers Market	524 S Layton Blvd	53215	-87.944924	43.025865	620
1021499	The St. James Farmers Market	304 Armstrong Blvd n	56081	-94.614044	43.9784291	464
1021699	Oswego Country Market	15 Main Street	60543	-88.351584	41.684774	685
1019742	Dodgeville Farmers Market	327 N. Iowa Street	53533	-90.129944	42.962345	440
1021634	Netcong Community Marketplace/Farmers Market	Rt. 46 & Main Street	7857	-74.707004	40.897787	153
1017930	City of Pittsburgh Carrick Farmers Market	1529 Brownsville Road	15210	-79.988803	40.400201	36
1001245	ASU Regional Farmers' Market	3300 Aggie Road	72401	-90.667327	35.840771	229
1000210	Colorado Farm and Art Market	7350 Pine Creek Road	80919	-104.814688	38.937716	80
1019759	Meigs County Farmers' Market	PO Box 702	45769	-82.034026	39.026596	66
1019998	Fulshear Farmers' Market	9035 Bois d'Arc Lane	77406	-95.888475	29.690226	398
1010636	King Farmers' Market	105 Moore Road	27021	-80.341178	36.276367	98
1010607	Bel Air Farmers' Market	2 South Bond Street	21014	-76.351011	39.535284	92
1019517	The Monroe Farmers’ Market	7 Fan Hill Road	6468	-73.207774	41.33221	224
1019228	Thief River Falls Farmers Market	Corner of 3rd Street and Duluth Ave.	56701	-96.184263	48.118841	553
1003915	Rusk County Farmers Market	US Highway 8 & W. 2nd  Street	54848	-91.09924	45.464998	532
1003982	Telluride Farmers' Market	South Oak St	81435	-107.813086	37.936843	519
1016916	Lettuce Eat Well Farmers' Market	4040 Harrison Ave	45211	-84.617203	39.1587027	409
1018900	Ellington Farmers Market	Main ST	6029	-72.4681079	41.9036393	470
1000303	City of Plymouth Farmers Market	15500 County Road 6	55447	-93.473419	44.997274	152
1021581	Farmers Market on Grand Parkway	1225 W Grand Parkway S	77494	-95.775167	29.761952	272
1011935	Somerville Mobile Farmers' Market - North Street	24 North Street	2144	-71.131331	42.407206	466
1019932	Blue Ash Farmers Market	4335 Glendale Milford Road	45242	-84.389892	39.251798	533
1021361	Lilburn Farmers Market	1400 Killian Hill Rd	30047	-84.081093	33.859588	269
1002769	Empire Farmers Market	10234 Front Street	49630	-86.063056	44.811224	472
1004750	Redlands Certified Farmers Market	100 E. State Street	92373	-117.181441	34.056448	207
1020038	Milk Lady Shady Grove Farmers Market	9601 Medical Center Drive	20850	-77.199488	39.104422	353
1021246	Westland Farmers & Artisan Market	1901 N. Carlson	48185	-83.380778	42.319173	379
1012033	Georgetown Farmers Market	122 Screven St	29440	-79.2817826	33.3662089	683
1019202	Original Merced County Certified Farmers Market - Downtown Merced	16th St. and Canal St.	95340	-120.484427	37.30093	212
1021664	Seaside Farmers Market	1140 Broadway	97138	-123.919864	45.993667	79
1002984	Atchison Farmers Market	Between 5th and 6th Streets on the south side of Main Street	66002	-95.119878	39.560737	697
1002400	Downtown Farmers Market	206 S 4th Street	42071	-88.3022291	36.6097959	595
1019777	Midland Area Farmers Market	\N	48640	-84.236727	43.609016	137
1003335	Basalt Sunday Market	101 Midland Avenue	81621	-107.034736	39.368957	531
1021571	Mt.Washington Farmer's Market	320 N.Bardstown rd	40047	-85.695776	37.9700281	706
1020002	Troy Waterfront Farmers Market	Riverfront Park	12180	-73.691288	42.732715	188
1021320	Green City Market West Loop	115 S. Sangamon St	60607	-87.650439	41.880039	577
1012799	The West River Farmers Market	2242 N. Main St.	5148	-72.821619	43.228259	57
1021646	Russian River Farmers Market	16290 5th St	95446	-122.998786	38.503197	537
1004849	Green Market at Piedmont Park	1071 Piedmont Ave NE	30309	-84.378551	33.784257	639
1018472	Gretna Farmers Market	739 Third Street	70053	-90.0653599	29.9165076	19
1008231	Wise Farmers' Market	309 E. Main Street	24293	-82.578257	36.9768742	287
1018986	Port Sanilac Farmers' Market	228 S Ridge Street	48469	-82.543109	43.424322	342
1018263	Caledonia Farmers Market Association - Winter	Pearl St	5819	-72.016831	44.417224	260
1019829	Soldotna Saturday Farmers Market	193 E. Corral Ave	99669	-151.067584	60.49304	321
1021614	C & C Garden	2022 S Scott St	46613	-86.26681	41.657676	178
1021324	Lawrence Farmers' Market - Saturday Downtown Market	824 New Hampshire Street	66044	-95.23448	38.96859	607
1007245	Piedmont Triad Farmers Market	2914 Sandy Ridge Road	27235	-79.992657	36.087691	44
1002345	Harvest Home West Harlem Market	Broadway btwn W. 138th & W. 139th St	\N	-73.953193	40.822369	282
1011497	The Markets at Shrewsbury	12025 Susquehanna Trail S	17327	-76.730703	39.793503	435
1018772	Indian Lake Community Farmers Market	144 JOHN RUST RD	12842	-74.270529	43.782397	409
1005159	Farmers Market of the Ozarks	2144 E Republic Rd	65804	-93.255076	37.136365	397
1021718	PC Sunday Farmers Market	Madison Street	43452	-82.941236	41.512209	9
1019931	the Farm Market	Main St	88042	-107.569106	32.920178	85
1005214	Salem Farmers Market	3 East Main Street	24153	-80.058606	37.292997	341
1021288	Mt. Pleasant Farmers' Market - Broadway Street	Broadway Street between Main & University Streets	48858	-84.776052	43.604433	615
1019260	Crescent City Farmers Market	200 Broadway Street	70118	-90.133127	29.932171	506
1021356	Old Capitol Farmers Market	4th and Adams	62701	-89.650662	39.800581	182
1021656	Morningside Farmers Market	1411 N. Morningside Drive NE	30306	-84.356113	33.793194	639
1019913	Sankofa World Market	224 Dexter St	2907	-71.42853	41.811066	230
1020005	Pittsfield Township Farmers Market	6201 W. Michigan Ave	48108	-83.700262	42.197733	257
1021498	WIC Clinic Pecan Valley Farmers' Market	802 Pecan Valley	78220	-98.525142	29.472403	315
1021493	Mission Marquee Plaza Farmers' Market	3100 Roosevelt Ave	78214	-98.525142	29.472403	315
1002106	Claremont Farmers & Artisans Market	Harvard Avenue Between Bonita and First Streets	91711	-117.716418	34.095598	490
1019615	Platteville Farmers Market - Winter	205 Market Street	53818	-90.479874	42.736018	127
1003970	Rogue Valley Growers & Crafters Market	99 Hawthorne St	97501	-122.854244	42.336896	491
1012212	Weiser Farmer's Market	1 State Street	83672	-116.97113	44.244083	539
1019177	LVHMC Cascades Farmers' Market	21060 Whitfield Drive	20165	-77.395364	39.031603	215
1005937	Grand Rapids Farmers' Market	11 Golf Course Road	55744	-93.529757	47.221394	484
1019393	Town of Hillsville Farmers Market	410 N. Main Street	24343	-80.7362	36.766222	115
1019861	Indiana County Farmers Market	8th & Church St.	15701	-79.155021	40.621852	653
1007250	Saugerties Farmers Market	115 Main Street	12477	-73.946818	42.080345	424
1011075	Brattleboro WInter Farmers' Market	80 Flat St.	5301	-72.560166	42.850844	57
1020113	Breathitt County Farmers' Market	3215 Quicksand Road	41339	-83.348327	37.535327	508
1018834	Lawrence Farmers Market	\N	49064	-86.048868	42.219637	432
1020021	Waterloo Rotary Farm Market	22 Locust Street	13165	-76.865814	42.903737	509
1019627	Scotland Farmers Market	Rt. 14 & Rt. 97	6264	-72.081503	41.698757	57
1019242	Your Neighborhood Farmers Market-The Groves	17317 Cathedral Pines Drive	77346	-95.26831	29.988144	272
1018975	Ruston Farmers Market	220 E. Mississippi Avenue	71270	-92.635542	32.529214	249
1020039	Somerville Mobile Farmers' Market - Council on Aging	167 Holland Street	2144	-71.125686	42.40098	466
1004676	Druid Hill Farmers' Market	3100 Swann Drive	21217	-76.645847	39.317944	148
1021380	Pine City Farmers Market	Main Street and 1st Ave NW	55063	-92.970689	45.832364	439
1005528	Main Street Farmers Market	South Main at Wheeling	15301	-80.245	40.169	539
1021339	Madrona Farmers Market	1126 Martin Luther King Jr Way	98122	-122.295751	47.612616	345
1004990	Saline Farmers Market	7265 Saline Ann Arbor Road	48176	-83.785094	42.179728	257
1004950	3 French Hens French Country Market	123 W. Illinois ave.	60450	-88.425186	41.356383	469
1019902	Mason County Farmers Market	2114 Old Main Street	41056	-83.80842	38.615073	473
1018155	Village of Constantine Farmers' Market	165 N Washington St	49042	-85.670007	41.843957	178
1019044	Bainbridge Farm Market	201 Grant Ave	46105	-86.817696	39.7622329	172
1020096	Boyd County Farmers Market - King's Daughters Medical Center	2420 Center Street	41129	-82.630489	38.470783	201
1003610	Red Stick Farmers Market - Thursday Year Round	6400 Perkins Road	70808	-91.121067	30.399197	657
1019979	Southshore Outdoor Market	8505 Durand Ave	53177	-87.888847	42.697348	644
1019005	Berkey Farmers Market	12290 Sylvania-Metamora Rd	43504	-83.839418	41.715538	251
1020100	Hopkinsville-Christian County Downtown Farmers Market	110 W 9th Street	42240	-87.489438	36.866111	468
1019539	Cuyahoga Falls Farmers' Market (Farmers' Market in the Falls)	1817 Front Street	44222	-81.48356	41.130404	663
1021358	Marinette Artisan & Farm Market	1607 Main Street	54143	-87.628231	45.098174	294
1018621	Downtown Novato Community Farmers Market	7th Street behind the CVS between Grant Ave & Novato Blvd	94947	-122.578749	38.107536	560
1021662	Garfield Park Neighborhood Market - Indoor Season	135 N Kedzie Ave.	60612	-87.705713	41.883908	577
1021384	Owen County Farmers Market	459 W. Morgan Street (SR46)	47460	-86.769484	39.286121	399
1019484	Annandale Farmers Market	6621 Columbia Pike	\N	-77.196229	38.832801	696
1002526	South Hill Farmers Market	105 W. Danville Street	23970	-78.1301422	36.7244013	676
1019342	Urban Harvest Farmers Market	2752 Buffalo Speedway	77027	-95.431103	29.741093	272
1019482	Market 23	2620 23 ST	68601	-97.361665	41.440025	256
1018903	My Matanuska Marketplace	610 S Valley Way	99645	-149.113628	61.59993	39
1019523	Farmers and Crafts Market of Las Cruces	221 N. Main St	88001	-106.789695	32.326444	698
1005254	Kapolei Community Park (People's Open Market)	91-1049 Kamaaha Loop	96707	-158.066932	21.333263	580
1019599	South Fork Fun Food & Brew	3309 W. Hwy 29	78628	-97.745633	30.631014	71
1001280	Shelby County Farmers Market	Hwys 44 and 59	51537	-95.338882	41.645926	660
1019494	Lorton	8990 Lorton Station Blvd	22079	-77.216355	38.698239	696
1018556	Bremerton Community Farmers Market	1400 Park Ave	98337	-122.628866	47.574253	463
1011930	Capital City Farmers Market	126 West Loockerman Street (Loockerman Way Plaza)	19904	-75.5262294	39.1576541	190
1021366	Washington on the Brazos Farmers Market	23400 Park Road 12	77880	-96.403458	30.2145775	539
1005250	City Hall Parking Lot Deck (People's Open Market)	Alapai & Beretania Street	96813	-157.852699	21.305408	580
1019424	West Orange Farmers Market	80 Main Street	7052	-74.238131	40.780392	677
1019513	Victoria Farmers' Market	2805 North Navarro	77901	-97.000968	28.821562	378
1018627	Petaluma Farmers Market	Petaluma Blvd S and D St	94952	-122.636797	38.231796	537
1019863	Zebulon Farm Fresh Market	103 N Arendell Ave	27597	-78.314111	35.821835	633
1019526	Stow Community Farmers Market	1567 Pilgrim Drive	44224	-81.452156	41.168794	663
1019346	Lexington Small Yet Mighty Winter Farmers Market	739 Massachusetts Avenue	2420	-71.206748	42.429242	466
1010014	Smith County Farmers Market	110 Ag. Center lane	37030	-85.9461859	36.2233523	362
1019169	Bessemer Farmers Market at Medical West	995 9th Ave SW	35022	-86.990644	33.373082	19
1021740	Casey Farm Market	2325 Boston Neck Rd.	2874	-71.423314	41.51301	539
1019030	Laurel Farmers Market	\N	39440	-89.130033	31.692522	661
1019015	Tahoe City Farmers Market Thursday CFM	400 N Lake Blvd	96145	-120.14113	39.169938	145
1010998	Terre Haute Farmers Market	2800 Poplar Street	47803	-87.37607	39.464145	263
1019511	South Lyon Farmers and Artisans Market	110 W. Liberty	48178	-83.653169	42.461015	270
1021430	Moonlight Market	11110 Johnson Drive	66203	-94.805322	39.017779	337
1019911	West Warwick Farmers Market	186 Providence St	2893	-71.516856	41.713691	190
1012783	Edenton Farmers Market	200 North Broad St	27932	-76.607401	36.062086	132
1019540	Union Square Farmers Market	66-70 Union Square	2143	-71.094533	42.379761	466
1018970	Garden City Farmers Market	1210 Fleming	67846	-100.8532074	37.9772536	261
1001661	Westside Community Market	750 University Row	53705	-89.470061	43.076159	326
1021462	Pontiac Farmers' Market	\N	61764	-88.629562	40.880177	75
1019876	Market on the Square (BrokenkBow)	\N	\N	-99.63987	41.40541	480
1001962	Waukon Farmers Market	850 Rossville Road	52172	-91.472878	43.260191	592
1020126	Phelan Certified Farmers Market	4128 Warbler Road	92371	-117.524831	34.439822	207
1020104	Farmers Market at the Depot	101 E. Depot Street	40069	-85.217676	37.683658	539
1020065	Floyd County Farmers Market (Floyds Knobs)	400 Block Lafollette Station	47119	-85.896109	38.315002	77
1021318	Dickinson Square Farmers' Market	1600 East Moyamensing Avenue	19148	-75.151276	39.927056	27
1019797	Westgate Farmers Market	2925 W. Broad Street	43204	-83.078781	39.954491	623
1020087	middletown farmer's Market	\N	40243	-85.543717	38.242222	19
1019981	Suwanee Farmers Market	330 Town Center Ave	30024	-84.063354	34.05617	269
1010865	Olde Beaufort Farmers' Market	300 Courthouse Square	28516	-76.663201	34.719572	143
1020008	Fightingville Fresh	315 W Simcoe	70501	-92.031394	30.211573	119
1021457	De Soto Farmers' Market	520 N. Main St.	63020	-90.552205	38.143674	19
1020177	Phoenix Hill NuLu Farmers' Market	1007 E. Jefferson St	40206	-85.733398	38.251583	19
1021623	Rocky Butte Farmers Market	9200 NE Fremont St	97220	-122.568013	45.551352	724
1018925	Winters Farmers Market at The Crossing at Hollar Mill	883 Highland Avenue SE	28602	-81.3258422	35.735392	37
1007309	Wrightstown Farmers Market	Middletown Grange 576 Penns Park Road	18940	-75.106815	40.336871	29
1019345	Nourish Knoxville's Winter Farmers' Market	500 Howard Baker Jr Ave	37915	-83.910507	35.96565	58
1002060	Philmont Farmers' Market	116 Main St. - opposite Local 111 restaurant	12565	-73.649443	42.249303	391
1018227	Braintree Farmers Market	1 JFK Memorial Dr	2184	-71.004927	42.206437	377
1000431	Appleton Downtown Farm Market	100 College Avenue	54911	-88.40703	44.26201	641
1021698	Easthampton Farmers' Market	50 Payson Ave	1027	-72.669332	42.265213	338
1018622	Fairfax Community Farmers' Market	124 Bolinas Avenue	94930	-122.58998	37.985729	560
1018214	Vineyard Farmers Market	100 W. Shaw	93704	-119.7910413	36.8097606	121
1019125	Eastgate Plaza Farmers Market	4927 - 5089 Transit Road	14221	-78.595325	42.97573	487
1021385	Woodstock Farmers Market-Tuesday Summer	112 S. Benton St.	60098	-88.435654	42.310266	14
1021367	Westerly Land Trust Farmers Market	61-85 Main Street	2891	-71.83172	41.375089	539
1021504	Forest Hills Farmers Market	1840 Ardmore Blvd	15221	-79.86111	40.425019	36
1019318	Boonville Farmers Market Inc	1931 Boone Village Shopping Center	65233	-92.741591	38.955643	563
1021742	Kentwood Farmers Market	4900 Breton Rd SE	49512	-85.595648	42.874394	190
1020124	Colusa Certified Farmers Market	10th Street Memorial Park	95932	-122.014038	39.214999	250
1007271	Sunland Park Ardovino's DC Farmers' Market	one Ardovino Dr	88063	-106.557437	31.791358	698
1009080	San Francisco Certified Alemany Farmers Market	100 Alemany Boulevard	94110	-122.4085979	37.7373447	692
1019458	Dimondale Farmers' Market	136 N Bridge St	48821	-84.647388	42.646201	186
1019419	River Street Market	30 River Street	23803	-77.40373	37.233787	649
1010319	Westchase District Farmers Market	10503 Westheimer Road	77042	-95.560152	29.736539	272
1021441	Clay Center Farmers Market	720 5th Street	67432	-97.126471	39.376936	550
1011203	West Lafayette Farmers Market	3065 N Salisbury St	47906	-86.915836	40.461469	520
1004927	Cagan Crossings Farmers' Market	600 Cagan Park Ave.	34714	-81.678425	28.355644	431
1018988	Shiloh Farmers' Market	5300 Philadelphia Dr.	45415	-84.235026	39.819046	353
1021665	Fernley Poolside Farmers Market	300 Cottonwood Lane	89408	-119.247333	39.594402	609
1020129	Chico Certified Farmers Market - Chico Wednesday	North Valley Plaza Mall	95926	-121.848452	39.758425	447
1019805	Greenbelt Farmers Market	25 Crescent Road	20770	-76.877296	39.001146	21
1019493	Reston	1609 Washington Plaza	20190	-77.342215	38.948449	696
1018121	Fulton County Farmers Market	\N	46975	-86.2158331	41.0647645	639
1011814	Galleria @ Tyler Riverside Farmers Market	1370 Galleria @ Tyler	92503	-117.4578357	33.9097475	500
1021576	Tuesday Market in Library Park	200 Park Street	95453	-122.913879	39.043583	431
1008303	Saracen Landing Farmers Market	200 Lake Saracen Drive	71601	-92.004296	34.231049	19
1018625	Santa Rosa Community Farmers Market at the Veterans Building	1501 Farmers Lane	95404	-122.689399	38.434379	537
1019884	Plattsmouth Downtown Farmers Market	\N	\N	-95.894144	41.005653	146
1019033	Rockmart Farmers Market	108 Water St.	30153	-85.053094	33.997669	486
1006324	Townshend Farmers Market	6573 Route 30	5359	-72.711717	43.084256	57
1021512	Historic Lewes Farmers Market	Savannah Rd. and Sussex Ave.	19958	-75.147417	38.767703	43
1019506	La Plata Farmers Market - Saturday	209 Washington Ave	20646	-76.978699	38.531647	300
1006547	Monroe County Farmer's Market	20 E. Willow St.	48162	-83.39378	41.91965	572
1019075	Temple Terrace Farmers' Market	11302 N 56th St	33617	-82.394125	28.050964	302
1002339	Harvest Home Metropolitan Hospital Market	97-99th Street and 2nd Ave.	\N	-73.94622	40.785539	282
1019879	New Grand Island Farmers Market	\N	\N	-98.357951	40.922193	521
1019149	Price Farmers Market	100 N 100 E	84501	-110.8088043	39.6010798	656
1018416	Delcambre Seafood & Farmers Market	605 S Railroad (Hwy 330)	70528	-91.982453	29.941659	368
1019527	BROOKINGS HARBOR FARMERS MARKET	15786 HWY 101 SOUTH	97415	-124.244963	42.037301	336
1021456	Greater Washington County Food Bank Farmers' Market	909 National Pike West	15417	-79.977907	40.041867	539
1021317	Woodstock Farmers Market - Winter	11900 Country Club Rd.	60098	-88.435654	42.310266	14
1021613	Salem Farmers Market	32 Derby Square	1970	-70.894541	42.520767	677
1021208	Historic Downtown Jersey City Farmers Market	Grove PATH Plaza	\N	-74.042428	40.719659	452
1012157	Anaconda Community Market	Kennedy Common (306 Main)	59711	-113.139108	46.099059	652
1016909	Yreka Community Certified Farmers Market	1712 Fairlane Road	96097	-122.6401341	41.7070195	375
1011076	Middlebury Farmers' Market	530 Exchange St	5753	-73.169908	44.026734	501
1021575	Cameron Park Burke Junction Certified Farmers Market	Burke Junction Shopping Certer	95672	-120.973615	38.657829	445
1012429	Freedom Farmers Market at the Carter Center	453 Freedom Pkwy NE	30307	-84.35682	33.76759	639
1021412	Ohio Valley Farmers' Market	3200 Union St	43906	-80.74212	40.014375	233
1012666	Corpus Christi Downtown Farmers' Market	100 N Shoreline Blvd	78401	-97.392206	27.791601	220
1004515	Westside Farmers Market	510 W. Ottawa St.	48933	-84.559858	42.73477	702
1021495	WIC Clinic Callaghan Farmers' Market	4412 Callaghan Rd	78228	-98.525142	29.472403	315
1019533	HAPI Fresh Farmers' Market	647 E. Market Street	44304	-81.521429	41.080456	663
1002536	Del Monte Farmers Markets at Del Monte Shopping Center	1410 Del Monte Center	93940	-121.9270394	36.9872756	264
1002765	Suttons Bay Farmers Market	Intersection of M22 & M204	49682	-85.647075	44.980186	472
1021567	Kershaw County Farmers Market	906 Broad Street	29020	-80.606634	34.243195	364
1012484	Cedar Mill Farmers Market	Corner Of NW Cornell and Murray Roads	97229	-122.8141034	45.5263877	539
1021540	Batavia Farmers' Market	North River Street	60510	-88.306027	41.851028	643
1000712	Reedsburg Area Medical Center Farmer's Markets	2000 North Dewey Avenue	53959	-89.993406	43.549612	205
1018968	Union County Farm & Craft Market	106 Lakeside Drive	29379	-81.614994	34.716023	722
1019410	Redland Community Farm and Market	12690 SW 280th Street	33033	-80.395809	25.506957	604
1019227	New Glarus Farmers Market	1101 Hwy 69	53574	-89.632242	42.809612	33
1021435	Canton Farmers' Market	300 Market Ave N	44702	-81.374888	40.80065	104
1021672	Healthy New Albany Indoor Farmers Market	150 W Main St	43054	-82.798908	40.083073	623
1020108	Jackson County Farmers Market	3034 Welchburg Rd.	40486	-83.922703	37.330559	491
1003694	Northbrook Farmers Market	Cherry Lane and Meadow Road	60062	-87.8286573	42.1314024	577
1021676	Ferndale Farmers Market	27021 Kanis Rd	72223	-92.556803	34.776925	404
1021516	Historic Lewes Farmers Market	Dupont and Johnson Avenues	19958	-75.147503	38.772404	43
1019395	Sevier County Farmers Market	Herman Dierks Park   604 East Hayes Avenue	71832	-94.342133	34.042245	564
1019351	Adams County Farmers' Market Association	103 Carlisle Street	17325	-77.234147	39.830597	562
1012278	St. Petersburg Saturday Morning Market	First Street and First Avenue South	33701	-82.633652	27.769964	699
1019120	King George Farmers Market	King George Middle School at 8246 Dahlgren Rd	22485	-77.2028	38.27678	372
1002177	West Point-Town of Highlands Farmers Market	Main street	10928	-73.96631	41.36957	165
1019770	HAPI Fresh Farmers' Market	381 Ontario Street	44310	-81.521429	41.080456	663
1009884	North Square Farmers Market	100 Spring St	17201	-77.662435	39.938459	623
1011160	Santa Rosa Farmers Market	4587 Woodbine Road	32571	-87.183559	30.603977	343
1020109	Cumberland County Farmers' Market	819 S Main Street	42717	-85.364614	36.790074	407
1019369	Winchester Farmers' Market	Meridian & Washington St.	47394	-84.977051	40.1721	502
1005257	Manoa Valley District Park (People's Open Market)	Manoa Rd	96826	-157.807997	21.314189	580
1018921	Pittsburg County Farmers Market	SW Corner of Main and Choctaw	74501	-95.769944	34.926816	648
1020081	Meade County Farmers Market	1041 Old Ekron Rd	40108	-86.166136	37.988637	428
1021643	Sustainable Food Center Farmers' Market Downtown	422 Guadalupe St	78701	-97.747306	30.26766	662
1006678	Espanola Farmers Market	1105 N.Railroad  Avenue	87532	-106.065805	36.003598	569
1021431	Healthway Park Farmers Market	4055 South Roy Wilson Way	46163	-85.91723	39.726276	113
1020163	SLO Farm Supply Farmers Market	224 Tank Farm Rd	93401	-120.667181	35.247189	110
1000549	Clio Market	21 College Street	36311	-85.619065	31.7078144	171
1018190	Coralville Farmers' Market	1513 7th St	52241	-91.584155	41.678726	337
1019104	China Grove Farmers Market	308 North Main Street	28023	-80.5778246	35.570981	192
1021461	Gilbert Farmers Market	222 N Ash St	85234	-111.790943	33.354527	418
1019503	Lewiston Area Farmers Market	170 S Fremont St	55952	-91.866902	43.980991	41
1018549	Richmond Farmers Market - Summer Season (May-October)	47 N 6th St	47374	-84.893377	39.829996	379
1021267	Champlain Islands Farmers' Market - Wednesday	501 U.S Route 2	5486	-73.323048	44.661841	53
1021649	Denton Community Market	317 w Mulberry St	76201	-97.136334	33.213317	655
1021733	Aquidneck Growers Market Miantonomi Community Farmers Market	120 Hillside Avenue	2840	-71.30979	41.509894	507
1019922	CalaverasGROWN Certified Farmers' Market San Andreas	891 Mountain Ranch Road	95249	-120.667822	38.191243	99
1012296	DeForest Farmers' Market	DeForest Street	53532	-89.339846	43.246672	326
1021659	The LMH Market	1408 Short Eleventh St	62656	-89.385624	40.154175	559
1020192	Jeffersontown Farmers Market	10434 watterson trail	40299	-85.562797	38.19521	19
1019173	Speedway Farmers Market	1068 Main Street	46224	-86.247542	39.793698	494
1019138	Team Jaffrey Farmers Market	28 Main St	3452	-72.023787	42.815213	406
1011811	Simi Valley City Hall Certified Farmers' Market	2757 Tapo Canyon rd	93093	-118.718091	34.285295	209
1018394	Bottineau Farmers Market	6th Street and Main Street	58318	-100.4459433	48.8262788	505
1020094	Logan County Farmer's Market	255 John Paul Avenue	42276	-86.884185	36.866286	559
1019137	Miami County Farmers Market	North Broadway and East 5th Street	46970	-86.069521	40.755229	335
1021326	Southwest Plaza Farmers Market	Wadsworth and Bowles	80123	-105.09573	39.611904	19
1021615	Reisterstown Farmers Market	120 Main Street	21136	-76.8297	39.465227	385
1019683	Middletown Farmers' Market	12 S Church St	21769	-77.54531	39.441867	295
1021343	Tremont Farmers Market	1200 Startkweather Ave	44113	-81.690301	41.479328	654
1005631	USDA Farmers Market	Corner 12th St. & Independence Ave. SW	20250	-77.028494	38.887743	277
1019914	Fisherman's Memorial Park Farmers Market	1011 Point Judith Rd	2882	-71.488239	41.380339	539
1021262	Broome County Regional Farmers Market	840 Upper Front St	13905	-75.904648	42.129759	395
1019303	The Creede Farmers and Local Artisan Market	001 - 1st Street	81130	-106.926949	37.852344	530
1021325	Lawrence Farmers' Market - Tuesday Market	1140 Massachusetts Street	66044	-95.235986	38.963018	607
1021429	Shawnee Farmers Market	11110 Johnson Drive	66203	-94.805322	39.017779	337
1006661	Fulton Street Farmers Market	1145 East Fulton	49503	-85.640479	42.963913	190
1019383	Harvest Home 125th Street Market	W. 125th Street & Adam Clayton Powell Blvd	\N	-73.947702	40.808707	282
1021746	Perry County Farmers Market Perryville	\N	72126	-92.801421	35.005134	675
1019163	Dardanelle Farmers Market	120 N Front St	\N	-93.153099	35.220839	479
1020168	Woodford County Farmers' Market	525 Marsailles Road	40383	-84.733856	38.050275	363
1020103	Shepherdsville farmer's Market	170 W. Joe B. Hall Avenue	40165	-85.709198	37.988053	706
1019895	Henderson Farmers Market	\N	\N	-97.811491	40.778922	435
1011363	Belton Farmers Market	Memorial Park	64012	-94.525252	38.808556	146
1001925	Voorheesville Farmers Market	68 Maple Ave.	12186	-73.930027	42.649656	254
1021233	Secotan Market	2868 NC-345	27981	-75.645391	35.854615	504
1008054	Airport Farmers and Flea Market	17375 Spring Hill Dr	34604	-82.441514	28.481294	716
1012206	Lake Placid Farmers' Market	281 Station Street	12946	-73.9841054	44.2770413	677
1019771	Fibonacci's Mount Healthy Farmers Market	1445 Compton Road	45231	-84.54095	39.23161	409
1019048	Rocky Mountain Front Farmers Market	North Main Avenue & 8th Street NW	59422	-112.188004	47.818183	219
1019400	Bedminster Farmers Market	3055 River Road	7921	-74.646889	40.662856	350
1021566	Oak Hill Hops	3051 W STREETSBORO RD	44286	-81.600093	41.244993	663
1000312	Durham Farmers' Market	501 Foster Street	27701	-78.901856	36.000559	312
1005493	Twin City Farmers Market	106 Avenue A	61081	-89.697172	41.787255	636
1021217	Westside Community Market	750 University Row	53705	-89.470022	43.076385	326
1021713	Marion Farmers Market	2200 31st St	52302	-91.580645	42.044309	365
1018978	Jackson County Winter Farmers Market	23 Central Street	28779	-83.224149	35.375581	491
1021244	KSQ Farmers Market	401 Birch St	19348	-75.705331	39.842787	140
1019235	Reidsville Market Square Farmers' Market	303 S. Scales Street	27320	-79.6640029	36.3586088	185
1006059	Greater Watertown-North Country Chamber of Commerce Farm & Craft Market	317 Washington St.	13601	-75.9112726897001	43.9720956981182	19
1019146	Bridgewater Farmer's Market	1 Vogt Drive	8807	-74.607976	40.588552	350
1018940	Engadine Area Farmers' Market	\N	\N	-85.578248	46.119734	587
1019789	Auburn Farmers Market	1140 Auburn Way S	98002	-122.218459	47.298267	345
1016820	Low-Line Market at Southport	3410 N Southport Ave	60657	-87.664233	41.943816	577
1019445	SE Columbus Farmer's & Grower's Market	5081 Carbondale Drive	43232	-82.847372	39.924927	623
1016803	Pitkin Verde Farmers Market	2094 Pitkin Avenue	11207	-73.895438	40.671863	31
1019927	Riverview Farmers Market	320 Ogden Avenue	7307	-74.042798	40.744736	452
1011139	Maryville Farmers Market - Saturdays	Founders Square	37801	-83.969504	35.756987	600
1019899	Rock Valley Farmers Market	1013 13th Ave	51247	-96.300832	43.200223	211
1005949	Big Bear Farmers Market	42900 Big Bear Blvd	92315	-116.866714	34.260803	207
1017915	Wytheville Farmers Market	210 W. Spring Street	24368	-81.0833677	36.9486397	674
1021696	Harlingen Farmers Market	218 E Tyler Ave	78550	-97.694079	26.189375	271
1019602	Get Moving Houston Farmers Market - Acres Homes	6719 W. Montgomery	77091	-95.422239	29.857439	95
1010406	Bethesda Central Farm Market	7600 Arlington Road	20814	-77.09989	38.986761	353
1012233	Agricenter International Farmer's Market	7777 Walnut Grove Rd	38120	-89.801733	35.127452	660
1003980	Manhattan Farmers Market	South Broadway and West Main	59741	-111.333325	45.856793	194
1019305	Sowing Seeds Growing Futures Farmers Market	18917 Joy Road	48228	-83.130895	42.362216	379
1020149	Surprise Valley Farmers Market	501 Main	96104	-120.171665	41.527832	528
1019921	Elgin Farmers' Market	\N	78621	-97.370756	30.346425	408
1001260	Pflugerville Pfarmers Market	901 Old Austin Hutto Road	78660	-97.606001	30.442585	662
1021535	Round Rock Farmers' Market	201 University Oaks Blvd	78665	-97.688209	30.557966	71
1021404	Farmers Market of Gravette	Hwy. 72 east	72736	-94.446383	36.419093	170
1001290	Collinsville Farmers Market	Main St. and Route 179	6019	-72.923264	41.810819	558
1003971	Rogue Valley Growers & Crafters Market	Oak & N Main	97520	-122.700426	42.192172	491
1019245	Your Neighborhood Farmers Market-LaCenterra at Cinco Ranch	23501 Cinco Ranch BLVD.	77494	-95.7750405	29.7413678	272
1008612	Alachua County Farmers' Market	5920 NW 13th Street	32653	-82.352515	29.7106652	705
1005991	New Highland Baptist Church Farmers Market	9200 New Ashcake Road	23116	-77.410676	37.699238	216
1019791	Ross Township Farmers Market	920 Perry Hwy	15229	-80.036108	40.533713	36
1019339	Big Lake Winter Farmers Market	311 Lake Street South	55309	-93.747475	45.329205	576
1020175	Peaceful Valley Farmers Market	14888 Peaceful Valley Road	95370	-120.338076	37.974304	163
1021309	Ambler Farmers' Market	29 West Butler Pike	19002	-75.225298	40.153501	353
1019222	Arnold Farmers Market	2400 Bradley Beach Road	63010	-90.353093	38.453275	19
1011738	TD Saturday Market	Main Street at West Court Street	29601	-82.4000115	34.8485031	325
1020198	Orinda Famers Market	28 Orinda Way	94563	-122.174543	37.882764	208
1020091	Floyd County Farmers Market	361 N. Lake Drive	41653	-82.775995	37.670674	77
1020034	Milk Lady Derwood Fall 2020 Pickup/Delivery	16501 Redland Road	20855	-77.150329	39.126727	353
1019300	Mauldin Farmers Market	101 East Butler Road	29662	-82.3063956	34.7796468	325
1020114	Orange Home Grown Farmers & Artisans Market	303 W. Palm Ave.	92866	-117.855866	33.791554	165
1019995	Little Italy Mercato CFM	555 W Date Street	92101	-117.167574	32.723123	582
1020162	Morro Bay Main Street Farmers Market	Main St. and Morro Bay Blvd.	93442	-120.849956	35.365976	110
1021628	Berwick Winter Farmers Market	11 Sullivan St.	3901	-70.86243	43.269956	435
1002880	Frankenmuth Farmers Market	534 North Main Street	48734	-83.738212	43.344313	642
1021574	El Dorado Hills Town Center Certified Farmers Market	Town Center Blvd.	95762	-121.064292	38.651318	445
1018598	Vermillion Area Farmers Market Winter Markets	515 High Street	57069	-96.9346099	42.7851033	550
1018343	Jackson County Farmers Market	Diploma Drive	54615	-90.862319	44.291599	491
1020101	Boone County Farmers Market	1961 Burlington Pike	41005	-84.721563	39.022231	65
1020186	Sunnyvale Farmers' Market	Murphy Avenue at Washington Avenue	94086	-122.026323	37.385784	12
1021350	Gooding Farmer's Market	Corner of 13th and Main	83330	-114.712524	42.932194	122
1019156	Village of Skokie Farmers' Market	5127 Oakton Street	60077	-87.756755	42.026029	577
1010839	Petworth Community Market	4100 9th St. NW	20010	-77.0250472	38.9411512	277
1021307	Mt Airy Farmers' Market	601 Carpenter Lane	19119	-75.196253	40.046156	27
1019772	Canton Farmers Market	500 North Ridge Road	48188	-83.533591	42.308841	379
1018655	Omaha Farmers Market - Aksarben Village	67th & Center Street	68106	-96.0138738	41.2377371	607
1019167	Linton Farmers' Market	\N	47441	-87.149098	39.039325	397
1010286	Manson Farmers Market	157 E Wapato Way	98831	-120.155979	47.884784	275
1012627	Fearrington Farmers' Market	East Camden	27312	-79.090143	35.800209	527
1021209	Memphis Farmers Market	540 S. Front Street	38103	-90.06008	35.132038	660
1002890	Wellington Square Certified Farmers Market	4394 W Washington Blvd.	90016	-118.334753	34.03979	490
1021586	The Wilmington Farmers Market	5329 Oleander Dr	28403	-77.860425	34.20895	603
1011761	Historic Marion Tailgate Market	67 West Henderson Street	28752	-82.008815	35.682465	61
1006831	Highland Farmers' Market	61 Highland Center Drive	24465	-79.586195	38.409646	181
1019313	Hot Springs Farmers Market	c/o Rajni Lerman	57747	-103.479082	43.432276	413
1019802	Hereford Farm Market	17004 York Rd	\N	-76.644722	39.4668834	385
1018927	Ligonier Country Market	110 Andi Lane	15658	-79.2507333	40.2501886	111
1018937	Farmers Branch Market	12700 Denton Drive	75234	-96.8952798	32.9178496	695
1018626	Petaluma Evening Farmers' Market	2nd Street between D St and B St	94952	-122.637103	38.233365	537
1019652	Wilkinsburg Thursday Open Market	225 Penn Avenue	15221	-79.890864	40.445948	36
1019671	Somerset County Farmers' Market Inc.	800 Georgian Place	15501	-79.072141	40.022787	350
1019634	Medford Farmers Market	2501 Mystic Valley Parkway	2155	-71.115435	42.41853	466
1021269	Carrboro Farmers' Market	301 W Main St	27510	-79.077607	35.910781	165
1019500	Red Lodge Farmers' Market	Lion's Park	59068	-109.247918	45.1913	656
1020066	North Berkeley Farmers' Market	Shattuck and Vine	94702	-122.269078	37.880337	246
1021526	Stayton Farmers Market	Third Ave & Florence St	97383	-122.791922	44.796453	494
1019966	The Market at Second Stage	194 Second St.	24521	-79.048809	37.583162	667
1019687	Enumclaw Plateau Farmers' Market	1600 1st Street	98022	-121.987466	47.202843	345
1016867	Downingtown Farmers Market	1 Park Lane	19335	-75.705606	40.007243	140
1018113	Lebanon Farmers Market	579 Exeter Road	6249	-72.212877	41.635781	204
1007267	Homer Farmers Market	Ocean Drive	99603	-151.512342	59.638109	321
1019751	The Farmers’ Market at Rutherfurd Hall	1686 county road 517	7820	-74.813622	40.914599	650
1019376	Harvest Home Kings County Hospital Market	Clarkson Avenue btwn E. 37th & E. 39th Street	\N	-73.94252	40.655889	31
1008322	Carrollton Farmers Market	Carrollton Uptown Square	64633	-93.496941	39.358097	115
1009004	A Growers' Market	229 Lake Ella Drive	32303	-84.279874	30.461953	669
1019262	Crescent City Farmers Market	200 Broadway Street	70118	-90.133127	29.932159	506
1018319	Watford Market	501 7th St SE	58854	-103.271392	47.797315	169
1021363	Belleville Farmers Market	Main and 4th	48111	-83.482812	42.201917	379
1020051	Lakewood Village Farmers Market	6434 E Mockingbird Lane	75218	-96.751083	32.835725	695
1019936	El Monte Farmers' Market	10700 Main Street	91731	-118.03995	34.075484	490
1021353	Freight House Farmers' Market	421 West River Drive #32	52801	-90.582083	41.519748	632
1018619	Guttenberg Farmers Market	400 Block of South River Park Drive	52052	-91.095446	42.782433	493
1001597	Hampton Farmers Market	1st Street NW and 1st Ave. NW	50441	-93.209702	42.742892	623
1019489	Wakefield	8100 Braddock Road	22003	-77.196229	38.832801	696
1012737	New Bedford Farmers Market- Indoor	101 West Rodney French Blvd	2744	-70.937913	41.661303	103
1018505	Fort Sumner Farmers Market	213 E Sumner Avenue	88119	-104.244013	34.470848	474
1011274	Winchester Road Farmers Market	1262 Winchester Rd	35811	-86.526471	34.801092	460
1020135	Coastside Farmers' Market - Half Moon Bay	225 Cabrillo Highway	94019	-122.437378	37.46677	416
1019832	Allen County Farmers' Market	807  N. State	66749	-95.400669	37.927427	423
1020088	Scott County Farmers' Market	corner of North Broadway and Washington Street	40324	-84.559554	38.211492	632
1004651	Lewis County General Hospitals Farmers Market	7785 North State street	13367	-75.500665	43.794672	581
1007810	St. Paul Farmers' Market	210 Holyoke	55044	-93.2429	44.6451	309
1019159	Catawba Valley Farmers Market	4965 Catawba Creek Road	24070	-80.1068482	37.3835006	341
1010821	Rose City Farmers Market	302 S. Broadway Ave.	75701	-95.300309	32.347948	362
1009994	18th Street Farmer's Market	18th and Broadway	69361	-103.662538	41.864268	247
1019815	Northside Farmers Market	4222 Hamilton Ave	45223	-84.539984	39.163947	409
1019148	Hanover Market House	210 East Chestnut Street	17331	-76.98261	39.803273	435
1019091	South Side Farmers' Market	Alder Street and Cedar Avenue	18505	-75.6668643	41.4003507	575
1020102	Beattyville Main Street Marketplace Locally Made Market	26 Hwy 52 W	41311	-83.705633	37.591129	534
1005588	GLENCOE	201  W CHASTAIN BLVD. WEST	35905	-85.934714	33.957828	585
1019110	Cleburne Farmers Market	141 S Ridgeway Drive	76033	-97.407713	32.339893	337
1019078	Vermont Farmers Market	Depot Park (at the Walmart Shopping Plaza)	5701	-72.980071	43.605826	700
1021340	Wallingford Farmers Market	4800 Meridian Ave N	98103	-122.333359	47.663924	345
1019192	Henderson County Tailgate Market	100 North King Street	28739	-82.458271	35.314825	327
1005943	CitySeed Wooster Square Farmers Market	DePalma Ct. between Chapel St. and Wooster St.	6511	-72.917848	41.303232	591
1018814	Sleeping Dragon Farmers Market	6475 Columbus Rd SE	88030	-107.750939	32.189126	712
1010037	MLK Campus Farmers' Market	1670 E 120th St	90059	-118.243583	33.923533	490
1019111	Mansfield Farmers Market	703 East Broad Street	76063	-97.134052	32.564588	346
1020070	Westport Rd Baptist Farmers Market	9705 Westport Road	40241	-85.571695	38.288727	19
1019635	Riverwalk Farmers Market	5 S. Walnut Street	19963	-75.42808	38.913062	43
1019035	Lamoni Farmer's Market	610  E. Main St  or Corner of Main St & South Linden St	50140	-93.933204	40.62353	49
1004516	Danbury Farmers' Market	120 White Street	6810	-73.450227	41.397912	224
1021478	New Braunfels Food Bank Farmers' Market	1620 S. Seguin Ave	78130	-98.115109	29.699301	315
1020134	McKinleyville CFM	2165 Central Ave	95519	-124.100568	40.944643	159
1021655	Cape Riverfront Market	35 S Spanish Street	63703	-89.519952	37.302782	245
1011730	Friendswood Farmers Market	1100 S Friendswood Dr.	77546	-95.191302	29.520767	566
1019185	Market Mondays at the Arsht Center	1301 Biscayne Blvd	33132	-80.189855	25.787138	604
1019250	Your Neighborhood Farmers Market-Summerwood	14303 West Lake Houston Parkway	77044	-95.1773832	29.9341141	272
1021349	Kenosha Public Market - Winter Indoor	625 57th Street	53140	-87.819183	42.584009	476
1008213	Pleasants Area Farmers Market	2nd Street	26170	-81.205928	39.390828	707
1018994	Terra Square Farmers Market	3380 Chicago Dr.	49426	-85.8654557	42.8677383	9
1005332	Harvest Home North Central Bronx Market	E. Mosholu Pkwy N. & Jerome Avenue	\N	-73.883864	40.880479	167
1020061	Delano Neighborhood Market	1709 W Douglas	67213	-97.360349	37.683757	631
1006997	Green Scene Walker Community Farmer's Market	617 Michigan Avenue	56484	-94.584857	47.100539	146
1021336	New Orleans East Hospital Farmer's Market	5620 Read Boulevard	70127	-89.975013	30.030672	506
1012739	New Bedford Farmers Market- Brooklawn Park	1997 Acushnet Ave.	2745	-70.923644	41.675431	103
1019396	Avon Farmers Market	8190 E US Highway 36	\N	-86.38263	39.765279	130
1018829	Oak Square Farmers Market	640 Washington Street	2135	-71.1691939	42.3506821	314
1020073	Taylorsville Farmers Market Inc.	751 Taylorsville Rd	40071	-85.344893	38.03192	381
1021641	Pittsburg Area Farmers' Market	119 E. 11St.	66762	-94.703397	37.418249	2
1019618	Central Kitsap Farmers Market	2251 NW Bucklin Hill Rd	98383	-122.680109	47.650238	463
1019240	Newport Beach Certified Farmers' Market by Farmer Mark	1 McFadden Place	92663	-117.928792	33.607886	165
1019924	Marksville Main Street Fresh Market	317 North Main Street	71351	-92.066002	31.12742	238
1019654	Downtown Green Bay Saturday Farmers Market	200 S. Washington Street	54301	-88.017128	44.513118	524
1019258	Countryside Winter Farmers' Market	2315 Ira Rd.	44333	-81.589922	41.192676	663
1019128	Pfafftown Farmer's Market	4725 Yadkinville Rd	27040	-80.256362	36.1304034	499
1002062	Salamanca Farmers market	768 Broad st	14779	-78.741263	42.164734	308
1010408	Pike Central Farm Market	910 Rose Avenue	20852	-77.117929	39.049352	353
1021297	Vine Street Market at O'Fallon Station	212 E 1st Street	62269	-89.908925	38.591615	89
1004073	Riverdale Park Farmers Market	4650 Queensbury Road	20737	-76.935311	38.962979	21
1021697	South Collier Farmer's Market	6060 Collier Blvd	34114	-81.698398	26.045266	273
1021311	Bryn Mawr Farmers' Market	775 Lancaster Avenue	19010	-75.317067	40.021168	353
1019726	Lewiston Winter Farmers Market	130 East Ave.	4240	-70.172185	44.089594	430
1012081	Bangor Farmers' Market	Corner of Franklin and Harlow Streets	4401	-68.771649	44.8039587	90
1018807	Orange Community Farmers' Market	525 Orange Center Road	6477	-73.0210587	41.2735586	591
1019878	Wilber Farmers Market	\N	\N	-97.114886	40.64738	333
1021289	Greeley Farmers Market	902 7th Ave.	80631	-104.689105	40.424001	630
1021207	Elmwood Bidwell Farmers' Market	Elmwood and Bidwell	14221	-78.877625	42.923862	487
1019266	Kirksville Kiwanis Farmers' Market	100 North Elson Street	63501	-92.584293	40.195114	514
1021545	Yucaipa Certified Farmers Market	12062 California St	92399	-117.044913	34.032512	207
1019198	Lakeside Farmers Market - Saturday - year round	6110 Lakeside Avenue	23228	-77.4710931	37.6145155	306
1019123	Food for Thought Summer Market	200 S. David St.	82601	-106.3269901	42.8482536	478
1006833	Boone Farmers Market Association	7th and Story Street	50036	-93.879688	42.062726	65
1019676	Adams County Farmers Market	103 Carlisle Street	17325	-77.234147	39.830597	562
1018958	Dillsburg Farmers' Market	1 N. 2nd Street	17019	-77.037849	40.110975	435
1021734	Farmers Market - Covington	301 4th St	47932	-87.39697	40.13712	60
1000368	Country Lane Farmers Market	1642 16th St	54812	-91.828516	45.443768	482
1021294	Cape Coral Farmers Market	SE 47th Terrace & SE 10th Place	33904	-81.954459	26.564457	534
1021302	Rittenhouse Tuesday Market	1800 Walnut Street	19103	-75.170843	39.950045	27
1021563	South Waterfront Farmers Market	3508 S Moody Avenue	97239	-122.671046	45.496936	724
1020117	Campbell County Farmers Market Association	7634 Alexandria Pike	41001	-84.392139	38.97801	647
1019793	Prince George Farmers Market	6605 Courts Drive	23875	-77.287343	37.224538	144
1019158	Legacy Farmers Market	18402 US Highway 281 N	78259	-98.465436	29.609419	315
1011146	Poestenkill Farmers Market	38 Davis Drive	12140	-73.5635307	42.6904758	188
1018215	Pueblo of San Felipe Farmers' Market	25 Hagen Road	87001	-106.404321	35.416275	301
1000519	Alexandria Bay Farmers Market	Route 12	13607	-75.916118	44.331171	19
1019596	The Capital Market of 20743	111 Capitol Heights Blvd	20743	-76.913335	38.887555	21
1000242	Market in The Park	300 Conti	36602	-88.045015	30.69035	421
1018976	Maryville Farmer’s Market	1 Schiber Ct.	62062	-89.9500804	38.7331622	460
1017995	Charleston Farmers Market	\N	72933	-94.0363153	35.2970353	623
1020068	Artistlane Farmers Market	1966 Broad Street	30904	-82.073422	33.365531	199
1019101	Fox Lake Farmers Market	17 E School St.	60020	-88.17851	42.398071	431
1019794	Bronzeville Growers Market	925 E. Mt. Vernon Avenue	43203	-82.976997	39.97139	623
1019378	Harvest Home Jacobi Hospital Market	1400 Pelham Parkway	\N	-73.846979	40.857347	167
1019008	Norwich Farmers Market	2-75 North Broad Street	13815	-75.523641	42.531632	13
1021537	Wagoner Farmers Market	115 S Main Street	74467	-95.379596	35.963528	232
1019296	Covington Farmers Market	3rd and Greenup Street	41011	-84.508855	39.088659	340
1005183	Berkeley Springs Farmers Market	129 Fairfax Street at Washington Street/522	25411	-78.227534	39.624722	645
1019763	Clintonville Farmers' Market	N High St and W Dunedin Rd	43214	-83.016501	40.034269	623
1012160	Edmonds Museum Summer Market	5th Ave between Main and Bell & Bell St. between 5th & 6th Ave	98020	-122.376787	47.811264	120
1011800	LSI Global Greens Farmers' Market	3200 University Ave	50311	-93.660454	41.599698	486
1010145	Queen Anne Farmers Market	W Crockett Street and Queen Anne Ave N	98109	-122.357601	47.637172	345
1019418	Riverfront Farmers Market	116 Dock St.	28401	-77.94793	34.234207	603
1021263	Prescott Farmers Market	900 Iron Springs Road	86301	-112.482809	34.557395	425
1012045	Encino Farmers Market	17400 Victory Blvd	91406	-118.5128542	34.1862306	490
1019968	Mauston Farmers' Market	220 East State Street	53948	-90.082332	43.801304	495
1021530	Backyard Market in Black Forest - Holiday	13710 Black Forest Road	80908	-104.701697	39.029861	80
1002021	Lakeside Farmers' Market	1606 lakeside ave.	23228	-77.470522	37.614945	306
1020193	Ferry Plaza Farmers Market	1 Ferry Building	94111	-122.39352	37.795162	692
1019380	Harvest Home East Harlem Market	E. 104th Street & 3rd Avenue	\N	-73.945625	40.790266	282
1002657	Emmaus Farmers' Market	235 Main St	18049	-75.4903	40.5366	599
1002280	WesMar Farms Farm Stand	851 Couvillion St	71355	-91.979567	31.035239	238
1019328	Plainfield Township Farmers Market Hale	220 West Washington	48739	-83.804474	44.380388	214
1003563	Amicalola Regional Farmers Market	186 Recreation Road	30534	-84.099043	34.437795	384
1021214	South End Market at Atherton	2000 South Blvd.	28203	-80.860801	35.20911	676
1019610	Seed2Seed Farmer’s Market	100 north main st.	27101	-80.244023	36.09598	499
1019204	Randolph County Farmers' Market	1966 Highway 62 West	72455	-90.983393	36.257409	502
1020040	Somerville Mobile Farmers' Market - East Somerville Community School	50 Cross Street	2145	-71.087099	42.385778	466
1012256	Downtown Fond du Lac Farmers Market - Wednesday	Main Street Plaza	54935	-88.447092	43.777853	684
1010158	Union Farmers Market	280 Common Road	4862	-69.274562	44.211498	58
1019877	West Point Farmers Market	\N	\N	-96.705918	41.837741	4
1021587	Elkhart Farmers Market	301 NIBCO Parkway	46516	-85.970818	41.687093	352
1009034	Canal District Farmers Market	200 Harding Street	1604	-71.797436	42.256235	367
1011037	BisMarket	\N	58501	-100.796471	46.803081	361
1021265	Batesville Farmers Market	Main and Boehringer Street	47006	-85.221859	39.298852	30
1019875	Beaver City Farmers Market	\N	\N	-99.827615	40.138332	42
1019853	Bedford Farmers Market	209 Route 101	3110	-71.525849	42.938268	302
1021450	Athol Farmers Market	30355 N 3rd Street	83801	-116.707904	47.944594	217
1017968	Bruce Community Farmers Market	Corner of Hwy 8 and N Alvey Street	54819	-91.2746971	45.4551101	532
1019682	Myersville Farmers Market	301 Main Street	21773	-77.56524	39.505519	295
1012573	Twin Bridges ALL YEAR Farmers' Market	Main Street City Park and Fairgrounds	59754	-112.33373	45.542747	460
1021583	Hana Farmers Market	Hana Highway	96713	-155.986942	20.750751	380
1021345	La Cienega Farmers Market	1835 La Cienega Blvd	90035	-118.37983	34.044973	490
1005281	Downtown Santa Cruz Farmers' Market	Cedar St & Lincoln St.	\N	-122.0270374	36.9724758	184
1021359	Aquidneck Growers Market - Wednesday	Memorial Blvd	2840	-71.305831	41.483658	507
1018483	Portland Farmers Market - Shemanski Park	SW Park and Main	97205	-122.682231	45.517125	724
1019692	Vanderbilt Farmers Market	Galleria Shoppes at Vanderbilt	34109	-81.771054	26.246337	273
1021570	Decorah Farmers Market	Heivly Street	52101	-91.78475	43.301618	612
1012325	Vashon Farmers Market - Saturday	17519 Vashon Highway SW	98070	-122.460758	47.447921	345
1021387	Cumberland Farmers Market	11501 E Washington Street	46229	-85.961539	39.77586	494
1000481	Madison County Farmers Market	112 N. John Wayne Dr.	50273	-94.013604	41.335222	460
1019199	Columbus KS Farmers Market	202 N. East Avenue	66725	-94.831459	37.171861	426
1018315	Santa Rosa Downtown Market (Wednesday Night Market)	Courthouse Square & 4th St	95404	-122.71359	38.4406777	537
1021494	Pica Pica Plaza Farmers' Market	910 SE Military Dr	78214	-98.525142	29.472403	315
1019675	St. Michaels Farmers Market	204 S Talbot St	21663	-76.225202	38.785161	318
1018563	Bloomington Winter Farmers' Market	1601 S Rogers St	47403	-86.539649	39.149906	572
1021724	Salisbury Farmer's Market	16 Elm Street	1952	-70.842243	42.835542	677
1019933	The Berlin Farmers Market	Pitts Street and Commerce Street	21811	-75.219388	38.325383	367
1021227	Crenshaw Farmers' Market	3650 W Martin Luther King Jr Blvd	90008	-118.335422	34.008706	490
1019701	Culver Farmers' Market	819 E. Lake Shore Drive	46511	-86.419302	41.218494	551
1021552	Ft. Thomas Farmers Market	801 Cochran Ave	41075	-84.444349	39.06822	647
1020086	Prospect Area Farmer's Market	12900 W. Hwy 42	40059	-85.58996	38.37102	50
1003343	La Familia Verde Farmers Market	East Tremont Ave. between Lafontaine Ave& Arthue Ave	10460	-73.893737	40.846468	167
1009829	Dover Farmers' Market	550 Central Avenue	3820	-70.875971	43.200765	185
1019880	David City Farmers Market	\N	68632	-97.129955	41.264759	533
1008409	Chippewa Falls Farmers Market	1 S. Bridge Street	54729	-91.389337	44.934888	82
1019826	The Original Gresham Farmers Market	401 NE Second St.	97030	-122.426975	45.499582	724
1021228	Echo Park Farmers' Market	1146 Logan St	90026	-118.258276	34.076409	490
1001804	Halifax Market Place & Farmers Market	209 South Main Street	24558	-78.92836	36.76317	621
1012494	Bethlehem Farmers' Market	Intersection of New and Morton Streets	18015	-75.3784029	40.6098058	599
1019978	CalaverasGROWN Murphys Certified Farmers' Market	505 S. Algiers St.	95247	-120.463811	38.13686	99
1020015	The Township of Little Falls Farmers Market	225 Main St	7424	-74.234683	40.882225	442
1019501	MainStreet Libertyville Farmers Market	413 N Milwaukee Ave	60048	-87.954744	42.287242	431
1018734	Celina's Friday Night Market	142 N Ohio Street	75009	-96.7869845	33.3247511	339
1019477	Quapaw Farmers Market	326 N Main St	74363	-94.787418	36.955063	9
1021671	Healthy New Albany Farmers Market	200 Market Square	43054	-82.798908	40.083073	623
1018629	Cotati Community Farmers Market	Old Redwood Hwy and W Sierra	94931	-122.707298	38.326544	537
1016862	Mission Farm and Flower Market	5635 Johnson Drive	66202	-94.6512054	39.0219446	337
1021708	Newcastle Farmers Market	\N	82701	-104.184983	43.849469	234
1021735	Pawtuxet Village Farmers Market	60 Rhodes Pl	2905	-71.393666	41.768065	230
1021730	Galena KS Farmer's Market	210 W 7th St	66739	-94.640914	37.074792	426
1019630	Gallatin Farmers Market	160 W Franklin St	37066	-86.448948	36.388902	196
1021306	Jefferson Farmers' Market	925 Chestnut Street	19107	-75.156213	39.94994	27
1020001	Downtown Bloomington Farmers Market- Indoor	101 S. Madison	61701	-88.996165	40.478127	51
1020047	Waynesboro Farmers Market	215 McElroy St.	22980	-78.885734	38.068559	414
1019312	River Valley Farmers' Market	Center Avenue	59034	-107.608015	45.742235	5
1011003	Colwell's Farmers Market	9079 HWY377	76240	-96.9110998	33.5491175	116
1001104	Monday Farmers Market at your library	1515 SW 10th Avenue	66604	-95.69624	39.049968	96
1011901	Montour Falls Farmers Market	300 West Main Street	14865	-76.847748	42.346431	608
1021728	Burrillville Farmers Market	75 Tinkham Lane	2830	-71.677124	41.967496	230
1019678	Litchfield Hills Farm-Fresh Market	West Street and Woodruff Lane	6759	-73.189724	41.743812	589
1019244	Your Neighborhood Farmers Market-Towne Lake at Boardwalk	9945 Barker Cypress Road	77443	-95.6872981	29.9223808	272
1012357	The Indian Shores Sunday Morning Market	19305 Gulf Blvd	33785	-82.842837	27.84788	699
1020107	Hart County Farmers Market	Main Street	42765	-85.889578	37.271492	173
1018486	Milton Farmers' Market	6 Village Center Boulevard	19968	-75.310511	38.769132	43
1019348	New Bedford Farmers Market- Downtown/Custom House Square	466 Brock Ave	2740	-70.937913	41.661303	103
1018407	Main Street Dyersburg Farmers Market	335 Clark Ave. South	38024	-89.389549	36.030081	63
1019213	Town of Wadley Farmers Market	Main Street	36276	-85.573055	33.1234	502
1019049	Fairland Farmers Market	50 N. Pine St.	74343	-94.854471	36.747475	9
1001839	Ocean Beach Certified Farmers Market	4900 Newport Avenue	92107	-117.25016	32.74619	582
1019067	West End Farmers Market	1210 Patterson Ave. SW	24016	-79.958472	37.27783	723
1020095	Garrard County Farmers Market	117 Lexington RD	40444	-84.583209	37.614373	267
1018466	Peacham Farmers Market	555 Bayley Hazen Road	5862	-72.170037	44.327445	260
1018930	Downtown Marquette Farmers Market	112 S. Third St.	49855	-87.395409	46.543488	354
1018093	Merchantville Market Off Centre	N. Centre St. & Chestnut Ave.	8109	-75.0490757	39.9524734	285
1019693	Botetourt Farmer's Market	90 Town Center St	24083	-79.912646	37.417795	448
1012485	Wayne State University Farmers Market	Warren and Woodward Ave	48202	-83.064645	42.356528	379
1005358	Dublin	4201 Central Parkway	94568	-121.878639	37.710402	246
1011119	Main Street Farmers Market	Main Street and Highland Ave	66720	-95.4504829	37.6817937	117
1019949	Fulton Stall Market - Indoor Farmers Market	91 South St.	10038	-74.003474	40.706222	282
1019755	Park View Farmers Market	3400 Georgia Ave NW	20009	-77.023928	38.932172	277
1019304	Lincoln Park Farmers Market	SW Corner Fort Street & Southfield Road	48146	-83.177664	42.249843	379
1005499	Mount Carroll Farmers Market	116 E Market Street	61053	-89.978008	42.101295	115
1019096	Annandale Farmers Market - ACT	25 East Cedar St	55302	-94.1238322	45.2636097	465
1009894	Down to Earth Chelsea Farmers Market	W. 23rd Street off 9th Avenue	10011	-74.000805	40.746359	282
1021310	Chestnut Hill Farmers' Market	7673 Germantown Avenue	19118	-75.196931	40.06776	27
1021694	Tenino Farmers Market	po Box 554	98589	-122.860375	46.853829	605
1021452	Webb City Farmers Market	106 East Tracy Street	64870	-94.462592	37.140206	538
1020000	Downtown Bloomington Farmers Market	200 N. Main	61701	-88.994107	40.480014	51
1005270	Kailua Distirct Park (People's Open Market)	21 South Kainalu Drive	96734	-157.737337	21.395631	580
1019147	Franklin Farmers Market	Parking Lot 2 Blocks West of the Courthouse	46131	-86.05768	39.479799	337
1019022	Market in the Park	W South Park Ave & Georgia St	54901	-88.557509	44.0053166	202
1021612	Humpday Farmers Market	2421 W Main St	62901	-89.247353	37.731906	491
1019530	Countryside Farmers' Market at Highland Square	1175 W Exchange St	44302	-81.553272	41.098698	663
1021741	Charlestown Land Trust Farmers' Market	4150 Old Post Road	2813	-71.621941	41.38411	539
1021453	Fondy Farmers Market	2200 W Fond du Lac Ave	53206	-87.939701	43.061843	620
1005269	Waikele Community Park (People's Open Market)	94-870 Lumiana Street	96767	-157.971725	21.453708	580
1019854	Pennington Farmers Market	101 Route 31 N	8534	-74.79688	40.3494	359
1019605	Get Moving Houston Farmers Market - Magnolia	7037 Capitol St. 77011	77011	-95.300902	29.734482	95
1008173	Surfside Sunset Market	Veteran's Pkwy & Surfside Blvd	33991	-82.024341	26.608161	534
1002366	Yellow Green Farmers Market	1940 North 30th Road	33021	-80.169243	26.03026	704
1018908	Medicine Root/Oyate Teca Farmers Market	1000 Youth Center Drive	57752	-102.176734	43.424109	420
1019189	Market Square Farmers' Market	500 Howard Baker Jr Ave	37915	-83.910506	35.965659	58
1000436	Bastrop 1832 Farmers Market	1302 Chestnut Street	78602	-97.311627	30.111777	408
1021685	One African! One Nation! Farmers Market	4031 W. Florissant Ave.	63107	-90.218914	38.674084	618
1019132	Greene Farmers Market	42 Carmen Place	22968	-78.384143	38.233858	397
1010638	Pinecrest Farmers Market	11000 S. Red Road	33156	-80.285895	25.669124	604
1018552	Waterfront Farmers Market of Gig Harbor	3211 Harborview Drive	98335	-122.581273	47.330952	666
1008366	Hopkinton Farmers Market	Main Street and Ash Street	1748	-71.51777	42.229299	466
1019803	Soutel Community Market	4750 Soutel Dr	32208	-81.72001	30.40374	147
1021204	The Albemarle Farmers Market	Towncenter lane	22911	-78.445556	38.126837	454
1010483	Lenoir County Farmers Market	100N. Herritage Street	2804	-77.584119	35.260631	114
1006780	Northeast Minneapolis Farmers Market	University Avenue NE and 7th Avenue NE	55413	-93.262339	44.995288	152
1005256	Makiki District Park (People's Open Market)	1527 Keeaumoku Street	96822	-157.836497	21.303939	580
1021331	Crawfordsville Winter Market	400 Parke Avenue	47933	-86.896007	40.04604	353
1004377	Fish Creek Settlement Shops Farm Market	9116 Hwy 42	54212	-87.24535	45.113436	106
1019327	Ypsilanti Farmers Market- Downtown	16 S Washington	48197	-83.614751	42.240285	257
1021284	Gilmanton Community Farmers Market Association	1385 NH Route 140	3237	-71.332318	43.425347	686
1021355	Herriman Farmers Market	5355 W. Herriman Main St.	84096	-112.015037	40.515537	296
1012076	Hood River Farmers Market	5th Street & Columbia Street	\N	-121.515814	45.710094	274
1019257	Broadway Farmers Market	161 S Main St	22815	-78.799904	38.611375	185
1019003	Keller Farmers Market	400 Bear Creek Parkway	76248	-97.243807	32.926757	346
1021308	Gorgas Park Farmers' Market	6300 Ridge Avenue	19128	-75.221221	40.037308	27
1011596	Putnam Farmers Market	1 Valley Way	25526	-81.99554	38.441892	172
1019808	Lewiston Farmers Market	65 Main St.	4240	-70.220379	44.096575	430
1019847	Adams-Ricci Farmers Market	100 East Penn Drive	17025	-76.937407	40.273997	407
1021369	Kenosha Public Market	Outdoor Summer Market 625 52nd Street- Indoor Winter Market 625 57th Street	53140	-87.819902	42.587189	476
1012093	Carver Farmers Market	108 Main St.	2330	-70.769182	41.888852	102
1021490	Tosa Farmers Market	7720 Harwood Ave	53213	-88.008791	43.048733	620
1011689	Charlotte Regional Farmers Market	1801 Yorkmont Road	28217	\N	\N	676
1021496	WIC Clinic Salinas Farmers' Market	630 S General McMullen	78237	-98.525142	29.472403	315
1019353	Ocala Downtown Market	corner of SE 3rd Street and SE 3rd Avenue	34471	-82.320981	29.19393	494
1006342	Vincennes Historic Farmers Market	102 N. Second St.	47591	-87.531359	38.68061	58
1021401	Downtown Conway Farmers' & Crafts Market	718 Parkway	72032	-92.440867	35.088507	25
1020159	SoKY Marketplace Farmer's Market	636 Center Street	42102	-86.438462	36.970919	650
1019939	Paseo Farmers Market	3100 N Walker Ave	73103	-97.52482	35.501891	522
1019885	Plainview Farmers Market	\N	\N	-97.787145	42.353346	666
1009802	Tigard Farmers Market	Burnham Street at Main Street	\N	-122.772142	45.429956	539
1019545	Summit Lake Neighborhood Farmers' Market	380 W. Crosier St.	44311	-81.542318	41.058965	663
1021275	Eagle Springs Farmers Market	13555 Valley Lodge Parkway	77346	-95.194557	29.975941	272
1021346	Culver City Farmers Market	Main Street in Culver City	90232	-118.39464	34.024936	490
1016810	Lebanon City Market	309 S Lebanon St.	46052	-86.469047	40.0456714	65
1005633	Miles City Farmers Market	500 Main St  Riverside Park	\N	-105.840096	46.408215	480
1018504	Voluntown Farmers' Market	195 Main Street	6384	-71.865502	41.573913	204
1019364	Western Greenbrier Farmers Market	Main and 11th st	25962	-80.760056	37.972743	225
1019176	LVHMC Loudoun Station Farmers Market	Gramercy Park Drive and Central Station Drive	20147	-77.489597	39.006277	215
1019989	Grass Roots Farmers Market	W.145th. Street between Edgecombe & Bradhurst Aves.	10031	-73.943475	40.823804	282
1004574	Wahoo Farmers Market	Corner of 7th and Beech	68066	-96.617391	41.212079	293
1019350	Antioch's Farmers Market	900 Skidmore Drive	60002	-88.09457	42.478128	431
1018152	Huguenot-Robious Farmers Market	2051 Huguenot Road	23236	-77.610398	37.519516	155
1019734	SaintParis FarmersMarket	135 W. Main St	43072	-83.959772	40.127699	56
1019944	Downtown Chico Thursday Night Market	\N	95928	-121.840469	39.728991	447
1001766	Red Oak Farmers Market	307 East Reed Street	51566	-95.228044	41.009641	353
1019239	Mineola Main Street Farmers Market	115 E. Front St.	75773	-95.489641	32.662165	394
1021329	Aurora Farmers Market	170 Main Street	13026	-76.699995	42.744684	179
1002407	Brattleboro Area Farmers' Market	570 Western Ave.	5301	-72.58407	42.8499	57
1003081	Nash County Farmers Market in Rocky Mount	1006 Peachtree St.	27804	-77.802729	35.955256	198
1019649	Lachat Farmers Market	106 Godfrey Road West	6883	-73.385668	41.235769	224
1012249	Madison Farmers Market	Highway 40 E. and 1st St.	56256	-96.1754168	45.0087575	255
1019439	Dolores County Farmers Market	390 Main Street	81324	-108.903587	37.764836	157
1019667	Downtown Alachua Farmer's Market	14801 Main Street	32615	-82.495552	29.790872	705
1021470	Lexington Farmers' Market	Worthen Road Practice Field	2421	-71.235394	42.444009	466
1019970	Decatur Farmers Market	308 Clairemont Ave	30030	-84.296808	33.778773	311
1020097	Beaver Dam Farmer's Market	Hwy 231 South	42320	-86.877647	37.407199	376
1001641	Ithaca Farmers Market	Center & Pine River Street	48847	-84.598559	43.292319	634
1020131	Old L.A. Certified Farmers Market	N Figueroa & Ave. 58	90042	-118.191934	34.110171	490
1018221	Cotton Mill Farmers Market	609 Dixie Street	30117	-85.07274	33.571347	115
1019586	Hutto Farmers Market	208 East Street	78634	-97.548336	30.545152	71
1019080	Vermont Farmers Market	251 West Street	5701	-72.985592	43.607916	700
1019647	Anderson County Farmers Market	402 N. Murray Ave	29621	-82.652197	34.506898	284
1018728	Northridge Farmers Market and family festival	9301 tampa ave	91324	-118.5562362	34.2385732	490
1005941	CitySeed Fair Haven Farmers Market	Corner of Front St. and Grand Ave.	6513	-72.888848	41.308956	591
1019261	Crescent City Farmers Market	1235 N. Peters	70116	-90.058904	29.960279	506
1009020	Rensselaer Farmers Market	110 W Harrison St.	47978	-87.1501069	40.9356403	538
1021680	Fort Smith Farmer's Market	2nd and Gartison Ave	72901	-94.80361	35.534732	174
1019027	Port Chester Farmers Market	Highland St	10573	-73.661339	41.00211	156
1012766	Stafford Community Farmers' Market	31 Main Street	6076	-72.304724	41.953553	470
1010316	Mulberry Market	1155 College Street	31201	-83.646551	32.833797	433
1019481	Sustain Greenville Farmers Market	N1915 Julius Dr	54942	-88.557375	44.311141	202
1011538	Mableton Farmers Market	5239 Floyd Road	30126	-84.575384	33.826085	10
1002905	Menlo Park Farmers' Market	Chestnut & Menlo Avenues	94025	-122.1841	37.450822	416
1004717	Mount Pleasant Farmers Market	645 Coleman Boulevard	29464	-79.8734	32.790718	175
1019285	Ft. Wayne's Farmers Market-Winter Market	216 W Douglas Ave	46802	-85.140411	41.074494	423
1000559	Aurora Local Farmer's Market - Summer Market	2031 S. Elliott Ave.	65605	-93.7201867	36.948908	150
1002929	Marshfield Farmer's Market	140 Main St  (Route 3A)	2050	-70.717317	42.098148	102
1021653	Circle Square Commons Farmers Market	8445 SW 80th Street	34481	-82.257895	29.106489	494
1020011	Kensington Farmers Market	Kensington train station parking lot	20895	-77.073728	39.026476	353
1019697	The Fresh MARTA Market - Bankhead Rail Station   Wednesdays  3:00-7:00p.m.	1335 Donald Lee Hollowell Parkway	\N	-84.426967	33.773326	639
1010969	Down to Earth McGolrick Park Farmers Market	At the center of the park	11222	-73.943291	40.724358	31
1019203	AG Farmers' Market	108 Indian Head Road	8753	-74.207478	39.992509	134
1019852	Lancaster Farmers Market	West Chestnut Street	43130	-82.603853	39.712631	224
1019871	Bassett Farmers Market	200 Clark St.	68714	-99.536625	42.582541	389
1020138	Woodford County Farmers Market	N. Gratz St.	40347	-84.682308	38.149925	363
1005201	Madison NJ Farmers Market	Central Avenue between Cook Avenue and Main Street	7940	-74.414532	40.759057	153
1019081	Fair Haven Market (hosted by The Vermont Farmers Market	On The Green	5777	-73.266531	43.59449	700
1012634	Eldora Farmers Market	Corner of Edgington Ave. and 14th Street	50627	-93.100656	42.36051	288
1019930	Ridgeway Farmers Market	299 Hughitt Street	53582	-89.993242	42.998521	440
1019487	McCutcheon/Mount Vernon	2501 Sherwood Hall Lane	22306	-77.082026	38.818343	696
1019319	Shoreline Farmers Market	15415 Westminster Way	98133	-122.349452	47.741553	345
1010614	NORFOLK FARMERS’ MARKET	19 Maple Avenue	6058	-73.197873	41.990739	589
1019698	The Fresh MARTA Market - H.E. Holmes Rail Station   Wednesdays  3:00-7:00p.m.	70 Hamilton E. Holmes	30311	-84.476405	33.764764	639
1018261	Caledonia Farmers Market Association - Danville	\N	5828	-72.140337	44.411036	260
1019449	Winter Makers Market	420 W. 1st St.	82601	-106.329524	42.850412	478
1019212	Kirtland Growers Market	47 Road 6500	87417	-108.3605187	36.7507894	588
1019962	Hillsboro Farmers' Markets - Orenco Station	6125 NE Cornell Rd	97124	-122.917552	45.534675	539
1021720	Williamsburg Farmers Market	345 W. Duke of Gloucester Street	23185	-76.705462	37.270966	276
1021579	Rail Yards Market	777 1st street SW	87102	-106.649029	35.075615	136
1019926	Sodus Farmers' Market	58 West Main Street	14551	-77.062753	43.237102	379
1004360	Church Street Farmers' Market	603 Church Street	23824	-78.008079	37.077437	708
1021710	Eat Drink RI Market at Blackbird Farm	660 Douglas Pike	2917	-71.505011	41.901787	230
1018196	Columbia Farmers Fresh Market	5th Street & Riverside Drive	38401	-87.0304808	35.6187845	166
1019592	Como Farmer's Market	Main Street	38619	-89.939947	34.513561	720
1012626	iowa falls farmers' market	Corner of Rocksylvania Ave. anb Stevens St.	50126	-93.264356	42.521222	288
1018853	Holly Springs Farmers Market	300 West Ballentine Street	27540	-78.83619	35.650573	633
1010394	Wabasha Downtown Farmers Market	Main Street West & Allegheny Avenue next to Hill’s Hardware	55981	-92.032633	44.384124	139
1019807	Prairie Township Farmer's Market	5955 W. Broad Street	43119	-83.009303	39.9695356	623
1021573	South Lake Tahoe Certified Farmers Market	2748 Young Street	96150	-119.982044	38.927079	445
1006376	Jackalope Square Farmers Market	130 S. 3rd	82633	-105.384457	42.759014	48
1019341	Downtown Lawrenceburg Farmer's Market	US 50 and Park Streets	47025	-84.857359	39.095734	614
1021305	University Square Farmers' Market	3600 Walnut Street	19104	-75.194883	39.953276	27
1021388	Farmers Market at the Fairgrounds	620 N Apple Street	46140	-85.75624	39.791832	113
1012204	Westbrook Village Second Sundays Marketplace	19251 N Westbrook Parkway	85382	-112.265596	33.658197	418
1018478	Portland Farmers Market - Lents International	SE 92nd and Reedway	97266	-122.5685894	45.4813183	724
1019765	Bexley Farmers Market	E Main St and S Dawson Ave	43209	-82.935745	39.957135	623
1020172	East Palo Alto Community Farmers Market	2555 Pulgas Avenue	94303	-122.13255	37.469415	416
1000585	Mountain Fresh Oakland Farmers Market	5 Town Park Lane	21550	-79.409554	39.408747	392
1019211	Salem NH Farmers Market - Winter	14 Main Street	3079	-71.2372585	42.781773	185
1021654	Franklin Park Conservatory and Botanical Gardens Farmers' Market	1777 East Broad Street	43203	-82.950712	39.965067	623
1019225	Challis Community Farmers Market	Challis City Park	83226	-114.227231	44.505154	480
1011286	Rogers Farmers Market	12724 Main Street	55374	-93.551965	45.186933	152
1019360	MADWest Winter Farmers' Market	55 South Gammon Road	53717	-89.502026	43.066326	326
1020071	Carter County Farmers’ Market - Grayson	94 FAIRGROUND DR	41143	-82.904359	38.331557	351
1019068	Payette Farmers Market	Kiwanis Park	83661	-116.935907	44.069117	11
1019756	Lansdale Farmers' Market	400 Penn Street	19446	-75.277496	40.234201	353
1019385	South Cumberland Farmers Market	39 Ballpark Road	37375	-85.917223	35.193923	623
1005267	Ewa Beach Community Park (People's Open Market)	91-955 North Road	96706	-158.007174	21.314954	580
1018998	Manistique Farmers' Market	180 N. Maple Street	49854	-86.243595	45.959984	24
1019070	Roanoke Farmer's Market	Main Street	46783	-85.373322	40.961979	651
1019457	Fallbrook Farmers' Market	600 Fallbrook Blvd	68522	-96.728376	40.877605	151
1011782	Hartford Farmers Market	1001 N Oaks Ave	57033	-96.947438	43.632679	516
1019372	Bluffton Farmers Market	102 S Main St	45817	-83.892721	40.893082	423
1021497	WIC Clinic Naco-Perrin Farmers' Market	4020 Naco Perrin	78217	-98.525142	29.472403	315
1021521	Bamberg Farmers Market	12205 Heritage Hwy	29003	-81.031222	33.300136	54
1021618	QC Farmers' Market	1700 1st ave	61201	-90.576384	41.51278	410
1021642	Nederland Farmers Market	80 E. Second St.	80466	-105.508922	39.962418	262
1012260	High Springs Farmers Market	115 NE Railroad Avenue	32643	-82.596257	29.825509	705
1018702	Needham Farmers Market	Garrity Way	2492	-71.236446	42.280988	377
1019428	Salomon Farm Park Farmers' Market	817 West Dupont Road	46825	-85.152678	41.175641	423
1018901	Local APX Market - Seasonal	1848 Church Street	24522	-78.826847	37.353215	680
1018211	Stanly Commons Farmers Market	1000 N. First St.	28001	-80.197218	35.366184	547
1019717	City Market	1150 South Gay Street	36830	-85.475592	32.584813	534
1012027	Little River Farmers Market	4461 Mineola Ave	29566	-78.640489	33.880648	597
1021268	Huntley Farmers Market	11712 Coral Street	60142	-88.424435	42.168577	14
1021578	Albany Square Farmers Market	\N	64402	-94.333605	40.247729	55
1012738	New Bedford Farmers Market- Clasky Common Park	1119 Pleasant St.	2740	-70.928587	41.644314	103
1018476	Taos Farmers' Market	400 Camina de la Placita	87571	-105.574539	36.407207	347
1021538	Farmers Market Ogden	Historic 25th Street and Grant Avenue	84401	-111.973274	41.220677	549
1018671	FRESHFARM Dupont Market	1624 20th St NW	20009	-77.044967	38.911806	277
1002764	Northport Farmers Market	105 S. Bay Street	49670	-85.614175	45.129668	472
1018422	The Market at Town Square	492 Hill St.	54941	-88.960382	43.845375	565
1018092	BMI Farmers' Market	1415 Key Highway	21230	-76.601326	39.273864	148
1020093	Red Bird Farmers Market	70 Queendale Center	40913	-83.526289	37.009793	550
1019098	Wolfforth Farmers Market	8924 CR 7100	79382	-102.0163305	33.5197029	471
1021250	L. A Mercado Agricola	\N	979	-66.011273	18.431395	489
1019710	Glens Falls Farmers Market Association	10 Sanford St	12801	-73.653504	43.317546	650
1020197	Walnut Creek Certified Farmers' Market	1799 Locust Street	94596	-122.040479	37.902666	208
1018875	North End Farmers Market	417 Blust Ave.	44903	-82.524714	40.770362	578
1019908	Neutaconkanut Farmers Market	675 Plainfield St	2909	-71.461775	41.8118	230
1021711	Hope Street Farmers Market	1015 Hope St	2906	-71.356584	41.799956	230
1020127	Chico Certified Farmers Market - Paradise Tuesday	6491 Clark Road	95969	-121.595446	39.77368	447
1019862	Farmers on the Square	2A N Hanover St	17013	-77.189254	40.201689	407
1006681	MILFORD - DOWNTOWN FARMERS’ MARKET	108 West Main Street (Wasson Field)	6460	-73.062096	41.226598	591
1019480	Moreland Farmers Market	1400 SE Bybee Blvd	97202	-122.651387	45.47394	724
1021627	Astoria Sunday Market	12th and Commercial St.	97103	-123.83015	46.188719	79
1021237	Church St Farmers Market	6730 Church St	30134	-84.750061	33.749649	607
1019510	East Orange Farmer's Market	44 City Hall Plaza	7018	-74.209979	40.76125	677
1020132	Lincoln Heights Certified Farmers Market	N. Broadway & Sichel	90031	-118.213102	34.073591	490
1021617	Pullman Farmers Market	150 E Spring St	99163	-117.174043	46.729751	714
1021327	Highlands Ranch Farmers Market	Highlands Ranch Pkwy and Dorchester Rd	80129	-104.999685	39.547023	607
1019409	Lafayette County Farmers Market	224 E. First Street	71845	-93.577673	33.355445	119
1012243	Downtown Fond du Lac Farmers Market - Saturday	Main Street from Western Ave. to Sheboygan St.	54935	-88.446973	43.775364	684
1008946	Pacific City Farmers Market	6200 Camp St	97135	-123.960749	45.205076	458
1021601	New Era Farmers Market	1820 Ray Avenue	49446	-86.347156	43.559633	596
1020156	Whitley County Farmers Market (WCFM)	Billwoods Park	40769	-84.159267	36.741975	541
1019076	Baldwin's Main St. Farmers Market	Main St. and 6th Ave.	54002	-92.370763	44.966999	226
1021408	Dallas County Farmer's Market	206 West 3rd St.	71742	-92.41424	33.812858	695
1002816	Westminster Farmers' Market	21-33 Academy St. (Town Common)	1473	-71.906161	42.541635	367
1021582	Barm Bargains Market	3782 Winding Creek Ln	95633	-120.878152	38.840227	445
1019061	Claremont Farmers' Market	14 North Street	3743	-72.339305	43.375823	266
1021254	The Corner Farmers Market	2200 Walker Avenue	27403	-79.828293	36.069019	44
1005280	Westside Santa Cruz Farmers' Market	Corner of Western Drive and Mission St.	95060	-122.057	36.9598	184
1021238	Buy Local Farmers Market - Fall Creek	7930 Fall Creek Bend	77396	-95.269976	29.93294	272
1019427	Lakewood NY Farmers' and Artisans' Market	Chautauqua Ave	14750	-79.326095	42.103565	719
1021279	North Albany Farmer's Market	6980 nw hwy 20	97321	-123.178829	44.63664	170
1021509	Historic Lewes Farmers Market	\N	\N	\N	\N	0
1004751	Redlands Saturday Morning Certified Farmers Market	100 E. Redlands Boulevard	92373	-117.180913	34.05708	207
1012041	Hopkins Farmers Winter Market	33 14th Avenue North	55343	-93.417104	44.925619	152
1019739	The Orchard Farmers Market	14697 Delaware St	80023	-104.992071	39.961115	562
1019810	Canal Market District	36 East Canal Street	43055	-82.401032	40.056586	393
1021648	Palmas Farmers Market	170 Canderlero Dr	791	-65.797119	18.088831	74
1020035	Milk Lady Derwood Farmers Market	16501 Redland Road	20855	-77.150144	39.126885	353
1006093	Webster Springs Farmer's Market	Baker's Island	26288	-80.415459	38.47842	355
1021584	Hamilton Park Farmers Market	Hamilton Park	7302	-74.044847	40.72781	452
1021455	Pleasantville Farmers Market - Outdoor	Memorial Plaza (next to the train station)	10570	-73.793652	41.135051	156
1021442	Adams County Farmer's Market	110 W. Main St.	45693	-83.546357	38.795296	562
1019065	Hancock County Farmers' Market	200 West Main Cross	45840	-83.653004	41.039589	113
1018907	Jackson (MO) Farmers Market	252 E. Jackson Blvd.	63755	-89.6659726	37.3778137	245
1002485	Salmon Creek Farmers' Market at Legacy Hospital	2211 NE 139th Street	98686	-122.648554	45.720387	427
1019764	Upper Arlington Farmers Market	2850 Tremont Rd	43221	-83.066903	40.013849	623
1019490	McLean	1659 Chain Bridge Rd	22101	-77.192913	38.943545	696
1021396	Conway Farmers' Market	150 Amity Rd.	72032	-92.41257	35.077695	25
1019023	Oshkosh Farmers Market - Downtown	400 & 500 Blocks N Main St & 100 Block Church Ave	54901	-88.537461	44.022875	202
1021314	Media Farmers' Market	Edgemont Street	19063	-75.385551	39.917838	88
1019246	Your Neighborhood Farmers Market-Park Lakes	4503 Canyon Village  Trace Dr.	77396	-95.2539369	29.9415214	272
1004255	City of Loveland Farmers Market	700 S. Railroad	80537	-105.078652	40.387479	412
1019237	Sealy Farmers Market	410 Main Street	77474	-96.159309	29.78029	240
1018756	Brigham City Farmers Market	20 N Main Street	84302	-112.015057	41.510773	619
1005265	Halawa District Park (People's Open Market)	99-795 Iwaiwa Street	96701	-157.914948	21.373292	580
1021638	Forest Grove Farmers Market	2030 Main St	97116	-123.112048	45.520653	539
1012505	Darlington Farmers Market	Main Street	53530	-90.117445	42.677666	119
1011829	Bloomfield Saturday Market	5050 Liberty Ave	15224	-79.944435	40.459005	36
1019905	Broad St. Farmers Market	807 Broad St.	2907	-71.41892	41.801869	230
1012030	Conway Farmers Market	1029 2nd Ave	29526	-79.044831	33.833331	597
1021632	New Harmony Farmers & Artisans Market	407 West Tavern St.	47631	-87.936384	38.12899	123
1019883	Norfolk Farmers Market	\N	\N	-97.212686	41.948007	460
1012116	Suffolk Farmers' Market	524 N. Main Street	23434	-76.581989	36.737572	314
1019499	Farm to Preschool Market: Mercy Cares for Kids	310 S. Manning Blvd	12206	-73.798353	42.665745	254
1021748	Kayleen Weister	5000 W National Ave	\N	-87.976663	43.020291	620
1021215	Overbrook Farmers Market	Maple & Market St	66524	-95.556782	38.777419	128
1018482	Portland Farmers Market - Portland State University	SW Park and Montgomery	97201	-122.684833	45.512348	724
1019784	Spotsylvania Farmers Market - Spotsylvania Regional Medical Center	4600 Spotsylvania Parkway	22407	-77.495899	38.219747	401
1019679	Litchfield Hills Farm-Fresh Market	421 Bantam Rad	6759	-73.215193	41.740678	589
1021377	Monticello Market on the Square	119 W. Washington St.	31064	-83.683495	33.304642	538
1018313	Boise Farmers Market	10TH & GROVE  - SUMMER MARKET	83702	-116.444084	43.532957	356
1011325	Hyattsville Farmers Market	4310 Gallatin Street	20781	-76.941854	38.952822	21
1016799	Maple Valley Farmers' Market	25719 Maple Valley Black Diamond Road	98038	-122.023367	47.367729	345
1020146	Old Oakland Farmers' Market	492 9th street	94609	-122.274596	37.801382	246
1012254	Dawson Farmers Market	Ash  and 8th street	56232	-96.0574386	44.9259444	255
1019761	Park View Farmers Market	3400 Georgia Ave NW	20010	-77.02396	38.932155	277
1018597	Vermillion Area Farmers Market Summer Saturday Markets	Main and Market Streets	57069	-96.93415	42.779219	550
1018380	Harker Heights Farmers Market	850 West Central Texas Expressway	76548	-97.681611	31.073245	91
1019738	Hampden Farmers Market	106 Western Ave.	4444	-68.847236	44.74558	90
1021242	CAVE SPRING FARMERS MARKET	6770 Cave Spring Rd SW	30124	-85.30991	34.132871	77
1019498	Urbana Library Farmers' Market	9020 Amelung Street	21704	-77.35447	39.331636	295
1010758	Columbia Farmory and Mountain People Organics	10800 Airport Road	95310	-120.410011	38.029395	163
1019728	Garfield Park Farmers Market	2345 Pagoda Dr	46225	-86.14183	39.731109	494
1004382	Cottin's Hardware Farmers Market	1832 Massachusetts Street	66044	-95.235146	38.950747	607
1021667	Olde Pickerington Farmers' Market	89 N Center St	43147	-82.754075	39.886046	224
1003046	Dousman Farmers Market	118 S. Main St	53118	-88.4725142	43.013121	161
1021341	Market on the Green	105 Norton Park Drive	43213	-82.875408	39.97423	623
1002803	Forest Lakes Farmers Market	1650 Ashwood Blvd.	22911	-78.44106	38.1087	454
1021392	Grand Prairie Farmers Market	505 S. Main St.	72160	-91.55237	34.49802	366
1019684	Enka-Candler Tailgate Market	70 Pisgah Hwy	28715	-82.684674	35.54099	444
1012552	Cowtown Farmers Market	3821 SOUTHWEST BLVD	\N	-97.442048	32.716447	346
1011934	Somerville Mobile Farmers' Market - Mystic	530 Mystic Avenue	2145	-71.091856	42.396251	466
1019800	Fayette County Farmers' Market	401 N Central Ave	47331	-85.139738	39.641132	691
1003238	Marietta Square Farmers Market	65 Church St	30060	-84.549494	33.953194	10
1021199	City Heights Certified Farmers Market	4325 Wightman St.	92104	-117.101527	32.747817	582
1019620	Russellville Community Market	320 West C St.	72801	-93.135468	35.280402	68
1018922	Lowville Farm and Craft Market	5473 Bostwick Street	13367	-75.491021	43.793854	581
1021403	Bentonville Farmers Market	100 N. Main Street	72712	-94.208458	36.372637	170
1019959	Hillsboro Farmers' Markets - Downtown Hillsboro	1st Ave and NW Lincoln St	97124	-122.990366	45.524375	539
1021705	Hope & Main's Schoolyard Market	691 Main Street	2885	-71.28193	41.725289	103
1019915	South Kingstown Farmers Market  at Marina Park	2 Salt Pond Rd	2879	-71.49696	41.428192	539
1005261	Royal Kunia Park-n-Ride (People's Open Market)	Kupuna Lp/Kupuohi Street	96797	-158.032652	21.38912	580
1021252	Morgan County Winter Farmers' Market Association	240 E Washington St.	46151	-86.420904	39.422141	645
1021501	Pretzel Park Farmers Market	4300 Silverwood Street	19127	-75.220985	40.025446	27
1021546	Salinas City Center Certified Organic Farmer's Market	Gabilan Street	93901	-121.65603	36.675383	264
1021300	East Vancouver Farmers Market	17701 SE Mill Plain Blvd.	98683	-122.493777	45.615372	427
1019433	Winchester Farmers Market	Larawy Rd	1890	-71.137946	42.452024	466
1020022	SOCO Farmers' Market	3315 Hyland	92626	-117.927099	33.694867	165
1021707	Scituate Rotary Farmers Market	46 Institute Lane	2857	-71.579083	41.848902	230
1019435	Lynden Farmers Market	4th and Grover Street at Centennial Park	98264	-122.452228	48.944087	109
1020072	Pendleton County Farmers’ Market	68 Fairgrounds Road	41040	-84.332926	38.671615	383
1021700	Seward Farmer's Market	529 Seward St	68434	-97.098509	40.907721	610
1018969	Coastal Growers Farmers Market	650 Ten Rod Rd.	2852	-71.485463	41.572691	539
1021394	Springdale Farmers’ Market	992 E. Emma Ave.	72764	-94.11845	36.18745	539
1005674	Hudson Farmers Market	Corner of Columbia and Sixth Streets	12534	-73.783692	42.248656	391
1005260	Queen Kapiolani Park (People's Open Market)	Monsarrat and Paki Streets	96822	-157.81638	21.268812	580
1019302	Holly Farmers Market	Crapo Park	48442	-83.625343	42.7906	270
1019881	Chatter Box Farmers Market in Tekamah	\N	\N	-96.222387	41.775832	679
1001059	North Myrtle Beach Farmers Market	925 First Avenue South	29582	-78.683173	33.827655	597
1000958	Forest farmers market	15583 Forest Road	24551	-79.285443	37.36437	386
1019019	Oshkosh Farmers Market - Downtown	400-500 Blocks N Main St	54901	-88.537573	44.021478	202
1020118	Campbell County Farmers Market Association	3504 Alexandria Pike	41075	-84.451866	39.028829	647
1010889	Falls Park Farmers Market	E Falls Park Drive and N 2nd Ave	57101	-96.723203	43.560777	516
1019102	Palo Alto College Farmers Market	1400 W Villaret Blvd	78224	-98.543052	29.321634	315
1019141	City Center Farmers Market	200 Sanborn Street	29501	-79.773582	34.198789	400
1010598	Huntingdon Farmers' Market	842 Penn Street	16652	-78.01723	40.485653	129
1021386	Woodstock Farmers Market-Saturday Summer	112 S. Benton St.	60098	-88.435654	42.310266	14
1021683	Lanark Farmers Market	101 N Broad St	61046	-89.832636	42.102271	115
1004297	MONTEVALLO FARMERS MARKET	Middle Street and Island Street	35115	-86.862926	33.09948	660
1018304	Alamo Heights Farmers Market	255 E Basse	78209	-98.481174	29.493258	315
1005086	Athens Farmers Market	1002 East State Street	45701	-82.056622	39.336038	535
1000709	26th Annual Highlands Business Partnership's Farmers Market	71 Waterwitch Avenue	7732	-73.994358	40.404837	310
1019491	Kingstowne	5870 Kingstowne Towne Center	22315	-77.276198	38.8347926	696
1008140	Bellingham Farmers Market	1207 10th Street	98226	-122.469657	48.75262	109
1002907	Joshua Tree Certified Farmers Market	61651 Twentynine Palms Highway	92252	-116.3182535	34.1349431	207
1019124	Waynesburg Farmers' Market	High Street	15370	-80.186112	39.896462	639
1008276	Catawba County Public Health Farmers Market	3070 11th Ave Dr. SE	28602	-81.269507	35.712066	37
1019874	Beatrice Farmers Market Indian Creek Mall	Indian Creek Mall 2205 N 6th St	68310	-96.747301	40.273594	331
1019700	The Fresh MARTA Market - College Park Rail Station   Thursdays  3:00-7:00p.m.	3800 Main Street	30337	-84.46008	33.638149	639
1021503	Russiaville Farmers Market	250 N Union St	46979	-86.270804	40.419151	84
1019963	Torrington WY Farmers Market	21st & Main Street	82240	-104.184071	42.064541	297
1010937	Historic Farmers Market of Lapeer LLC	272 N. Court St.	48446	-83.309076	43.053482	97
1000616	Market in The Park - Lavretta Park	200 Parkway Street West	36606	-88.160082	30.691614	421
1019973	Rosa Parks Farmers Market	2020 Beatties Ford Road	28216	-80.854493	35.262802	676
1021226	Central Avenue Farmers' Market	4301 S Central Ave	90011	-118.256796	34.005326	490
1002674	Camellia City Farmers Market	333 Erlanger Ave. (corner of 3rd. St.)	70458	-89.780754	30.275994	268
1021716	Downtown Phoenix Farmers Market	721 N Central Ave	85004	-112.073418	33.455875	418
1021485	Ponce City Farmers Market on the BeltLine	675 Ponce de Leon Ave	30315	-84.364611	33.772425	639
1018816	Dodge County Farmer's Market	5401 Courthouse Circle	31023	-83.176305	32.20079	4
1018193	Fifth Street Farmers' Market	West Fifth Street	44882	-83.1700053	40.9509375	307
1018920	Orange Park Farmer's & Arts Market	2042 Park Ave	32073	-81.701664	30.165484	550
1019515	Scottsville Midweek Farmers' Market	61 Main St.	14546	-77.753379	43.022276	572
1019980	Caledonia Outdoor Market	3920 N Greenbay Rd	53404	-87.822883	42.769605	644
1018535	Vance County Regional Farmers Market	210 Southpark Dr.	27536	-78.4244013	36.3378971	488
1020054	NOVA Central Farm Market	543 Beulah Road	22180	-77.264712	38.915538	696
1011310	Randolph County Farmers Market	2959 County Road 333	36278	-85.451892	33.255362	502
1019375	Harvest Home Coney Island Hospital Market	Ocean Pkwy btwn Shore Pkwy & Avenue Z	\N	-73.966129	40.58551	31
1019603	Get Moving Houston Farmers Market - Denver Harbor	6402 Market St.	77020	-95.386342	29.780472	95
1021272	Richmond Winter Farmers Market - Winter Season (November - April)	204 S Second St	47374	-84.900398	39.825813	379
1010195	Evart Farmers Market	200 South Main Street	49631	-85.259592	43.899648	323
1004070	Alamosa Farmers Market	Corner of 6th Street and State Avenue's Parking Lot	81101	-105.865006	37.467321	242
1021558	Scituate Farmers Market	600 Chief Justice Cushing Hwy	2066	-70.769256	42.19847	102
1019105	Uptown Market	220 Maxwell Avenue	29646	-82.1638058	34.1903885	467
1009757	Downtown Madison Farmers Market	2103 Main Street / Historic Red Caboose Site	39110	-90.114634	32.460885	460
1000462	Loveland Farmers Market	205 Broadway Street	45140	-84.259924	39.266388	584
1018219	Wapello County Farmers Market	\N	52501	-92.425855	41.017422	434
1021313	Swarthmore Farmers Market	121 Park Avenue	19081	-75.348771	39.901671	88
1019952	Vernon Hills Park District Farmers Market	Lakeview Parkway and Hawthorn Parkway	60061	-87.962265	42.241619	431
1019600	Freiheit Village Farmers Market	2032 Central Plaza	78130	-98.072988	29.717952	517
1011117	Kittery Community Market	10 Shapleigh Road	3904	-70.736542	43.090021	435
1018550	North Market Farmers' Market	59 Spruce Street	43215	-83.0043304	39.9718961	623
1019529	Countryside Farmers' Market at Howe Meadow	4040 Riverview Rd.	44264	-81.583614	41.189312	663
1019414	Glenwood Sunday Market	\N	60626	-87.681844	41.837551	577
1021291	Larimer County Farmers' Market	200 W. Oak St.	80521	-105.080197	40.586073	412
1003516	Andersonville Farmers Market	1500 W. Catalpa Ave.	60640	-87.668602	41.981745	577
1021382	Grinnell Farmers Market	833 4th Ave	50112	-92.724057	41.743189	574
1019870	Eagle Farmers Market	5th St. and Hwy 34	68347	-96.432729	40.816121	146
1019038	Woodstock Farm Festival	6 Maple Lane	12498	-74.117834	42.040522	424
1021364	Goddard Memorial State Park Farmers Market	1095 Ives Rd	2818	-71.444335	41.649602	190
1021677	Gateway Farmers Market	602 East Jefferson Ave	71854	-94.029739	33.430713	259
1021572	Placerville Certified Farmers Market	337 Placerville Drive	95667	-120.821856	38.731615	445
1021549	Newburgh Farmers' Market	97 Broadway	12550	-74.011014	41.49981	165
1019640	Northampton Pa Farmers Market	1401 Laubach Avenue Municipal Park	18067	-75.489035	40.684278	598
1021197	Main Street DeFuniak Farmer's Market	Baldwin Avenue between 7th and 8th St.	32435	-86.1137	30.720266	540
1021743	Kenosha Public Market - Summer Outdoor	625 52nd Street	53140	-87.820653	42.587252	476
1019507	Montrose Farmers Market - Summer	S. Uncompahgre and S. 1st Street	81401	-107.874269	38.479423	280
1019606	Get Moving Houston Farmers Market - Northeast	9720 Spaulding St. 77016	77016	-95.304197	29.851549	95
1019737	Neosho Farmers Market	Spring & Jefferson St	64850	-94.370028	36.870009	210
1021536	Grove Farm Market	4411 Kikowaena St	96766	-159.395575	21.965378	475
1019938	3rd Day Farmer's Market	3234 S. LaChance Rd	49651	-85.296147	44.292952	292
1006425	Hanalei Farmers' Market at Hale Halawai 'Ohana O Hanalei	55299C Kuhio Hwy	96714	-159.499208	22.201731	475
1018952	Spanish Peaks Farm Stand	23500 US Hwy 160	81089	-104.831846	37.600391	718
1021203	The BLVD Market	Lancaster BLVD	93534	-118.142518	34.69773	490
1004212	Oxford Farmers Market	Corner of Lanier and McClanahan Streets	27565	-78.5866163	36.3148277	711
1018274	Wilkes County Farmers' Market	842 CBD Loop	28659	-81.1452	36.159075	455
1021296	Down to Earth Cunningham Park Farmers Market	Parking lot off Union Turnpike	11366	-73.773482	40.7308	64
1019478	Plateau Valley Farmers Market	2003 Main Street	81624	-107.962277	39.238943	7
1010057	Stones River Market	301 Spring Street	37130	-86.416062	35.852209	236
1021555	Harrison City Market	121 E. Main Street	48625	-84.800573	44.019859	305
1008959	Cortez Farmers Market	Main and Elm Streets	81321	-108.587634	37.348444	187
1020036	Tamarack Junction Casino Farmers' Market	13101 So. Virginia Street	89511	-119.755381	39.416292	164
1020020	Westwood Village Farmers Market	1030 Broxton St	90024	-118.44653	34.061784	490
1021338	Ballard Farmers Market	5300 Ballard AVE NW	98107	-122.3845	47.667512	345
1019685	Peach Street Farmers Market	234 S. Arcola St.	77515	-95.428973	29.169195	552
1021688	Pendleton Indiana Farmers Market	Falls Park Drive	46064	-85.744734	40.005635	460
1021529	Backyard Market in Black Forest - Winter	6845 Shoup Road	80908	-104.698264	39.013991	80
1019374	Harvest Home Clinton Hill Market	Lafayette btwn Waverly & Washington	\N	-73.96631	40.688145	282
1021721	Paducah Homegrown Farmer's Market	306 N 2nd Street	42001	-88.596465	37.090228	687
1009043	Downtown Allen Park Farmers Market	Park Avenue and Harrison Avenue	48101	-83.208989	42.254801	379
1004848	Lincoln County Producers' Markets	360 Lincoln Street	89008	-114.5149	37.61666	249
1011535	Napa Downtown Farmers Market	1100 West Street	94559	-122.285131	38.301189	206
1018637	Rohnert Park Farmers' Market	500 City Center Dr	94928	-122.703949	38.349284	537
1019696	The Fresh MARTA Market - Tuesdays - West End Station	\N	\N	-84.416667	33.728652	639
1019401	Downtown Elgin Farmers Market	S. Spring Ave	60120	-88.282543	42.036328	643
1001533	Benica Certified Farmers Market	First Street between B & D Streets	94510	-122.161188	38.046215	456
1020049	The American Legion Farmers Market	2 S Artillery Dr	29150	-80.361114	33.919521	118
1021689	Albany Farmers' Market	4th & Ellsworth	97321	-123.106097	44.635052	365
1021232	College Place Farmers & Artisan Market	801 SE Larch Avenue	99324	-118.377845	46.041708	32
1016870	Farmers' Market at Hamakua Harvest	46-2600 Hawaii Belt Highway	96727	-155.44974	20.070927	548
1019229	Winnsboro Farmers' Market	Market Street	75494	-95.289646	32.957692	394
1020029	Barrow County Farmers Market	30 N. Broad St	30680	-83.721123	33.993074	243
1020079	Farmers Market on the Square	105 Merchant Street	42728	-85.307537	37.103437	514
1019118	Egg Harbor Farmers Market	7809 Highway 42	54209	-87.280716	45.049942	106
1005268	Wahiawa District Park (People's Open Market)	1139 A Kilani Avenue	96786	-158.02258	21.500382	580
1021231	Windmill Park Farmers Market in Cornville	9950 E CORNVILLE RD	86325	-111.908597	34.739119	425
1021511	Historic Lewes Farmers Market	36707 Crooked Hammock Way	19958	-75.150657	38.746394	43
1018644	Bennet Farmers' Market	Elm and Harrison	68317	-96.503262	40.680612	151
1021732	Aquidneck Growers Market- Saturday Summer	35 Dexter St	2840	-71.304555	41.509123	507
1019224	High Desert Farmers Market	18422 Bear Valley RD	92395	-117.257633	34.473755	207
1018931	Munising Farmers' and Artisans' Market	Veteran's Drive	49862	-86.653401	46.412557	332
1019525	Downtown Yakima Farmers Market	Yakima Ave & S 3rd Street	98901	-120.502787	46.602267	70
1009658	Mililani District Park (People's Open Market)	94-1150 Lanikuhana Ave.	96789	-158.018299	21.440682	580
1020130	Old L.A. Certified Farmers Market	North Figueroa & Ave. 58	90042	-118.1919	34.110124	490
1019122	Quincy Certified Farmers' Market	530 W. Main St.	95971	-120.950176	39.937091	526
1021443	Battle Creek Farmers Market	25 S McCamly St	49017	-85.18515	42.32009	586
1020026	Hickory Point UMC Produce Market	2001 Lock B Road North	37043	-87.24862	36.433597	353
1001886	Uptown Greenville Umbrella Market	Fifth Street and Evans Street	27858	-77.373338	35.611005	570
1019897	Fleming County Farmers’ Market	1384 Elizaville Rd	41041	-83.759523	38.421407	35
1021731	Pike Farmers Market	5429 Lafayette Road	46254	-86.258818	39.849755	494
1019842	Cedar Point Farmers Market	1046 Cedar Point Blvd.	28584	-77.083526	34.68261	143
1019624	Eastside Sunday Market	2020 MLK Jr. Ave	37915	-83.900903	35.976258	58
1010838	Shallotte Farmers Market/Market on Mulberry	123 Mulberry Street	28470	-78.386035	33.975058	94
1019659	Martin County Main Street Market	Main St. and Smithwick St.	27892	-77.055113	35.855219	281
1019082	E. Center St. Farmers Market	40 East Center Street	89406	-118.776299	39.473055	573
1010798	The Village Farmers Market on California Street	625 Booth Street	89509	-119.827646	39.514749	164
1010954	Down to Earth Larchmont Farmers Market	Parking Lot off Chatsworth Ave.	10538	-73.760008	40.933512	156
1019448	Uptown Westerville Farmers' Market	62 N. State St.	43081	-82.932051	40.12757	623
1019488	Oak Marr	3200 Jermantown Road	22124	-77.302226	38.889444	696
1019747	Rogersville Farmer's Market	270 County Line Road	65741	-93.066381	37.115153	355
1019782	Spotsylvania Farmers Market - VDOT Commuter Parking Lot	12150 Gordon Road	22170	-77.559528	38.289909	401
1018898	Ellington Winter Farmers' Market	11 Pinney St	6029	-72.49035	41.8697886	470
1021606	Rocky Mount Farmers Market	435 Franklin St	24151	-79.888073	36.994866	623
1018167	Seacoast Eat Local Winter Farmers' Market - Exeter High School	1 Blue Hawk Drive	3833	-71.0003126	43.0168516	185
1020064	Downtown Berkeley	1947 Center St.	94704	-122.2716	37.869819	246
1019695	Abita Springs Art & Farmers Market	22049 Main Street	70420	-90.038907	30.479064	268
1008450	Carmel Farmers Markets at the Barnyard Shopping Village	3690 The Barnyard	93923	-121.9270394	36.9872756	264
1019416	Orofino Farmers Market	101 Michigan Ave.	83544	-116.255806	46.477929	303
1021213	Carson Farmers Market @3rd & Curry St.	3rd & Curry St.	89703	-119.768164	39.162841	349
1019371	Albany IN Farmers Market	208 E. State Street	47320	-85.235831	40.299191	88
1018573	Morgan County Farmers Market	Intersection Main and Kennebec	43756	-81.853276	39.648855	645
1019975	The People’s Market	3220 E 3rd St.	47403	-86.491053	39.164192	572
1018349	Roosevelt Community Farmers' Market	380 Nassau Road	11575	-73.5908479	40.6817846	594
1018706	Dorchester/Dorchester House Farmers Market	1353 Dorchester Avenue	2122	-71.060126	42.304202	314
1002470	Croghan Colonial Bank Farmers Market	Front Street and Garrison Street	43420	-83.1135499	41.345408	483
1021624	Main Street Saturday Market	South Public Square	37130	-86.392158	35.845982	236
1021597	Algoma Sunday Farmers Market	Clark St. and Lake St.	54201	-87.435983	44.607438	419
1005140	Woodstock Farm Fresh Market	Market Street and Elm Street	30188	-84.52092	34.100488	426
1019632	Tuesday Farmers Market at Meridianville	175 Monroe Road	35759	-86.57513	34.859086	460
1002063	Southern Tier Farmers Market - Olean	1900 Constitution Ave	14760	-78.041832	42.211214	308
1005642	Mattapan Square  Farmers Market	882 Cummins Hwy	2126	-71.076514	42.3313532	314
1021693	Searcy County Farmers Market	200 W Fair Street	72650	-92.632893	35.911945	328
1021335	Oxford Farmers Market	E. Park Place	45056	-84.741544	39.510915	533
1003169	Sitka Farmers Market	611 Lincoln Street	99835	-135.326742	57.051519	344
1020174	Heritage Farmers' Market	1313 N. Mill St.	40741	-84.096167	37.135019	133
1003568	Estacada Farmers Market	664 Wade St	97023	-122.331858	45.297544	688
1019165	Bowie Farmers' Market	15200 Annapolis Road	20715	-76.741902	38.97832	21
1011778	Rolling Meadows City Markets	2720 Kirchoff Road	60008	-88.016174	42.078232	577
1021568	Sparks United Methodist Church Farmer's Market	1231 Pyramid Way	89431	-119.753397	39.544248	164
1021460	Fayette County Farmers Market	101 E East St	43160	-83.427938	39.53886	691
1005069	Farmers Market of Bluffton	40 Calhoun Street	29910	-80.862568	32.234811	678
1019906	Brown University Farmers Market	201 Thayer St	2906	-71.400031	41.826418	230
1019965	Burlington Farmers Market	345 Pine Street	5401	-73.215415	44.46973	617
1021524	Burke Area Farmers Market	626 County Road	57523	-99.299066	43.185042	512
1019344	Plainwell Indoor Market	211 N. Main St.	49080	-85.643297	42.44491	62
1012247	Vicksburg Farmers' Market	300 N. Richardson	49097	-85.528345	42.126553	189
1018624	The Springs Community Farmers' Market	Parking lot at Boyes Blvd & Hwy 12	95476	-122.482053	38.31433	537
1006069	Minturn Market	Historic Downtown Minturn	81645	-106.4315	39.58839	531
1019194	Roslindale Village Main Street Winter Farmers Market	32 Birch St	2131	-71.130709	42.286072	314
1005352	Lane County Farmers Holiday Market	Lane Event Center (Fairgrounds)	97401	-123.116207	44.056748	360
1008826	The Woodland Farmers Market	250 First Street	95695	-121.7737712	38.6792311	498
1018474	Portland Farmers Market - Kenton	N McClellan & N Denver	97217	-122.686792	45.583224	724
1021633	Koreshan State Park Farmers Market	3800 Corkscrew Road	33928	-81.815322	26.433896	534
1010560	Sioux City Farmers Market	100 Pearl Street	51101	-96.408445	42.490552	40
1008607	Brunswick-Topsham Land Trust Farmers' Market at Crystal Spring Farm	277 Pleasant Hill Rd	4011	-69.995923	43.890786	407
1021330	Crawfordsville Farmers Market	100 W Pike St.	47933	-86.903732	40.040652	353
1010487	Abingdon Farmers Market	Corner of Remsburg Drive & Cummings St	24212	-81.97716	36.708863	539
1021303	East Boston Farmers Market - Summer/Early Fall	Across from 201 Border St.	2128	-71.039467	42.374945	314
1019392	Whitehaven Kulliye Farmers Market	3379 Millbranch Road	38116	-90.008281	35.055288	660
1021281	Jackson Food & Farm Market	2708 Sherman Rd	53037	-88.171891	43.309792	539
1021491	Paola Farmers Market	Park Square	66071	-94.878291	38.572307	335
1021666	Farmers Market - Covington	301 4th St	47932	-87.39709	40.137063	60
1003680	Issaquah Farmers Market	1730 10th Ave N.W.	98027	-122.049115	47.550637	345
1018314	Morgan County Farmers' Market Association	Main St. & Indiana St.	46151	-86.428695	39.423392	645
1020199	Menifee County Farmers Market	62 Back Street	40322	-83.62783	37.951788	635
1010755	Northeast Washington (NEW) Farmers Market	Corner of Main and Astor	99114	-117.905228	48.543279	141
1006417	Idaho Falls Farmers' Market	A - D St. Memorial Drive	83402	-112.042508	43.494592	518
1009993	Cozad Grand Generation Center	410 W 9th St.	69130	-99.9901154	40.8606228	384
1020055	Narrowsburg Farmers' Market	7 Erie Avenue	12764	-75.05512	41.596136	266
1019631	Little Farm Store Market	520 Lucky Road	65746	-92.680159	37.118045	465
1019486	Herndon Farmers Market	768 Lynn Street	20170	-77.387108	38.970411	696
1019508	Yorktown Farmers Marketplace	1901 South Tiger Drive	47396	-85.495124	40.177147	88
1019910	Pawtucket Farmers Market	374 Main ST	2860	-71.387274	41.877734	230
1005944	Anacortes Farmers Market	611 R Avenue	98221	-122.609181	48.516974	709
1001034	Oneida Farmers Market	N7332 Water Circle Place	54155	-88.202341	44.503625	641
1020023	Ovid Farmers Market	Main Street	14521	-76.822157	42.676729	509
1019479	Ronan Farmers' Market	155-199 Hwy 93	59864	-114.097574	47.5276	431
1018918	STCC Open Air Market	180 Airport Road	17257	-77.477569	40.050647	407
1019752	Main Street Wadsworth Farmers Market	151 Main Street	44281	-81.732318	41.028681	358
1020090	Johnson County Farmers Market	826 F. M. Stafford Ave.	41240	-82.8042	37.812048	337
1021559	Wayne County Farmers Market	200 Willow Ave. Route 6	18431	-75.251698	41.566626	379
1005262	Salt Lake Municipal Lot (People's Open Market)	5337 Likini Street	96818	-157.904131	21.346157	580
1019325	Coventry Farmers' Market (formerly Coventry Regional Farmers' Market)	2299 South St.	6238	-72.345186	41.764283	470
1005197	Dubuque Farmers Market	Iowa Street between 10th & 13th Streets	52001	-90.667851	42.504521	436
1019617	Bay Area Farmers Market	500 Baybrook Mall Drive	77546	-95.150682	29.548702	272
1020010	White House Farmers Market	105 College Street	37188	-86.653004	36.467683	196
1004499	Wayland Winter Farmers' Market	397 Boston Post Road	1778	-71.369892	42.363071	466
1018972	Historic Newburgh Farmers Market	1 E Water St	47630	-87.405321	37.944042	291
1018098	South St. Joseph Farmers Market at the Junction	Lake & Illinois Avenues	64504	-94.865955	39.718654	158
1012344	Latham Farmers Market	109 Weatherly Road	35803	-86.56453	34.647522	460
1021333	Steelville Farmer & Artist Saturday Morning Market	392 Main St	65565	-91.358368	37.967138	2
1018282	Haymaker Farmers' Market	Franklin Avenue & Summit Street	44240	-81.360033	41.150692	715
1018359	Capital Harvest on the Plaza	1300 Pennsylvania Avenue	20004	-77.030256	38.894748	277
1021198	Linda Vista Certified Farmers Market	6939 Linda Vista Rd.	92111	-117.170563	32.785209	582
1019723	Palisades Winter Farmers' Market	675 Oak Tree Road	10964	-73.917284	41.011605	87
1019741	Clemmons Farmers Market	1150 S Peace Haven Road	27012	-80.386699	36.033223	499
1012038	Canoga Park Certified Farmers Market	7248 Owensmouth st	91303	-118.601612	34.203746	490
1010972	Down to Earth Morningside Park Farmers Market	110th Street and Manhattan Avenue	10026	-73.959645	40.801254	282
1019843	Marlette Farmers Market	3048 Main Street	48453	-83.080532	43.327346	342
1018944	Pawtucket Wintertime Farmers Market	1005 Main Street	2860	-71.39999	41.862831	230
1021202	Canal Village Farmers' Market	127 West Center Street	14103	-78.388368	43.220102	506
1021362	Celina Farmers Market	1001 W Market St.	45822	-84.582827	40.549633	359
1019370	Downtown Canton Farmers Market	202 N. Buffalo St.	75103	-95.863185	32.55736	583
1018397	Tuesday Market at Bloomington Community Farmers Market	6th and Madison Streets	47404	-86.537883	39.167687	572
1020133	East Hollywood Certified Farmers' Market	Hollywood Blvd. and Western Ave.	90028	-118.308877	34.10151	490
1005076	Hinsdale Farmers Market	30 E. Chicago Ave.	60521	-87.928694	41.8036543	370
1018283	Tupelo Farmers' Depot	415 South Spring Street	38804	-88.704327	34.253733	534
1012365	Crossroads Farmers Market	Anne St. at University Blvd. E	20912	-76.990169	38.990479	353
1021210	Brookline Farmers' Market	Centre Street West PArking Lot	2446	-71.123782	42.34219	377
1019727	Brownsburg Farmers Market	61 N. Green Street	46112	-86.396445	39.844272	130
1019442	Seneca Falls Farmers Market	15 Water Street	13148	-76.800314	42.909109	509
1019997	Camarillo Hospice Certified Farmers Market	2220 Ventura Blvd.	93010	-119.041574	34.216518	209
1020043	New Harvest Farmers' Market	4775 New Harvest Lane	37918	-83.883624	36.039471	58
1020184	Campbell Farmers' Market	Campbell Avenue & Central Avenue	95008	-121.954352	37.280232	12
1021433	City of Seven Hills Farmers Market	7221 Broadview Road	44131	-81.684217	41.369164	654
1006285	Hernando Farmers Market	2535 Highway 51 South	38632	-89.994281	34.823026	461
1003269	Kingston Farmers' Market	Wall Street - Uptown Kingston	12402	-74.019483	41.932986	424
1021736	Brookside Farmers' Market	6425 Wornall Road	64113	-94.551136	39.125212	491
1020119	Campbell County Farmers Market Association	709 Monmouth St	41071	-84.491761	39.090164	647
1019976	Shelby County Farmers Market	151 W Washington Street	46176	-85.780478	39.52422	660
1009959	2nd Street Market - Five Rivers MetroPark	600 E. 2nd Street	45402	-84.18103	39.762593	353
1020058	CFFMA - Ft Washington Farmers Market - Sunday	NE Corner Friant and Ft Washington	93730	-119.776881	36.874654	121
1021466	St. Louis Farmers Market	300 North Mill Street	48880	-84.608462	43.410742	634
1021554	Northville Farmers Market	Corner of 7 Mile and Center Streets	48167	-83.483407	42.42637	379
1019729	Dresden Farmers Market	421 Linden St.	38225	-88.693465	36.277008	606
1019790	Columbia Farmers Market	1769 West Ash Street	65203	-92.364624	38.958293	65
1021261	Dillsboro Farmers Market	12921 North Street	47018	-85.059414	39.018037	614
1018184	North Iowa Farmers Market	1st NE and Delaware	50401	-93.199249	43.15259	34
1018765	Ennis Farmers Market	104 North McKinney Street	75119	-96.629391	32.32763	693
1019940	Lynchburg Community Market	1219 Main St	24504	-79.140379	37.411517	195
1007261	Sara Hardy Downtown Farmers Market	152 East Grandview Parkway	49684	-85.621764	44.765173	446
1019986	La Familia Verde Market	Tremont Ave between Arthur Ave & LaFontaine Ave	10457	-73.891978	40.849357	167
1019806	Market on Main	Ford Center Plaza 6th and Main St	47715	-87.568349	37.972884	52
1009656	Colorado Farm and Art Market	215 S. Tejon	80903	-104.822309	38.830543	80
1020195	Mission Community Market	84 Bartlett Street	94111	-122.419881	37.755373	692
1019349	Tuscaloosa River Market	1900 Jack Warner Pkwy	35401	-87.562834	33.216479	579
1019114	Wellfleet Farmers' Market	200 Main Street	2667	-70.027995	41.939238	183
1018945	Dearborn Farmers & Artisans Market	22271 West Village Drive	48124	-83.211488	42.313057	379
1019127	Nutley Farmers Market	537 Franklin Avenue	7110	-74.154584	40.824341	677
1019786	Heber Market on Main	250 South Main	84032	-111.167763	40.329639	624
1019263	Jackson County Farmers Market - Outdoor Market	110 Railroad Avenue	28779	-83.218394	35.375375	491
1003969	Rogue Valley Growers & Crafters Market	1492 East Main	97520	-122.6905	42.1949	491
1020048	Verona Farmers Market	18 Gov Center Ln	24482	-79.010219	38.193744	690
1019848	Winter Farmers Market by Grow Oak Ridge	323 Vermont Avenue	37830	-84.251024	36.017239	284
1019775	The Fairfield Farmers Market	411 Wessel Drive	45014	-84.563916	39.334042	533
1020053	Etna Farmers Market	514 N Hwy 3	96027	-122.895854	41.458263	375
1021553	South Orange Farmers Market	12 Sloan Street	7079	-74.248205	40.7881258	677
1020157	Whitley County Farmers Market	NIBROC Park	40771	-84.096509	36.947	541
1019762	Ft. Wayne's Farmers Market - Summer	301 E Wayne Street	46802	-85.136155	41.078388	423
1021379	Northside Farmers' Market	2901 N. Sherman Ave.	53704	-89.362808	43.128145	326
1019904	Armory Farmers Market	85 Parade St	2909	-71.4316	41.814767	230
1019011	Independence Farmers Market	100 1st St. W	50644	-91.8949732	42.4687056	158
1008360	Ormond Beach Farmers Market	22 S. Beach St. (City Hall Plaza)	32174	-81.055484	29.284852	6
1018951	Highway 7 Market	1118 1st Ave	50563	-94.5353089	42.5171234	586
1019954	Eureka Springs Farmers Market	44 Kingshighway	72632	-93.746149	36.398616	115
1021608	Open Air Farmers Market+ At The Dole Mansion	401 Country Club Road	60014	-88.335331	42.232554	14
1019381	Harvest Home Harlem Hospital Market	Lenox Avenue btwn W. 136th & W. 138th Street	\N	-73.9401	40.814968	282
1005560	Southwest Virginia Farmers' Market	497 Farmers Market Drive	24343	-80.772836	36.742228	115
1021691	Corvallis Farmers' Market	1st & Jackson	97330	-123.258244	44.564828	170
1005258	Aina Moana  Park (People's Open Market)	1201 Ala Moana Boulevard	96822	-157.84493	21.287867	580
1012268	Plainwell Farmers Market	554 Allegan St.	49080	-85.650721	42.452003	62
1019708	Yardlet Farmers Market - Indoor Winter Market	65 N. Main St.	19067	-74.841627	40.243417	29
1019473	Aberdeen Sunday Market	Broadway between Heron & State St	98520	-123.816413	46.972973	628
1020050	Good Local Markets White Rock Farmers Market	9150 Garland Road	75218	-96.706451	32.829956	695
1021248	Braeswood Farmers Market	5401 south braeswood	77096	-95.477537	29.676944	272
1009803	Lane County Farmers Market	8th Ave & Oak St.	97401	-123.09154	44.050826	360
1012031	Market Common Farmers Market	Deville St	29577	-78.9390094	33.6699343	597
1021484	Grant Park Farmers Market	1040 Grant Street SE	30315	-84.376724	33.725504	639
1019531	Countryside Public Market	21 Furnace Street	44308	-81.515871	41.08885	663
1005259	Pokai Bay Beach Park (People's Open Market)	85-037 Pokai Bay Road	96792	-158.188437	21.442923	580
1005080	Imlay City Farmers Market	120 N Main	48444	-83.074322	43.02429	97
1018959	The Clarksville Downtown Market	One Public Square	37040	-87.361048	36.528219	353
1003836	Solana Beach Farmers Market	444 South Cedros Avenue	92075	-117.269204	32.987194	582
1021312	Rittenhouse Saturday Farmers' Market	1800 Walnut Street	19103	-75.170836	39.950039	27
1019181	The cornwall farmers market	183 main street	12518	-74.059815	41.442234	165
1019207	Little Italy Farmers Market	331 West 18th Street	16502	-80.085081	42.1155929	487
1018717	Elm Street Market	Elm Street	2465	-71.229493	42.349361	466
1019215	Union County Farmers Market	290 Farmers Market Way	30512	-83.950669	34.886298	722
1020056	CFFMA - River Park Farmers Market - Tuesday	SE Corner Blackstone and Nees	93720	-119.789095	36.849308	121
1018200	Hub City Farmers' Market	498 Howard St.	29303	-81.942413	34.956245	525
1021409	Riverside Farmers Market	2800 Riverside Drive	46208	-86.192041	39.806671	494
1018459	California Farmers Market	22810 Three Notch Road	20619	-76.499596	38.294524	374
1020112	Elliott County Farmers’ Market	2944 S KY 7	41171	-83.122634	38.093439	299
1021287	Mt. Pleasant Farmers' Market - Island Park	331 N. Main Street	48858	-84.780178	43.607074	615
1021464	Alexandria Farmers Market	2727 JACKSON STREET	71301	-92.466488	31.294467	81
1019964	Donnelly Farmers Market	FW Gestrin and E. Roseberry Rd	83615	-116.07672	44.730034	100
1019083	DOWNTOWN LIMA FARMERS' MARKET	7 Town Square	45801	-84.1058237	40.7395472	423
1018995	Mount Pleasant Farmers' Market	3200 Mt. Pleasant St NW	20010	-77.038675	38.931518	277
1021274	Westfield Farmers Market	36 Court St	1085	-72.751662	42.119742	405
1019591	Billerica Farmers Market	25 Concord Road	1821	-71.269999	42.557646	466
1018279	Texas Township Farmers' Market	7110 West Q Ave	49009	-85.687996	42.201444	189
1019455	Shawano Farmers Market	235 S. Washington Street	54166	-88.612868	44.777707	510
1019674	Pawling Farmers Market	Charles Colman Blvd & West Main Street	12564	-73.600845	41.564215	529
1020165	Pikeville Farmers Market	130 Adams Lane	41501	-82.544326	37.485971	191
1021726	Uptown Farmers Market	4620 N. Broadway	60640	-87.657972	41.965832	577
1010982	Down to Earth Queens Botanical Garden Farmers Market	Dahlia Avenue at Main Street	11355	-73.826548	40.751776	64
1020067	South Berkeley Farmers' Market	Adeline at 63rd Street	94703	-122.271931	37.847765	246
1021670	St. John Farmers Market	9660 Wicker Avenue	46373	-87.468144	41.444077	431
1000278	The Territory Farmers' Market	2000 Territory Drive	61036	-90.31353	42.404443	542
1019382	Harvest Home Lenox Avenue Market	Lenox Avenue btwn W. 117th & W. 118th Street	\N	-73.948857	40.803029	282
1019831	Allen County Farmers' Market	Jefferson	66749	-95.400669	37.927427	423
1021276	The Groves Marketplace	11939 Madera Run Pkwy	77346	-95.188057	29.957574	272
1021390	Little River County Farmers Market	\N	71822	-94.1176	33.661403	18
1018458	Home Grown Farm Market	21078 Three Notch Road	20653	-76.420927	38.247929	374
1021610	Humpday Farmers Market	1237 E Main St	62901	-89.193194	37.730073	491
1018217	Manistee Farmers Market	180 Memorial Drive	49660	-86.323001	44.249273	438
1007255	Des Moines Waterfront Farmers Market	22307 Dock Ave S	98198	-122.329307	47.401657	345
1021508	Birdsboro Farmers Market	226 N Water St	19508	-75.810113	40.262329	218
1006837	Main Street Farmers Market	401 Main Street	95667	-120.796965	38.730544	445
1018634	Union Street Farmers Market @ Celebration Pointe	4949 Celebration Pointe Ave	32608	-82.39552	29.62549	705
1001362	Butte Farmers Market	Uptown Butte	59701	-112.5364	46.01269	668
1021702	The Market at White River State Park	801 W Washington St.	46204	-86.171313	39.767371	494
1012314	Monroe Farmers Market	10th St and 16th Ave	53566	-89.639224	42.601889	33
1019206	CitySeed Winter Market	115 Water St	6511	-72.9188338	41.3011808	591
1019259	Rivertown Farmers Market	303 Williams Blvd	70062	-90.246653	29.973156	19
1021589	South Windsor Farmers' Market	220 Nevers Rd.	6074	-72.55179	41.842841	558
1020099	Boyd County Farmers Market - KYOVA Mall	10699 US-60	41102	-82.712555	38.400138	201
1018923	Sweetwater Sunday Market	6942 West Comanche Avenue	33634	-82.560612	27.999259	302
1006652	Legion Park Farmers Market	6601 Biscayne Blvd	33138	-80.183684	25.836451	604
1021569	West Haven Farmers Market	355 Main Street	6516	-72.949946	41.271879	591
1019042	Connecticut's Old State House Farmers Market	800 Main Street	6103	-72.672892	41.766118	558
1009810	Ashland Farmers Market	125 Front St	1721	-71.461538	42.260027	466
1018687	Palos Heights Farmer's Market	6601 W 127th Street	60463	-87.7831286	41.6604652	577
1009707	Surfside Beach Farmers Market	Intersection of Surfside Drive and Willow Drive	29575	-78.9743641	33.6069616	597
1020147	Temescal Urban Village Farmers' Market	5300 Claremont Ave.	94618	-122.259736	37.839774	246
1019967	Bethalto Market In The Park	213 N Priaire St	62010	-90.053468	38.902967	460
1005264	Waimanalo Beach Park (People's Open Market)	41-741 Kalanianaole Highway.	96795	-157.6946	21.331444	580
1005060	Rindge Farmers and Crafters Market	Bradford Street and Route 202	3461	-72.03585	42.765593	406
1019955	White St. Saturday Market	26 White St.	72632	-93.741728	36.404902	115
1019677	Firefly Farmers' Market	15615 East 21st Street North	67230	-97.156597	37.723203	631
1019338	Big Lake Farmers Market	101 Lakeshore Drive	55309	-93.758167	45.333773	576
1012389	Aloha Community Farmers' Market	17675 SW Farmington Rd and SW Kinnaman Rd	97007	-122.858722	45.480164	539
1021590	Fuquay-Varina Growers Market	121 N Main St.	27526	-78.800147	35.585512	633
1020024	Red Stick Farmers Market  - Seasonal Tuesdays	7711 Goodwood Boulevard	70806	-91.106845	30.442682	657
1011103	DeKalb Farmers' Market	2nd and Locust Streets	60115	-88.752032	41.931127	311
1017947	Grandin Village Farmers Market	2080 Westover Ave SW	24015	-79.978064	37.265053	723
1021257	Ludington Farmer's Market	\N	49431	-86.447744	43.955713	473
1020187	Willow Glen Farmers' Market	1425 Lincoln Avenue	95125	-121.819306	37.296867	12
1012044	Newmarket Farmers Market	5 Granite St	3875	-70.9380776	43.0788567	185
1019844	Montavilla Farmers Market	7700 Block of SE Stark Street	97215	-122.584311	45.519002	724
1005939	New Haven - CitySeed Downtown Farmers Market	Church St.	6510	-72.924912	41.307645	591
1019993	Farmers Market on Green River	1099 Legion Park Road	42743	-85.482096	37.244082	33
1020158	Wolfe County Farmers Market	640 S KY 15	41301	-83.542778	37.727015	8
1019155	Waco Downtown Farmers Market	500 Washington Avenue	76701	-97.132941	31.55682	231
1020074	Carter County Farmers’ Market - Olive Hill	131 Jessica Lane	41164	-83.180887	38.29761	351
1021483	St. Phillips Plaza Market	4280 N. Campbell Rd	85718	-110.942088	32.285766	348
1006169	Two Rivers Farmers/Crafter Market	\N	54241	-87.569392	44.150114	462
1002335	Harvest Home Mt. Eden Market	Mt. Eden Pkwy & Morris Avenue	\N	-73.909517	40.8427	167
1018562	Fairwood Farmers' Market	319 W. Hastings Rd.	99218	-117.41778	47.768387	646
1019379	Harvest Home St. Mary's Park Market	E. 149th Street & Eagle Avenue	\N	-73.911898	40.81385	167
1002064	Belmont Farmers Market	5429 State Route 19N	14813	-78.053508	42.234077	221
1000194	Riverside Farmers' Market	10 Pine Ave.	60546	-87.8201027	41.8277856	577
1012163	Blairstown Farmers' Market	5 Stillwater Road	7825	-74.955689	40.982893	650
1011902	Belleville Farmer's Market	1815 M St.	66935	-97.630924	39.822988	396
1012060	Petersham Friday Market	\N	1366	-72.186669	42.488744	367
1019616	Platteville Farmers Market - Summer	100 Park Place	53818	-90.47957	42.735314	127
1019438	Amqui Station Farmers Market	303 Madison Street	37115	-86.717491	36.257792	290
1021218	Route One Farmers Market	3745 Constellation Rd	93436	-120.466224	34.700679	3
1019220	High Point Farmers Market	901 N Main Street	27262	-80.012645	35.966162	44
1009660	Hawaii Kai Park n Ride (People's Open Market)	300 Keahole Street	\N	-157.713935	21.283943	580
1019247	Your Neighborhood Farmers Market-CityCentre	800 Towne and County BLVD.	77024	-95.386342	29.780472	272
1021266	Putnam Farmer's Market	1 Valley Park Drive	25526	-81.995042	38.440335	172
1018891	Brooksville Farmers' Market	15487 Citrus Way	34614	-82.449304	28.654639	716
1021727	Lowell Area Farmers' Market	11940 Fulton St	49331	-85.372381	42.93063	190
1001281	Mason Farmers Market	100 block East Maple at Jefferson (in street)	48854	-84.4426	42.580168	702
1020004	Shreveport Farmers' Market	101 Crockett Street	71101	-93.744962	32.514186	313
1020160	Cambria Farmers Market	1000 Main Street	93428	-121.096629	35.564323	110
1019464	Meridian Main Street Market	33 E. Broadway Ave.	83642	-116.392301	43.609999	356
1018650	West LA Farmers Market	1600 Purdue Ave.	90025	-118.450674	34.045724	490
1019613	Wayland Farmers Market on Main Street	149 South Main Street	49348	-85.642864	42.67262	62
1020136	Imogene Stout Market on Main	139 North Main Street	42064	-88.081353	37.334578	124
1000841	Downtown Denison Farmers Market	701 W. Main St.	75020	-96.54535	33.755828	601
1019463	Wisconsin Rapids Downtown Farmers Market	100-198 1st Avenue South	54495	-89.82674	44.392924	394
1019907	Central Falls Farmers Market	559 Dexter St	2863	-71.39565	41.885605	230
1002767	Glen Arbor Farmers Market	6394 Western Ave.	49636	-85.986905	44.897978	472
1012725	Muldoon Farmers Market	1301 Muldoon Road	99504	-149.731189	61.208991	477
1019100	Daybreak Farmers Market	Kestrel Rise Rd. and Daybreak Pkwy/W 11400 S	84009	-112.002561	40.547045	296
1021304	The Fountain Farmers' Market	The Singing Fountain	19147	-75.163171	39.929934	27
1019417	Carolina fresh market and more	6619 hwy 29 north	29669	-82.4614	34.641892	284
1021631	Downtown Evanston Farmers’ Market	University Place at Oak Street	60201	-87.686152	42.05062	577
1021528	Backyard Market in Black Forest	12530 Black Forest Rd	80908	-104.702384	39.014791	80
1005248	Palolo Valley District Park (People's Open Market)	2007 Palolo Avenue	96813	-157.797316	21.29891	580
1019352	Landon's Greenhouse Farmers Market	505 College Meadows Drive	82801	-106.948321	44.760524	279
1010958	Down to Earth New Rochelle Farmers Market	Thomas Paine Cottage Museum	10804	-73.791017	40.93357	156
1019436	Farmers Fresh Market	33955 Community College Dr.	99669	-151.135361	60.472775	321
1021413	Ohio Valley Farmers' Market	67800 Mall Rd	43950	-80.865892	40.069884	233
1021319	Green City Market Lincoln Park	1817 N. Clark St	60614	-87.633865	41.915854	577
1021565	Frankton Town Market	102 S Church St	46044	-85.779261	40.222745	460
1019994	Duluth's Downtown Farmers' Market	Gitch ode' Akiing formerly known as Lake Place Park 214 E Superior Street	55802	-92.093948	46.788805	403
1019841	Farm to Fork Farmers Market at Normandy Farms	7802 Marsh Road	46278	-86.274997	39.894467	494
\.


--
-- Data for Name: markets_payments; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.markets_payments (market_payments_id, market_id, payment_id) FROM stdin;
\.


--
-- Data for Name: markets_products; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.markets_products (market_product_id, market_id, product_id) FROM stdin;
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.payment_methods (pay_id, methods_name) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.products (p_id, product_name) FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.ratings (id, fmid, mark, owner, date) FROM stdin;
1	1021464	5	user1	2025-08-04 09:16:41.071451+03
2	1021464	8	user2	2025-08-04 09:16:41.071451+03
3	1021464	7	user3	2025-08-04 09:16:41.071451+03
4	1021464	9	user4	2025-08-04 09:16:41.071451+03
5	1021464	6	user5	2025-08-04 09:16:41.071451+03
6	1021464	8	user1	2025-08-04 09:16:41.071451+03
7	1021464	9	user2	2025-08-04 09:16:41.071451+03
8	1021464	7	user3	2025-08-04 09:16:41.071451+03
9	1021464	6	user4	2025-08-04 09:16:41.071451+03
10	1021464	8	user5	2025-08-04 09:16:41.071451+03
11	1021464	9	user1	2025-08-04 09:16:41.071451+03
12	1021464	7	user2	2025-08-04 09:16:41.071451+03
13	1021464	6	user3	2025-08-04 09:16:41.071451+03
14	1021464	8	user4	2025-08-04 09:16:41.071451+03
15	1021464	9	user5	2025-08-04 09:16:41.071451+03
16	1021464	7	user1	2025-08-04 09:16:41.071451+03
17	1021464	6	user2	2025-08-04 09:16:41.071451+03
18	1021464	8	user3	2025-08-04 09:16:41.071451+03
19	1021464	9	user4	2025-08-04 09:16:41.071451+03
20	1021464	7	user5	2025-08-04 09:16:41.071451+03
21	1019956	6	user1	2025-08-04 09:16:41.071451+03
22	1019956	7	user2	2025-08-04 09:16:41.071451+03
23	1019956	5	user3	2025-08-04 09:16:41.071451+03
24	1019956	8	user4	2025-08-04 09:16:41.071451+03
25	1019956	7	user5	2025-08-04 09:16:41.071451+03
26	1019956	6	user1	2025-08-04 09:16:41.071451+03
27	1019956	9	user2	2025-08-04 09:16:41.071451+03
28	1019956	5	user3	2025-08-04 09:16:41.071451+03
29	1019956	7	user4	2025-08-04 09:16:41.071451+03
30	1019956	6	user5	2025-08-04 09:16:41.071451+03
31	1019956	8	user1	2025-08-04 09:16:41.071451+03
32	1019956	7	user2	2025-08-04 09:16:41.071451+03
33	1019956	6	user3	2025-08-04 09:16:41.071451+03
34	1019956	5	user4	2025-08-04 09:16:41.071451+03
35	1019956	8	user5	2025-08-04 09:16:41.071451+03
36	1019956	7	user1	2025-08-04 09:16:41.071451+03
37	1019956	6	user2	2025-08-04 09:16:41.071451+03
38	1019956	9	user3	2025-08-04 09:16:41.071451+03
39	1019956	5	user4	2025-08-04 09:16:41.071451+03
40	1019956	7	user5	2025-08-04 09:16:41.071451+03
41	1010406	9	user1	2025-08-04 09:16:41.071451+03
42	1010406	8	user2	2025-08-04 09:16:41.071451+03
43	1010406	7	user3	2025-08-04 09:16:41.071451+03
44	1010406	6	user4	2025-08-04 09:16:41.071451+03
45	1010406	9	user5	2025-08-04 09:16:41.071451+03
46	1010406	8	user1	2025-08-04 09:16:41.071451+03
47	1010406	7	user2	2025-08-04 09:16:41.071451+03
48	1010406	6	user3	2025-08-04 09:16:41.071451+03
49	1010406	9	user4	2025-08-04 09:16:41.071451+03
50	1010406	8	user5	2025-08-04 09:16:41.071451+03
51	1010406	7	user1	2025-08-04 09:16:41.071451+03
52	1010406	6	user2	2025-08-04 09:16:41.071451+03
53	1010406	9	user3	2025-08-04 09:16:41.071451+03
54	1010406	8	user4	2025-08-04 09:16:41.071451+03
55	1010406	7	user5	2025-08-04 09:16:41.071451+03
56	1010406	6	user1	2025-08-04 09:16:41.071451+03
57	1010406	9	user2	2025-08-04 09:16:41.071451+03
58	1010406	8	user3	2025-08-04 09:16:41.071451+03
59	1010406	7	user4	2025-08-04 09:16:41.071451+03
60	1010406	6	user5	2025-08-04 09:16:41.071451+03
61	1012365	7	user1	2025-08-04 09:16:41.071451+03
62	1012365	6	user2	2025-08-04 09:16:41.071451+03
63	1012365	5	user3	2025-08-04 09:16:41.071451+03
64	1012365	8	user4	2025-08-04 09:16:41.071451+03
65	1012365	7	user5	2025-08-04 09:16:41.071451+03
66	1012365	6	user1	2025-08-04 09:16:41.071451+03
67	1012365	9	user2	2025-08-04 09:16:41.071451+03
68	1012365	5	user3	2025-08-04 09:16:41.071451+03
69	1012365	7	user4	2025-08-04 09:16:41.071451+03
70	1012365	6	user5	2025-08-04 09:16:41.071451+03
71	1012365	8	user1	2025-08-04 09:16:41.071451+03
72	1012365	7	user2	2025-08-04 09:16:41.071451+03
73	1012365	6	user3	2025-08-04 09:16:41.071451+03
74	1012365	5	user4	2025-08-04 09:16:41.071451+03
75	1012365	8	user5	2025-08-04 09:16:41.071451+03
76	1012365	7	user1	2025-08-04 09:16:41.071451+03
77	1012365	6	user2	2025-08-04 09:16:41.071451+03
78	1012365	9	user3	2025-08-04 09:16:41.071451+03
79	1012365	5	user4	2025-08-04 09:16:41.071451+03
80	1012365	7	user5	2025-08-04 09:16:41.071451+03
81	1010406	2	user1	2025-08-12 00:00:00+03
87	1010406	6	test	2025-08-15 00:00:00+03
89	1021464	6	test	2025-08-21 00:00:00+03
90	1021464	6	test	2025-08-21 00:00:00+03
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.reviews (id, fmid, text, owner, date) FROM stdin;
1	1021464	Отличный фермерский рынок! Всегда свежие продукты и дружелюбные продавцы.	user1	2025-08-04 08:41:18.053399+03
2	1021464	Один из лучших рынков в округе. Рекомендую!	user2	2025-08-04 08:41:18.053399+03
3	1021464	Большой выбор овощей и фруктов. Цены немного выше, чем в магазине, но качество того стоит.	user3	2025-08-04 08:41:18.053399+03
4	1021464	Хорошее место, чтобы провести утро субботы. Часто бывают живые выступления.	user4	2025-08-04 08:41:18.053399+03
5	1021464	Всегда покупаю здесь овощи. Они намного вкуснее тех, что в супермаркете.	user5	2025-08-04 08:41:18.053399+03
6	1019956	Небольшой, но уютный рынок. Отличный выбор местных продуктов.	user1	2025-08-04 08:41:18.053399+03
7	1019956	Мне нравится этот рынок. Всегда можно найти что-то интересное.	user2	2025-08-04 08:41:18.053399+03
8	1019956	Отличные домашние десерты! Рекомендую попробовать.	user3	2025-08-04 08:41:18.053399+03
9	1019956	Хороший выбор органических продуктов.	user4	2025-08-04 08:41:18.053399+03
10	1019956	Небольшой рынок, но с большим сердцем. Очень дружелюбная атмосфера.	user5	2025-08-04 08:41:18.053399+03
12	1010406	Мне нравится этот рынок, но там всегда очень много людей.	user2	2025-08-04 08:41:18.053399+03
13	1010406	Отличный выбор готовой еды. Можно пообедать прямо на месте.	user3	2025-08-04 08:41:18.053399+03
14	1010406	Здесь можно найти все, что угодно: от свежих продуктов до ремесленных изделий.	user4	2025-08-04 08:41:18.053399+03
15	1010406	Отличный рынок, но парковка может быть проблемой.	user5	2025-08-04 08:41:18.053399+03
16	1012365	Отличный рынок с большим выбором местных продуктов.	user2	2025-08-04 08:41:18.053399+03
17	1012365	Мне нравится, что здесь можно купить продукты прямо у фермеров.	user3	2025-08-04 08:41:18.053399+03
18	1012365	Хорошее место, чтобы поддержать местный бизнес.	user4	2025-08-04 08:41:18.053399+03
19	1012365	Всегда свежие и вкусные фрукты и овощи.	user1	2025-08-04 08:41:18.053399+03
20	1012365	Рекомендую посетить этот рынок, если вы хотите купить качественные продукты.	user5	2025-08-04 08:41:18.053399+03
22	1010406	super	user2	2025-08-11 00:00:00+03
25	1021200	super	user1	2025-08-12 00:00:00+03
26	1011995	test	test	2025-08-21 00:00:00+03
27	1021464	test	test	2025-08-21 00:00:00+03
\.


--
-- Data for Name: state_city; Type: TABLE DATA; Schema: markets; Owner: postgres
--

COPY markets.state_city (zip, c_id, state_name, city_name) FROM stdin;
97266	724	Oregon	Portland
90008	490	California	Los Angeles
46151	645	Indiana	Martinsville
94952	537	California	Petaluma
50036	65	Iowa	Boone
66202	337	Kansas	Mission
42001	687	Kentucky	Paducah
77003	272	Texas	Houston
80521	412	Colorado	Fort Collins
94596	208	California	Walnut Creek
22485	372	Virginia	King George
30306	639	Georgia	Atlanta
90274	490	California	Rolling Hills Estates
12402	424	New York	Kingston
18049	599	Pennsylvania	Emmaus
53959	205	Wisconsin	Reedsburg
84501	656	Utah	Price
12206	254	New York	Albany
96727	548	Hawaii	Honokaa
15210	36	Pennsylvania	Pittsburgh
59047	125	Montana	Livingston
81401	280	Colorado	Montrose
35020	19	Alabama	Bessemer
72160	366	Arkansas	Stuttgart
71351	238	Louisiana	Marksville
80908	80	Colorado	Colorado Springs
49854	24	Michigan	Manistique
66219	337	Kansas	Lenexa
61764	75	Illinois	Pontiac
48197	257	Michigan	Ypsilanti
46511	551	Indiana	Culver
10543	156	New York	Mamaroneck
81301	556	Colorado	Durango
33021	704	Florida	Hollywood
97215	724	Oregon	Portland
20646	300	Maryland	La Plata
7110	677	New Jersey	Nutley
2446	377	Massachusetts	Brookline
70808	657	Louisiana	Baton Rouge
76548	91	Texas	Harker Heights
47374	379	Indiana	Richmond
49684	446	Michigan	Traverse City
40322	635	Kentucky	Frenchburg
28470	94	North Carolina	Shallotte
37801	600	Tennessee	Maryville
2740	103	Massachusetts	New Bedford
40245	19	Kentucky	Louisville/Jefferson County metro government (balance)
78621	408	Texas	Elgin
20622	374	Maryland	Charlotte Hall
23185	276	Virginia	Williamsburg
2135	314	Massachusetts	Brighton
27597	633	North Carolina	Zebulon
90031	490	California	Los Angeles
54901	202	Wisconsin	Oshkosh
2155	466	Massachusetts	Medford
56136	249	Minnesota	Hendricks
20165	215	Virginia	Sterling
3833	185	New Hampshire	Exeter
6058	589	Connecticut	Norfolk
14521	509	New York	Ovid
24343	115	Virginia	Hillsville
6468	224	Connecticut	Monroe
19119	27	Pennsylvania	Philadelphia
68714	389	Nebraska	Bassett
23235	155	Virginia	Richmond
92371	207	California	Phelan
66002	697	Kansas	Atchison
56484	146	Minnesota	Walker
95932	250	California	Colusa
28723	491	North Carolina	Cullowhee
3461	406	New Hampshire	Rindge
15417	539	Pennsylvania	Brownsville
71822	18	Arkansas	Ashdown
21136	385	Maryland	Reisterstown
8840	466	New Jersey	METUCHEN
98683	427	Washington	Vancouver
43160	691	Ohio	Washington Court House
40913	550	Kentucky	Beverly
54002	226	Wisconsin	Baldwin
45817	423	Ohio	Bluffton
93010	209	California	Camarillo
81101	242	Colorado	Alamosa
2893	190	Rhode Island	West Warwick
29646	467	South Carolina	Greenwood
78669	93	Texas	Spicewood
11215	31	New York	Park Slope
47394	502	Indiana	Winchester
32073	550	Florida	Orange Park
77546	272	Texas	Friendswood
13148	509	New York	Seneca Falls
31023	4	Georgia	Eastman
24153	341	Virginia	Salem
4240	430	Maine	Lewiston
56081	464	Minnesota	St.james
96767	580	Hawaii	Waipahu
43504	251	Ohio	Berkey
19147	27	Pennsylvania	Philadelphia
38116	660	Tennessee	Memphis
95969	447	California	Paradise
16063	533	Pennsylvania	Zelienople
29440	683	South Carolina	Georgetown
44113	654	Ohio	Cleveland
54812	482	Wisconsin	Barron
91711	490	California	Claremont
49862	332	Michigan	Munising
36311	171	Alabama	Clio
29910	678	South Carolina	Bluffton
77443	272	Texas	Cypress
24558	621	Virginia	Halifax
56142	249	Minnesota	Ivanhoe
20004	277	District of Columbia	DC
12054	254	New York	Delmar
20619	374	Maryland	California
2492	377	Massachusetts	Needham
72455	502	Arkansas	Pocahontas
93436	3	California	LOMPOC
29582	597	South Carolina	North Myrtle Beach
97103	79	Oregon	Astoria
46802	423	Indiana	FORT WAYNE
21244	385	Maryland	Woodlawn
13323	701	New York	Clinton
30303	639	Georgia	Atlanta
46563	551	Indiana	Plymouth
38103	660	Tennessee	Memphis
2745	103	Massachusetts	New Bedford
38024	63	Tennessee	Dyersburg
52241	337	Iowa	Coralville
83672	539	Idaho	Weiser
23832	155	Virginia	Chesterfield
41005	65	Kentucky	Burlington
36602	421	Alabama	Mobile
29464	175	South Carolina	Mount Pleasant
49042	178	Michigan	Constantine
44264	663	Ohio	Peninsula
85938	108	Arizona	Springerville
3743	266	New Hampshire	Claremont
47119	77	Indiana	floyds knobs
37130	236	Tennessee	Murfreesboro
19063	88	Pennsylvania	Media
84401	549	Utah	Ogden
3904	435	Maine	Kittery
47331	691	Indiana	Connersville
30134	607	Georgia	Douglasville
60607	577	Illinois	Chicago
96786	580	Hawaii	Wahiawa
48146	379	Michigan	Lincoln Park
41339	508	Kentucky	Jackson
98686	427	Washington	Vancouver
48130	257	Michigan	Dexter
60546	577	Illinois	Riverside
6040	558	Connecticut	Manchester
98226	109	Washington	Bellingham
95008	12	California	Campbell
40324	632	Kentucky	Georgetown
93401	110	California	San Luis Obispo
49670	472	Michigan	Northport
60614	577	Illinois	Chicago
30126	10	Georgia	Mableton
41171	299	Kentucky	Sandy Hook
84096	296	Utah	Herriman
70806	657	Louisiana	Baton Rouge
19508	218	Pennsylvania	Birdsboro
10026	282	New York	Manhattan
97415	336	Oregon	Brookings
48854	702	Michigan	Mason
68632	533	Nebraska	David City
48167	379	Michigan	Northville
70458	268	Louisiana	Olde Towne Slidell
60201	577	Illinois	Evanston
97217	724	Oregon	Portland
56601	593	Minnesota	Bemidji
93442	110	California	Morro Bay
1890	466	Massachusetts	Winchester
4401	90	Maine	Bangor
8822	72	New Jersey	Flemington
53818	127	Wisconsin	Platteville
94559	206	California	Napa
80466	262	Colorado	Nederland
46176	660	Indiana	SHELBYVILLE
65746	465	Missouri	Seymour
13026	179	New York	Aurora
18505	575	Pennsylvania	Scranton
15658	111	Pennsylvania	Ligonier
6511	591	Connecticut	New Haven
6384	204	Connecticut	Voluntown
32615	705	Florida	Alachua
15221	36	Pennsylvania	Wilkinsburg
47591	58	Indiana	Vincennes
19107	27	Pennsylvania	Philadelphia
95076	184	California	Watsonville
24212	539	Virginia	Abingdon
1748	466	Massachusetts	Hopkinton
4444	90	Maine	Hampden
96813	580	Hawaii	Honolulu
61201	410	Illinois	Rock Island
55413	152	Minnesota	Minneapolis
59874	86	Montana	Trout Creek
98501	605	Washington	Olympia
97030	724	Oregon	Gresham
49506	190	Michigan	Grand Rapids
27565	711	North Carolina	Oxford
22180	696	Virginia	Vienna
27012	499	North Carolina	Clemmons
68601	256	Nebraska	Columbus
6477	591	Connecticut	Orange
49712	316	Michigan	Boyne City
20737	21	Maryland	Riverdale Park
12801	650	New York	Glens Falls
29303	525	South Carolina	Spartanburg
98264	109	Washington	Lynden
47012	623	Indiana	BROOKVILLE
68317	151	Nebraska	Bennet
30153	486	Georgia	Rockmart
6513	591	Connecticut	New Haven
77042	272	Texas	Houston
46714	503	Indiana	Bluffton
86325	425	Arizona	CORNV
30030	311	Georgia	Decatur
41040	383	Kentucky	Falmouth
95404	537	California	Santa Rosa
72650	328	Arkansas	Marshall
72756	170	Arkansas	ROGERS
3237	686	New Hampshire	Gilmanton
43213	623	Ohio	Whitehall
43054	623	Ohio	New Albany
12498	424	New York	Woodstock
35759	460	Alabama	Meridianville
21230	148	Maryland	Baltimore
29720	151	South Carolina	Lancaster
47906	520	Indiana	West Lafayette
90011	490	California	Los Angeles
24293	287	Virginia	Wise
42728	514	Kentucky	Columbia
46225	494	Indiana	Indianapolis
53140	476	Wisconsin	Kenosha
1364	623	Massachusetts	Orange
14221	487	New York	Clarence
6510	591	Connecticut	New Haven
91739	207	California	Rancho Cucamonga
2917	230	Rhode Island	Smithfield
90025	490	California	Los Angeles
48178	270	Michigan	South Lyon
60637	577	Illinois	Chicago
54212	106	Wisconsin	Fish Creek
93030	209	California	Oxnard
6249	204	Connecticut	Lebanon
22079	696	Virginia	Lorton
2804	114	North Carolina	Kinston
8005	134	New Jersey	Barnegat
21811	367	Maryland	Ocean Pines
10580	156	New York	Rye
60430	577	Illinois	Homewood
15701	653	Pennsylvania	Indiana
20781	21	Maryland	Hyattsville
48847	634	Michigan	Ithaca
32204	147	Florida	Jacksonville
74501	648	Oklahoma	McAlester
64504	158	Missouri	St. Joseph
12983	623	New York	Saranac Lake
93923	264	California	Carmel
5753	501	Vermont	Middlebury
71301	81	Louisiana	Alexandria
15201	36	Pennsylvania	Pittsburgh
1821	466	Massachusetts	Billerica
46112	130	Indiana	Brownsburg
54729	82	Wisconsin	Chippewa Falls
40383	363	Kentucky	VERSAILLES
30344	639	Georgia	East Point
59741	194	Montana	Manhattan
71101	313	Louisiana	Shreveport
12764	266	New York	Narrowsburg
1604	367	Massachusetts	Worcester
33928	534	Florida	Estero
77880	539	Texas	Washington
34614	716	Florida	Brooksville
81321	187	Colorado	Cortez
96819	580	Hawaii	Honolulu
77515	552	Texas	Angleton
62701	182	Illinois	Springfield
57101	516	South Dakota	Sioux Falls
47320	88	Indiana	Albany
40601	623	Kentucky	Frankfort
96782	580	Hawaii	Pearl City
29601	325	South Carolina	Greenville
2066	102	Massachusetts	Scituate
97113	539	Oregon	Cornelius
91303	490	California	canoga park
28203	676	North Carolina	Charlotte
96713	380	Hawaii	Hana
48124	379	Michigan	Dearborn
92399	207	California	Yucaipa
40906	58	Kentucky	Barbourville
43906	233	Ohio	Bellaire
98368	19	Washington	PORT TOWNSEND
80123	19	Colorado	Littleton
75218	695	Texas	Dallas
27981	504	North Carolina	Wanchese
59864	431	Montana	Ronan
60120	643	Illinois	Elgin
77091	95	Texas	Houston
72761	170	Arkansas	Siloam Springs
60657	577	Illinois	Chicago
78237	315	Texas	San Antonio
60062	577	Illinois	Northbrook
70053	19	Louisiana	Gretna
40741	133	Kentucky	London
94025	416	California	Menlo Park
2144	466	Massachusetts	Somerville
35401	579	Alabama	Tuscaloosa
32208	147	Florida	Jacksonville
98901	70	Washington	Yakima
42064	124	Kentucky	Marion
29577	597	South Carolina	Myrtle Beach
95340	212	California	Merced
2907	230	Rhode Island	Providence
64850	210	Missouri	Downtown Neosho
81621	531	Colorado	Basalt
23824	708	Virginia	Blackstone
70802	657	Louisiana	baton rouge
1778	466	Massachusetts	Wayland
40769	541	Kentucky	Williamsburg
32720	6	Florida	DeLand
27040	499	North Carolina	Pfafftown
30024	269	Georgia	Suwanee
22968	397	Virginia	Ruckersville
37807	722	Tennessee	Maynardville
64040	337	Missouri	Holden
51566	353	Iowa	Red Oak
47404	572	Indiana	Bloomington
71601	19	Arkansas	Pine Bluff
54819	532	Wisconsin	Bruce
92107	582	California	San Diego
77346	272	Texas	Humble
12477	424	New York	Saugerties
58854	169	North Dakota	Watford City
43209	623	Ohio	Bexley
17201	623	Pennsylvania	Chambersburg
78220	315	Texas	San Antonio
97220	724	Oregon	Portland
78130	315	Texas	New Braunfels
2184	377	Massachusetts	Braintree
72736	170	Arkansas	Gravette
92252	207	California	Joshua Tree
63501	514	Missouri	Kirksville
44107	654	Ohio	Lakewood
97383	494	Oregon	Stayton
54455	443	Wisconsin	City
37030	362	Tennessee	Carthage
63537	58	Missouri	Edina
97330	170	Oregon	Corvallis
40444	267	Kentucky	Lancaster
76240	116	Texas	Collinsville
52345	170	Iowa	Urbana
63010	19	Missouri	Arnold
49654	472	Michigan	Leland
49064	432	Michigan	Lawrence
1102	405	Massachusetts	Springfield
92277	207	California	Twentynine Palms
45056	533	Ohio	Oxford
44240	715	Ohio	Kent
64633	115	Missouri	Carrollton
33785	699	Florida	Indian Shores
51247	211	Iowa	Rock Valley
33634	302	Florida	Tampa
95633	445	California	Garden Valley
28715	444	North Carolina	Candler
42134	658	Kentucky	Franklin
39110	460	Mississippi	Madison
59068	656	Montana	Red Lodge
60077	577	Illinois	Skokie
3869	613	New Hampshire	Rollinsford
88119	474	New Mexico	Fort Sumner
46254	494	Indiana	Indianapolis
49097	189	Michigan	Vicksburg
97501	491	Oregon	Medford
54303	524	Wisconsin	Green Bay
14813	221	New York	Belmont
83801	217	Idaho	Athol
46052	65	Indiana	Lebanon
48880	634	Michigan	St. Louis
94702	246	California	Berkeley
71901	664	Arkansas	Hot Springs
17331	435	Pennsylvania	Hanover
6074	558	Connecticut	South Windsor
86301	425	Arizona	Prescott
55063	439	Minnesota	Pine City
47978	538	Indiana	Rensselaer
83837	625	Idaho	Kellogg
84775	379	Utah	Torrey
45208	409	Ohio	Cincinnati
97219	724	Oregon	Portland
5038	165	Vermont	Chelsea
29575	597	South Carolina	Surfside Beach
55374	152	Minnesota	Rogers
99669	321	Alaska	Soldotna
48846	571	Michigan	Ionia
34471	494	Florida	Ocala
60115	311	Illinois	DeKalb
92503	500	California	Riverside
7732	310	New Jersey	Highlands
14750	719	New York	Lakewood
81089	718	Colorado	Walsenburg
3875	185	New Hampshire	Newmarket
28779	491	North Carolina	Sylva
43147	224	Ohio	Pickerington
26170	707	West Virginia	St. Marys
44310	663	Ohio	Akron
20132	215	Virginia	Purcellville
41041	35	Kentucky	Flemingsburg
22101	696	Virginia	McLean
94019	416	California	Half Moon Bay
7307	452	New Jersey	Jersey City
48176	257	Michigan	Saline
68066	293	Nebraska	Wahoo
46229	494	Indiana	Cumberland
2143	466	Massachusetts	Somerville
7960	153	New Jersey	Morristown
49017	586	Michigan	Battle Creek
72901	174	Arkansas	Fort Smith
21550	392	Maryland	Oakland
2863	230	Rhode Island	Central Falls
36278	502	Alabama	Wedowee
49636	472	Michigan	Glen Arbor
60463	577	Illinois	Palos Heights
72223	404	Arkansas	Little Rock
2914	230	Rhode Island	East Providence
52801	632	Iowa	Davenport
74343	9	Oklahoma	Fairland
93730	121	California	Fresno
49660	438	Michigan	Manistee
6238	470	Connecticut	Coventry
60450	469	Illinois	Morris
87417	588	New Mexico	Kirtland
40069	539	Kentucky	Springfield
40108	428	Kentucky	Brandenburg
46278	494	Indiana	Indianapolis
35905	585	Alabama	GLENCOE
22124	696	Virginia	Oakton
21773	295	Maryland	Myersville
46208	494	Indiana	indianapolis
45769	66	Ohio	Pomeroy
75020	601	Texas	Denison
15224	36	Pennsylvania	Pittsburgh
54301	524	Wisconsin	Green Bay
45840	113	Ohio	Findlay
57523	512	South Dakota	Burke
30337	639	Georgia	College Park
2145	466	Massachusetts	Somerville
95124	12	California	San Jose
66762	2	Kansas	Pittsburg
60002	431	Illinois	Antioch
7825	650	New Jersey	Blairstown
33143	604	Florida	Miami
60423	694	Illinois	Frankfort
97885	357	Oregon	Wallowa
7018	677	New Jersey	East Orange
98103	345	Washington	Seattle
28401	603	North Carolina	Wilmington
41143	351	Kentucky	GRAYSON
19081	88	Pennsylvania	Swarthmore
30315	639	Georgia	Atlanta
20742	21	Maryland	College Park
99835	344	Alaska	Sitka
40071	381	Kentucky	Taylorsville
60621	577	Illinois	Chicago
70118	506	Louisiana	New Orleans
14760	308	New York	Olean
4416	113	Maine	Bucksport
13607	19	New York	Alexandria Bay
5359	57	Vermont	West Townshend
17327	435	Pennsylvania	Glen Rock
62901	491	Illinois	Carbondale
47715	52	Indiana	Evansville
24551	386	Virginia	Forest
29150	118	South Carolina	Sumter
53211	620	Wisconsin	Shorewood
33617	302	Florida	Temple Terrace
37918	58	Tennessee	Knoxville
76201	655	Texas	Denton
5672	248	Vermont	Stowe
5250	611	Vermont	Arlington
37115	290	Tennessee	Madison
27312	527	North Carolina	Fearrington Village
95476	537	California	Boyes Hot Springs
51537	660	Iowa	Harlan
23228	306	Virginia	RICHMOND
71832	564	Arkansas	De Queen
87571	347	New Mexico	Taos
49426	9	Michigan	Hudsonville
88042	85	New Mexico	Hillsboro
27701	312	North Carolina	Durham
54143	294	Wisconsin	Marinette
24016	723	Virginia	Roanoke
12946	677	New York	Lake Placid
29662	325	South Carolina	Mauldin
27320	185	North Carolina	Reidsville
95971	526	California	Quincy
3820	185	New Hampshire	Dover
19335	140	Pennsylvania	Downingtown
30047	269	Georgia	Lilburn
11575	594	New York	Roosevelt
72032	25	Arkansas	Conway
58318	505	North Dakota	Bottineau
95050	12	California	Santa Clara
77011	95	Texas	Houston
27858	570	North Carolina	Greenville
55447	152	Minnesota	Plymouth
21704	295	Maryland	Frederick
38120	660	Tennessee	Memphis
95060	184	California	Santa Cruz
15668	111	Pennsylvania	Murrysville
2421	466	Massachusetts	Lexington
68522	151	Nebraska	Lincoln
70062	19	Louisiana	Kenner
45822	359	Ohio	Celina
23664	671	Virginia	Hampton
94703	246	California	Berkeley
47025	614	Indiana	Lawrenceburg
59632	19	Montana	Boulder
46979	84	Indiana	Russiaville
22170	401	Virginia	Fredericksburg
96101	528	California	Alturas
75773	394	Texas	Mineola
46131	337	Indiana	Franklin
50311	486	Iowa	Des Moines
54241	462	Wisconsin	Two Rivers
75494	394	Texas	Winnsboro
20190	696	Virginia	Reston
50644	158	Iowa	Independence
10928	165	New York	Village of Highland Falls
91731	490	California	El Monte
54942	202	Wisconsin	Greenville
54935	684	Wisconsin	Fond du Lac
89008	249	Nevada	Caliente
19348	140	Pennsylvania	Kennett Square
60543	685	Illinois	Oswego
81130	530	Colorado	Creede
78214	315	Texas	San Antonio
97202	724	Oregon	Portland
5458	53	Vermont	Grand Isle
49631	323	Michigan	Evart
11355	64	New York	Queens
35803	460	Alabama	Huntsville
44903	578	Ohio	Mansfield
78665	71	Texas	Round Rock
21014	92	Maryland	Bel Air
20170	696	Virginia	Herndon
46970	335	Indiana	Peru
5777	700	Vermont	Fair Haven
2818	190	Rhode Island	Warwick
3452	406	New Hampshire	Jaffrey
32303	669	Florida	Tallahassee
42240	468	Kentucky	HOPKINSVILLE
31201	433	Georgia	Macon
95926	447	California	Chico
70501	119	Louisiana	Lafayette
95695	498	California	Woodland
77459	398	Texas	Missorui City
48108	257	Michigan	Ann Arbor
22315	696	Virginia	Alexandrida
7853	153	New Jersey	Long Valley
43452	9	Ohio	Port Clinton
85234	418	Arizona	Gilbert
3901	435	Maine	Berwick
96097	375	California	Yreka
61036	542	Illinois	Galena
48202	379	Michigan	Detroit
78224	315	Texas	San Antonio
35022	19	Alabama	Bessemer
92382	207	California	Running Springs
34714	431	Florida	Clermont
90026	490	California	Los Angeles
53705	326	Wisconsin	Madison
60020	431	Illinois	Fox Lake
77901	378	Texas	Victoria
60061	431	Illinois	Vernon Hills
18015	599	Pennsylvania	Bethlehem
31503	640	Georgia	Waycross
12564	529	New York	Pawling
48444	97	Michigan	Imlay City
5701	700	Vermont	Rutland
29379	722	South Carolina	Union
71742	695	Arkansas	Fordyce
52804	632	Iowa	Davenport
37043	353	Tennessee	Clarksville
61104	202	Illinois	Rockford
97401	360	Oregon	Eugene
30307	639	Georgia	Atlanta
22003	696	Virginia	Annandale
50563	586	Iowa	Manson
48640	137	Michigan	Midland
97214	724	Oregon	Portland
49009	189	Michigan	Kalamazoo
28739	327	North Carolina	Hendersonville
55981	139	Minnesota	Wabasha
25661	638	West Virginia	Williamson
48821	186	Michigan	Dimondale
97321	365	Oregon	Albany
40243	19	Kentucky	Middletown
53948	495	Wisconsin	mauston
97135	458	Oregon	Pacific City
28403	603	North Carolina	Wilmington
24465	181	Virginia	Monterey
53177	644	Wisconsin	sturtevant
46516	352	Indiana	Elkhart
49651	292	Michigan	Lake City
2852	539	Rhode Island	North Kingstown
94930	560	California	Fairfax
12180	188	New York	Troy
43055	393	Ohio	Newark
93428	110	California	Cambria
12043	142	New York	Cobleskill
94563	208	California	Orinda
46140	113	Indiana	Greenfield
49331	190	Michigan	Lowell
10031	282	New York	New York
81435	519	Colorado	Telluride
46064	460	Indiana	Pendleton
64801	538	Missouri	Joplin
89511	164	Nevada	RENO
64113	491	Missouri	Kansas City
64050	491	Missouri	Independence
58701	616	North Dakota	Minot
33701	699	Florida	St Petersburg
83402	518	Idaho	Idaho Falls
25526	172	West Virginia	Hurricane
24522	680	Virginia	Appomattox
95927	447	California	Chico
16648	371	Pennsylvania	Hollidaysburg
13905	395	New York	Binghamton
43214	623	Ohio	Columbus
92866	165	California	Orange
2909	230	Rhode Island	Providence
48933	702	Michigan	Lansing
19148	27	Pennsylvania	Philadelphia
22815	185	Virginia	Broadway
5401	617	Vermont	Burlington
12550	165	New York	Newburgh
61046	115	Illinois	Lanark
24083	448	Virginia	Daleville
2190	377	Massachusetts	Weymouth
53154	620	Wisconsin	Oak Creek
46373	431	Indiana	St. John
95453	431	California	Lakeport
93720	121	California	Fresno
85004	418	Arizona	Phoenix
50273	460	Iowa	Winterset
66073	19	Kansas	Perry
2860	230	Rhode Island	Pawtucket
28584	143	North Carolina	Cedar Point
2744	103	Massachusetts	New Bedford
54615	491	Wisconsin	Black River Falls
55309	576	Minnesota	Big Lake
62062	460	Illinois	Maryville
26288	355	West Virginia	Webster Springs
37830	284	Tennessee	Oak Ridge
30904	199	Georgia	Augusta-Richmond County consolidated government (balance)
36830	534	Alabama	Auburn
97023	688	Oregon	Estacada
60612	577	Illinois	Chicago
61701	51	Illinois	Bloomington
55027	545	Minnesota	Goodhue
43204	623	Ohio	Columbus
60014	14	Illinois	Crystal Lake
92395	207	California	Victorville
78217	315	Texas	San Antonio
6460	591	Connecticut	Milford
77474	240	Texas	Sealy
33991	534	Florida	Cape Coral
83605	670	Idaho	Caldwell
30309	639	Georgia	Atlanta
78660	662	Texas	Pflugerville
42743	33	Kentucky	Greensburg
2128	314	Massachusetts	East Boston
34109	273	Florida	Naples
47932	60	Indiana	Covington
25411	645	West Virginia	Berkeley Springs
49682	472	Michigan	Suttons Bay
42071	595	Kentucky	Murray
44222	663	Ohio	Cuyahoga Falls
7857	153	New Jersey	Netcong
90059	490	California	Los Angeles
24521	667	Virginia	Amherst
14901	422	New York	Elmira
55056	457	Minnesota	North Branch
10570	156	New York	Pleasantville
50310	486	Iowa	Des Moines
78745	662	Texas	Austin
2667	183	Massachusetts	Wellfleet
33033	604	Florida	Homestead
27892	281	North Carolina	Williamston
18431	379	Pennsylvania	Honesdale
16502	487	Pennsylvania	Erie
2891	539	Rhode Island	Westerly
65565	2	Missouri	Steelville
88061	127	New Mexico	Silver City
30512	722	Georgia	Blairsville
40486	491	Kentucky	Tyner
63107	618	Missouri	St Louis
18940	29	Pennsylvania	Wrightstown (use Newtown for GPS)
89509	164	Nevada	Reno
72712	170	Arkansas	Bentonville
34481	494	Florida	Ocala
71355	238	Louisiana	Moreauville
50627	288	Iowa	Eldora
19067	29	Pennsylvania	Yardley borough
67432	550	Kansas	Clay Center
77339	272	Texas	Kingwood
54201	419	Wisconsin	Algoma
76033	337	Texas	Cleburne
92101	582	California	San Diego
65605	150	Missouri	Aurora
51445	289	Iowa	Ida Grove
59422	219	Montana	Choteau
94618	246	California	Oakland
30815	199	Georgia	Hephzibah
98335	666	Washington	Gig Harbor
46163	113	Indiana	New Palestine
45140	584	Ohio	Loveland
92075	582	California	Solana Beach
83615	100	Idaho	donnelly
44720	104	Ohio	North Canton
43081	623	Ohio	Westerville
76063	346	Texas	Mansfield
47631	123	Indiana	New Harmony
98020	120	Washington	Edmonds
29526	597	South Carolina	Conway
30060	10	Georgia	MARIETTA
94111	692	California	San Francisco
10011	282	New York	New York
5862	260	Vermont	Peacham
27262	44	North Carolina	High Point
46404	431	Indiana	Gary
8534	359	New Jersey	Pennington
97067	688	Oregon	Welches
85718	348	Arizona	Tucson
38804	534	Mississippi	Tupelo
40353	353	Kentucky	Mt. Sterling
95446	537	California	Guerneville
52501	434	Iowa	Ottumwa
53215	620	Wisconsin	Milwaukee
44105	654	Ohio	Cleveland
73103	522	Oklahoma	Oklahoma City
89048	45	Nevada	Pahrump
38401	166	Tennessee	Columbia
53172	620	Wisconsin	South Milwaukee
2813	539	Rhode Island	Charlestown
791	74	Puerto Rico	Humacao
2330	102	Massachusetts	Carver
69361	247	Nebraska	Scottsbluff
66725	426	Kansas	Columbus
46204	494	Indiana	Indianapolis
40447	491	Kentucky	Mckee
28516	143	North Carolina	Beaufort
30124	77	Georgia	CAVE SPRING
3079	185	New Hampshire	Salem
49348	62	Michigan	Wayland
48101	379	Michigan	Allen Park
75009	339	Texas	Celina
89406	573	Nevada	Fallon
94704	246	California	Berkeley
2301	102	Massachusetts	Brockton
49855	354	Michigan	Marquette
39440	661	Mississippi	Laurel
19103	27	Pennsylvania	Philadelphia
22407	401	Virginia	Spotsylvania
54848	532	Wisconsin	Ladysmith
7079	677	New Jersey	SOUTH ORANGE
28217	676	North Carolina	Charlotte
82601	478	Wyoming	Casper
71854	259	Arkansas	Texarkana
30534	384	Georgia	Dawsonville
23970	676	Virginia	South Hill
50112	574	Iowa	Grinnell
98038	345	Washington	Maple Valley
95249	99	California	San Andreas
52172	592	Iowa	Waukon
40771	541	Kentucky	Corbin
71270	249	Louisiana	Ruston
76248	346	Texas	Keller
97131	458	Oregon	Nehalem
10924	165	New York	Goshen
32174	6	Florida	Ormond Beach
24015	723	Virginia	Roanoke
40165	706	Kentucky	Shepherdsville
83544	303	Idaho	Orofino
90210	490	California	Beverly Hills
28659	455	North Carolina	North Wilkesboro
45242	533	Ohio	Blue Ash
49858	101	Michigan	Menominee
1027	338	Massachusetts	Easthampton
48228	379	Michigan	Detroit
45014	533	Ohio	Fairfield
2633	183	Massachusetts	Chatham
72112	491	Arkansas	Newport
40059	50	Kentucky	Prospect
40356	154	Kentucky	Nicholasville
62010	460	Illinois	Bethalto
2882	539	Rhode Island	Narragansett
78209	315	Texas	San Antonio
85252	418	Arizona	Scottsdale
44333	663	Ohio	Akron
60622	577	Illinois	Chicago
45801	423	Ohio	Lima
57033	516	South Dakota	Hartford
63755	245	Missouri	Jackson
92373	207	California	Redlands
95125	12	California	San Jose
42320	376	Kentucky	Beaver Dam
62656	559	Illinois	Lincoln
50401	34	Iowa	Mason City
83702	356	Idaho	Boise City
19010	353	Pennsylvania	Bryn Mawr
2905	230	Rhode Island	Cranston
60626	577	Illinois	Chicago
68310	331	Nebraska	Beatrice
33904	534	Florida	Cape Coral
27403	44	North Carolina	Greensboro
70127	506	Louisiana	New Orleans
45701	535	Ohio	Athens
50140	49	Iowa	Lamoni
48188	379	Michigan	Canton
10538	156	New York	Larchmont
40347	363	Kentucky	Midway
49001	189	Michigan	Kalamazoo
81324	157	Colorado	Dove Creek
67230	631	Kansas	Wichita
66935	396	Kansas	Belleville
21663	318	Maryland	St. Michaels
17025	407	Pennsylvania	Enola
38632	461	Mississippi	Hernando
87532	569	New Mexico	Espanola
83440	460	Idaho	Rexburg
25962	225	West Virginia	Rainelle
20814	353	Maryland	Bethesda
29690	325	South Carolina	Travelers Rest
1760	466	Massachusetts	Natick
2050	102	Massachusetts	Marshfield
95928	447	California	Chico
22306	696	Virginia	Alexandria
17013	407	Pennsylvania	Carlisle
27804	198	North Carolina	Rocky Mount
5819	260	Vermont	St. Johnsbury
60098	14	Illinois	Woodstock
53530	119	Wisconsin	Darlington
80919	80	Colorado	Colorado Springs
6264	57	Connecticut	Scotland
30117	115	Georgia	Carrollton
13815	13	New York	Norwich
44308	663	Ohio	Akron
29566	597	South Carolina	Little River
46783	651	Indiana	Roanoke
27101	499	North Carolina	Winston-Salem
47303	88	Indiana	Muncie
60540	370	Illinois	Naperville
75693	67	Texas	Clarksville City
70420	268	Louisiana	Abita Springs
2420	466	Massachusetts	LEXINGTON
42025	551	Kentucky	Benton
22911	454	Virginia	Charlottesville
83330	122	Idaho	Gooding
15501	350	Pennsylvania	Somerset
1952	677	Massachusetts	Salisbury
20009	277	District of Columbia	Washington
29153	118	South Carolina	Sumter
12842	409	New York	INDIAN LAKE
92626	165	California	Costa Mesa
6810	224	Connecticut	Danbury
22980	414	Virginia	Waynesboro
28001	547	North Carolina	Albemarle
32435	540	Florida	DeFuniak Springs
96706	580	Hawaii	Ewa Beach
98109	345	Washington	Seattle
44304	663	Ohio	Akron
47460	399	Indiana	Spencer
66739	426	Kansas	Galena
24504	195	Virginia	Lynchburg
99114	141	Washington	Colville
13601	19	New York	Watertown
84032	624	Utah	Heber City
30311	639	Georgia	Atlanta
65741	355	Missouri	Rogersville
97138	79	Oregon	Seaside
80903	80	Colorado	Colorado Springs
1085	405	Massachusetts	Westfield
19446	353	Pennsylvania	Lansdale
63050	19	Missouri	Hillsboro
11207	31	New York	Brooklyn
53532	326	Wisconsin	DeForest
80023	562	Colorado	Westminster
55408	152	Minnesota	Minneapolis
32643	705	Florida	High Springs
45011	533	Ohio	Hamilton
43203	623	Ohio	Columbus
49080	62	Michigan	Plainwell
28023	192	North Carolina	China Grove
78401	220	Texas	Corpus Christi
97203	724	Oregon	Portland
15229	36	Pennsylvania	Pittsburgh
98022	345	Washington	Enumclaw
47396	88	Indiana	Yorktown
53206	620	Wisconsin	Milwaukee
20770	21	Maryland	Greenbelt
95370	163	California	Sonora
53582	440	Wisconsin	Ridgeway
66044	607	Kansas	Lawrence
41653	77	Kentucky	Prestonsburg
41075	647	Kentucky	Ft. Thomas
42717	407	Kentucky	Burkesville
93093	209	California	Simi Valley
67846	261	Kansas	Garden City
20250	277	District of Columbia	Washington
30188	426	Georgia	Woodstock
34114	273	Florida	Naples
28540	253	North Carolina	Jacksonville
91324	490	California	northridge
2906	230	Rhode Island	Providence
48442	270	Michigan	Holly
96797	580	Hawaii	Waipahu
8753	134	New Jersey	Toms River
98520	628	Washington	Aberdeen
17325	562	Pennsylvania	Gettysburg
30680	243	Georgia	Winder
80129	607	Colorado	Highlands Ranch
94947	560	California	Novato
60048	431	Illinois	Liberytville
46825	423	Indiana	Fort Wayne
24368	674	Virginia	Wytheville
94931	537	California	cotati
2874	539	Rhode Island	Saunderstown
2885	103	Rhode Island	Warren
55744	484	Minnesota	Grand Rapids
75119	693	Texas	Ennis
77406	398	Texas	Fulshear
10804	156	New York	New Rochelle
24070	341	Virginia	Catawba
1721	466	Massachusetts	Ashland
57747	413	South Dakota	Hot Springs
38619	720	Mississippi	Como
6759	589	Connecticut	Litchfeild
23231	306	Virginia	Henrico
41501	191	Kentucky	Pikeville
10460	167	New York	Bronx
60010	431	Illinois	Lake Barrington
90035	490	California	Los Angele
14865	608	New York	Montour Falls
94086	12	California	Sunnyvale
95403	537	California	Santa Rosa
48446	97	Michigan	Lapeer
7940	153	New Jersey	Madison
94510	456	California	Benicia
52101	612	Iowa	Decorah
95762	445	California	El Dorado Hills
37040	353	Tennessee	Clarksville
45402	353	Ohio	Dayton
59711	652	Montana	Anaconda
46613	178	Indiana	South Bend
46224	494	Indiana	Speedway
44224	663	Ohio	Stow
96826	580	Hawaii	Honolulu
15301	539	Pennsylvania	Washington
47441	397	Indiana	Linton
59034	5	Montana	Hardin
41001	647	Kentucky	Alexandria
90024	490	California	Los Angeles
56701	553	Minnesota	Thief River Falls
23505	377	Virginia	Norfolk
29621	284	South Carolina	Anderson
78227	315	Texas	San Antonio
98122	345	Washington	Seattle
42276	559	Kentucky	Russellville
7052	677	New Jersey	West Orange
41071	647	Kentucky	Newport
96714	475	Hawaii	Hanalei
47006	30	Indiana	Batesville
14779	308	New York	Salamanca
29501	400	South Carolina	Florence
50441	623	Iowa	Hampton
47933	353	Indiana	Crawfordsville
43130	224	Ohio	Lancaster
7820	650	New Jersey	Allamuchy
19127	27	Pennsylvania	Philadelphia
15370	639	Pennsylvania	Waynesburg
47710	52	Indiana	Evansville
6516	591	Connecticut	West Haven
44302	663	Ohio	Akron
21769	295	Maryland	Middletown
50126	288	Iowa	Iowa Falls
45223	409	Ohio	Cincinnati
55044	309	Minnesota	Lakeville
57752	420	South Dakota	Kyle
54911	641	Wisconsin	Appleton
65804	397	Missouri	Springfield
15801	180	Pennsylvania	DuBois
87102	136	New Mexico	Albuquerque
27510	165	North Carolina	Carrboro
2809	103	Rhode Island	Bristol
92262	500	California	Palm Springs
35811	460	Alabama	Huntsville
44281	358	Ohio	Wadsworth
65233	563	Missouri	Boonville
27536	488	North Carolina	Henderson
21217	148	Maryland	Baltimore
95519	159	California	McKinleyville
45231	409	Ohio	Cincinnati
53213	620	Wisconsin	Wauwatosa
3894	115	New Hampshire	Wolfeboro
94954	537	California	Petaluma
78550	271	Texas	Harlingen
63703	245	Missouri	Cape Girardeau
48185	379	Michigan	Westland
97007	539	Oregon	Aloha
48453	342	Michigan	Marlette
96701	580	Hawaii	Aiea
82801	279	Wyoming	Sheridan
36606	421	Alabama	Mobile
10964	87	New York	Palisades
93534	490	California	LANCASTER
92663	165	California	Newport Beach
98014	345	Washington	Carnation
16652	129	Pennsylvania	Huntingdon
14103	506	New York	Medina
62269	89	Illinois	O'Fallon
40241	19	Kentucky	Louisville
5486	53	Vermont	South Hero
85929	437	Arizona	Pinetop-Lakeside
23875	144	Virginia	Prince George
38225	606	Tennessee	Dresden
61053	115	Illinois	Mount Carroll
7424	442	New Jersey	Little Falls
98383	463	Washington	Silverdale
98831	275	Washington	Manson
56232	255	Minnesota	Dawson
37915	58	Tennessee	Knoxville 
42102	650	Kentucky	Bowling Green
27235	44	North Carolina	Colfax
45415	353	Ohio	Dayton
77074	95	Texas	Houston
20852	353	Maryland	North Potomac
94303	416	California	East Palo Alto
2857	230	Rhode Island	North Scituate
36276	502	Alabama	Wadley
17257	407	Pennsylvania	Shippensburg
43119	623	Ohio	Galloway
41056	473	Kentucky	Maysville
33129	604	Florida	Miami
44131	654	Ohio	Seven Hills
19968	43	Delaware	Milton
82701	234	Wyoming	Newcastle
41311	534	Kentucky	Beattyville
98027	345	Washington	Issaquah
48150	379	Michigan	Livonia
94110	692	California	San Francisco
77024	272	Texas	Houston
60640	577	Illinois	Chicago
99163	714	Washington	Pullman
79407	471	Texas	Lubbock
4862	58	Maine	Union
47403	572	Indiana	Bloomington
23116	216	Virginia	Mechanicsville
87001	301	New Mexico	San Felipe Pueblo
40207	19	Kentucky	Louisville
12186	254	New York	Voorheesville
20912	353	Maryland	Takoma Park
2122	314	Massachusetts	Dorchester
41301	8	Kentucky	Campton
61081	636	Illinois	Sterling IL
60142	14	Illinois	Huntley
32571	343	Florida	Pace
49512	190	Michigan	Kentwood
89703	349	Nevada	Carson City
46619	178	Indiana	South Bend
96766	475	Hawaii	Lihue
72933	623	Arkansas	Charleston
94568	246	California	Dublin
13367	581	New York	Lowville
90039	490	California	Los Angeles
2465	466	Massachusetts	West Newton
78602	408	Texas	Bastrop
99801	495	Alaska	Juneau
89408	609	Nevada	Fernley
91406	490	California	Van Nuys
40206	19	Kentucky	Louisville
54155	641	Wisconsin	Oneida
55952	41	Minnesota	Lewiston
98002	345	Washington	Auburn
97520	491	Oregon	Ashland
37375	623	Tennessee	Sewanee
27021	98	North Carolina	King
12140	188	New York	Poestenkill
72764	539	Arkansas	Springdale
4073	435	Maine	Sanford
44882	307	Ohio	Sycamore
22030	696	Virginia	Fairfax
47803	263	Indiana	Terre Haute
43206	623	Ohio	Columbus
76701	231	Texas	Waco
48111	379	Michigan	Belleville
10573	156	New York	Port Chester
979	489	Puerto Rico	Carolina
72126	675	Arkansas	Perryville
43302	494	Ohio	Marion
20010	277	District of Columbia	Washington
2830	230	Rhode Island	Harrisville
12565	391	New York	Village of Philmont
45693	562	Ohio	West Union
99218	646	Washington	Spokane
29020	364	South Carolina	Camden
7302	452	New Jersey	Jersey City
54495	394	Wisconsin	Wisconsin Rapids
19118	27	Pennsylvania	Philadelphia
64870	538	Missouri	Webb City
28216	676	North Carolina	Charlotte
6103	558	Connecticut	Hartford
54941	565	Wisconsin	Green Lake
97239	724	Oregon	Portland
32653	705	Florida	Gainesville
53717	326	Wisconsin	Madison
22473	76	Virginia	Heathsville
94609	246	California	Oakland
96707	580	Hawaii	Kapolei
88001	698	New Mexico	Las Cruces
48469	342	Michigan	Port Sanilac
66720	117	Kansas	Chanute
51101	40	Iowa	Sioux City
6883	224	Connecticut	Weston
42765	173	Kentucky	Munfordville
97211	724	Oregon	Portland
43072	56	Ohio	Saint Paris
19958	43	Delaware	Lewes
84009	296	Utah	South Jordan
38606	720	Mississippi	Batesville
60510	643	Illinois	Batavia
53704	326	Wisconsin	Madison
4064	435	Maine	Old Orchard Beach
43232	623	Ohio	Columbus
16354	2	Pennsylvania	Titusville
92104	582	California	San Diego
72632	115	Arkansas	Eureka Springs
53037	539	Wisconsin	Jackson
97116	539	Oregon	Forest Grove
27932	132	North Carolina	Edenton
98019	345	Washington	Duvall
72801	68	Arkansas	Russellville
77027	272	Texas	Houston
69130	384	Nebraska	Cozad
20743	21	Maryland	Capitol Heights
95672	445	California	Cameron Park
77045	95	Texas	Houston
22920	717	Virginia	Afton
99324	32	Washington	College Place
6515	591	Connecticut	New Haven
29003	54	South Carolina	Bamberg
43950	233	Ohio	St. Clairsville
53404	644	Wisconsin	Caledonia
97201	724	Oregon	Portland
83661	11	Idaho	Payette
98133	345	Washington	Shoreline
46044	460	Indiana	Frankton
64772	107	Missouri	Nevada
66524	128	Kansas	Overbrook
98070	345	Washington	Vashon
43420	483	Ohio	Fremont
11366	64	New York	Queens
90046	490	California	West Hollywood
95310	163	California	Columbia
77044	272	Texas	Houston
5148	57	Vermont	Londonderry
59701	668	Montana	Butte
41164	351	Kentucky	Olive Hill
18042	598	Pennsylvania	Easton
10457	167	New York	Bronx
40299	19	Kentucky	Jeffersontown
24151	623	Virginia	Rocky Mount
74363	9	Oklahoma	Quapaw
72401	229	Arkansas	Jonesboro
96795	580	Hawaii	Waimanalo
40031	50	Kentucky	La Grange
49503	190	Michigan	Grand Rapids
90042	490	California	Los Angeles
64402	55	Missouri	Albany
95247	99	California	Murphys
28752	61	North Carolina	Marion
68106	607	Nebraska	Omaha
23236	155	Virginia	Richmond
8109	285	New Jersey	Merchantville
22015	696	Virginia	Burke
41129	201	Kentucky	Catlettsburg
90232	490	California	Culver City
27540	633	North Carolina	Holly Springs
79382	471	Texas	Wolfforth
71845	119	Arkansas	Lewisville
78759	662	Texas	AUSTIN
33138	604	Florida	Miami
6076	470	Connecticut	Stafford Springs
58501	361	North Dakota	Bismarck
96822	580	Hawaii	Honolulu
19904	190	Delaware	Dover
98221	709	Washington	Anacortes
83226	480	Idaho	Challis
99645	39	Alaska	Palmer
14551	379	New York	sodus
92315	207	California	City of Big Bear Lake
96104	528	California	Cedarville
66071	335	Kansas	Paola
96734	580	Hawaii	Kailua
66030	337	Kansas	Gardner
49431	473	Michigan	LUDINGTON
31064	538	Georgia	Monticello
35115	660	Alabama	MONTEVALLO
97124	539	Oregon	Hillsboro
48734	642	Michigan	Frankenmuth
24482	690	Virginia	Verona
8807	350	New Jersey	Bridgewater
81645	531	Colorado	Minturn
94928	537	California	Rohnert Park
52052	493	Iowa	Guttenberg
53533	440	Wisconsin	Dodgeville
70528	368	Louisiana	Delcambre
68347	146	Nebraska	eagle
88030	712	New Mexico	Deming
30316	639	Georgia	Atlanta
43221	623	Ohio	Upper Arlington
93704	121	California	Fresno
99603	321	Alaska	Homer
75103	583	Texas	Canton
48858	615	Michigan	Mount Pleasant
82240	297	Wyoming	Torrington
53574	33	Wisconsin	New Glarus
55802	403	Minnesota	Duluth
1970	677	Massachusetts	Salem
90016	490	California	Los Angeles
84302	619	Utah	Brigham City
59754	460	Montana	Twin Bridges
75234	695	Texas	Farmers Branch
48047	557	Michigan	New Baltimore
37066	196	Tennessee	Gallatin
95667	445	California	Placerville
70116	506	Louisiana	New Orleans
80537	412	Colorado	Loveland
47630	291	Indiana	Newburgh
41011	340	Kentucky	Covington
52302	365	Iowa	Marion
5828	260	Vermont	Danville
46975	639	Indiana	Rochester
66604	96	Kansas	Topeka
75701	362	Texas	Tyler
2131	314	Massachusetts	Roslindale
46158	645	Indiana	Mooresville
19963	43	Delaware	Milford
57069	550	South Dakota	Vermillion
78634	71	Texas	Hutto
51555	193	Iowa	Missouri Valley
54166	510	Wisconsin	Shawano
89431	164	Nevada	Sparks
2126	314	Massachusetts	Mattapan
1810	677	Massachusetts	Andover
66203	337	Kansas	Shawnee
97205	724	Oregon	Portland
20715	21	Maryland	Bowie
33132	604	Florida	Miami
18067	598	Pennsylvania	Northampton
74467	232	Oklahoma	Wagoner
4011	407	Maine	Brunswick
6019	558	Connecticut	Collinsville
43756	645	Ohio	McConnelsville
33156	604	Florida	Pinecrest
88063	698	New Mexico	sunland park
12061	188	New York	East Greenbush
77051	95	Texas	Houston
62301	562	Illinois	QUINCY
67213	631	Kansas	Wichita
5301	57	Vermont	Brattleboro
2879	539	Rhode Island	Wakefield
93940	264	California	Monterey
37188	196	Tennessee	White House
41240	337	Kentucky	Paintsville
90028	490	California	Los Angeles
10038	282	New York	New York
12534	391	New York	Hudson
2840	507	Rhode Island	Newport
77096	272	Texas	Houston
96818	580	Hawaii	Honolulu
47018	614	Indiana	Dillsboro
30442	17	Georgia	Millen
98198	345	Washington	Des Moines
65775	465	Missouri	West Plains
2895	230	Rhode Island	Woonsocket
96027	375	California	Etna
3110	302	New Hampshire	Bedford
52001	436	Iowa	Dubuque
17019	435	Pennsylvania	Dillsburg
19104	27	Pennsylvania	Philadelphia
98337	463	Washington	Bremerton
98589	605	Washington	Tenino
55302	465	Minnesota	Annandale
90094	490	California	Playa Vista
23434	314	Virginia	Suffolk
41102	201	Kentucky	Ashland
28655	555	North Carolina	Morganton
38655	119	Mississippi	Oxford
1473	367	Massachusetts	Westminster
53118	161	Wisconsin	Dousman
63020	19	Missouri	DeSoto
48162	572	Michigan	Monroe
96789	580	Hawaii	Mililani
54209	106	Wisconsin	Egg Harbor
48625	305	Michigan	Harrison
56256	255	Minnesota	Madison
20653	374	Maryland	Lexington Park
97229	539	Oregon	Portland
32608	705	Florida	Gainesville
55343	152	Minnesota	Hopkins
46809	423	Indiana	Fort Wayne
99504	477	Alaska	Anchorage
68434	610	Nebraska	Seward
13165	509	New York	Waterloo
20850	353	Maryland	Rockville
29669	284	South Carolina	Pelzer
77020	95	Texas	Houston
10562	156	New York	Ossining
40342	284	Kentucky	Lawrenceburg
45211	409	Ohio	Cincinnati
80631	630	Colorado	Greeley
19002	353	Pennsylvania	Ambler
44702	104	Ohio	Canton
60521	370	Illinois	Hinsdale
85382	418	Arizona	Peoria
96788	580	Hawaii	Kaneohe
44286	663	Ohio	RICHFIELD
24319	200	Virginia	Chilhowie
23803	649	Virginia	Petersburg
83861	46	Idaho	St. Maries
20855	353	Maryland	Rockville
28602	37	North Carolina	Hickory
14546	572	New York	Scottsville
64118	550	Missouri	Gladstone
19128	27	Pennsylvania	Philadelphia
65203	65	Missouri	Columbia
78628	71	Texas	Georgetown
73801	298	Oklahoma	Woodward
20147	215	Virginia	Ashburn
46105	172	Indiana	bainbridge
96792	580	Hawaii	Waianae
96145	145	California	Tahoe City
40047	706	Kentucky	Mt.Washington
98106	345	Washington	Seattle
98107	345	Washington	Seattle
77396	272	Texas	Humble
60008	577	Illinois	Rolling Meadows
92111	582	California	San Diego
68102	607	Nebraska	Omaha
12518	165	New York	cornwall n.y.
44311	663	Ohio	Akron
1366	367	Massachusetts	Petersham
20895	353	Maryland	Kensington
6029	470	Connecticut	Ellington
49446	596	Michigan	New Era
93901	264	California	Salinas
64012	146	Missouri	Belton
77016	95	Texas	Houston
95435	431	California	Finley
78228	315	Texas	San Antonio
34604	716	Florida	Brooksville
78259	315	Texas	San Antonio
49630	472	Michigan	Empire
27526	633	North Carolina	Fuquay-Varina
43215	623	Ohio	Columbus
82633	48	Wyoming	Douglas
11222	31	New York	Brooklyn
70801	657	Louisiana	Baton Rouge
83642	356	Idaho	Meridian
7921	350	New Jersey	Bedminster
81624	7	Colorado	Collbran
96150	445	California	South Lake Tahoe
66749	423	Kansas	IOLA
53566	33	Wisconsin	Monroe
48739	214	Michigan	Hale
77494	272	Texas	Katy
78701	662	Texas	Austin
\.


--
-- Name: countries_c_id_seq; Type: SEQUENCE SET; Schema: markets; Owner: postgres
--

SELECT pg_catalog.setval('markets.countries_c_id_seq', 1, false);


--
-- Name: payment_methods_pay_id_seq; Type: SEQUENCE SET; Schema: markets; Owner: postgres
--

SELECT pg_catalog.setval('markets.payment_methods_pay_id_seq', 1, false);


--
-- Name: products_p_id_seq; Type: SEQUENCE SET; Schema: markets; Owner: postgres
--

SELECT pg_catalog.setval('markets.products_p_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: markets; Owner: postgres
--

SELECT pg_catalog.setval('markets.ratings_id_seq', 90, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: markets; Owner: postgres
--

SELECT pg_catalog.setval('markets.reviews_id_seq', 27, true);


--
-- Name: countries country_pk; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.countries
    ADD CONSTRAINT country_pk PRIMARY KEY (c_id);


--
-- Name: markets fmid_pk; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets
    ADD CONSTRAINT fmid_pk PRIMARY KEY (fmid);


--
-- Name: markets_payments market_payments_pk; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets_payments
    ADD CONSTRAINT market_payments_pk PRIMARY KEY (market_payments_id);


--
-- Name: markets_products market_product_pk; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets_products
    ADD CONSTRAINT market_product_pk PRIMARY KEY (market_product_id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (pay_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (p_id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: state_city state_city_pkey; Type: CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.state_city
    ADD CONSTRAINT state_city_pkey PRIMARY KEY (zip);


--
-- Name: state_city fk_city_state_countries; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.state_city
    ADD CONSTRAINT fk_city_state_countries FOREIGN KEY (c_id) REFERENCES markets.countries(c_id);


--
-- Name: reviews fk_fmid; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.reviews
    ADD CONSTRAINT fk_fmid FOREIGN KEY (fmid) REFERENCES markets.markets(fmid);


--
-- Name: ratings fk_fmid; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.ratings
    ADD CONSTRAINT fk_fmid FOREIGN KEY (fmid) REFERENCES markets.markets(fmid);


--
-- Name: markets_payments markets_categories_markets_fk; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets_payments
    ADD CONSTRAINT markets_categories_markets_fk FOREIGN KEY (payment_id) REFERENCES markets.payment_methods(pay_id);


--
-- Name: markets_products markets_fk; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets_products
    ADD CONSTRAINT markets_fk FOREIGN KEY (market_id) REFERENCES markets.markets(fmid);


--
-- Name: markets_payments markets_fk; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets_payments
    ADD CONSTRAINT markets_fk FOREIGN KEY (market_id) REFERENCES markets.markets(fmid);


--
-- Name: markets_products product_fk; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets_products
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES markets.products(p_id);


--
-- Name: markets zip_fk; Type: FK CONSTRAINT; Schema: markets; Owner: postgres
--

ALTER TABLE ONLY markets.markets
    ADD CONSTRAINT zip_fk FOREIGN KEY (zip) REFERENCES markets.state_city(zip);


--
-- PostgreSQL database dump complete
--

