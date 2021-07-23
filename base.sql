--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO user_name;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO user_name;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO user_name;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO user_name;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO user_name;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO user_name;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO user_name;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO user_name;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO user_name;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO user_name;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO user_name;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO user_name;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO user_name;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO user_name;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO user_name;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO user_name;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO user_name;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO user_name;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO user_name;

--
-- Name: store_category; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.store_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    image character varying(100) NOT NULL,
    parent_id bigint
);


ALTER TABLE public.store_category OWNER TO user_name;

--
-- Name: store_category_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.store_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_category_id_seq OWNER TO user_name;

--
-- Name: store_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.store_category_id_seq OWNED BY public.store_category.id;


--
-- Name: store_product; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.store_product (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    image character varying(100) NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.store_product OWNER TO user_name;

--
-- Name: store_product_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.store_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_product_id_seq OWNER TO user_name;

--
-- Name: store_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.store_product_id_seq OWNED BY public.store_product.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: store_category id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_category ALTER COLUMN id SET DEFAULT nextval('public.store_category_id_seq'::regclass);


--
-- Name: store_product id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_product ALTER COLUMN id SET DEFAULT nextval('public.store_product_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add category	1	add_category
2	Can change category	1	change_category
3	Can delete category	1	delete_category
4	Can view category	1	view_category
5	Can add product	2	add_product
6	Can change product	2	change_product
7	Can delete product	2	delete_product
8	Can view product	2	view_product
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add content type	7	add_contenttype
26	Can change content type	7	change_contenttype
27	Can delete content type	7	delete_contenttype
28	Can view content type	7	view_contenttype
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$6noYOWZjKzyJoJIb3fJ17J$HwIG9+ngcoyqZ6wuCkJl2K3E92RODy2TrVmm0hh1/uA=	2021-07-23 03:28:38.56307+00	t	admin				t	t	2021-07-23 03:28:35.092882+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-07-23 03:29:07.866745+00	1	CPU	1	[{"added": {}}]	1	1
2	2021-07-23 03:29:19.227691+00	2	CPU -> Intel	1	[{"added": {}}]	1	1
3	2021-07-23 03:29:26.879141+00	3	CPU -> AMD	1	[{"added": {}}]	1	1
4	2021-07-23 03:29:39.726412+00	4	CPU -> Intel -> intel-i5	1	[{"added": {}}]	1	1
5	2021-07-23 03:29:52.354444+00	5	CPU -> Intel -> intel-i3	1	[{"added": {}}]	1	1
6	2021-07-23 03:30:20.527827+00	1	intel-i5-cpu	1	[{"added": {}}]	2	1
7	2021-07-23 03:30:28.923831+00	2	intel-i3-cpu	1	[{"added": {}}]	2	1
8	2021-07-23 03:35:14.232312+00	5	CPU -> Intel -> intel-i3	2	[{"changed": {"fields": ["Image"]}}]	1	1
9	2021-07-23 03:45:52.848025+00	5	CPU -> Intel -> intel-i3	2	[{"changed": {"fields": ["Image"]}}]	1	1
10	2021-07-23 03:48:55.126088+00	5	CPU -> Intel -> intel-i3	2	[{"changed": {"fields": ["Image"]}}]	1	1
11	2021-07-23 03:49:58.718274+00	5	CPU -> Intel -> intel-i3	2	[]	1	1
12	2021-07-23 03:51:12.057722+00	5	CPU -> Intel -> intel-i3	2	[]	1	1
13	2021-07-23 03:52:39.126662+00	4	CPU -> Intel -> intel-i5	2	[{"changed": {"fields": ["Image"]}}]	1	1
14	2021-07-23 04:11:42.679695+00	1	intel-i5-cpu	2	[{"changed": {"fields": ["Image"]}}]	2	1
15	2021-07-23 04:20:39.121291+00	2	intel-i3-cpu	2	[{"changed": {"fields": ["Image"]}}]	2	1
16	2021-07-23 04:24:11.503303+00	4	CPU -> Intel -> intel-i5	2	[{"changed": {"fields": ["Image"]}}]	1	1
17	2021-07-23 04:24:28.414997+00	3	intel-i5-noimage	1	[{"added": {}}]	2	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	store	category
2	store	product
3	admin	logentry
4	auth	permission
5	auth	group
6	auth	user
7	contenttypes	contenttype
8	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-07-23 03:25:57.094026+00
2	auth	0001_initial	2021-07-23 03:25:57.208634+00
3	admin	0001_initial	2021-07-23 03:25:57.24276+00
4	admin	0002_logentry_remove_auto_add	2021-07-23 03:25:57.255563+00
5	admin	0003_logentry_add_action_flag_choices	2021-07-23 03:25:57.265747+00
6	contenttypes	0002_remove_content_type_name	2021-07-23 03:25:57.28732+00
7	auth	0002_alter_permission_name_max_length	2021-07-23 03:25:57.298537+00
8	auth	0003_alter_user_email_max_length	2021-07-23 03:25:57.306418+00
9	auth	0004_alter_user_username_opts	2021-07-23 03:25:57.319422+00
10	auth	0005_alter_user_last_login_null	2021-07-23 03:25:57.328145+00
11	auth	0006_require_contenttypes_0002	2021-07-23 03:25:57.331863+00
12	auth	0007_alter_validators_add_error_messages	2021-07-23 03:25:57.347961+00
13	auth	0008_alter_user_username_max_length	2021-07-23 03:25:57.364993+00
14	auth	0009_alter_user_last_name_max_length	2021-07-23 03:25:57.379849+00
15	auth	0010_alter_group_name_max_length	2021-07-23 03:25:57.390451+00
16	auth	0011_update_proxy_permissions	2021-07-23 03:25:57.404135+00
17	auth	0012_alter_user_first_name_max_length	2021-07-23 03:25:57.416304+00
18	sessions	0001_initial	2021-07-23 03:25:57.434939+00
19	store	0001_initial	2021-07-23 03:25:57.486588+00
20	store	0002_auto_20210723_1025	2021-07-23 03:25:57.498305+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ye6eqxrqrl8yrzc7gxx4qc1vadajvbh3	.eJxVjMsOwiAQRf-FtSEdHgPj0r3fQGCgUjU0Ke3K-O_apAvd3nPOfYkQt7WGrZclTFmcBYjT75YiP0rbQb7Hdpslz21dpiR3RR60y-ucy_NyuH8HNfb6rRE1aHKgHI8E7HlgMCPqRFFZTUwuO28xeTaIFpwlD16bwSArpkji_QGsuTZH:1m6lra:wnl37nUrsRYDgTz-nPy_rC96MAHtb4F5ArPILX1uIsg	2021-08-06 03:28:38.566335+00
\.


--
-- Data for Name: store_category; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.store_category (id, name, slug, image, parent_id) FROM stdin;
1	CPU	cpu	default.jpg	\N
2	Intel	intel	default.jpg	1
3	AMD	amd	default.jpg	1
5	intel-i3	intel-i3	13hq.jpeg	2
4	intel-i5	intel-i5	i5category.jpeg	2
\.


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.store_product (id, name, slug, image, category_id) FROM stdin;
1	intel-i5-cpu	intel-i5-cpu	i5_Ry3GpaT.jpeg	4
2	intel-i3-cpu	intel-i3-cpu	13hq.jpeg	5
3	intel-i5-noimage	intel-i5-noimage		4
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 17, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: store_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.store_category_id_seq', 5, true);


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.store_product_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: store_category store_category_name_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_category
    ADD CONSTRAINT store_category_name_key UNIQUE (name);


--
-- Name: store_category store_category_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_category
    ADD CONSTRAINT store_category_pkey PRIMARY KEY (id);


--
-- Name: store_category store_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_category
    ADD CONSTRAINT store_category_slug_key UNIQUE (slug);


--
-- Name: store_product store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- Name: store_product store_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_slug_key UNIQUE (slug);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: store_category_name_150032c6_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX store_category_name_150032c6_like ON public.store_category USING btree (name varchar_pattern_ops);


--
-- Name: store_category_parent_id_a6e736ff; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX store_category_parent_id_a6e736ff ON public.store_category USING btree (parent_id);


--
-- Name: store_category_slug_2d349264_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX store_category_slug_2d349264_like ON public.store_category USING btree (slug varchar_pattern_ops);


--
-- Name: store_product_category_id_574bae65; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX store_product_category_id_574bae65 ON public.store_product USING btree (category_id);


--
-- Name: store_product_slug_6de8ee4b_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX store_product_slug_6de8ee4b_like ON public.store_product USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_category store_category_parent_id_a6e736ff_fk_store_category_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_category
    ADD CONSTRAINT store_category_parent_id_a6e736ff_fk_store_category_id FOREIGN KEY (parent_id) REFERENCES public.store_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_product store_product_category_id_574bae65_fk_store_category_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_category_id_574bae65_fk_store_category_id FOREIGN KEY (category_id) REFERENCES public.store_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

