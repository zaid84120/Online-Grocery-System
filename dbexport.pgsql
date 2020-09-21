--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category_details; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE category_details (
    categoryid integer NOT NULL,
    categoryname character varying(20) NOT NULL
);


ALTER TABLE public.category_details OWNER TO root;

--
-- Name: order_details; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE order_details (
    orderid integer,
    productid integer,
    quantity integer
);


ALTER TABLE public.order_details OWNER TO root;

--
-- Name: order_table; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE order_table (
    orderid integer NOT NULL,
    userid character varying(20) NOT NULL,
    totalamount integer,
    orderdate character varying(20)
);


ALTER TABLE public.order_table OWNER TO root;

--
-- Name: product_details; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE product_details (
    productid integer NOT NULL,
    categoryid integer,
    title character varying(40) NOT NULL,
    company character varying(20) NOT NULL,
    dealer character varying(20) NOT NULL,
    price double precision,
    quantity integer,
    description character varying(20) NOT NULL
);


ALTER TABLE public.product_details OWNER TO root;

--
-- Name: temp_detail; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE temp_detail (
    productid integer,
    categoryid integer,
    title character varying(20) NOT NULL,
    company character varying(20) NOT NULL,
    dealer character varying(20) NOT NULL,
    price integer,
    quantity integer,
    discription character varying(20) NOT NULL
);


ALTER TABLE public.temp_detail OWNER TO root;

--
-- Name: user_auth; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE user_auth (
    username character varying,
    password character varying(20)
);


ALTER TABLE public.user_auth OWNER TO root;

