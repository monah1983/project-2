--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: type_kurs; Type: TYPE; Schema: public; Owner: default
--

CREATE TYPE public.type_kurs AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5'
);


ALTER TYPE public.type_kurs OWNER TO "default";

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: default
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO "default";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_rights; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.access_rights (
);


ALTER TABLE public.access_rights OWNER TO "default";

--
-- Name: faculty; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.faculty (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE public.faculty OWNER TO "default";

--
-- Name: faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculty_id_seq OWNER TO "default";

--
-- Name: faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.faculty_id_seq OWNED BY public.faculty.id;


--
-- Name: kurs; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.kurs (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE public.kurs OWNER TO "default";

--
-- Name: kurs_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.kurs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kurs_id_seq OWNER TO "default";

--
-- Name: kurs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.kurs_id_seq OWNED BY public.kurs.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.lessons (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    teachers smallint NOT NULL,
    date date
);


ALTER TABLE public.lessons OWNER TO "default";

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lessons_id_seq OWNER TO "default";

--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.people (
    id integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    thrname character varying(50),
    email character varying(100),
    address character varying(100),
    kurs integer,
    faculty integer,
    saveinfo integer,
    whois integer,
    zip character varying,
    image character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.people OWNER TO "default";

--
-- Name: roles; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.roles OWNER TO "default";

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO "default";

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.rooms OWNER TO "default";

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO "default";

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.schedule (
    id integer NOT NULL,
    lessons smallint NOT NULL,
    start_time timestamp(0) with time zone NOT NULL,
    end_time timestamp(0) with time zone NOT NULL,
    room smallint NOT NULL,
    teacher smallint,
    day date
);


ALTER TABLE public.schedule OWNER TO "default";

--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_id_seq OWNER TO "default";

--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.schedule_id_seq OWNED BY public.schedule.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    thrname character varying NOT NULL,
    kurs integer NOT NULL,
    faculty integer NOT NULL
);


ALTER TABLE public.students OWNER TO "default";

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO "default";

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: students_in_schedule; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.students_in_schedule (
    id_students integer NOT NULL,
    id_schedule integer NOT NULL,
    id integer NOT NULL,
    id_lessons integer NOT NULL
);


ALTER TABLE public.students_in_schedule OWNER TO "default";

--
-- Name: students_in_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.students_in_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_in_schedule_id_seq OWNER TO "default";

--
-- Name: students_in_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.students_in_schedule_id_seq OWNED BY public.students_in_schedule.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    firstname character varying NOT NULL,
    second_name character varying,
    thrname character varying
);


ALTER TABLE public.teachers OWNER TO "default";

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO "default";

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying,
    roles smallint,
    created_at timestamp(0) with time zone DEFAULT now(),
    updated_at timestamp(0) with time zone DEFAULT now(),
    deleted_at timestamp(0) with time zone
);


ALTER TABLE public.users OWNER TO "default";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "default";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.people.id;


--
-- Name: users_id_seq1; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.users_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq1 OWNER TO "default";

--
-- Name: users_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.users_id_seq1 OWNED BY public.users.id;


