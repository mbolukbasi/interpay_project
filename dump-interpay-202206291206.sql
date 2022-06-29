--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-06-29 12:06:24

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16421)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16420)
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 209
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- TOC entry 212 (class 1259 OID 16430)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    author_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16429)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 211
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 3169 (class 2604 OID 16424)
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- TOC entry 3170 (class 2604 OID 16433)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3316 (class 0 OID 16421)
-- Dependencies: 210
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, name) FROM stdin;
85	Isak3 Azimov
87	Isak2 Azimov
94	Isak Azimov
86	3
102	Melih
\.


--
-- TOC entry 3318 (class 0 OID 16430)
-- Dependencies: 212
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, author_id, name) FROM stdin;
12	40	End of spirit
13	62	Standard
14	63	End of spirit
15	62	Standard
16	65	End of spirit
17	62	Standard
18	40	End of spirit
19	62	Standard
20	63	End of spirit
21	62	Standard
22	65	End of spirit
23	62	Standard
24	40	End of spirit
25	62	Standard
26	63	End of spirit
27	62	Standard
28	65	End of spirit
29	62	Standard
30	85	End of spirit
31	86	Standard
32	87	End of spirit
33	85	End of spirit
34	86	Standard
35	87	End of spirit
36	86	Standard
37	94	End of spirit
38	86	Standard
39	85	End of spirit
40	86	Standard
41	87	End of spirit
42	86	Standard
43	94	End of spirit
44	86	Standard
\.


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 209
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 102, true);


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 211
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 44, true);


--
-- TOC entry 3173 (class 2606 OID 16428)
-- Name: authors authors_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pk PRIMARY KEY (id);


--
-- TOC entry 3175 (class 2606 OID 16437)
-- Name: books books_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pk PRIMARY KEY (id);


--
-- TOC entry 3171 (class 1259 OID 16439)
-- Name: authors_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX authors_name_idx ON public.authors USING btree (name);


-- Completed on 2022-06-29 12:06:25

--
-- PostgreSQL database dump complete
--