--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE user_profile (
    username character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    firstname character varying(20) NOT NULL,
    middlename character varying(20) NOT NULL,
    lastname character varying(20) NOT NULL,
    address1 character varying(20) NOT NULL,
    address2 character varying(20),
    city character varying(20) NOT NULL,
    state character varying(20) NOT NULL,
    pincode character varying(20),
    email character varying(40) NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE public.user_profile OWNER TO root;

--
-- Data for Name: category_details; Type: TABLE DATA; Schema: public; Owner: root
--

COPY category_details (categoryid, categoryname) FROM stdin;
1729	Dals & Pulses
9156	Edible Olis & Ghee
4689	Masalas & Spices
7033	Dry Fruits
7036	Ice Creams
8953	Beverages
6794	Frozen
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_details (orderid, productid, quantity) FROM stdin;
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_table (orderid, userid, totalamount, orderdate) FROM stdin;
\.


--
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: root
--

COPY product_details (productid, categoryid, title, company, dealer, price, quantity, description) FROM stdin;
5104	9156	Olive Oil	Borges	bigbasket	1286	600	(Extra Light)
1323	9156	Sunflower Oil	Fortune	bigbasket	93	500	(Sun Light)
9761	9156	Mustered Oil	Fortune	bigbasket	130	400	kachi ghani
9517	9156	Cow Ghee	DMart	DMart	125	300	(1 ltr pack)
6683	9156	Redefined SunFlower Oil	Dhara	DMart	100	300	(1 ltr pack)
1805	9156	Pure Ghee	Nandini	DMart	90	250	(1 ltr pack)
2961	9156	Active Edible Oil	Saffola	More	105	60	(1 ltr pack)
7241	9156	Tasty Edible Oil	Saffola	More	112	60	(1 ltr pack)
799	9156	Pure Ghee Cow	Mother dairy	More	422	68	(1 ltr pack)
1208	9156	Coconut Oil	KPL	More	283	90	(Shudhi)
2270	1729	Toor Dal	BB Royal	Reliance	399	250	(5-kg pouch)
1829	1729	Arhar Dal	BB Popular	DMart	385	600	(5kg pouch)
2730	1729	Peanuts Raw	BB Royal	bigbasket	149	400	(1kg pack)
3263	1729	Channa Kabuli	BB Royal	bigbasket	109	500	(1kg pack)
5618	1729	Urad Dal	BB Royal	Reliance	196	500	(1kg pack)
4004	1729	Masur Daal	BB Royal	DMart	99	100	(1kg pack)
1470	1729	Channa Daal	DMart	DMart	176	500	(1kg pack)
538	1729	Fried Garam	BB Popular	More	109	60	(1kg pack)
6243	1729	Rajma Kashmiri	BB Popular	More	24	60	(200 gram)
1274	1729	Urad Gota	BB Popular	More	196	60	(1kg pack)
6798	4689	Coconut Milk	Kara	Reliance	114	100	(1kg pack)
8153	4689	Mustered/Rai	BB Royal	Reliance	94	300	(1kg pack)
5624	4689	Phool Makhana	BB Royal	Reliance	119	60	(100 gram)
4284	4689	Tamarind	BB Royal	Reliance	55	300	(200 gram)
5492	4689	Methi	BB Royal	Reliance	89	400	(1kg pack)
9322	4689	Dhaniya Seeds	BB Popular	More	160	150	(1kg pack)
7043	4689	Black Peper	BB Popular	Reliance	111	60	(200 gram)
4038	4689	Ginger Garlic Paste	Dabur	DMart	39	300	(200 gram)
1457	4689	Elaichi Green	BB Royal	bigbasket	59	500	(50gram)
941	7033	Almond	Super Market	DMart	725	300	(1kg pack)
9388	7033	Cashew-whole	Super Market	DMart	1089	500	(1kg pack)
7870	7033	Cashew-broken	Super Market	DMart	177	100	(200 gram)
7204	7033	Walnut	Super Market	DMart	699	50	(500 gram)
9166	7033	Figs	Navajeevan	More	299	50	(200 gram)
4751	7033	Kishmish	Navajeevan	More	439	85	(1kg pack)
4458	7033	Pista	Navajeevan	More	359	250	(1kg pack)
4430	7033	Pumpkin Seeds	Navajeevan	More	195	100	(125 gram)
6268	7033	Dry Fruits-Mixed	Navajeevan	More	599	180	(500gm pack)
6148	7033	Canberries	Navajeevan	More	157	90	(125 gram)
3340	8953	Tata Tea Gold	Tata	bigbasket	359	100	(1kg pack)
4914	8953	Red Lable Tea	Red Lable	Reliance	203	100	(1kg pack)
4200	8953	Tajmahal Tea	Tajmahal	DMart	251	66	(1kg pack)
4513	8953	Mineral Water	Bisleri	Reliance	20	500	(1 ltr)
500	8953	Club Soda	Kinley	Reliance	17	60	(1 ltr)
1602	8953	Coca Cola	Coca Cola	bigbasket	33	100	(250 ML)
975	8953	Mango Drink	Frooti	bigbasket	105	600	(250 ml)
9622	8953	Orange Juice	Tropicana	bigbasket	390	69	(1kg pack)
3182	8953	Coffee Classic	Nescafe	More	246	60	(200 gram)
731	8953	Coffee Instant	Bru	DMart	310	45	(200 gram)
5590	6794	Green Peas	Safal	More	61	450	(500 gram)
9712	6794	Sweet Corn	Safal	DMart	71	120	(500 gram)
7997	6794	French - Fries	Mccain	Reliance	95	450	(500 gram)
9104	6794	Smilies	Mccain	Reliance	45	90	(500 gram)
9284	6794	Mixes Veggetables	Safal	bigbasket	120	45	(1kg pack)
5468	6794	Dry Fish	Cohere	bigbasket	75	100	(100 gram)
1736	6794	Graded Coconut	Cohere	Reliance	125	150	(200 gram)
6624	6794	Potato Nuggets	Mccain	bigbasket	110	220	(500 gram)
7416	8953	Health	Bournvita	Reliance	500	420	(1kg Pack)
7194	4689	Jeera	BB	bigbasket	319	250	(1kg Pack)
3342	6794	Patato	Mccain	Reliance	45	100	(200 gram)
\.


--
-- Data for Name: temp_detail; Type: TABLE DATA; Schema: public; Owner: root
--

COPY temp_detail (productid, categoryid, title, company, dealer, price, quantity, discription) FROM stdin;
2270	1729	Toor Dal	BB Royal	Reliance	399	250	(5-kg pouch)
1829	1729	Arhar Dal	BB Popular	DMart	385	600	(5kg pouch)
2730	1729	Peanuts Raw	BB Royal	bigbasket	149	400	(1kg pack)
3263	1729	Channa Kabuli	BB Royal	bigbasket	109	500	(1kg pack)
5618	1729	Urad Dal	BB Royal	Reliance	196	500	(1kg pack)
4004	1729	Masur Daal	BB Royal	DMart	99	100	(1kg pack)
1470	1729	Channa Daal	DMart	DMart	176	500	(1kg pack)
538	1729	Fried Garam	BB Popular	More	109	60	(1kg pack)
6243	1729	Rajma Kashmiri	BB Popular	More	24	60	(200 gram)
1274	1729	Urad Gota	BB Popular	More	196	60	(1kg pack)
\.


--
-- Data for Name: user_auth; Type: TABLE DATA; Schema: public; Owner: root
--

COPY user_auth (username, password) FROM stdin;
Administrator	Administrator
raaj	imraaj
neel	abc123
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY user_profile (username, password, firstname, middlename, lastname, address1, address2, city, state, pincode, email, phone) FROM stdin;
Administrator	Administrator	saeed		khan	shivdarshan pune		Pune	Maharashtra	411009	saeedkhan@gmail.com	9145737662
raaj	imraaj	raaj		shaikh	ghorpadi peth		Pune	Maharashtra	411042	raaj6677@gmail.com	8100900458
neel	abc123	neel		shah	125, ghord	Pune	Pune	Maharashtra	411002	abc@gmail.com	1234569870
\.


--
-- Name: category_details_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY category_details
    ADD CONSTRAINT category_details_pkey PRIMARY KEY (categoryid);


--
-- Name: order_table_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT order_table_pkey PRIMARY KEY (orderid);


--
-- Name: product_details_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_pkey PRIMARY KEY (productid);


--
-- Name: user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (username);


--
-- Name: order_details_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_details_orderid_fkey FOREIGN KEY (orderid) REFERENCES order_table(orderid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_details_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_details_productid_fkey FOREIGN KEY (productid) REFERENCES product_details(productid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_details_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES category_details(categoryid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_auth_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_auth
    ADD CONSTRAINT user_auth_username_fkey FOREIGN KEY (username) REFERENCES user_profile(username);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