--
-- Name: whois; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public.whois (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.whois OWNER TO "default";

--
-- Name: whois_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public.whois_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whois_id_seq OWNER TO "default";

--
-- Name: whois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public.whois_id_seq OWNED BY public.whois.id;


--
-- Name: faculty id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.faculty ALTER COLUMN id SET DEFAULT nextval('public.faculty_id_seq'::regclass);


--
-- Name: kurs id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.kurs ALTER COLUMN id SET DEFAULT nextval('public.kurs_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: schedule id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.schedule ALTER COLUMN id SET DEFAULT nextval('public.schedule_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: students_in_schedule id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.students_in_schedule ALTER COLUMN id SET DEFAULT nextval('public.students_in_schedule_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq1'::regclass);


--
-- Name: whois id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.whois ALTER COLUMN id SET DEFAULT nextval('public.whois_id_seq'::regclass);


--
-- Data for Name: access_rights; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.access_rights  FROM stdin;
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.faculty (id, name, description) FROM stdin;
1	факультет 1	1
2	факультет 2	2
3	факультет 3	3
4	факультет 4	4
5	факультет 5	5
8	6	6
9	8	8
\.


--
-- Data for Name: kurs; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.kurs (id, name, description) FROM stdin;
3	Курс 3	\N
4	Курс 4	\N
5	Курс 5	\N
1	Курс 1	\N
2	Курс 2	\N
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.lessons (id, name, description, start_time, end_time, teachers, date) FROM stdin;
1	Матем	1	09:00:00	09:45:00	1	2021-11-13
8	Анг1	Анг1	00:01:00	02:00:00	1	2021-11-13
2	Физра	2	10:00:00	10:45:00	2	2021-12-13
3	Физика	3	11:00:00	11:45:00	3	2021-12-13
4	Труды	4	12:00:00	12:45:00	4	2021-12-13
5	История	5	13:00:00	13:45:00	5	2021-12-13
7	ИЗО	ИЗО	11:11:11	12:12:12	9	2021-12-13
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.people (id, firstname, lastname, thrname, email, address, kurs, faculty, saveinfo, whois, zip, image, created_at, updated_at, deleted_at) FROM stdin;
196	2	2222	2222	11	111	1	2	1	1	111	\N	2021-02-17 21:51:44.894454+03	2021-02-17 21:54:00.499559+03	\N
197	dsdsad	 dsad asd	adas das	sadad d asdsadsa	 sadas d	4	3	1	1	q434342	\N	2021-02-17 23:15:24.224986+03	2021-02-22 22:12:03.65257+03	\N
206	dsadas	dsad3333	sadsa	dsadddd	cxcxzczddd	4	4	\N	1	dsadsaas	\N	2021-02-22 22:03:39.037531+03	2021-02-22 22:40:45.695023+03	\N
211	4	4	4	\N	\N	1	3	\N	\N	\N	\N	2021-03-03 22:28:03.209112+03	2021-03-03 22:28:03.209112+03	\N
212	dsad	dsad	dsad	\N	\N	2	2	\N	\N	\N	\N	2021-03-03 22:29:04.91895+03	2021-03-03 22:29:04.91895+03	\N
198	asdd	сергеевис	dsadsa	Петров	Багрима	1	2	2	2	225320	\N	2021-02-18 21:54:03.17743+03	2021-03-15 21:08:13.323392+03	\N
90	Елена	Петровна	Сергеевна	Петров	Ленина 1	2	1	1	3	2225406	6015cc201fcff.png	2021-01-31 00:14:08.132622+03	2021-03-15 21:08:16.513949+03	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.roles (id, name, description) FROM stdin;
1	admin	\N
2	teachers	\N
3	students	\N
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.rooms (id, name, description) FROM stdin;
1	101	1
2	102	2
3	103	3
4	104	4
5	201	5
6	202	6
7	203	7
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.schedule (id, lessons, start_time, end_time, room, teacher, day) FROM stdin;
1	2	2021-02-22 22:12:03+03	2021-02-22 22:12:03+03	2	5	2021-01-01
2	5	2021-02-22 22:12:03+03	2021-02-22 22:12:03+03	3	1	2021-01-01
4	4	2021-02-22 22:12:03+03	2021-02-22 22:12:03+03	3	9	2021-01-01
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.students (id, first_name, last_name, thrname, kurs, faculty) FROM stdin;
1	1	1	1	1	1
2	2	2	2	2	2
3	r	r	r	3	4
4	w	w	w	5	5
5	q	q	q	1	1
\.


--
-- Data for Name: students_in_schedule; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.students_in_schedule (id_students, id_schedule, id, id_lessons) FROM stdin;
1	1	5	1
2	2	6	2
2	4	7	3
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.teachers (id, firstname, second_name, thrname) FROM stdin;
1	Пупкин	2	3
2	Петров	2	3
3	Сидиров	2	3
4	Василевич	2	3
5	Буйный	2	3
9	Сергеевич	Петров	Иван
10	Сергеевна	Петров	Петров
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.users (id, login, password, roles, created_at, updated_at, deleted_at) FROM stdin;
25	aaaaaaaaaa	47bce5c74f589f4867dbd57e9ca9f808	1	\N	\N	\N
26	2222	bcbe3365e6ac95ea2c0343a2395834dd	1	\N	\N	\N
28	rerew	698d51a19d8a121ce581499d7b701668	1	\N	\N	\N
29	monah	698d51a19d8a121ce581499d7b701668	1	\N	\N	\N
1	cccc	xxx	1	\N	\N	\N
30	1112	bcbe3365e6ac95ea2c0343a2395834dd	1	\N	\N	\N
31	3434	550a141f12de6341fba65b0ad0433500	2	\N	\N	\N
32	ewewq	698d51a19d8a121ce581499d7b701668	3	2021-03-03 01:05:32+03	2021-03-03 01:05:32+03	\N
\.


--
-- Data for Name: whois; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public.whois (id, name) FROM stdin;
1	Студент
2	Профессор
3	Декан
\.


--
-- Name: faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.faculty_id_seq', 9, true);


--
-- Name: kurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.kurs_id_seq', 5, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.lessons_id_seq', 8, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.rooms_id_seq', 8, true);


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.schedule_id_seq', 4, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.students_id_seq', 6, true);


--
-- Name: students_in_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.students_in_schedule_id_seq', 7, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.teachers_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.users_id_seq', 212, true);


--
-- Name: users_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.users_id_seq1', 32, true);


--
-- Name: whois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.whois_id_seq', 3, true);


--
-- Name: faculty faculty_un; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_un UNIQUE (id);


--
-- Name: kurs kurs_un; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.kurs
    ADD CONSTRAINT kurs_un UNIQUE (id);


--
-- Name: teachers teachers_un; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_un UNIQUE (id);


--
-- Name: people users_pk; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: whois whois_un; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public.whois
    ADD CONSTRAINT whois_un UNIQUE (id);


--
-- Name: people set_timestamp; Type: TRIGGER; Schema: public; Owner: default
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.people FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- Name: users set_timestamp; Type: TRIGGER; Schema: public; Owner: default
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: default
--

GRANT ALL ON SCHEMA public TO root;


--
-- PostgreSQL database dump complete
--

