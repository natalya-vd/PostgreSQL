--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_subscribers; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_subscribers (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_community_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_subscribers OWNER TO gb_user;

--
-- Name: communities_subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_subscribers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_subscribers_id_seq OWNER TO gb_user;

--
-- Name: communities_subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_subscribers_id_seq OWNED BY public.communities_subscribers.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    user_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscribers_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscribers_users (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.subscribers_users OWNER TO gb_user;

--
-- Name: subscribers_users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscribers_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribers_users_id_seq OWNER TO gb_user;

--
-- Name: subscribers_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscribers_users_id_seq OWNED BY public.subscribers_users.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    user_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: communities_subscribers id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_subscribers ALTER COLUMN id SET DEFAULT nextval('public.communities_subscribers_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: subscribers_users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscribers_users ALTER COLUMN id SET DEFAULT nextval('public.subscribers_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	Urna Institute	31	2023-06-27 04:28:10
2	Mauris Blandit Inc.	6	2022-01-29 07:33:42
3	Vulputate Nisi Industries	54	2022-11-20 20:27:54
4	Non Quam Pellentesque Corp.	38	2022-03-18 21:04:05
5	Ultricies Ltd	84	2022-03-01 02:04:10
6	Et LLP	45	2021-12-01 00:00:51
7	Rutrum Magna Institute	57	2023-01-13 06:21:29
8	Scelerisque Dui Suspendisse Incorporated	99	2022-02-11 10:29:34
9	Nascetur Ridiculus Corporation	83	2023-07-06 12:30:09
10	Quis Pede PC	5	2022-05-26 12:41:10
11	Non Enim Limited	27	2022-07-03 06:54:46
12	Gravida Mauris Ut Company	19	2023-07-30 13:24:37
13	Quis Diam PC	65	2022-09-01 09:13:32
14	Mauris Rhoncus Id PC	25	2021-09-12 07:53:16
15	Dictum Eu Placerat Inc.	62	2023-05-12 17:55:32
16	Semper Nam PC	65	2023-03-15 20:58:55
17	Eget Mollis LLP	80	2021-12-31 21:10:51
18	Sapien Consulting	36	2023-07-25 09:45:15
19	Pellentesque Tincidunt Company	35	2023-05-01 04:40:21
20	Erat Vel Pede Foundation	68	2021-12-18 08:29:58
21	At Pretium Corp.	61	2021-08-14 20:32:57
22	Sem Nulla LLP	91	2022-01-09 02:33:11
23	Duis LLC	93	2022-08-27 21:16:38
24	Curabitur Massa Vestibulum Corp.	71	2022-06-29 09:29:53
25	Non Cursus Non Inc.	3	2023-04-06 23:09:22
26	Mauris Industries	29	2023-01-17 03:38:31
27	Tortor Nunc Inc.	35	2022-07-20 05:02:37
28	Metus Vivamus Euismod Ltd	13	2022-06-29 06:39:50
29	Ridiculus Mus Associates	21	2023-05-14 22:09:02
30	Aliquet Molestie Tellus LLC	59	2022-04-23 18:56:06
31	Tellus Associates	4	2022-04-23 18:18:22
32	Consequat Purus Limited	77	2021-12-17 07:35:43
33	Scelerisque Dui LLP	7	2021-10-11 15:36:42
34	Eu Limited	58	2022-07-12 21:27:22
35	Fringilla Euismod LLP	56	2023-07-15 21:09:45
36	Mattis Ornare Corporation	8	2021-08-20 05:52:40
37	Cum Sociis Foundation	33	2022-05-12 04:53:20
38	Eu Metus In Corp.	3	2023-01-17 08:45:36
39	Eleifend Nunc Institute	23	2021-09-14 14:34:20
40	Id Sapien Industries	84	2022-10-29 19:29:32
41	In Dolor Foundation	19	2023-01-06 21:34:08
42	Enim Non Associates	66	2023-05-10 18:14:51
43	Nullam LLC	51	2021-08-28 06:17:18
44	Interdum Enim Non Corp.	94	2022-01-30 12:38:57
45	Nunc Nulla Foundation	64	2021-10-25 03:43:02
46	At Ltd	49	2023-05-15 15:17:10
47	Ac Institute	49	2022-04-21 20:56:06
48	Nam Porttitor Institute	26	2022-11-08 19:49:48
49	Lacus LLC	18	2022-03-25 15:55:43
50	Accumsan Sed Incorporated	60	2022-10-29 11:09:14
51	Integer Vulputate PC	69	2022-12-18 23:06:52
52	Fermentum Fermentum Foundation	82	2022-02-22 09:39:07
53	Ultricies Adipiscing Associates	17	2022-12-16 04:46:10
54	Nunc Ltd	29	2023-07-06 06:49:42
55	Nulla Eget LLP	85	2021-12-10 03:46:40
56	Pharetra Corporation	16	2022-09-02 13:29:08
57	Convallis Erat Corp.	83	2022-04-15 07:53:54
58	Suspendisse Inc.	15	2022-07-06 23:20:31
59	Nulla Eget Institute	89	2023-01-31 23:04:02
60	Nulla Eget Industries	65	2022-03-17 03:15:41
61	Dictum Foundation	80	2023-06-24 17:31:25
62	Dui Incorporated	83	2021-12-25 00:16:26
63	Pede Ultrices Limited	60	2022-08-14 13:53:15
64	Sed Ltd	80	2022-07-21 10:21:51
65	Odio Auctor Consulting	96	2022-05-11 09:53:40
66	Lobortis Limited	44	2023-03-24 00:33:00
67	Velit Industries	45	2022-01-08 08:02:28
68	Lorem Ipsum Dolor Associates	43	2021-12-16 04:49:47
69	At Nisi Cum Institute	7	2022-01-14 14:24:58
70	Mauris Inc.	39	2022-04-18 23:12:27
71	Mauris Blandit LLP	9	2022-02-26 02:16:13
72	Ultrices LLP	90	2022-08-01 12:09:49
73	Diam Institute	42	2021-09-15 00:28:27
74	Metus In Institute	19	2021-12-16 20:51:37
75	Lacus Aliquam Company	99	2022-04-03 14:15:34
76	Commodo At Institute	40	2022-12-21 22:41:34
77	Vitae Incorporated	57	2022-09-20 20:49:48
78	Suspendisse Dui Corp.	57	2023-01-10 13:55:33
79	Vel Convallis Corporation	19	2023-07-16 03:46:53
80	Magna Et Ipsum Limited	83	2023-04-06 17:31:13
81	Vulputate Lacus Incorporated	34	2022-09-10 00:26:04
82	Sit LLP	71	2022-11-13 08:34:40
83	Dolor Sit Inc.	11	2022-05-07 07:18:02
84	Lobortis Quam Ltd	70	2022-05-26 10:29:06
85	Lacus Quisque Purus Associates	67	2023-04-06 10:20:58
86	Nonummy Ut Molestie Company	17	2023-03-31 23:12:43
87	Donec Incorporated	60	2022-01-07 10:10:56
88	Sed Et Libero Company	60	2023-08-04 05:29:57
89	Faucibus Foundation	71	2022-10-21 13:32:44
90	Sagittis Placerat Cras Institute	39	2022-12-20 14:50:57
91	Donec Est LLC	75	2022-11-22 23:30:36
92	Neque Sed Limited	79	2022-08-17 09:37:22
93	Non Magna Corporation	40	2022-09-12 02:28:55
94	Amet Incorporated	60	2022-09-15 18:10:45
95	Tellus Aenean Ltd	51	2022-02-05 17:22:56
96	Ultrices Posuere Ltd	11	2023-03-20 06:10:26
97	Vulputate Mauris Corporation	51	2022-03-07 16:05:39
98	Mi Aliquam Gravida Ltd	88	2023-05-25 20:44:50
99	Ligula Foundation	95	2022-12-11 20:31:14
100	Dictum Corp.	36	2022-06-30 23:13:44
\.


--
-- Data for Name: communities_subscribers; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_subscribers (id, from_user_id, to_community_id, created_at) FROM stdin;
1	8	43	2022-10-28 04:42:23
2	26	96	2023-08-11 05:06:40
3	40	68	2022-05-15 10:17:15
4	44	8	2021-10-10 15:56:32
5	29	48	2021-09-17 07:15:43
6	45	1	2022-08-18 15:42:44
7	25	94	2023-03-17 05:46:03
8	50	75	2022-12-19 00:14:45
9	67	85	2022-06-18 16:13:40
10	14	36	2022-10-06 23:13:32
11	5	46	2022-06-23 03:43:35
12	85	30	2021-11-01 20:08:32
13	15	52	2022-08-05 11:25:54
14	74	74	2023-01-05 20:30:31
15	98	17	2022-12-02 15:47:58
16	22	45	2023-07-25 21:55:25
17	85	58	2022-05-08 14:59:48
18	43	63	2023-07-05 08:52:23
19	94	32	2022-10-05 20:16:54
20	44	89	2023-01-16 10:28:02
21	66	93	2021-09-17 16:41:11
22	12	27	2022-09-17 06:12:17
23	59	59	2022-05-17 18:49:33
24	72	64	2022-03-30 01:24:12
25	32	90	2022-05-18 06:16:27
26	73	70	2023-06-18 02:17:26
27	88	35	2022-06-08 12:42:30
28	36	6	2021-10-29 21:29:50
29	73	27	2022-10-22 19:39:04
30	4	44	2022-02-08 01:21:24
31	61	54	2022-09-30 19:20:18
32	10	12	2021-09-04 06:15:54
33	74	51	2022-06-22 16:26:41
34	8	34	2022-02-18 03:04:31
35	62	95	2021-09-27 17:07:06
36	85	48	2021-10-20 15:34:47
37	58	3	2022-12-12 22:06:56
38	71	99	2022-03-24 08:42:20
39	3	53	2022-02-16 01:32:19
40	45	6	2022-11-05 23:31:58
41	46	64	2023-08-12 03:08:30
42	81	41	2022-01-22 03:22:57
43	23	87	2022-12-08 23:10:43
44	71	19	2021-09-22 22:11:10
45	88	53	2023-07-07 08:06:53
46	21	22	2022-08-20 14:47:31
47	23	50	2021-10-13 11:10:17
48	58	57	2022-03-06 23:47:23
49	16	39	2022-03-23 22:36:29
50	20	63	2023-06-25 15:55:40
51	73	43	2022-12-14 20:07:58
52	98	28	2022-02-20 22:36:37
53	81	14	2022-05-08 08:01:47
54	20	79	2022-12-03 18:20:39
55	46	73	2022-07-01 22:56:25
56	23	78	2021-08-17 20:50:33
57	73	87	2021-12-09 23:59:20
58	24	88	2022-03-20 14:58:56
59	14	44	2022-02-09 18:57:56
60	34	55	2022-06-10 20:21:37
61	3	74	2023-07-19 03:27:37
62	68	38	2022-11-03 19:56:31
63	32	60	2021-10-19 17:28:54
64	85	56	2022-06-03 09:50:54
65	81	69	2023-07-18 00:42:37
66	58	59	2022-06-13 00:10:42
67	36	54	2023-01-21 03:19:19
68	57	2	2022-10-24 10:18:05
69	87	27	2022-12-28 08:41:50
70	77	22	2023-02-05 17:30:45
71	11	62	2023-02-18 13:38:27
72	55	100	2023-08-02 22:18:45
73	37	15	2023-05-11 15:27:44
74	66	30	2022-08-17 18:47:13
75	39	5	2021-10-17 16:05:25
76	78	17	2022-03-01 05:21:29
77	78	35	2021-12-10 04:06:37
78	38	55	2022-06-19 01:45:56
79	70	70	2021-09-07 16:42:06
80	14	54	2021-11-29 00:33:02
81	97	46	2022-05-29 21:39:57
82	83	20	2021-10-02 01:46:40
83	52	31	2022-05-13 07:27:42
84	35	65	2022-10-23 21:20:48
85	4	77	2021-08-26 18:13:12
86	23	65	2021-12-25 08:34:39
87	37	53	2021-12-12 06:07:32
88	73	59	2023-02-06 06:46:09
89	95	20	2023-08-12 15:51:50
90	31	88	2023-07-09 08:10:10
91	5	17	2022-06-23 08:25:50
92	29	80	2022-09-25 01:41:27
93	25	43	2021-09-08 16:46:40
94	64	52	2022-06-17 20:58:27
95	92	88	2021-10-02 18:12:30
96	60	90	2021-10-07 05:17:46
97	62	85	2023-01-24 00:47:05
98	13	100	2023-06-13 17:09:00
99	92	18	2022-07-31 03:31:38
100	65	62	2023-03-24 14:11:25
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
84	53	2023-02-13 07:46:01
55	23	2023-03-20 11:33:01
51	24	2023-03-16 12:56:25
15	61	2023-01-03 21:38:44
70	71	2022-09-17 09:27:28
40	66	2023-02-03 03:00:50
80	45	2021-11-02 11:17:35
94	97	2023-05-21 07:04:14
42	76	2023-04-23 21:55:20
4	16	2023-02-28 15:59:33
3	98	2022-02-10 11:55:19
61	17	2022-11-07 02:30:21
93	43	2023-04-04 03:09:34
46	35	2021-10-09 12:30:27
9	37	2022-11-04 07:19:32
24	42	2021-11-19 13:39:12
34	55	2023-06-11 06:37:33
48	37	2021-09-02 18:49:40
78	87	2023-07-14 23:19:29
80	34	2022-01-20 06:32:15
95	27	2021-08-14 22:22:38
91	29	2022-08-08 05:17:16
81	63	2023-05-25 14:33:57
99	90	2022-12-11 07:02:52
9	31	2022-09-12 04:21:30
94	89	2021-10-17 12:58:12
42	22	2022-07-27 21:03:32
28	70	2022-08-20 06:16:04
50	11	2021-10-04 18:21:37
9	30	2023-05-11 15:49:23
65	96	2022-05-05 11:08:29
42	92	2023-02-11 10:58:10
32	93	2022-11-15 02:32:18
47	34	2022-07-05 09:46:39
43	59	2022-07-28 18:47:19
28	46	2023-07-11 06:05:38
98	99	2022-02-14 12:21:59
17	81	2023-07-26 12:08:17
68	77	2022-09-15 12:18:25
70	7	2022-01-25 05:54:46
35	19	2022-06-15 09:12:23
83	71	2022-12-17 21:47:11
55	73	2023-04-01 05:28:01
48	58	2023-03-02 10:03:58
47	62	2023-06-09 03:59:59
62	82	2022-05-01 01:06:00
63	85	2023-03-15 17:21:13
61	40	2023-06-04 22:32:55
76	25	2023-06-13 05:12:51
98	50	2022-05-01 12:24:37
56	50	2022-12-01 10:55:36
2	34	2021-11-20 10:40:45
4	88	2022-10-21 15:06:06
97	36	2021-10-11 12:16:49
29	42	2021-10-07 10:00:35
48	62	2023-03-08 00:42:24
60	42	2021-08-28 12:09:12
10	63	2022-03-13 04:21:14
45	43	2022-04-13 11:36:28
82	33	2022-10-01 01:08:44
98	51	2022-05-25 08:57:24
91	30	2022-03-15 18:44:12
25	13	2023-06-21 16:19:42
18	49	2022-10-17 22:42:55
6	1	2022-09-27 21:59:07
76	97	2021-08-18 17:07:32
76	89	2023-05-21 05:41:48
98	27	2023-08-12 17:57:11
74	88	2023-05-25 18:26:15
55	49	2022-04-05 09:48:56
10	39	2023-03-18 09:31:06
46	91	2022-06-21 11:46:46
26	41	2022-11-03 20:01:30
41	99	2023-06-17 19:56:00
72	81	2022-06-29 01:34:25
19	19	2022-04-08 02:25:00
78	10	2022-06-24 21:26:16
14	25	2023-04-17 03:37:09
59	62	2022-09-28 19:23:10
59	79	2022-08-20 11:36:17
57	86	2022-09-04 22:31:46
55	26	2023-03-21 16:09:40
42	82	2021-11-29 06:25:40
52	36	2022-10-18 11:39:46
79	81	2022-09-09 19:16:22
98	9	2023-04-09 09:36:48
8	19	2023-04-11 00:24:10
4	15	2022-01-11 19:13:48
72	29	2022-03-10 01:22:10
58	97	2022-02-03 16:38:30
87	78	2022-11-23 01:02:39
11	34	2023-06-19 04:40:16
6	10	2022-01-13 02:03:26
5	39	2022-07-17 09:10:15
42	40	2023-05-25 00:16:40
9	4	2023-05-22 19:09:02
72	71	2022-06-17 20:23:55
67	16	2022-06-05 17:45:24
70	33	2023-04-06 11:54:31
56	76	2021-11-12 14:14:28
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	35	21	5	2022-09-23 17:09:10	2023-07-17 18:22:06
2	52	71	4	2022-01-29 05:39:33	2023-07-16 05:03:48
3	97	56	1	2023-03-25 22:47:10	2021-11-25 03:27:25
4	98	27	5	2021-10-12 00:21:18	2022-09-13 12:39:55
5	23	77	5	2022-01-12 17:14:54	2022-05-07 22:41:56
6	29	48	1	2023-06-01 16:46:43	2021-09-09 15:16:30
7	80	94	1	2021-11-04 18:14:34	2022-12-23 21:19:48
8	50	66	2	2022-12-14 08:57:21	2022-02-19 15:53:05
9	51	14	4	2023-06-27 23:29:09	2023-02-11 17:28:39
10	27	30	2	2022-12-03 14:54:19	2022-12-09 13:33:55
11	66	15	2	2023-03-09 18:14:21	2021-09-30 14:20:11
12	18	84	4	2023-07-09 13:52:34	2022-12-01 00:28:59
13	76	43	5	2022-02-06 07:18:11	2023-05-11 17:45:42
14	21	57	5	2022-10-18 22:24:53	2022-01-14 09:30:46
15	20	68	3	2022-02-18 12:36:57	2022-11-21 07:13:26
16	78	10	3	2022-06-04 03:48:30	2022-06-18 00:14:21
17	78	62	4	2022-03-14 01:57:29	2023-05-14 23:11:55
18	29	11	4	2021-08-29 14:25:22	2023-02-18 04:13:35
19	69	65	4	2022-12-11 11:25:37	2021-10-15 06:11:13
20	35	36	2	2021-11-28 15:51:23	2022-03-09 00:26:44
21	16	58	4	2022-05-16 22:45:47	2023-06-03 19:38:19
22	30	3	1	2023-03-28 23:16:37	2022-01-07 23:51:05
23	5	41	3	2023-04-13 18:28:36	2022-11-03 06:46:38
24	67	82	2	2023-02-13 02:45:49	2021-09-16 18:08:56
25	27	47	2	2022-07-06 12:48:48	2021-12-26 05:19:12
26	59	41	4	2022-03-25 23:10:56	2023-03-18 23:33:15
27	45	72	2	2023-04-04 21:46:45	2022-03-27 17:23:19
28	63	94	5	2022-03-06 21:39:24	2022-09-29 19:46:25
29	64	25	3	2022-10-29 10:31:15	2021-10-31 13:14:04
30	59	82	3	2023-01-08 13:50:50	2022-12-02 17:02:16
31	30	26	4	2022-12-25 20:20:54	2023-07-16 06:24:53
32	80	99	5	2023-03-14 11:30:44	2022-07-27 14:34:41
33	59	84	4	2022-07-23 17:59:05	2021-09-07 02:05:20
34	44	17	1	2022-10-14 08:04:44	2023-01-17 15:39:41
35	43	80	2	2022-01-21 05:23:29	2022-05-13 14:40:04
36	100	100	3	2022-12-23 05:03:55	2022-12-25 04:12:46
37	48	13	2	2022-07-28 03:39:10	2023-07-23 17:21:44
38	21	63	2	2022-05-03 06:30:06	2022-05-18 00:22:25
39	67	47	2	2023-02-02 18:20:07	2021-10-10 13:26:13
40	67	84	2	2021-10-20 14:58:33	2022-06-14 12:05:55
41	9	56	4	2022-05-07 05:18:30	2021-12-07 11:40:11
42	69	84	4	2022-10-20 17:03:41	2022-01-16 08:05:45
43	12	48	4	2023-06-02 18:28:17	2022-05-24 07:35:25
44	84	27	2	2021-08-24 12:11:11	2021-09-08 23:45:41
45	10	37	5	2021-11-28 12:05:13	2022-08-22 21:47:26
46	67	4	3	2023-05-10 07:57:48	2022-06-09 17:15:12
47	20	82	1	2023-03-13 22:31:10	2022-02-22 13:20:20
48	25	49	2	2022-05-28 01:38:08	2022-10-01 16:46:22
49	57	72	2	2023-03-20 01:08:21	2023-07-14 07:08:56
50	83	14	3	2022-10-21 05:50:11	2021-09-16 04:08:34
51	91	41	3	2021-08-26 18:37:43	2023-08-04 01:32:17
52	3	81	3	2022-05-23 04:48:32	2022-04-16 12:03:14
53	3	64	4	2022-02-22 03:38:02	2022-08-23 20:39:24
54	48	30	3	2021-12-21 21:36:18	2022-02-06 14:02:10
55	56	68	4	2023-02-25 22:03:01	2022-10-29 11:25:24
56	15	63	3	2023-06-22 22:03:13	2021-08-16 07:18:41
57	64	88	1	2022-03-31 22:11:23	2022-11-13 14:45:13
58	4	35	2	2023-06-26 02:00:51	2023-01-04 16:19:36
59	47	20	5	2022-08-03 05:34:44	2022-07-13 02:26:34
60	3	84	4	2023-03-11 03:45:42	2022-11-23 22:30:48
61	92	51	2	2022-06-17 00:59:49	2022-02-02 21:32:01
62	61	98	4	2022-02-14 19:28:32	2022-06-16 06:59:19
63	72	94	5	2022-04-12 02:58:18	2023-03-15 05:30:52
64	31	1	3	2022-09-09 21:51:16	2021-11-09 13:59:44
65	49	92	4	2023-01-23 11:52:49	2022-05-17 02:01:43
66	66	34	3	2023-02-14 03:31:16	2021-08-23 01:01:38
67	59	21	4	2022-01-04 22:10:25	2023-05-18 19:34:38
68	94	42	4	2023-01-12 11:30:07	2022-04-13 05:25:29
69	98	80	2	2023-06-16 18:17:11	2022-02-23 13:45:57
70	56	66	4	2023-04-10 21:16:43	2021-09-20 21:14:05
71	23	9	2	2022-08-02 23:30:31	2023-03-03 17:03:03
72	13	38	3	2023-06-08 11:45:24	2022-06-25 14:09:06
73	80	48	1	2022-09-28 20:35:46	2022-04-09 04:03:12
74	97	17	4	2022-08-16 03:41:42	2021-08-31 22:40:58
75	88	58	2	2022-08-13 05:33:32	2022-07-01 08:11:29
76	70	35	4	2023-01-12 11:32:57	2023-05-17 23:41:16
77	70	29	4	2022-02-07 11:14:05	2023-06-14 14:45:22
78	27	52	3	2023-03-25 23:38:14	2022-02-01 00:39:08
79	38	95	1	2022-11-16 02:43:42	2021-10-17 22:49:27
80	46	94	1	2021-10-17 10:40:31	2023-02-07 15:31:12
81	90	73	3	2022-04-06 14:19:18	2021-10-01 00:44:26
82	38	100	4	2023-04-30 09:14:52	2022-08-15 14:32:24
83	48	50	5	2022-04-17 14:17:02	2023-07-18 20:53:03
84	25	15	1	2021-12-18 21:31:40	2022-08-27 22:56:04
85	46	95	2	2023-03-23 03:06:13	2023-03-27 01:19:35
86	46	95	4	2022-07-13 14:13:32	2023-06-19 15:19:27
87	37	75	3	2022-06-02 20:45:26	2022-04-30 17:20:40
88	51	18	3	2021-11-12 11:41:33	2023-06-14 11:10:08
89	43	78	5	2022-05-07 21:24:58	2022-11-14 03:06:42
90	91	52	1	2021-09-19 00:27:37	2023-04-07 12:01:21
91	61	25	1	2022-01-31 07:58:22	2022-11-02 19:26:28
92	34	34	1	2022-08-20 20:20:33	2022-09-25 23:00:48
93	97	96	2	2022-05-19 23:22:57	2021-11-06 19:50:05
94	31	3	3	2022-02-22 23:50:25	2023-05-24 00:06:32
95	93	27	2	2022-05-16 17:47:36	2023-03-06 09:29:57
96	20	20	2	2022-05-02 14:03:24	2023-03-24 19:55:38
97	100	97	2	2021-08-31 02:03:43	2022-09-10 20:26:49
98	42	8	4	2022-12-23 22:17:46	2021-11-07 03:57:49
99	93	49	4	2022-02-14 20:25:12	2023-04-08 04:54:18
100	49	78	3	2022-12-23 06:16:27	2022-08-08 05:19:24
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	elementum
2	ornare
3	cubilia
4	Phasellus
5	orci
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	4	82	enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a,	f	t	2022-12-30 07:32:16
2	27	30	convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit	t	f	2022-06-26 22:41:25
3	27	15	sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque.	f	f	2022-09-24 09:11:32
4	61	54	gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce	t	f	2022-11-22 03:28:55
5	22	46	Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.	f	t	2022-09-22 18:13:25
6	35	97	est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non	t	f	2021-09-01 19:34:08
7	62	3	neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,	f	f	2021-12-24 03:06:10
8	52	52	cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy	f	f	2022-11-12 03:09:52
9	43	60	dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus	f	t	2022-10-11 16:38:08
10	4	98	ante ipsum primis in faucibus	f	t	2023-06-14 05:10:07
11	52	51	commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et,	t	f	2023-02-21 04:47:38
12	82	95	sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus.	t	t	2021-12-26 16:34:41
13	68	53	aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit	f	f	2023-01-30 16:59:03
14	3	71	Mauris vel turpis. Aliquam adipiscing lobortis risus. In	t	f	2023-06-21 16:55:27
15	90	87	lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo	t	t	2022-11-25 18:01:41
16	81	83	vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.	f	f	2022-01-10 13:38:59
17	22	98	parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed	t	t	2023-05-21 23:11:20
18	14	36	erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat	f	f	2023-01-28 08:22:40
19	93	98	amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum	f	f	2022-07-15 17:28:49
20	46	7	sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis	f	t	2022-09-21 04:46:08
21	40	5	venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi	f	f	2022-07-17 15:26:01
22	37	97	Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat	t	t	2022-04-08 04:05:31
23	53	24	Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,	f	f	2023-03-05 05:11:31
24	89	99	convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	f	f	2022-10-20 11:16:11
25	60	72	a, dui. Cras pellentesque. Sed dictum. Proin eget	f	f	2022-08-01 23:07:36
26	35	73	tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus	t	t	2022-03-18 05:35:29
27	99	87	ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis.	f	f	2023-05-08 05:45:33
28	60	29	Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem	t	f	2022-03-24 02:43:45
29	31	27	auctor ullamcorper, nisl arcu iaculis enim, sit amet	t	t	2022-06-03 23:44:14
30	35	95	ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,	f	t	2023-04-23 22:44:20
31	85	26	ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla	f	t	2022-12-31 10:29:10
32	26	90	blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis	t	t	2022-10-15 10:00:48
33	72	16	semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam	t	f	2021-10-06 06:57:14
34	18	95	fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis	t	f	2022-08-25 06:55:31
35	56	79	congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate	f	f	2022-12-26 04:25:48
36	10	78	mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem.	t	t	2023-07-26 21:47:45
37	12	72	ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat.	t	f	2023-06-20 05:55:33
38	34	64	pede. Cum sociis natoque penatibus et magnis dis parturient	f	t	2021-10-08 12:54:43
39	12	15	quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at	f	t	2022-08-22 18:38:00
40	60	51	ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et	t	f	2022-06-26 23:41:20
41	68	86	sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at,	f	f	2023-04-14 23:34:38
42	68	51	arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros	t	f	2022-01-20 23:50:00
43	12	31	at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit	f	f	2023-06-26 06:24:42
44	62	46	aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras	t	f	2022-04-25 18:19:40
45	36	78	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit	f	f	2023-02-04 04:38:52
46	73	13	turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla	t	t	2022-09-22 17:49:47
47	73	72	elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam	f	t	2023-01-15 07:13:26
48	53	79	Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem	t	f	2021-11-18 02:48:52
49	11	55	risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus.	t	f	2022-08-14 13:37:06
50	43	3	iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum	t	t	2021-09-22 12:33:04
51	80	26	volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut	f	f	2022-05-04 13:16:05
52	17	97	massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus	f	t	2022-12-31 05:34:37
53	59	73	Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor	t	t	2022-10-20 04:56:50
54	1	54	Aliquam gravida mauris ut mi. Duis risus odio, auctor	t	t	2022-06-12 05:23:13
55	26	84	dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede	t	f	2022-01-09 16:10:00
56	70	98	consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo	t	t	2021-11-30 02:03:25
57	22	95	non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,	f	t	2023-07-19 15:31:58
58	40	47	sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing	t	t	2023-05-19 08:17:06
59	38	21	dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae	t	t	2022-09-16 11:05:04
60	26	75	luctus et ultrices posuere cubilia Curae Phasellus ornare.	f	t	2022-12-15 17:07:32
61	10	45	adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum	f	f	2023-03-24 01:51:29
62	76	70	risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce	f	f	2022-02-13 16:52:09
63	64	43	luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos	t	f	2023-03-17 19:10:25
64	20	87	nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit	f	f	2022-10-29 20:56:08
65	100	36	consectetuer euismod est arcu ac orci. Ut semper pretium	t	f	2022-07-29 07:41:23
66	82	20	nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus	t	f	2021-08-29 22:36:35
67	69	48	dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at	f	t	2022-04-10 21:39:06
68	59	49	sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus.	t	f	2023-01-17 17:12:43
69	17	44	risus a ultricies adipiscing, enim mi tempor lorem, eget	f	f	2023-05-02 08:00:35
70	37	27	ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula.	f	t	2022-05-05 21:21:25
71	93	51	Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,	f	t	2021-11-24 23:19:20
72	11	80	augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing	t	f	2021-12-21 00:09:27
73	42	21	nibh enim, gravida sit amet, dapibus	t	t	2022-12-06 06:25:54
74	69	41	Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,	t	f	2022-05-06 12:42:43
75	44	64	Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a	f	f	2022-04-16 17:38:18
76	18	92	sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci,	f	t	2022-07-18 12:16:27
77	26	10	at auctor ullamcorper, nisl arcu iaculis enim,	t	f	2022-07-20 09:23:09
78	78	99	Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum	f	t	2023-01-28 22:29:42
79	53	93	augue ut lacus. Nulla tincidunt, neque	t	f	2021-08-28 07:01:25
80	4	65	arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus	f	t	2022-11-08 04:31:39
81	41	42	magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu.	f	f	2022-06-24 04:54:15
82	38	98	ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero	t	t	2022-05-31 21:54:08
83	20	54	Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,	f	f	2023-08-02 04:47:37
84	21	2	velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel	f	f	2023-06-15 08:11:12
85	43	66	erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus	f	t	2022-10-18 01:59:22
86	63	31	mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed	t	t	2021-12-19 20:28:52
87	23	46	Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum	t	f	2022-04-15 13:08:33
88	69	29	gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum	t	f	2022-07-27 14:33:44
89	71	49	ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam	f	f	2022-09-24 14:20:00
90	37	18	a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus	t	t	2022-07-25 10:20:07
91	51	62	turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed	t	t	2023-01-18 06:36:44
92	13	87	felis. Donec tempor, est ac mattis semper, dui lectus rutrum	f	t	2021-12-31 06:32:06
93	90	46	luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris	t	f	2023-06-23 17:00:15
94	60	7	hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor	t	t	2022-04-21 18:13:02
95	53	45	ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer	f	f	2023-05-25 22:11:36
96	91	35	diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet	f	t	2023-04-11 13:25:01
97	76	98	taciti sociosqu ad litora torquent per conubia nostra,	f	t	2023-01-13 01:36:14
98	30	80	Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem,	f	t	2023-02-17 17:55:06
99	40	28	erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac	t	t	2023-01-03 09:13:18
100	25	91	odio. Etiam ligula tortor, dictum eu, placerat	f	t	2022-01-06 12:57:04
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, user_id, description, uploaded_at, size) FROM stdin;
1	https://naver.com/user/110	75	amet, consectetuer	2021-11-08 14:51:05	528
2	https://ebay.com/en-us	61	lacus. Etiam bibendum fermentum metus. Aenean	2022-01-13 17:38:33	880
3	http://nytimes.com/sub	47	pede. Praesent eu	2022-02-17 16:36:17	719
4	http://instagram.com/sub/cars	44	metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien.	2023-05-16 23:17:09	853
5	https://bbc.co.uk/sub1	63	felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis	2023-05-15 16:30:19	457
6	https://nytimes.com/fr	96	massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel	2022-10-25 11:17:06	262
7	http://instagram.com/settings	84	non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean	2023-04-02 18:31:01	408
8	http://whatsapp.com/sub	95	lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non	2022-05-10 13:51:37	487
9	https://yahoo.com/group/9	96	eu sem. Pellentesque ut	2021-12-16 12:28:31	493
10	https://bbc.co.uk/sub2	64	Donec est mauris, rhoncus	2021-11-15 21:55:45	367
11	http://twitter.com/sub	66	arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales	2021-12-07 10:46:03	572
12	http://pinterest.com/en-us	17	convallis est,	2022-02-19 12:56:44	248
13	http://google.com/sub/cars	51	nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus	2021-12-14 14:11:29	174
14	https://whatsapp.com/fr	21	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,	2022-12-19 02:12:44	855
15	https://nytimes.com/sub	20	Praesent interdum ligula	2022-08-03 21:10:55	696
16	https://nytimes.com/en-us	66	quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.	2022-02-10 08:11:25	87
17	http://guardian.co.uk/en-us	45	id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc	2022-10-23 10:21:16	22
18	https://netflix.com/fr	46	cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet	2022-10-11 07:24:28	831
19	https://instagram.com/group/9	27	Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at	2023-06-06 07:45:37	865
20	https://yahoo.com/site	73	commodo tincidunt nibh. Phasellus	2022-02-05 12:49:14	616
21	http://yahoo.com/group/9	10	sit amet	2021-12-19 18:49:53	34
22	https://walmart.com/sub	86	Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla	2022-08-11 21:21:53	908
23	https://baidu.com/one	87	in faucibus orci luctus et ultrices posuere cubilia Curae	2022-08-10 17:39:41	194
24	https://twitter.com/settings	50	mus. Proin	2023-07-11 15:36:39	438
25	http://facebook.com/one	47	cursus, diam at	2023-02-18 06:22:48	915
26	https://google.com/en-ca	66	dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.	2022-03-22 11:32:15	147
27	http://bbc.co.uk/settings	4	Quisque nonummy	2022-12-29 13:11:20	732
28	http://nytimes.com/en-ca	80	dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus	2023-07-28 17:12:19	663
29	https://twitter.com/one	44	vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida	2023-01-10 19:31:16	329
30	https://pinterest.com/en-us	42	ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus	2021-10-11 06:22:36	885
31	https://youtube.com/site	32	velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim	2023-02-05 14:46:42	164
32	https://google.com/en-ca2	77	vel, venenatis	2021-11-24 11:07:44	334
33	https://netflix.com/site	32	Cras eget nisi	2021-12-29 17:15:24	588
34	https://ebay.com/group/9	8	consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies	2023-05-01 14:39:31	907
35	http://walmart.com/sub	88	Cras convallis convallis dolor. Quisque	2023-05-13 13:44:56	877
36	https://twitter.com/site	38	dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique	2022-01-24 05:15:32	231
37	http://reddit.com/en-ca	28	eleifend egestas.	2021-12-10 23:39:42	610
38	http://cnn.com/en-us	26	imperdiet non, vestibulum nec, euismod in, dolor. Fusce	2023-07-29 05:06:32	679
39	https://naver.com/one	88	Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada	2022-07-05 13:10:51	193
40	http://yahoo.com/settings	36	massa lobortis ultrices. Vivamus rhoncus.	2023-05-09 22:04:42	904
41	http://yahoo.com/settings2	30	at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus.	2021-08-30 21:14:24	545
42	http://walmart.com/one	95	tempor arcu. Vestibulum ut	2022-04-07 18:08:28	370
43	https://youtube.com/sub/cars	3	Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam	2022-03-13 21:06:50	782
44	http://reddit.com/sub/cars	34	ac urna.	2021-10-05 21:07:41	418
45	http://google.com/user/110	85	adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero	2022-10-04 10:00:38	685
46	https://bbc.co.uk/user/110	22	et ipsum cursus vestibulum.	2022-03-13 13:59:34	43
47	http://instagram.com/settings2	80	egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui	2023-03-25 04:59:39	342
48	https://bbc.co.uk/sub3	50	convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,	2022-04-25 04:46:22	319
49	http://nytimes.com/user/110	51	ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum	2022-10-27 00:36:26	399
50	http://instagram.com/en-us	91	Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,	2023-01-08 23:56:51	180
51	http://pinterest.com/user/110	53	tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus	2022-05-28 05:51:51	221
52	http://bbc.co.uk/en-ca	30	vel lectus. Cum	2022-06-22 21:40:25	788
53	https://guardian.co.uk/one	75	dictum cursus. Nunc mauris elit, dictum eu, eleifend	2023-05-04 17:47:17	785
54	http://nytimes.com/sub/cars	32	ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac	2022-12-13 13:21:43	627
55	https://cnn.com/fr	11	bibendum ullamcorper.	2022-04-08 09:09:34	100
56	http://bbc.co.uk/sub/cars	78	sit amet luctus vulputate, nisi sem semper erat, in	2021-08-29 12:57:01	468
57	http://guardian.co.uk/sub	23	eu tellus. Phasellus elit pede, malesuada vel,	2023-06-21 02:51:38	935
58	http://youtube.com/sub/cars	41	fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam	2022-03-23 20:34:05	514
59	https://zoom.us/en-us	73	egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris	2022-01-30 15:06:18	706
60	https://wikipedia.org/sub	17	dis parturient montes, nascetur ridiculus mus. Proin vel arcu	2021-11-19 04:50:28	184
61	http://walmart.com/site	31	egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem	2022-10-22 07:43:42	485
62	https://facebook.com/site	40	pharetra nibh. Aliquam ornare,	2022-05-22 09:47:06	474
63	http://google.com/settings	5	aliquet magna a neque. Nullam ut nisi a odio	2022-04-08 14:52:41	19
64	http://yahoo.com/sub/cars	21	a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis	2023-05-17 06:20:38	420
65	http://zoom.us/fr	56	hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio,	2022-03-31 15:31:48	143
66	https://instagram.com/en-us	47	id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus	2022-08-16 10:50:18	294
67	http://google.com/one	46	molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim.	2022-02-16 11:07:07	93
68	https://reddit.com/sub	9	quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus	2021-10-02 19:55:31	493
69	https://naver.com/sub	72	Aenean eget magna.	2022-11-15 13:10:28	363
70	http://nytimes.com/group/9	70	lectus ante dictum mi, ac	2021-08-21 20:59:46	639
71	https://google.com/sub	56	et,	2022-04-29 17:48:39	430
72	http://whatsapp.com/site	8	Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor	2022-03-28 13:24:17	243
73	http://netflix.com/en-us	71	Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.	2022-12-14 02:57:12	848
74	https://ebay.com/site	55	laoreet lectus quis massa. Mauris vestibulum, neque sed	2021-10-23 02:20:13	316
75	http://youtube.com/fr	43	in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit	2021-10-11 17:54:21	107
76	http://netflix.com/sub/cars	50	Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus,	2023-05-19 09:55:13	55
77	http://instagram.com/group/9	28	nec orci. Donec nibh. Quisque nonummy ipsum non	2022-09-06 05:28:02	976
78	http://whatsapp.com/group/9	22	Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae	2023-01-21 00:22:38	292
79	https://reddit.com/settings	25	Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque	2021-11-03 20:02:54	875
80	http://zoom.us/en-us	73	aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit	2022-01-01 18:52:58	768
81	https://youtube.com/en-ca	95	volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean	2022-03-14 16:28:43	871
82	http://wikipedia.org/settings	24	In	2022-12-01 12:35:44	996
83	http://google.com/one2	9	nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc	2022-03-23 06:29:22	118
84	https://zoom.us/sub	58	ullamcorper eu, euismod ac, fermentum vel,	2022-06-20 16:53:00	243
85	https://google.com/group/9	9	erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et	2022-10-20 19:16:12	175
86	http://wikipedia.org/user/110	74	feugiat nec, diam. Duis mi enim,	2022-06-11 02:03:19	434
87	https://twitter.com/group/9	83	Phasellus	2022-11-16 22:15:07	193
88	https://walmart.com/en-us	39	lacus. Quisque purus	2023-07-14 21:47:11	625
89	http://cnn.com/en-us2	93	varius ultrices, mauris ipsum porta elit, a feugiat	2023-03-24 21:44:00	363
90	http://facebook.com/sub/cars	11	Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.	2023-05-06 06:30:53	113
91	http://yahoo.com/fr	19	lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras	2022-09-24 04:27:13	209
92	https://walmart.com/one2	43	sapien. Aenean massa. Integer vitae nibh.	2022-07-15 04:35:15	247
93	https://wikipedia.org/site	48	In	2022-01-01 18:19:43	664
94	http://instagram.com/en-us2	55	non, lacinia	2022-01-26 00:39:09	128
95	https://walmart.com/one	83	odio semper cursus. Integer mollis. Integer tincidunt aliquam	2022-01-25 16:59:30	780
96	https://baidu.com/settings	73	Maecenas malesuada fringilla	2023-08-02 05:39:46	242
97	http://netflix.com/fr	54	ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a	2023-03-24 18:12:20	187
98	http://ebay.com/one	95	Suspendisse commodo tincidunt nibh. Phasellus nulla.	2022-12-11 22:29:50	420
99	https://reddit.com/fr	89	per conubia nostra,	2023-01-24 14:10:15	830
100	https://pinterest.com/settings	56	odio	2021-09-21 09:39:32	31
\.


--
-- Data for Name: subscribers_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscribers_users (id, from_user_id, to_user_id, created_at) FROM stdin;
1	96	82	2022-08-02 01:27:18
2	64	58	2023-02-15 04:27:22
3	83	94	2022-01-26 15:44:15
4	12	25	2022-06-30 23:47:43
5	28	24	2022-07-10 12:21:16
6	76	31	2022-04-21 19:23:34
7	83	83	2023-06-12 15:54:17
8	96	43	2023-06-08 11:44:27
9	35	92	2023-01-22 06:00:00
10	68	67	2022-12-20 02:54:08
11	60	95	2022-06-22 21:53:49
12	15	3	2023-04-27 03:13:30
13	73	98	2021-12-14 15:54:45
14	35	10	2022-07-24 08:21:11
15	98	95	2022-02-22 18:03:35
16	40	99	2022-07-14 20:26:23
17	73	23	2023-06-09 01:34:17
18	85	58	2022-02-17 10:16:27
19	79	14	2023-02-18 02:44:24
20	73	76	2022-04-13 03:40:55
21	38	15	2023-01-09 22:35:49
22	94	35	2022-10-16 04:06:53
23	84	92	2023-03-08 03:49:14
24	81	5	2022-02-27 08:52:20
25	61	54	2022-09-04 14:51:11
26	13	83	2023-04-16 13:09:41
27	49	17	2023-01-22 17:00:26
28	86	93	2022-01-29 00:31:41
29	3	42	2022-01-01 13:06:37
30	71	87	2021-11-08 09:30:16
31	31	41	2022-01-06 19:28:53
32	27	24	2022-06-24 17:16:46
33	37	96	2023-04-30 13:51:10
34	80	94	2022-11-23 12:30:11
35	36	66	2022-09-20 14:41:59
36	5	60	2022-05-13 07:28:23
37	98	68	2022-06-22 12:36:05
38	55	93	2022-01-26 21:40:36
39	19	14	2023-03-02 17:02:16
40	16	81	2023-02-18 20:51:50
41	23	51	2023-03-01 05:29:07
42	47	23	2021-11-20 19:36:27
43	89	17	2021-10-22 16:34:24
44	57	55	2023-05-27 19:58:02
45	44	7	2022-04-01 05:02:05
46	33	18	2022-12-26 02:48:10
47	56	74	2022-05-01 22:13:11
48	32	3	2023-02-13 17:00:57
49	78	15	2023-03-22 03:59:41
50	27	71	2023-07-16 23:42:52
51	77	53	2023-05-04 23:21:54
52	97	13	2022-11-26 10:13:55
53	66	50	2021-11-16 07:07:29
54	12	14	2023-02-15 03:53:31
55	59	95	2022-08-23 03:45:22
56	91	19	2023-04-30 20:39:13
57	72	64	2022-02-28 19:05:43
58	46	60	2023-06-30 04:13:32
59	54	94	2022-02-18 23:59:27
60	61	22	2022-01-22 02:57:18
61	11	5	2023-07-19 21:06:46
62	27	95	2022-02-22 03:39:15
63	75	70	2022-09-04 04:10:24
64	19	73	2022-05-22 07:14:00
65	32	16	2022-08-02 01:48:58
66	75	18	2023-06-27 01:06:16
67	20	17	2022-06-03 19:53:30
68	47	39	2023-06-29 23:51:43
69	93	33	2022-09-10 19:00:32
70	22	14	2022-05-07 02:46:35
71	86	87	2022-01-13 22:32:37
72	54	87	2022-06-03 00:04:28
73	59	33	2022-11-27 23:58:42
74	6	69	2023-04-30 07:14:20
75	77	20	2022-02-24 16:53:59
76	65	30	2022-05-26 11:14:07
77	68	14	2022-10-11 06:04:23
78	50	39	2023-07-12 14:49:16
79	7	69	2022-01-10 15:11:20
80	83	8	2023-06-16 00:06:17
81	6	85	2022-05-15 08:57:33
82	66	10	2021-09-28 18:03:51
83	21	69	2022-08-02 20:44:32
84	13	92	2023-07-04 12:19:24
85	46	67	2022-02-21 09:35:18
86	73	44	2021-10-07 21:13:26
87	57	66	2023-01-11 13:17:13
88	69	92	2021-11-27 11:41:17
89	63	50	2023-01-22 17:13:22
90	3	24	2022-03-22 22:46:01
91	58	33	2022-11-15 01:03:00
92	76	25	2022-06-27 03:02:24
93	46	32	2021-09-29 08:03:21
94	43	15	2022-07-08 10:44:00
95	98	20	2023-03-21 14:42:10
96	12	17	2023-04-27 19:19:12
97	83	49	2022-08-08 22:01:23
98	93	33	2022-07-11 12:56:14
99	44	95	2022-08-13 16:39:41
100	71	14	2022-12-05 16:32:53
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Nomlanga	Pugh	tempor.augue@icloud.net	(867) 261-5235	79	2022-04-18 21:07:18
2	Hyatt	Burns	ipsum.porta@google.ca	1-126-436-7336	96	2022-10-10 21:41:20
3	Jordan	Wilkins	pharetra.nam.ac@icloud.ca	(143) 898-1484	19	2022-07-15 06:07:47
4	Igor	Riley	vulputate.dui.nec@aol.ca	(841) 898-3022	4	2023-06-25 15:22:35
5	Oren	Cobb	imperdiet.dictum.magna@outlook.couk	(265) 403-7937	51	2023-03-19 03:44:00
6	Wallace	Burt	sed@icloud.ca	(738) 177-4598	79	2021-10-03 09:10:19
7	Azalia	Chambers	eget.varius.ultrices@icloud.edu	1-387-597-5972	58	2022-09-11 19:35:22
8	Jin	Tate	lorem.ipsum.dolor@icloud.org	(521) 377-2535	58	2022-04-08 00:54:06
9	Lillian	Salazar	tincidunt.neque@outlook.org	(834) 296-2922	3	2022-06-08 21:35:49
10	Colby	Webster	id.blandit@yahoo.ca	(324) 898-8475	8	2021-11-30 07:42:46
11	Abigail	Gaines	commodo.auctor@google.edu	(581) 982-5305	36	2022-06-18 00:21:47
12	Hedwig	Melendez	ligula.aenean@aol.org	(437) 774-6706	72	2022-11-29 18:31:44
13	Carolyn	Mays	mattis.velit.justo@hotmail.ca	1-253-927-9343	53	2022-07-04 03:37:02
14	Ivy	Marsh	sed.dictum@hotmail.ca	(526) 535-4043	68	2022-05-08 02:10:43
15	Mohammad	Burks	a.magna@icloud.org	(538) 342-6215	93	2022-05-29 10:06:15
16	Tanisha	Graham	magna.malesuada@yahoo.net	(554) 322-4238	93	2021-12-26 13:39:09
17	Wynter	Witt	vel.mauris@outlook.edu	1-818-878-9826	83	2022-01-25 11:55:14
18	Emerald	Barnett	augue@google.couk	1-740-796-8438	31	2023-01-22 01:11:53
19	Griffin	Beck	neque.vitae@yahoo.couk	(211) 391-1182	54	2022-09-09 13:42:39
20	Lyle	Emerson	diam@protonmail.ca	1-486-461-8577	87	2022-08-27 00:42:06
21	Chastity	Yates	eu.nibh.vulputate@icloud.edu	(564) 566-7970	35	2022-09-11 18:14:31
22	Iona	Hobbs	laoreet.posuere@google.couk	1-104-396-2609	81	2022-08-26 10:48:22
23	Abraham	Cantrell	pellentesque@outlook.couk	(884) 880-7741	44	2022-10-02 20:56:56
24	John	Cruz	pede@google.net	(241) 382-3588	21	2022-02-20 21:54:22
25	Quynn	Chapman	tortor.at.risus@icloud.org	1-322-638-3737	83	2021-12-10 13:34:38
26	Maile	Acosta	vitae.mauris@yahoo.ca	1-684-854-1173	32	2022-11-07 21:02:21
27	Wesley	Eaton	vestibulum.lorem@hotmail.ca	1-664-614-1512	30	2023-06-14 19:39:00
28	Bruno	Clay	sapien.molestie@aol.ca	1-841-221-6915	8	2023-07-29 21:10:43
29	Edward	Lester	interdum.curabitur@yahoo.com	1-252-488-1023	39	2021-09-12 07:03:28
30	Charity	Garrison	parturient@yahoo.net	1-775-294-5580	31	2022-04-03 10:01:58
31	Macy	Mejia	tellus.id@outlook.com	(598) 664-2267	48	2022-09-24 12:02:53
32	Gay	Sherman	neque.pellentesque.massa@protonmail.couk	(723) 621-2463	44	2023-06-01 18:12:51
33	Catherine	Gillespie	non.enim.commodo@protonmail.net	1-665-324-6855	47	2022-04-21 08:57:35
34	May	Washington	vulputate.posuere@google.couk	(413) 641-1841	94	2023-01-12 04:22:54
35	Addison	Gibbs	feugiat.nec.diam@google.edu	(368) 915-2277	23	2021-11-13 10:15:44
36	Lawrence	Mack	orci.tincidunt@aol.ca	1-241-471-8741	93	2022-09-24 23:48:21
37	Illiana	Browning	cursus.luctus@aol.ca	(887) 486-6167	30	2022-09-21 00:37:41
38	Emi	Huber	quis.massa@hotmail.net	1-323-464-8283	76	2021-12-23 02:59:33
39	Howard	Melton	amet.lorem@google.com	1-284-186-6547	78	2021-12-26 16:35:39
40	Joan	Vaughn	placerat.velit@outlook.edu	(834) 735-6434	9	2023-07-17 02:13:06
41	Eagan	Todd	nunc.est@aol.org	1-381-817-5375	60	2022-05-29 15:34:48
42	Hadley	Riggs	commodo.ipsum.suspendisse@outlook.org	1-882-863-1454	16	2021-09-18 22:38:29
43	Alyssa	Joseph	risus.donec@protonmail.com	(121) 263-6312	82	2022-05-31 06:30:03
44	Hiram	Quinn	non@google.ca	(134) 645-4944	24	2023-07-31 04:13:13
45	Beatrice	Whitfield	tincidunt.donec@protonmail.ca	1-441-866-7042	90	2021-12-15 20:45:12
46	Jacob	Bowman	enim.condimentum@icloud.net	1-161-549-7401	19	2022-12-05 19:53:59
47	Gage	Gamble	sed@google.edu	(471) 672-4410	3	2022-09-01 14:13:09
48	Hall	Coffey	sapien@google.edu	(677) 929-4252	31	2023-06-30 18:25:28
49	Tatum	Taylor	mauris@icloud.edu	(472) 429-8018	37	2022-04-27 08:50:45
50	Dane	Woodard	integer.vitae@google.edu	1-862-769-1942	99	2022-10-22 13:45:38
51	Faith	Vasquez	nibh.sit.amet@hotmail.ca	(132) 821-6874	5	2023-08-12 06:27:09
52	Marshall	Sharp	est.vitae@yahoo.ca	1-447-760-6947	10	2022-10-25 21:41:15
53	Ava	Houston	sit@aol.com	(595) 871-1694	33	2023-06-01 02:50:51
54	Dominique	Pollard	praesent.interdum@aol.couk	1-605-861-9644	47	2021-12-08 01:28:37
55	Arsenio	Reese	lorem.vitae@google.ca	1-451-815-0257	53	2023-04-19 09:16:10
56	Lunea	Lucas	netus@icloud.ca	1-766-783-7593	61	2022-10-14 09:17:10
57	Audra	Kline	et.malesuada.fames@protonmail.net	1-868-441-5176	19	2023-02-28 06:53:21
58	Wynter	Galloway	vehicula.risus@outlook.net	1-945-204-8675	56	2022-01-18 07:28:20
59	Denise	Salazar	amet.faucibus.ut@outlook.ca	(348) 547-6355	33	2023-01-10 09:11:30
60	Karyn	Mercado	nulla.facilisis.suspendisse@icloud.com	(329) 984-7428	40	2021-12-20 15:58:24
61	Silas	Fuller	molestie.arcu@hotmail.com	(901) 269-8801	8	2022-09-19 18:56:54
62	Ivan	Lester	aenean.egestas@protonmail.couk	1-823-630-3637	22	2023-04-05 21:24:19
63	Ocean	Callahan	ut.pharetra@protonmail.com	(207) 415-9852	54	2023-04-09 14:12:46
64	Grady	Velazquez	diam@protonmail.com	(456) 930-0793	43	2022-03-19 10:26:41
65	Rogan	Beard	sit.amet.ornare@icloud.couk	1-238-822-9712	19	2023-07-31 11:59:19
66	Callie	Porter	scelerisque@protonmail.couk	(223) 573-7775	37	2022-08-07 01:22:36
67	Pandora	Roy	nec@google.com	(759) 624-8464	84	2022-05-28 16:01:40
68	Dieter	Nelson	mollis.lectus@aol.net	(831) 130-4064	55	2022-11-29 09:25:07
69	Keely	Payne	proin.dolor@icloud.net	1-710-464-4764	17	2023-04-14 04:44:38
70	Kitra	Browning	urna@google.net	(533) 784-6625	74	2022-01-23 21:09:09
71	Norman	Mendoza	suspendisse.commodo@hotmail.com	(224) 942-8757	63	2022-04-24 18:48:16
72	Belle	Reilly	arcu.iaculis@aol.edu	1-864-868-7471	43	2023-05-07 12:23:00
73	Pascale	Campos	vitae.sodales.at@icloud.net	1-625-527-7422	80	2021-11-29 11:23:57
74	Winifred	Gutierrez	sit.amet.massa@icloud.ca	(657) 877-6429	5	2023-06-20 11:12:54
75	Emi	Taylor	at.iaculis@protonmail.com	(867) 164-4833	55	2022-05-11 21:57:23
76	Kiayada	Beck	dolor@yahoo.net	(725) 518-4741	90	2021-09-13 01:15:50
77	Linda	Huber	risus@hotmail.couk	(824) 497-1601	86	2023-04-06 10:08:26
78	Jade	Espinoza	at@icloud.edu	(866) 445-4045	42	2022-09-14 13:25:18
79	Ramona	Watts	mollis@icloud.com	1-513-151-0343	47	2022-12-31 15:43:51
80	Gwendolyn	Cote	eu.nibh@protonmail.ca	(811) 631-4673	10	2022-10-14 23:14:48
81	James	Mcmillan	pellentesque.ultricies@protonmail.com	(337) 970-5573	86	2022-09-18 11:16:37
82	August	Bass	sit.amet@yahoo.ca	(518) 644-6678	93	2021-11-16 17:53:05
83	Samantha	Galloway	magna@hotmail.com	(650) 786-2595	1	2023-03-15 16:18:30
84	Adele	Berger	nibh.sit@google.org	(221) 901-2256	30	2021-11-26 01:27:52
85	Tana	Bird	gravida.sit@yahoo.edu	(845) 926-8316	45	2023-05-26 13:01:25
86	Irene	Michael	tellus@aol.com	1-541-647-4254	45	2023-04-30 08:59:44
87	Kevin	Howell	mi.duis.risus@icloud.org	(854) 137-1864	94	2022-05-10 17:11:26
88	Jamalia	Riley	ut.semper.pretium@icloud.couk	(849) 513-1766	25	2022-11-04 04:47:12
89	Norman	Hendrix	tellus.suspendisse.sed@google.edu	1-238-413-2006	14	2021-12-11 05:45:26
90	Melodie	Evans	ullamcorper.duis.cursus@google.edu	1-714-361-4568	7	2023-03-01 11:38:56
91	Aphrodite	Gibson	id@google.org	(432) 662-4398	47	2022-11-10 13:59:10
92	Julie	Goodman	sagittis@outlook.ca	1-473-173-9315	47	2022-06-06 23:18:18
93	Tate	Kelley	nulla.donec@protonmail.edu	(731) 656-6185	47	2022-04-02 12:50:36
94	Ulysses	Kennedy	sit.amet.luctus@outlook.couk	(523) 817-5804	63	2023-06-17 04:14:29
95	Grady	Mckinney	dictum@yahoo.edu	(788) 520-5587	65	2022-12-23 22:30:02
96	Keaton	Wiggins	ut@google.ca	(880) 524-3236	29	2023-01-12 11:25:57
97	Jessica	Glass	ligula@yahoo.net	(645) 671-0242	65	2022-12-21 22:43:26
98	Lane	Dawson	nulla.interdum.curabitur@hotmail.couk	(514) 856-4008	70	2021-11-07 20:49:05
99	Malcolm	Foster	erat@outlook.net	1-712-649-2847	9	2022-11-11 20:36:05
100	Hop	Heath	diam.dictum.sapien@hotmail.net	(138) 122-6438	78	2022-01-31 15:16:59
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, user_id, description, uploaded_at, size) FROM stdin;
1	http://youtube.com/sub	70	nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu	2023-02-08 03:08:31	317
2	https://yahoo.com/user/110	38	Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum	2022-01-31 14:37:30	31
3	http://facebook.com/group/9	74	nibh vulputate mauris sagittis	2023-03-01 12:09:42	282
4	https://facebook.com/en-us	49	cursus. Integer mollis.	2023-02-18 17:01:20	271
5	http://twitter.com/group/9	49	dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna.	2023-05-06 02:04:22	903
6	https://facebook.com/sub	70	egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam	2022-05-06 01:34:22	840
7	https://google.com/fr	58	convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus	2023-05-19 03:53:54	970
8	https://walmart.com/fr	62	justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer	2022-09-14 09:16:22	164
9	https://twitter.com/site	23	molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,	2023-06-15 17:25:59	91
10	https://instagram.com/sub/cars	70	elementum purus,	2022-12-17 09:18:04	345
11	https://instagram.com/sub/cars2	7	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et	2022-08-19 21:48:09	537
12	https://walmart.com/settings	21	montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit.	2022-10-27 05:00:43	778
13	http://instagram.com/sub	93	ut	2022-09-20 02:49:07	190
14	https://facebook.com/sub2	11	velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum.	2021-10-17 17:55:23	581
15	https://whatsapp.com/user/110	47	Cras sed leo. Cras vehicula aliquet libero. Integer in	2022-08-23 17:51:20	957
16	https://bbc.co.uk/group/9	83	quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui.	2023-04-22 11:01:31	764
17	http://youtube.com/one	32	ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu	2023-01-24 06:24:29	130
18	https://bbc.co.uk/en-us	11	Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue	2022-07-10 13:54:12	238
19	https://twitter.com/settings	4	ut mi.	2023-07-08 01:42:59	173
20	https://guardian.co.uk/group/9	61	Aenean euismod mauris eu elit. Nulla facilisi.	2021-12-13 09:47:04	294
21	http://guardian.co.uk/user/110	62	ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean	2022-04-15 00:13:30	284
22	https://bbc.co.uk/sub	93	eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus	2023-07-23 11:18:53	325
23	http://naver.com/user/110	58	Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus	2021-11-20 01:50:10	740
24	https://guardian.co.uk/group/92	27	imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada	2022-12-05 22:35:12	796
25	http://baidu.com/one	70	dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.	2023-05-27 02:35:40	614
26	http://yahoo.com/sub/cars	72	risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit	2023-02-11 09:19:15	725
27	https://ebay.com/one	98	ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing	2021-08-19 17:47:13	372
28	https://netflix.com/sub	44	ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque.	2023-05-01 22:53:24	430
29	http://cnn.com/group/9	30	sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum	2021-08-30 02:02:36	200
30	https://naver.com/site	82	diam nunc, ullamcorper eu, euismod ac, fermentum vel,	2022-11-14 17:09:51	340
31	https://twitter.com/settings2	31	luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis	2023-02-04 04:40:01	85
32	https://facebook.com/group/9	78	Proin dolor. Nulla semper tellus id nunc interdum feugiat.	2021-10-19 01:38:20	705
33	http://youtube.com/fr	92	risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non,	2022-09-03 20:38:03	998
34	http://youtube.com/sub/cars	1	suscipit, est ac	2022-11-09 21:58:34	709
35	https://cnn.com/sub	29	magna et ipsum cursus vestibulum. Mauris magna. Duis	2023-06-30 19:56:02	40
36	http://netflix.com/site	72	luctus, ipsum leo	2021-11-17 16:55:10	435
37	http://pinterest.com/sub/cars	67	Donec tempor, est ac mattis	2023-08-03 20:43:49	159
38	http://youtube.com/en-ca	57	mus. Donec dignissim magna a tortor. Nunc	2022-06-18 09:42:31	692
39	http://instagram.com/group/9	48	primis in faucibus	2023-04-28 19:44:05	916
40	https://instagram.com/fr	28	ridiculus mus. Proin vel arcu eu odio tristique	2022-10-20 17:45:38	144
41	https://zoom.us/sub/cars	6	tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida	2023-04-13 13:48:36	389
42	https://yahoo.com/group/9	48	lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend.	2022-06-09 01:18:17	431
43	https://bbc.co.uk/site	18	velit. Pellentesque	2022-01-13 11:49:03	217
44	http://youtube.com/user/110	18	In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices	2022-07-14 15:30:46	767
45	http://naver.com/en-ca	12	dolor dapibus gravida. Aliquam tincidunt, nunc ac	2022-10-17 12:55:32	318
46	https://zoom.us/en-us	17	ac tellus. Suspendisse sed dolor. Fusce mi lorem,	2022-08-30 17:50:01	624
47	https://youtube.com/sub	83	pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,	2022-02-06 04:48:17	11
48	http://walmart.com/group/9	18	purus. Nullam scelerisque neque sed sem	2023-01-10 22:42:47	792
49	https://naver.com/group/9	3	eget mollis	2023-02-22 02:32:51	288
50	http://cnn.com/settings	36	vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor.	2023-04-09 09:48:29	221
51	http://walmart.com/en-us	23	sit amet, dapibus id, blandit at, nisi. Cum	2022-07-24 02:26:54	235
52	http://guardian.co.uk/en-ca	3	diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing	2021-12-30 18:45:46	805
53	https://yahoo.com/fr	24	vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum	2022-01-26 13:25:54	801
54	http://zoom.us/one	51	fringilla euismod enim. Etiam gravida molestie arcu.	2023-01-15 00:56:51	388
55	http://ebay.com/sub	16	ligula. Donec luctus aliquet odio. Etiam	2021-12-06 18:55:08	805
56	http://facebook.com/group/92	72	posuere vulputate, lacus. Cras interdum.	2021-11-14 05:06:08	65
57	https://walmart.com/fr2	13	tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci.	2022-11-10 15:05:00	204
58	http://nytimes.com/group/9	93	egestas, urna justo faucibus lectus,	2023-01-15 05:10:36	142
59	http://nytimes.com/en-ca	60	nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit.	2021-09-04 08:33:03	62
60	http://zoom.us/site	18	vestibulum.	2023-05-17 10:54:05	818
61	https://naver.com/group/92	17	Cras dictum ultricies ligula. Nullam enim. Sed	2022-06-19 21:29:44	661
62	http://pinterest.com/site	61	neque non quam. Pellentesque habitant morbi tristique	2022-07-29 02:56:09	107
63	https://naver.com/fr	83	mi fringilla mi lacinia mattis. Integer eu lacus.	2022-01-05 00:32:54	81
64	http://baidu.com/one2	48	leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum	2022-11-11 12:19:14	458
65	http://zoom.us/fr	97	vitae erat vel pede blandit congue. In	2022-06-08 23:11:34	188
66	http://yahoo.com/settings	26	ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc	2022-05-16 06:54:33	420
67	https://walmart.com/site	86	magna. Phasellus dolor elit, pellentesque a, facilisis non,	2022-03-03 04:06:28	968
68	https://google.com/site	78	nisi sem semper erat,	2022-06-23 02:03:15	116
69	http://youtube.com/sub/cars2	51	odio. Etiam ligula	2022-04-30 12:15:54	586
70	https://google.com/fr2	100	lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada	2021-12-07 20:16:52	426
71	http://facebook.com/group/93	21	lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum	2023-04-21 12:55:05	14
72	https://baidu.com/user/110	63	ridiculus mus.	2023-01-03 01:02:34	278
73	http://ebay.com/one	22	ante ipsum	2022-04-26 12:05:47	572
74	https://netflix.com/settings	37	aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer	2023-02-14 17:41:34	751
75	http://google.com/group/9	48	erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar	2022-12-09 01:01:50	441
76	http://walmart.com/sub	11	Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	2022-10-04 09:50:36	94
77	https://wikipedia.org/en-us	72	Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus	2022-10-02 11:16:30	344
78	https://youtube.com/one	25	ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non	2022-02-06 23:24:11	885
79	http://naver.com/group/9	56	ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus	2023-05-16 09:35:17	287
80	https://bbc.co.uk/sub2	5	augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan	2022-02-16 04:39:55	392
81	http://twitter.com/settings	7	ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,	2022-11-28 20:10:20	546
82	https://wikipedia.org/fr	19	Quisque varius. Nam porttitor scelerisque neque. Nullam nisl.	2021-09-05 06:31:12	498
83	http://instagram.com/en-ca	88	nascetur ridiculus mus. Donec dignissim magna a tortor.	2022-10-16 03:33:30	580
84	http://naver.com/group/92	36	sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc	2021-08-26 08:20:44	330
85	http://baidu.com/site	70	sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut	2023-07-03 01:26:33	699
86	http://pinterest.com/group/9	55	neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo.	2021-09-05 08:27:36	28
87	http://zoom.us/en-us	62	euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam	2021-12-23 19:34:07	475
88	https://baidu.com/settings	87	felis purus	2022-07-20 18:07:36	436
89	http://whatsapp.com/sub/cars	13	id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam	2022-07-10 00:28:53	691
90	http://facebook.com/user/110	18	ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy	2022-12-30 11:07:09	498
91	http://guardian.co.uk/sub	89	non, lacinia at, iaculis quis, pede. Praesent eu dui.	2022-09-18 12:51:55	914
92	http://instagram.com/sub/cars	51	consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies	2021-09-18 21:28:02	455
93	http://baidu.com/en-us	98	ultrices. Duis volutpat nunc sit amet metus. Aliquam erat	2023-01-25 18:01:32	363
94	http://cnn.com/fr	27	sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet	2023-06-07 16:34:19	815
95	https://bbc.co.uk/sub3	19	non nisi. Aenean eget metus. In nec orci. Donec	2022-09-03 14:43:53	906
96	http://reddit.com/one	63	tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer	2022-02-20 07:33:26	855
97	http://instagram.com/settings	3	lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per	2021-11-15 10:18:42	941
98	http://cnn.com/sub	89	Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui.	2023-07-30 23:31:52	302
99	http://nytimes.com/group/93	93	augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec,	2023-01-02 21:11:31	859
100	https://cnn.com/sub3	20	egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna.	2022-01-28 20:47:28	379
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 100, true);


--
-- Name: communities_subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_subscribers_id_seq', 100, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 5, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 100, true);


--
-- Name: subscribers_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscribers_users_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_subscribers communities_subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_subscribers
    ADD CONSTRAINT communities_subscribers_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: subscribers_users subscribers_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscribers_users
    ADD CONSTRAINT subscribers_users_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

