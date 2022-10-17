--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

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
-- Name: requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.requests (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "urlId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token character varying(255) NOT NULL,
    "isValid" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" character varying(20) NOT NULL,
    url character varying(1000) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visitors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visitors (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: visitorsCount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."visitorsCount" (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: visitorsCount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."visitorsCount_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visitorsCount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."visitorsCount_id_seq" OWNED BY public."visitorsCount".id;


--
-- Name: visitors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.visitors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visitors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.visitors_id_seq OWNED BY public.visitors.id;


--
-- Name: requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visitors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitors ALTER COLUMN id SET DEFAULT nextval('public.visitors_id_seq'::regclass);


--
-- Name: visitorsCount id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."visitorsCount" ALTER COLUMN id SET DEFAULT nextval('public."visitorsCount_id_seq"'::regclass);


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.requests (id, "userId", "urlId", "createdAt") FROM stdin;
1	6	1	2022-10-17 14:18:11.006243+01
2	6	2	2022-10-17 14:18:11.268975+01
3	6	3	2022-10-17 14:18:11.747518+01
4	6	4	2022-10-17 14:18:12.21638+01
5	6	5	2022-10-17 14:18:12.662988+01
6	6	6	2022-10-17 14:18:13.11268+01
7	6	7	2022-10-17 14:18:13.608629+01
8	6	8	2022-10-17 14:18:14.109219+01
9	6	9	2022-10-17 14:18:14.699248+01
10	6	10	2022-10-17 14:19:05.539816+01
11	2	11	2022-10-17 14:19:57.642629+01
12	1	12	2022-10-17 14:21:17.224559+01
13	4	13	2022-10-17 14:21:58.070965+01
14	4	14	2022-10-17 14:41:08.037611+01
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (id, "userId", token, "isValid", "createdAt") FROM stdin;
1	4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjY2MDEyNjE2fQ.dX3ecf_a8AP8WM0BTYbLwDvQy8YtNL9e1XHbGOGqwXs	t	2022-10-17 14:16:56.823469+01
2	1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjY2MDEyNjQ5fQ.egM7xyv8vd4ksoUbvrzzzvPzd8O2Q3vt684BkxGFPOA	t	2022-10-17 14:17:29.813541+01
3	2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjY2MDEyNjU2fQ.-LMO_hJ3Re2dRDnHzfKEG-_KwhHwBNOgQff-v3SpJcw	t	2022-10-17 14:17:36.194318+01
4	6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNjY2MDEyNjYyfQ.QZqSRELNbyZRRw9oZw9qHFMYQ2H_m0ZFJzJV6S38RmM	t	2022-10-17 14:17:42.845416+01
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.urls (id, "shortUrl", url, "createdAt") FROM stdin;
1	fec18eed14	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:11.001754+01
2	5754ad7228	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:11.268221+01
3	f8592ea021	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:11.745212+01
4	025dea3ff5	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:12.215745+01
5	17d9958808	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:12.660916+01
6	ecfd9edcfa	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:13.111281+01
7	d23bd07c75	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:13.607322+01
8	f7eb1c8b00	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:14.107944+01
9	7d3f4a5e61	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:18:14.698413+01
10	19be261d4a	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:19:05.538157+01
11	d2c7f4b9d8	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:19:57.64056+01
12	2d4aeaae3c	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:21:17.22277+01
13	1ed05bc461	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:21:58.069142+01
14	fa83efb5bf	https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1	2022-10-17 14:41:08.032731+01
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
1	leo	leo@driven.com.br	$2b$10$Nic/K42ul6zSEvGXmUsT0O/4UNlCXyrvfEfbrKZWGSSuFfiT8h4Ka	2022-10-17 14:01:46.456249+01
2	Mickey	mickey@driven.com.br	$2b$10$b16MxiRFvIRTXxBIg36aquOK2czfQPOb9FBNh.J/IULDrCIRNe8Ki	2022-10-17 14:01:58.650515+01
3	edson	edson@driven.com.br	$2b$10$A0ybrjvndQajquYEKssktuAxkOpfHARTVVcQABuK5kz/1Sf0eaydS	2022-10-17 14:02:07.906603+01
4	sofia	sofia@driven.com.br	$2b$10$b/9WSOVdRzXrPy1Ij6yVseVZXVn1.8L5/NJeRD4RU6lCHRk7C2riu	2022-10-17 14:02:15.625272+01
5	lorenzo	lorenzo@driven.com.br	$2b$10$97hDrMq.rmFM5Krb.oyiDeVhCIEFDK43ODr5aU.iibsLTDEHOwhYq	2022-10-17 14:02:28.236436+01
6	valdirene	valdirene@driven.com.br	$2b$10$4NKxNjYauqk5SMOUlgWcI.QIdJt1rCKGQ98ZrtCdaYjekJcrMJ15i	2022-10-17 14:02:54.171907+01
7	maykel	maykel@driven.com.br	$2b$10$v0Mh2I3Lh/FT4HnOIHlvTuMgFkAOUhofkD.fTLoS128fjS0mGTGna	2022-10-17 14:03:07.034636+01
8	joice	joice@driven.com.br	$2b$10$vCuhmAM.iY.W1aYN48BdQONOEzAx0g2NL0aeBqUYzYZBlsgNxebgu	2022-10-17 14:04:40.620657+01
9	Helen	Helen@driven.com.br	$2b$10$k4OjHzkrF6alTiwUMyzm3OoDYvRUXtNFOjZKroPTQdk1p4Joe8LcO	2022-10-17 14:04:52.430066+01
10	Marcelo	marcelo@driven.com.br	$2b$10$zhyfmbrGKGqIBDJa8CSzJObWmuOT8wuDjZcq8EaCFiVs7DoQIzWtC	2022-10-17 14:05:09.964945+01
11	Cagão	cagao@driven.com.br	$2b$10$UlOIJIWNHg0rjOoPFiFtX.OxiZqBeZbRCWZ4.p5xatGSiausxv1yS	2022-10-17 14:05:42.062974+01
\.


--
-- Data for Name: visitors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.visitors (id, "urlId", "userId", "createdAt") FROM stdin;
\.


--
-- Data for Name: visitorsCount; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."visitorsCount" (id, "urlId", "createdAt") FROM stdin;
1	9	2022-10-17 14:18:29.518117+01
2	9	2022-10-17 14:18:30.012917+01
3	9	2022-10-17 14:18:30.658222+01
4	9	2022-10-17 14:18:31.919431+01
5	9	2022-10-17 14:18:33.079684+01
6	9	2022-10-17 14:18:34.287743+01
7	9	2022-10-17 14:18:35.909802+01
8	9	2022-10-17 14:18:37.229356+01
9	9	2022-10-17 14:18:38.313583+01
10	9	2022-10-17 14:18:39.445296+01
11	9	2022-10-17 14:18:40.771801+01
12	9	2022-10-17 14:18:42.063116+01
13	9	2022-10-17 14:18:43.46974+01
14	10	2022-10-17 14:19:14.448516+01
15	10	2022-10-17 14:19:15.845917+01
16	11	2022-10-17 14:20:09.281183+01
17	11	2022-10-17 14:20:26.446+01
18	12	2022-10-17 14:21:27.633195+01
19	13	2022-10-17 14:22:06.415716+01
20	13	2022-10-17 14:22:07.951335+01
21	13	2022-10-17 14:22:09.461844+01
22	13	2022-10-17 14:22:11.36141+01
\.


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.requests_id_seq', 14, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: visitorsCount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."visitorsCount_id_seq"', 22, true);


--
-- Name: visitors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.visitors_id_seq', 1, false);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: requests requests_urlId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "requests_urlId_key" UNIQUE ("urlId");


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visitorsCount visitorsCount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."visitorsCount"
    ADD CONSTRAINT "visitorsCount_pkey" PRIMARY KEY (id);


--
-- Name: visitors visitors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT visitors_pkey PRIMARY KEY (id);


--
-- Name: visitors visitors_urlId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT "visitors_urlId_key" UNIQUE ("urlId");


--
-- Name: requests requests_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "requests_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: requests requests_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "requests_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: visitorsCount visitorsCount_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."visitorsCount"
    ADD CONSTRAINT "visitorsCount_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: visitors visitors_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT "visitors_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: visitors visitors_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT "visitors_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

