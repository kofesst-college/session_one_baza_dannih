--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

DROP DATABASE IF EXISTS first_session;
--
-- Name: first_session; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE first_session WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE first_session OWNER TO postgres;

connect first_session

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
-- Name: competition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competition (
    id integer NOT NULL,
    title text NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    description character varying(1000) NOT NULL,
    city character varying(100)
);


ALTER TABLE public.competition OWNER TO postgres;

--
-- Name: competition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.competition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_id_seq OWNER TO postgres;

--
-- Name: competition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.competition_id_seq OWNED BY public.competition.id;


--
-- Name: competition_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competition_skill (
    competition_id integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE public.competition_skill OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    capital character varying(100) NOT NULL,
    district character varying(100) NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    role character varying(100) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill (
    id integer NOT NULL,
    title character varying(1000),
    skill_block_id integer NOT NULL,
    is_future boolean NOT NULL,
    description character varying(1000),
    square_workplace integer NOT NULL,
    square_experts integer NOT NULL,
    square_briefing integer NOT NULL,
    square_warehouse integer NOT NULL,
    square_try_a_skills integer NOT NULL,
    members_count integer NOT NULL
);


ALTER TABLE public.skill OWNER TO postgres;

--
-- Name: skill_block; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill_block (
    id integer NOT NULL,
    title character varying(1000) NOT NULL
);


ALTER TABLE public.skill_block OWNER TO postgres;

--
-- Name: skill_block_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skill_block_id_seq OWNER TO postgres;

--
-- Name: skill_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_block_id_seq OWNED BY public.skill_block.id;


--
-- Name: skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skill_id_seq OWNER TO postgres;

--
-- Name: skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_id_seq OWNED BY public.skill.id;


--
-- Name: users_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_results (
    id integer NOT NULL,
    full_name character varying,
    gender character(1) NOT NULL,
    password character varying NOT NULL,
    pin integer NOT NULL,
    date_of_birth date NOT NULL,
    role_id integer NOT NULL,
    skill_id integer NOT NULL,
    region_id integer NOT NULL,
    place integer,
    competition integer
);


ALTER TABLE public.users_results OWNER TO postgres;

--
-- Name: users_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_results_id_seq OWNER TO postgres;

--
-- Name: users_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_results_id_seq OWNED BY public.users_results.id;


--
-- Name: competition id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition ALTER COLUMN id SET DEFAULT nextval('public.competition_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: skill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill ALTER COLUMN id SET DEFAULT nextval('public.skill_id_seq'::regclass);


--
-- Name: skill_block id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_block ALTER COLUMN id SET DEFAULT nextval('public.skill_block_id_seq'::regclass);


--
-- Name: users_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_results ALTER COLUMN id SET DEFAULT nextval('public.users_results_id_seq'::regclass);


--
-- Data for Name: competition; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (1, 'Мировой чемпионат по профессиональному мастерству WorldSkills Abu Dhabi 2017', '2017-11-14', '2017-11-19', '<p>С 14 по 19 октября 2017 года в г. Абу-Даби (ОАЭ) прошел мировой чемпионат по профессиональному мастерству WorldSkills Abu Dhabi 2017. В нем приняли участие 1300 конкурсантов и более 1500 экспертов из 59 стран по 51 компетенции (49 &ndash; основные, 2 &ndash; презентационные).</p>
<p>Главной площадкой соревнований Чемпионата стал выставочный комплекс Abu Dhabi National Exhibition Centre (ADNEC). Общая площадь выставочного комплекса ADNEC &ndash; 105&nbsp;000 квадратных метров. На протяжении всего мирового чемпионата конкурсную площадку посетили более 10&nbsp;000 представителей различных стран и 80&nbsp;000 школьников Арабских Объединенных Эмиратов. Более 1&nbsp;000 волонтеров были задействованы на конкурсных площадках и на территории ADNEC.</p>
<p>Церемония открытия Чемпионата состоялась 14 октября 2017 года на открытой концертной площадке du Arena, рядом со всемирно известным Феррари Парком. Там же 19 октября 2017 года состоялась церемония закрытия и награждения победителей Чемпиона', 'Абу-Даби');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (2, 'Чемпионат Европы по профессиональному мастерству EuroSkills Budapest 2018', '2018-09-25', '2018-09-29', '<p>С 25 по 29 сентября 2018 года в городе Будапешт (Венгрия) состоялся Чемпионат Европы по профессиональному мастерству EuroSkills 2018. EuroSkills &ndash; это самые масштабные в Европе соревнования по профессиональному мастерству для молодых людей до 25 лет. Порядка 600 конкурсантов из 29 стран приняли участие в чемпионате в 2018 году.</p>
<p>В соревнованиях EuroSkills 2018 приняли участие 48 российских конкурсантов из 17 регионов России по 41 компетенции. По итогам чемпионата сборная России заняла первое место по общему количеству баллов и впервые в медальном зачете, завоевав наибольшее количество золотых медалей среди всех 29 стран-участниц.</p>
<p>9 золотых, 8 серебряных, 2 бронзовые медали и 10 медальонов за профессионализм получили российские конкурсанты на церемонии награждения в столице Венгрии. Награды присудили чемпионам в основных компетенциях состязаний EuroSkills 2018. По количеству медалей Россия опередила Австрию и Францию, а по баллам &ndash; Австрию и Венгрию.</p>
<p>Л', 'Будапешт');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (3, 'Чемпионат Европы по профессиональному мастерству EuroSkills Gothenburg 2016', '2016-12-01', '2016-12-03', '<p>С 1 по 3 декабря 2016 года в Швеции прошел пятый чемпионат Европы по профессиональному мастерству EuroSkills 2016.</p>
<p>500 молодых профессионалов в возрасте до 25 лет из 28 европейских стран соревновались за звание лучших мастеров Европы по 35 основным и 9 презентационным компетенциям.</p>
<p>Национальная сборная WorldSkills Russia в составе 43 человек участвовала в EuroSkills 2016 по 36 компетенциям, заняла первое место по количеству баллов в общем зачете (набрала 15 882 балла по всем компетенциям) и седьмое место в медальном зачете, а также завоевала 11 медалей за профессионализм.</p>
<p>По основным компетенциям национальная сборная WorldSkills Russia завоевала 5 медалей: 2 золотые, 2 серебряные и 1 бронзовая. По презентационным компетенциям национальная сборная WorldSkills Russia завоевала 4 медали: 1 золотая, 1 серебряная и 2 бронзовые.</p>', 'Гётеборг');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (4, 'Региональный чемпионат «Молодые профессионалы» (WorldSkills Russia) Республики Татарстан 2018', '2018-12-14', '2018-12-07', '<p>С 14 ноября по 7 декабря 2018 года прошел региональный чемпионат &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) Республики Татарстан.</p>
<p>Чемпионат проходил по 82 компетенциям &laquo;Ворлдскиллс&raquo; и 52 компетенциям &laquo;Ворлдскиллс Юниоры&raquo;.</p>
<p>Организаторами чемпионата выступили Правительство Республики Татарстан, Союз &laquo;Молодые профессионалы (Ворлдскиллс Россия)&raquo;, Автономная некоммерческая организация &laquo;Центр развития профессиональных компетенций&raquo; и Автономная некоммерческая организация &laquo;Дирекция спортивных и социальных проектов&raquo;.</p>
<p>В Чемпионате приняли участие:</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 987 конкурсантов, в том числе 375 конкурсантов-юниоров;</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 919 экспертов, в том числе 336 экспертов юниоров;</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 134 главных эксперта и заместителей главных экспертов по юниорам;</p>
<p>Для обеспечения соблюдения стандартов &laquo;Ворлдскиллс&raquo; привлечены 77 се', 'Казань, Набережные Челны');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (5, 'Региональный чемпионат «Молодые профессионалы» (WorldSkills Russia) Республики Татарстан 2017', '2017-11-27', '2017-12-08', '<p>С 27 ноября по 8 декабря 2017 года в Республике Татарстан прошел региональный чемпионат &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) Республики Татарстан чемпионатного цикла 2017/2018 годов.</p>
<p>Организаторами чемпионата выступили Правительство Республики Татарстан, Союз &laquo;Молодые профессионалы (Ворлдскиллс Россия)&raquo;, АНО &laquo;Центр развития профессиональных компетенций&raquo; и АНО &laquo;Дирекция спортивных и социальных проектов&raquo;.</p>
<p>Основные показатели регионального чемпионата:</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 91 компетенция &laquo;Ворлдскиллс&raquo; (16-22 лет)</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 23 компетенции &laquo;Ворлдскиллс Юниор&raquo; (14-16 лет)</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 713 конкурсантов и 738 экспертов по компетенциям &laquo;Ворлдскиллс&raquo;</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 129 конкурсантов и 95 экспертов по компетенциям &laquo;Ворлдскиллс Юниор&raquo;</p>
<p>-&nbsp;&nbsp;&nbsp;&nbsp; 39 привлеченных сертифицированных эксперто', 'Казань, Набережные Челны');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (6, 'Второй отраслевой чемпионат по стандартам WorldSkills в сфере информационных технологий DigitalSkills 2018', '2018-12-13', '2018-12-16', '<p>Второй отраслевой чемпионат в сфере IT и IoT-технологий по стандартам WorldSkills прошел с 12 по 16 декабря 2018 года в столице Республики Татарстан. Площадкой соревнований по компетенциям IT профессий стал МВЦ &laquo;Казань Экспо&raquo;.</p>
<p>За звание лучших боролись более 200 участников &ndash; сотрудники предприятий, студенты колледжей, вузов и школьники из 14 стран мира. Помимо российских участников, чемпионат посетили представители Австралии, Австрии, Белоруссии, Германии, Гонконга, Китая, Кореи, Малайзии, Сингапура, Тайваня, Франции, Эстонии и Японии.</p>
<p>Участники продемонстрировали профессиональное мастерство в соревнованиях по 24 компетенциям. Презентационных компетенций в программе первенства было 17. Это &laquo;Разработка компьютерных игр и мультимедийных приложений&raquo;, &laquo;Магистральные линии связи. Строительство и эксплуатация ВОЛП&raquo;, &laquo;Интернет маркетинг&raquo;. Остальные представляют блок профессий будущего FutureSkills: &laquo;Анализ защищеннос', 'Казань');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (7, 'Первый отраслевой чемпионат по стандартам WorldSkills в сфере информационных технологий DigitalSkills 2017', '2017-12-11', '2017-12-15', '<p>С 11 по 15 декабря 2017 года на площадке Университета Иннополис прошел Отраслевой чемпионат по стандартам WorldSkills в сфере информационных технологий DigitalSkills.</p>
<p>Участие в соревнованиях приняли 120 участников и 118 экспертов - сотрудников предприятий малого, среднего и крупного бизнеса отрасли (13 компаний), студентов среднего (23 организации СПО) и высшего (12 ВУЗов) образования. Среди участников и экспертов Чемпионата - представители образовательных организаций более 15 регионов России (Москва, Санкт-Петербург, Татарстан, Московская область, Новгородская область, Воронежская область, Свердловская область, Смоленская область, Ульяновская область, Челябинская область, Томской область, Костромская область, Смоленская область, Ульяновская область), представители корпораций (ГК Росатом, ПАО Камаз, ПАО Таттелеком, ПАО Ростелеком, АО Танеко, АО Танеко, НПО Квант, ПАО Газпром &ndash; Нефть, ПАО МТС), предприятий малого и среднего бизнеса (1С-Аналитикс, ООО Ай-Ти Центр, ООО НПП', 'Иннополис');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (8, 'Финал V Национального чемпионата «Молодые профессионалы» (WorldSkills Russia) 2017 в Краснодаре', '2017-05-15', '2017-05-19', '<p>Финал V Национального чемпионата &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) прошел в Краснодаре с 15 по 19 мая 2017 года на площадке выставочно &ndash; конгрессного комплекса &laquo;Экспоград Юг&raquo;. Соревнования национального чемпионата прошли по компетенциям 6 блоков профессий: строительной сферы, информационных и коммуникационных технологий, творчества и дизайна, промышленного производства, сферы услуг и обслуживания гражданского транспорта.</p>
<p>Студенты и школьники приняли участие в соревнованиях по профессиональному мастерству в 109 основных и 4 демонстрационных компетенциях. В рамках Чемпионата проект FutureSkills был представлен блоком соревнований по 9 малораспространенным, но перспективным компетенциям, которые пока не стандартизированы: Изготовление прототипов; Инженерные космические системы; Промышленная робототехника; Реверсивный инжиниринг; Технологии композитов; Геномная инженерия; Эксплуатация беспилотных авиационных систем; Лазерные технологии; Ко', 'Краснодар');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (9, 'Чемпионат молодых дизайнеров по методике WorldSkills Russia – Kazan Fashion Skills 2019', '2019-05-25', '2019-12-22', '<p>С 25 февраля по 22 апреля 2019 года&nbsp; прошёл первый "Чемпионат молодых дизайнеров по методике "Ворлдскиллс Россия"&nbsp; - Kazan Fashion Skillls 2019</p>
<p>Организаторами Чемпионата выступили АНО &laquo;Центр развития профессиональных компетенций&raquo;, торговая марка SERGINNETTI, а также ГАПОУ &laquo;Казанский колледж технологии и дизайна&raquo; при поддержке Союз &laquo;Молодые профессионалы (Ворлдскиллс Россия)&raquo;.</p>
<p>На разных этапах чемпионат оценивала экспертная группа:</p>
<ul>
<li>Ирина Филичкина, международный эксперт Движения "Молодые профессионалы" (WorldSkills Russia) по компетенции &laquo;Технологии моды&raquo;</li>
<li>Светлана Першина, менеджер компетенции &laquo;Технологии моды&raquo; Движения "Молодые профессионалы" (WorldSkills Russia)</li>
<li>Ирина Купряхина, сертифицированный эксперт Движения "Молодые профессионалы" (WorldSkills Россия) по компетенции &laquo;Технологии моды&raquo;</li>
<li>Алиса Тулынина, основатель авторской студии макияжа и стиля', 'Казань');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (10, 'Финал VI Национального чемпионата «Молодые профессионалы» (WorldSkills Russia) 2018 в Южно-Сахалинске', '2018-08-08', '2018-08-12', '<p>С 8 по 12 августа 2018 года в г.Южно-Сахалинске прошел Финал VI Национального чемпионата &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) &ndash; 2018, который стал заключительным соревнованием в российском чемпионатном цикле 2017/2018 годов.</p>
<p>В течение соревновательных дней участники со всей страны демонстрировали свое мастерство в 63 компетенциях. Состязания проходили на площадках ТВЦ &laquo;Аллея&raquo; и аэродрома &laquo;Пушистый&raquo;. В них приняли участие 700 конкурсантов, чьи навыки оценивали 700 экспертов.</p>
<p>Республику Татарстан на Финале представляли 58 конкурсантов и 46 экспертов по 44 компетенциям &laquo;Ворлдскиллс&raquo; (возрастная категория от 16 до 22 лет) и 23 конкурсанта и 15 экспертов по 15 компетенциям &laquo;Ворлдскиллс Юниоры&raquo; (возрастная категория от 14 до 16 лет).</p>
<p>В 2018 году в медальный зачет регионов впервые вместе со взрослыми участниками вошли юниоры. Также впервые в этом году в общем медальном зачете учитывалось количест', 'Южно-Сахалинск');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (11, 'Финал VII Национального чемпионата «Молодые профессионалы» (WorldSkills Russia) 2019 в Казани', '2019-05-20', '2019-05-24', '<p>Финал Национального чемпионата &laquo;Молодые профессионалы (WorldSkills Russia)&raquo; &ndash; это самые масштабные в России соревнования профессионального мастерства по стандартам WorldSkills среди студентов средних профессиональных образовательных учреждений в возрасте от 16 до 22 лет, способствующие профессиональной ориентации молодежи и внедрению в систему отечественного образования лучших международных практик.</p>
<p>В период с 20 по 24 мая 2019 года в Казани в международном выставочном центре &laquo;Казань ЭКСПО&raquo; прошел Финал VII Национального чемпионата &laquo;Молодые профессионалы (Ворлдскиллс Россия)&raquo;. Соревнования прошли в период с 20 по 23 мая 2019 г.</p>
<p>Соревнования прошли по 92 компетенциям.</p>
<p>Сборную Татарстана представляли 260 конкурсантов и 216 экспертов-компатриотов по <strong>81 компетенции &laquo;Ворлдскиллс&raquo; &nbsp;и 48 компетенциям &laquo;Ворлдскиллс Юниоры&raquo;.</strong></p>
<p>Участниками финала VII Национального чемпионата &laquo', 'Казань');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (12, 'Мировой чемпионат по профессиональному мастерству WorldSkills Kazan 2019', '2019-08-22', '2019-08-27', '<p>Свершилось, наконец то, что так долго ждали! 45 Мировой чемпионат по профессиональному мастерству по стандартам WorldSkills прошёл в Казани с 22 по 27 августа. <br /><br /><br />1354 конкурсанта из 63 стран боролись за престижные медали в 56 компетенциях.<br />Китай возглавил итоговую медальную таблицу с 16 золотыми медалями. Россия взяла 14 золотых медалей, а Корея-семь. <br />Республика Татарстан, также внесла существенный вклад в общий медальный зачёт, заняв второе место по числу медалей среди региональных представителей, вошедших в состав сборной России. Для участия в Мировом Чемпионате WorldSkills Kazan 2019 от Республики Татарстан в национальную сборную было отобрано 15 человек по 14 компетенциям:<br />Бетонные строительные работы, Изготовление прототипов, Обслуживание тяжелой техники, Веб-дизайн, Графический дизайн, Инженерный дизайн CAD, Производство металлоконструкций, Ресторанный сервис, Информационные кабельные сети, Медицинский и социальный уход, Технологии моды, Мобильн', 'Казань');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (13, 'Региональный чемпионат «Молодые профессионалы» (WorldSkills Russia) Республики Татарстан 2019', '2019-11-13', '2020-04-06', '<p>С 13 ноября 2019 года по 6 февраля 2020 - го в Республике Татарстан прошёл Региональный чемпионат &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) чемпионатного цикла 2019/2020 годов.</p>
<p>Этот&nbsp;чемпионат прошёл по&nbsp; 97 компетенциям &laquo;Ворлдскиллс&raquo; и 66 компетенциям &laquo;Ворлдскиллс Юниоры&raquo;, в которых приняли участие более 2300 конкурсантов и экспертов.</p>
<p>Чемпионат проходил поэтапно, в 4 основных периода:</p>
<ul>
<li>13-15 ноября 2019 года (основные даты)</li>
<li>20-22 ноября 2019 года (дополнительные даты)</li>
<li>4 - 6 декабря 2019 года (дополнительные даты, в рамках Международной специализированной выставки &laquo;Машиностроение. Металлообработка. Казань&raquo;)</li>
<li>3-6 февраля 2020 года (дополнительные даты)</li>
</ul>
<p>Места проведения: 43 площадки: 11 городов и сёл Татарстана (Бугульма, Елабуга, Зеленодольск, Казань, Лениногорск, Набережные Челны, Нижнекамск, Сарманово, Тетюши, Иннополис, Буинск).</p>
<p>Основными площадками п', 'Республика Татарстан');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (14, 'Отборочные соревнования Финала VIII Национального чемпионата «Молодые профессионалы»( WorldSkills Russia)', '2020-08-01', '2020-08-20', '<p>С 1 по 20 августа 2020 &ndash; Отборочные соревнования Финала VIII Национального чемпионата &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) 2020. Формат проведения- дистанционно-очный.</p>', NULL);
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (15, 'Финал VIII Национального чемпионата «Молодые профессионалы» (WorldSkills Russia) 2020', '2020-09-06', '2020-09-21', '<p>06 &ndash; 20 сентября 2020 - пройдёт Финал VIII Национального чемпионата &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) 2020, с применением дистанционных и онлайн-технологий!</p>
<div class="o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q">
<div dir="auto">Нацфинал этого года станет самым масштабным за всё время. За победу будут бороться более 1700 молодых профессионалов. Экспертное сообщество представят 1100 человек. Студенты и школьники примут участие в соревнованиях по более чем 170 компетенциям. Так, финал национального чемпионата 2020 года станет самым масштабным за все 8 лет проведения. Для победителей региональных этапов по большинству компетенций отменят отборочные испытания, и они сразу попадут во всероссийский финал.</div>
</div>
<div class="o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q">
<div dir="auto">Местом проведения финальных соревнований станут региональные колледжи и центры компетенций. Эксперты будут работать либо в домашнем регионе, либо ', NULL);
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (17, 'Мировой чемпионат по профессиональному мастерству WorldSkills Shanghai 2021', '2021-09-22', '2021-09-27', '<p>С 22 по 27 сентября 2021 года в &nbsp;Китае пройдёт&nbsp;&nbsp; Мировой чемпионат по профессиональному мастерству WorldSkills Shanghai 2021</p>', NULL);
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (18, 'Региональный чемпионат «Молодые профессионалы» (WorldSkills Russia) Республики Татарстан 2020', '2020-11-16', '2020-12-18', '<p>В ноябре &ndash; декабре 2020 года в республике проходит региональный чемпионат &laquo;Молодые профессионалы&raquo; (WorldSkills Russia) Республики Татарстан чемпионатного цикла 2020/2021 годов.</p>
<p>В текущем чемпионатном цикле соревнования состоятся по 238 компетенциям: по <strong>143 компетенциям</strong> &laquo;Ворлдскиллс&raquo; (возрастная категория &laquo;от 16 до 22 лет&raquo;) и по <strong>95 компетенциям</strong> &laquo;Ворлдскиллс Юниоры&raquo; (возрастная категория &laquo;16 лет и моложе&raquo;).</p>
<p>В региональном чемпионате примут участие более <strong>1800 конкурсантов</strong> и <strong>1500 экспертов-компатриотов</strong>, а также 238 главных и заместителей главных экспертов по юниорам, порядка 180 технических администраторов площадок.</p>', 'Республика Татарстан');
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (19, 'Отборочные соревнования Финала IX Национального чемпионата «Молодые профессионалы» (WorldSkills Russia) – 2021.', '2021-04-01', '2021-05-31', '<p>Отборочные соревнования по 189 компетенциям прошли с 1 апреля по 31 мая 2021&nbsp; в 31 регионе России - Москве, Санкт-Петербурге, Томской, Ульяновской, Ярославской областях и др.</p>
<p>Всего от Татарстана в соревнованиях приняли участие&nbsp; 249 конкурсантов и 189 экспертов-компатриотов.</p>', NULL);
INSERT INTO public.competition (id, title, date_start, date_end, description, city) VALUES (20, 'Финал IX Национального чемпионата «Молодые профессионалы» (WorldSkills Russia) — 2021', '2021-08-25', '2021-04-29', '<p class="s4"><span class="s2"><span class="bumpedFont15">Финала IX Национального чемпионата &laquo;Молодые профессионалы&raquo; (</span></span><span class="s2"><span class="bumpedFont15">WorldSkills</span></span>&nbsp;<span class="s2"><span class="bumpedFont15">Russia</span></span><span class="s2"><span class="bumpedFont15">) &mdash; 2021 прошел с 25 по 29 августа 2021 года в г.Уфе. Э</span></span>то самые масштабные в России соревнования профессионального мастерства по стандартам WorldSkills среди студентов средних и высших профессиональных образовательных учреждений в возрасте от 16 до 25 лет и представителей направления WorldSkills Russia Juniors &ndash; школьников до 16 лет.</p>
<p>Соревнования прошли по 105 профессиональным компетенциям и 51 компетенции направления WorldSkills Russia Juniors, разделенным на 7 блоков: строительство и строительные технологии; информационные и коммуникационные технологии; творчество и дизайн; производство и инженерные технологии; сфера услуг; трансп', 'Уфа');


--
-- Data for Name: competition_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (1, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (1, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (1, 53);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (1, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (1, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (1, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (1, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (2, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (2, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (2, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (2, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (2, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (3, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (3, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (3, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 2);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 3);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 4);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 5);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 6);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 7);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 16);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 36);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 43);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 44);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 50);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 53);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 54);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 56);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 58);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 59);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 68);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 69);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 71);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 73);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 80);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 93);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 95);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 97);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 105);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 106);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 107);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 108);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 113);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 115);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 116);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (4, 119);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 2);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 3);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 4);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 6);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 7);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 9);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 11);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 14);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 16);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 18);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 19);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 20);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 21);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 27);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 36);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 37);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 43);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 44);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 50);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 53);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 54);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 58);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 59);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 68);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 69);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 71);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 73);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 80);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 82);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 93);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 95);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 97);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 105);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 106);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 107);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 108);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 113);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 115);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 116);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 119);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (5, 241);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (6, 25);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (6, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (6, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (6, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (6, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (6, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (6, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (7, 25);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (7, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (7, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (7, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (7, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (7, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (7, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 3);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 5);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 14);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 73);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 93);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 95);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 105);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 106);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 107);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 108);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 116);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (8, 119);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (9, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 2);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 27);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 50);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 58);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 69);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 93);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 116);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (10, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 2);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 3);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 4);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 5);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 6);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 7);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 9);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 11);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 16);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 22);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 23);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 26);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 27);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 28);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 36);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 50);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 53);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 54);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 59);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 67);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 68);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 69);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 71);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 73);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 80);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 98);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 99);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 106);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 107);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 113);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 116);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (11, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 4);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 6);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 23);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 30);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 36);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 71);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (12, 244);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 2);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 3);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 4);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 5);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 6);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 7);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 9);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 11);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 14);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 16);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 22);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 23);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 26);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 27);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 30);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 36);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 43);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 44);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 50);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 53);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 54);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 56);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 58);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 59);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 68);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 69);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 71);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 73);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 80);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 93);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 95);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 97);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 98);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 99);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 105);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 106);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 107);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 108);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 113);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 115);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 116);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 119);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 240);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 241);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 244);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 246);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (13, 253);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 2);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 3);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 4);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 5);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 6);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 7);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 11);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 16);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 22);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 23);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 25);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 26);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 27);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 28);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 29);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 36);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 50);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 53);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 54);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 59);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 67);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 68);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 69);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 71);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 73);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 80);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 98);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 99);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 106);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 107);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 113);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 116);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 119);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 242);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 244);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 246);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 247);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (15, 253);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 8);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 9);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 16);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 67);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 68);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 69);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 73);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 113);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (17, 246);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 1);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 2);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 3);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 4);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 6);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 7);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 8);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 9);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 10);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 11);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 13);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 14);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 15);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 16);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 18);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 20);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 22);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 23);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 24);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 26);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 27);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 28);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 30);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 31);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 32);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 33);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 34);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 35);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 36);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 37);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 41);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 42);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 43);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 44);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 45);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 46);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 47);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 48);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 49);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 50);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 51);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 52);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 53);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 54);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 55);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 56);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 57);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 58);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 59);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 67);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 68);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 70);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 71);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 72);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 74);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 75);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 76);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 77);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 78);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 79);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 81);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 83);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 84);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 85);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 86);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 87);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 88);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 89);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 90);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 91);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 92);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 93);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 94);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 95);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 96);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 97);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 98);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 99);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 100);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 101);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 102);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 103);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 104);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 105);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 106);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 107);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 108);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 111);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 112);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 113);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 114);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 115);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 117);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 119);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 240);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 241);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 244);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 246);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 247);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 253);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 254);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 255);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 256);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 257);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 258);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 260);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 261);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 262);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 263);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 265);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 266);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 267);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 268);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 269);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 270);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 271);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 272);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 273);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 274);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 275);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 276);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 277);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 278);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 279);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 280);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 286);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 287);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 288);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 289);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 290);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 291);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 292);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 293);
INSERT INTO public.competition_skill (competition_id, skill_id) VALUES (18, 294);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.regions (id, name, capital, district) VALUES (1, 'Республика Адыгея', 'Майкоп', 'Южный');
INSERT INTO public.regions (id, name, capital, district) VALUES (2, 'Республика Башкортостан', 'Уфа', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (3, 'Республика Бурятия', 'Улан-Удэ', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (4, 'Республика Алтай', 'Горно-Алтайск', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (5, 'Республика Дагестан', 'Махачкала', 'Северо-Кавказский');
INSERT INTO public.regions (id, name, capital, district) VALUES (6, 'Республика Ингушетия', 'Магас', 'Северо-Кавказский');
INSERT INTO public.regions (id, name, capital, district) VALUES (7, 'Кабардино-Балкарская Республика', 'Нальчик', 'Северо-Кавказский');
INSERT INTO public.regions (id, name, capital, district) VALUES (8, 'Республика Калмыкия', 'Элиста', 'Южный');
INSERT INTO public.regions (id, name, capital, district) VALUES (9, 'Республика Карачаево-Черкесия', 'Черкесск', 'Северо-Кавказский');
INSERT INTO public.regions (id, name, capital, district) VALUES (10, 'Республика Карелия', 'Петрозаводск', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (11, 'Республика Коми', 'Сыктывкар', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (12, 'Республика Марий Эл', 'Йошкар-Ола', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (13, 'Республика Мордовия', 'Саранск', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (14, 'Республика Саха (Якутия)', 'Якутск', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (15, 'Республика Северная Осетия-Алания', 'Владикавказ', 'Северо-Кавказский');
INSERT INTO public.regions (id, name, capital, district) VALUES (16, 'Республика Татарстан', 'Казань', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (17, 'Республика Тыва', 'Кызыл', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (18, 'Удмуртская Республика', 'Ижевск', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (19, 'Республика Хакасия', 'Абакан', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (20, 'Чеченская республика', 'Грозный', 'Северо-Кавказский');
INSERT INTO public.regions (id, name, capital, district) VALUES (21, 'Чувашская Республика', 'Чебоксары', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (22, 'Алтайский край', 'Барнаул', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (23, 'Краснодарский край', 'Краснодар', 'Южный');
INSERT INTO public.regions (id, name, capital, district) VALUES (24, 'Красноярский край', 'Красноярск', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (25, 'Приморский край', 'Владивосток', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (26, 'Ставропольский край', 'Ставрополь', 'Северо-Кавказский');
INSERT INTO public.regions (id, name, capital, district) VALUES (27, 'Хабаровский край', 'Хабаровск', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (28, 'Амурская область', 'Благовещенск', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (29, 'Архангельская область', 'Архангельск', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (30, 'Астраханская область', 'Астрахань', 'Южный');
INSERT INTO public.regions (id, name, capital, district) VALUES (31, 'Белгородская область', 'Белгород', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (32, 'Брянская область', 'Брянск', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (33, 'Владимирская область', 'Владимир', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (34, 'Волгоградская область', 'Волгоград', 'Южный');
INSERT INTO public.regions (id, name, capital, district) VALUES (35, 'Вологодская область', 'Вологда', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (36, 'Воронежская область', 'Воронеж', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (37, 'Ивановская область', 'Иваново', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (38, 'Иркутская область', 'Иркутск', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (39, 'Калининградская область', 'Калининград', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (40, 'Калужская область', 'Калуга', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (41, 'Камчатский край', 'Петропавловск-Камчатский', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (42, 'Кемеровская область', 'Кемерово', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (43, 'Кировская область', 'Киров', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (44, 'Костромская область', 'Кострома', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (45, 'Курганская область', 'Курган', 'Уральский');
INSERT INTO public.regions (id, name, capital, district) VALUES (46, 'Курская область', 'Курск', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (47, 'Ленинградская область', 'Санкт-Петербург', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (48, 'Липецкая область', 'Липецк', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (49, 'Магаданская область', 'Магадан', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (50, 'Московская область', 'Москва', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (51, 'Мурманская область', 'Мурманск', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (52, 'Нижегородская область', 'Нижний Новгород', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (53, 'Новгородская область', 'Великий Новгород', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (54, 'Новосибирская область', 'Новосибирск', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (55, 'Омская область', 'Омск', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (56, 'Оренбургская область', 'Оренбург', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (57, 'Орловская область', 'Орел', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (58, 'Пензенская область', 'Пенза', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (59, 'Пермский край', 'Пермь', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (60, 'Псковская область', 'Псков', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (61, 'Ростовская область', 'Ростов-на-Дону', 'Южный');
INSERT INTO public.regions (id, name, capital, district) VALUES (62, 'Рязанская область', 'Рязань', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (63, 'Самарская область', 'Самара', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (64, 'Саратовская область', 'Саратов', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (65, 'Сахалинская область', 'Южно-Сахалинск', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (66, 'Свердловская область', 'Екатеринбург', 'Уральский');
INSERT INTO public.regions (id, name, capital, district) VALUES (67, 'Смоленская область', 'Смоленск', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (68, 'Тамбовская область', 'Тамбов', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (69, 'Тверская область', 'Тверь', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (70, 'Томская область', 'Томск', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (71, 'Тульская область', 'Тула', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (72, 'Тюменская область', 'Тюмень', 'Уральский');
INSERT INTO public.regions (id, name, capital, district) VALUES (73, 'Ульяновская область', 'Ульяновск', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (74, 'Челябинская область', 'Челябинск', 'Уральский');
INSERT INTO public.regions (id, name, capital, district) VALUES (75, 'Читинская область', 'Чита', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (76, 'Ярославская область', 'Ярославль', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (77, 'г. Москва', 'Москва', 'Центральный');
INSERT INTO public.regions (id, name, capital, district) VALUES (78, 'г. Санкт-Петербург', 'Санкт-Петербург', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (79, 'Еврейская автономная область', 'Биробиджан', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (80, 'Агинский Бурятский автономный округ', 'пгт Агинское', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (81, 'Коми-Пермяцкий автономный округ', 'Кудымкар', 'Приволжский');
INSERT INTO public.regions (id, name, capital, district) VALUES (82, 'Корякский автономный округ', 'пгт Палана', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (83, 'Ненецкий автономный округ', 'Нарьян-Мар', 'Северо-Западный');
INSERT INTO public.regions (id, name, capital, district) VALUES (84, 'Таймырский (Долгано-Ненецкий) автономный округ', 'Дудинка', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (85, 'Таймырский (Долгано-Ненецкий) автономный округ', 'пгт Усть-Ордынский', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (86, 'Ханты-Мансийский автономный округ - Югра', 'Ханты-Мансийск', 'Уральский');
INSERT INTO public.regions (id, name, capital, district) VALUES (87, 'Чукотский автономный округ', 'Анадырь', 'Дальневосточный');
INSERT INTO public.regions (id, name, capital, district) VALUES (88, 'Эвенкийский автономный округ', 'пгт Тура', 'Сибирский');
INSERT INTO public.regions (id, name, capital, district) VALUES (89, 'Ямало-Ненецкий автономный округ', 'Салехард', 'Уральский');
INSERT INTO public.regions (id, name, capital, district) VALUES (91, 'Республика Крым', 'Симферополь', 'Южный');
INSERT INTO public.regions (id, name, capital, district) VALUES (92, 'г.Севастополь', 'Севастополь', 'Южный');


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id, role) VALUES (1, 'Участник');
INSERT INTO public.role (id, role) VALUES (2, 'Эксперт');
INSERT INTO public.role (id, role) VALUES (3, 'Главный эксперт');
INSERT INTO public.role (id, role) VALUES (4, 'Заместитель главного эксперта');
INSERT INTO public.role (id, role) VALUES (5, 'Технический эксперт');
INSERT INTO public.role (id, role) VALUES (6, 'Организатор');


--
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (11, 'Укладка напольных покрытий', 4, false, '<p>Укладчики напольных покрытий занимаются укладкой разнообразных материалов для интерьера зданий. Специалист должен уметь начертить план укладки, подготовить основание, изготовить стяжку и сборное основание, а также нанести изолирующие слои.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Floor Laying </strong></p>
<p><strong>Статус компетенции: Презентанционная </strong></p>
<p><strong>Тип: WSE </strong></p>
<p><strong>№ CIS: E50 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 3, 9, 39, 9, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (12, 'Татарские национальные блюда («Татар ашлары»)', 5, false, NULL, 3, 10, 37, 6, 8, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (1, 'Изготовление прототипов', 3, true, '<p>Прототипирование &ndash; это создание опытных образцов или работающей модели с целью проверки возможности реализации проекта для демонстрации модели заказчику. Прототип &ndash; модель изделия создается в соответствии с проектными критериями и характеристиками изделия перед этапом его запуска в массовое производство. Окончательный проект определяется тестированием и изучением функциональности и модификаций изготовленной модели &ndash; прототипа. Основной сферой применения технологии прототипирования является промышленность.</p>
<p>Специалист по прототипированию занимается разработкой, созданием, испытанием и модификацией прототипов. Он должен обладать умением твердотельного моделирования, CAD моделирования, иметь понимание технических деталей, уметь читать чертежи, обладать знанием программы для создания трехмерных моделей, создания трехмерного проекта модели, уметь работать с 3D-принтером, станками с ПУ, 3D-сканером, ручным электроинструментом. Специалист должен иметь навыки слесарн', 2, 10, 39, 8, 8, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (2, 'Аддитивное производство', 3, true, '<p>&nbsp;</p>
<p><strong>&nbsp;</strong></p>
<p>Реверсивный инжиниринг &ndash; это создание производственных проектов на основе уже существующих изделий с целью анализа, улучшения, ремонта или копирования. Реверсивный инжиниринг базируется на оцифровке и компьютерном моделировании, но также требует знаний в области механики, материаловедении и промышленных технологий.</p>
<p>Реверсивный инжиниринг необходим там, где:</p>
<p>- требуется запуск нового производства,</p>
<p>- ведутся научно-исследовательские и опытно-конструкторские разработки,</p>
<p>- осуществляется ремонт уникального оборудования или реставрационная деятельность,</p>
<p>- создается заново утраченная технологическая документация.</p>
<p>Специалист должен владеть компьютерными технологиями объемной оцифровки (оптические, лазерные, ультразвуковые, контактные и магнитно-резонансные), а также навыками компьютерного моделирования и исследования материалов.</p>
<p>Специалисты в области реверсивного инжиниринга востребованы в с', 4, 6, 29, 7, 10, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (3, 'Промышленная робототехника', 3, true, '<p>Промышленная робототехника &ndash; эффективный и гибкий метод автоматизации производства. Она применима практически во всех отраслях промышленности и быстро окупается. Мастера промышленной робототехники конструируют, налаживают, программируют и внедряют роботизированные системы для автоматизации производства. Промышленная робототехника широко распространена в автоматизации сварочных процессов, обслуживании станков, механической обработке, укладке на поддоны готовой продукции. Внедрение роботов для автоматизации на предприятиях позволяет в кратчайшие сроки увеличить объемы производства и снизить производственные издержки.</p>
<p>Специалист должен уметь разработать алгоритм и написать программу управления роботом на языках высокого и/или низкого уровней, знать общие принципы построения автоматических систем управления с обратной связью, иметь представление о системах технического зрения и машинной обработке изображений, а также уметь работать с проводными и беспроводными сетями переда', 4, 8, 25, 8, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (4, 'Лазерные технологии', 3, true, '<p>Специалисты рабочих специальностей в области лазерных технологий (гравер, оператор лазерной установки, сварщик, наладчик оборудования и др.) занимаются высокоточной обработкой материалов в сфере промышленности.&nbsp;</p>
<p>Специалисты в области лазерных технологий должны обладать знаниями и навыками механики, систем с электроуправлением, программирования, робототехники, электроники, материаловедения, сопротивления материалов. Они разрабатывают, конструируют, проводят пусконаладочные работы, осуществляют техническое обслуживание, локализуют и устраняют неисправности специализированного оборудования, а также программируют системы управления лазерных систем.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Laser Technology </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R47 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 10, 31, 5, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (5, 'Инженерия космических систем', 3, true, '<p>&nbsp;</p>
<p>Компетенция представляет собой проектирование, численное моделирование, программирование, сборку и наземные испытания функциональной модели микроспутника дистанционного зондирования Земли.</p>
<p>Квалифицированные специалисты в этой области ведут свою системную задачу от идеи до эксплуатации оборудования на орбите и на земле. Они владеют методами проведения испытаний, проектирования полезных нагрузок и служебных систем космических аппаратов, знают баллистику, динамику космического полета, теорию надежности. Имеют полное представление об электронике, радиотехнике, программировании, материаловедении и организации труда. Специалисты используют оборудование для сборки и испытаний малых космических аппаратов, паяльное и контрольно-измерительное оборудование, вычислительную технику, необходимые инструменты.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Space systems engineering </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>', 3, 8, 35, 9, 5, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (6, 'Технологии композитов', 3, true, '<p>Компетенция &laquo;Технологии композитов&raquo; моделирует работу опытного композитного производства, реализующего компетенции инженеров и высококвалифицированных рабочих кадров. Особенностью соревнований по компетенции &laquo;Технологии композитов&raquo; является то, что это не индивидуальное, а командное соревнование, соревнование команд взаимодополняющих специалистов.</p>
<p>Специалист должен иметь знания в материаловедении, проектировании, расчете и изготовлении изделий из композитов различного назначения, в том числе в экономике производства, а также навыки производства и испытаний данных изделий. Специалист должен уметь спроектировать изделие и технологическую оснастку, провести прочностной расчёт изделия, разработать конструкторскую и технологическую документацию, изготовить технологическую оснастку, изготовить изделие из композита, произвести механическую и финишную обработку изделия и его окончательную сборку.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Comp', 4, 10, 39, 9, 8, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (7, 'Командная работа на производстве', 3, true, '<p>&laquo;Командная работа на производстве&raquo; &ndash; компетенция, где команда из трех специалистов совместно выполняет Конкурсное задание. Соревнование по командной работе на производстве основывается на проектировании, изготовлении, сборке и испытании электромеханического устройства командами совместно работающих специалистов. Участники совместно с тренерами-экспертами компетенции не только делают прототипы электромеханических устройств, но и разрабатывают их с учетом технико-экономических показателей. Компетенция &laquo;Командная работа на производстве&raquo; остро востребована на стыке изобретения устройств и изготовления первых прототипов для массового производства или единичных изделий.</p>
<p>От каждого члена команды требуется способность работать в команде и вносить в нее свой вклад, также важны навыки межличностных отношений. Кроме того, для членов команды необходимо обладать способностью думать за рамками их собственной специализации и границ каждой компетенции, чтобы наи', 4, 7, 31, 6, 3, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (8, 'Облачные технологии', 1, false, '<p>Специалист по облачным вычислениям осуществляет поддержку компаний в проектах миграции физических информационных процессов в виртуальную среду. Инженеры по облачным сервисам, как правило, работают в компаниях в сфере информационных технологий или на крупных устоявшихся предприятиях, имеющих развитую информационную и облачную инфраструктуру.</p>
<p>Эта компетенция охватывает разработку и развертывание инфраструктуры информационных технологий в общедоступной облачной среде. Вид деятельности данного специалиста подразумевает широкий спектр специальностей: системный инженер, администратор баз данных, сетевой инженер, администратор систем хранения данных, архитектор программных систем/сетевых решений/программного обеспечения/корпоративных приложений, программист-разработчик и другие специальности, связанные с информационными и коммуникационными технологиями.</p>
<p>В обязанности специалиста по облачным вычислениям может входить формирование задания на разработку, взаимодействие со служба', 2, 9, 32, 7, 10, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (9, 'Кровельные работы по металлу', 4, false, '<p>Кровельщик по металлу изготавливает из тонколистового металла элементы кровли крыш и обшивки фасадов, в том числе водосточные трубы, карнизы и ограждающие конструкции для балконов, фасадов и крыш, а также производит их установку. Специалист должен обладать навыками сгибания, фальцовки, резки и сварки элементов конструкции из тонколистового металла в соответствии со спецификациями архитекторов и строительных подрядчиков. Он должен уметь собирать из готовых металлических деталей требуемую форму, а также изготавливать кровельное покрытие труб и вентиляционных каналов, устанавливать системы вентиляции, оборудование для кондиционирования воздуха, панели солнечных батарей, устройства для снегозадержания, системы защиты от птиц и громоотводы.</p>
<p>Кровельщик по металлу должен уметь пользоваться гибочными и штамповочными станками с ЧПУ, шлифовальной машиной и пилой, а также расширителем труб. Кровельщикам по металлу необходима развитая мелкая моторика, хороший глазомер и обстоятельный под', 2, 7, 19, 8, 1, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (10, 'Кровельные работы', 4, false, '<p>Кровельщик &ndash; специалист, выполняющий гидроизоляционные работы с применением широкого спектра современных рулонных и мастичных материалов не только на крышах, но и при гидроизоляции систем, находящихся в соприкосновении с землей, а также выполняющий работы по монтажу листовых и штучных материалов на скатных крышах.</p>
<p>Он проводит подготовительные мероприятия перед началом кровельных работ, производит очистку кровель и систем водоотвода в зимний период и при сезонных осмотрах кровель. Если при осмотре обнаружены локальные повреждения гидроизоляционного покрытия, кровельщик их ремонтирует. Выполнение кровельных работ включает в себя монтаж слоев кровельной системы, сборку деревянных несущих конструкций из элементов заводского изготовления и из пиломатериалов. Кровельщик выполняет устройство конструктивных элементов кровли, производит монтаж окон, продухов и элементов инженерных систем. Кровельщик выполняет полный комплекс кровельных работ на крышах криволинейной конструкции, ', 2, 9, 22, 10, 1, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (13, 'Стоматология ортопедическая', 5, false, '<p>Ортопедическая стоматология &ndash; это область стоматологии, которая фокусируется на протезировании зубов в целях улучшения функциональности и эстетики. Ортопедическая стоматология предлагает множество процедур, начиная с таких базовых процедур, как пломбы, коронки и отбеливание зубов, и до самых сложных, таких как протезирование при отсутствии большого количества зубов, лечение зубной эрозии и сложных нарушений функции челюсти.</p>
<p>Современный зубной техник должен воплотить все замыслы врача-ортопеда, а для этого должен обладать хорошим художественным вкусом, абстрактным мышлением, хорошими мануальными навыками, а также знать сложные современные технологии изготовления ортопедических конструкций.</p>', 3, 9, 37, 8, 3, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (14, 'Дизайн интерьера', 6, false, '<p>Дизайнер интерьера разрабатывает дизайн различных зданий и пространств. Как правило, дизайнер интерьера создает интерьер разных помещений, которые могут варьироваться от одной комнаты, например, кухни или гостиной, до целого офисного блока с несколькими отделами. Дизайнер интерьера всегда должен быть клиентоориентированным. Специалист должен удовлетворить потребности клиента по всем аспектам, включая стоимость, осуществимость и экономию. Специалист принимает во внимание возраст, стиль, цель и состояние интерьера, а также обладает брифами различных архитектурных стилей. Он должен понимать условия клиента и его задумки, полностью обдумывая детали с практической точки зрения. Специалист должен работать в соответствии с нормами по защите окружающей среды, охраны соблюдения санитарно-гигиенических норм и техники безопасности.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Interior Design </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><', 2, 6, 20, 6, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (15, '3D моделирование для компьютерных игр', 6, false, '<p>Профессионал в области 3D моделирования изучает задачу, и, комбинируя дизайнерскую концепцию, креативность и свои технические навыки, материализует задумку заказчика в виде трёхмерных моделей. Области работы специалистов: компьютерные игры, кинематограф, анимационные фильмы, виртуальная реальность. Специалист должен владеть прототипированием и созданием дизайн-концепта, трёхмерным моделированием объектов, созданием UV-развёртки, текстурированием модели, риггингом и анимацией.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: 3D Digital Game Art </strong></p>
<p><strong>Статус компетенции: Презентанционная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: D2 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 3, 7, 22, 5, 7, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (16, 'Окраска автомобиля', 7, false, '<p>Маляры по окраске автомобилей отвечают за восстановление красочного покрытия автомобиля, поврежденного в результате аварии, после ремонта или замены корпусной детали и/или панелей. Они также могут принимать заказы на полную перекраску автомобиля для смены цвета или придания ему визуальной новизны.</p>
<p>Маляры по окраске автомобилей готовят панели или транспортные средства к нанесению краски. Они могут выполнять мелкий ремонт панелей и наносить грунтовку, пигментирующий и прозрачный герметизирующий слой для получения необходимого блеска. От них также может потребоваться определить код оттенка разными методами, смешать цвета в необходимых пропорциях для получения определенного оттенка, а также распылить краску на тест-карты для определения соответствия цвета и оттенка оригинальному.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Car Painting </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 36 </strong></p>
<p><strong', 2, 8, 18, 9, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (27, 'Эксплуатация беспилотных авиационных систем', 7, true, '<p>Управление беспилотными летательными аппаратами (БПЛА), в том числе дистанционное пилотирование. Эксплуатация БПЛА, обнаружение и устранение неисправностей. Работа с беспилотниками предполагает различные специализации: техник, оператор, внешний пилот, программист, инженер и другие.</p>
<p>&nbsp;</p>
<p>Необходимые навыки:</p>
<p>- сборка, диагностика и ремонт беспилотников,</p>
<p>- визуальное и FPV-пилотирование,</p>
<p>- грузовые авиаперевозки,</p>
<p>- проектирование автономных полётов,</p>
<p>- программирование систем управления и сбора данных,</p>
<p>- коммуникабельность,</p>
<p>- организованность,</p>
<p>- тайм-менеджмент.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: UAV Operation </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: F1 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 8, 18, 8, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (18, 'Управление бульдозером', 7, false, '<p>В современном строительстве нельзя обойтись без тяжелой строительной техники, в частности бульдозеров. Их применяют при постройке дорог, зданий, мостов и различных коммуникаций.</p>
<p>Машинист бульдозера -работа сложная и ответственная. В процессе машинист выполняет планировку строительной площадки, засыпку траншей, срезание грунта. Для работы в опасных или неблагоприятных условиях рабочий должен отвечать индивидуальным требованиям профессии. Рабочее место машиниста &mdash; это кабина бульдозера.</p>
<p>Основные операции - подъем и опускание отвала, передвижение строительного транспорта. Ремонт и уход за доверенной техникой также осуществляет машинист бульдозера.</p>
<p>В обязанности машиниста бульдозера входит: управление этой машиной и применение ее строго по назначению, четкое знание и соблюдение техники безопасности, правил эксплуатации и требований ППД во избежание несчастных случаев и аварий, грамотное и регулярное техническое обслуживание бульдозера , ремонт неисправностей, ', 2, 10, 27, 10, 0, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (19, 'Управление автогрейдером', 7, false, '<p>Машинист автогрейдера &ndash; это квалифицированный рабочий, выполняющий механизированные работы с применением автогреи?дера в условиях строительства, обслуживания и ремонта автомобильных дорог, аэродромов, гидротехнических и других сооружении? в соответствии со строительными нормами и правилами, а также отвечает за техническое обслуживание и хранение автогреи?дера.</p>
<p>Специалист должен обладать знаниями в области востребованных дорожно-строительной отраслью технологий выполнения дорожно-строительных работ. Кроме того, для выполнения работ необходима физическая сила и выносливость, высокая острота слуха и зрения, высокая скорость и точность сенсомоторных реакций, развитый глазомер (линейный, плоскостной, объемный), умение распределять и быстро переключать внимание, хорошая зрительная память, склонность к работе с техникой, техническое мышление, хорошая пространственная ориентация, способность предвидеть развитие дорожных ситуаций, наблюдательность и терпение, дисциплинированност', 2, 7, 24, 8, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (20, 'Управление экскаватором', 7, false, '<p>Экскаватор можно назвать универсальной техникой, поэтому от работника, управляющего этой машиной, требуются различные навыки и умения. Люди этой профессии требуются везде, где есть необходимость проведения земельных работ: в строительном и дорожном деле, при укладке</p>
<p>железнодорожного полотна, прокладке коммуникаций, уборке снега и мусора. Машинист экскаватора управляет механизмом при выполнении строительных, монтажных и ремонтно-строительных работ, ведет разработку грунта при устройстве дорожного полотна, выполняет в составе ремонтной бригады текущий ремонт экскаватора, устраняет неисправности, возникшие в процессе эксплуатации.</p>
<p>При выполнении всех видов работ машинист экскаватора должен знать: устройство, правила и инструкции по эксплуатации, техническому уходу и профилактическому ремонту экскаватора, требования к качеству работ, правила разработки грунтов различной категории.</p>
<p>Профессия машиниста экскаватора является вредной. Хотя это работа на открытом воздухе,', 4, 7, 15, 10, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (21, 'Управление фронтальным погрузчиком', 7, false, NULL, 2, 9, 40, 6, 4, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (22, 'Интернет вещей', 3, true, '<p>Компетенция &laquo;Интернет вещей&raquo; представляет собой деятельность по системной организации взаимодействия устройств, связанных через интернет, различных источников и потребителей данных, с целью сбора и анализа данных, управления устройствами. Квалифицированные специалисты в данной области могут создавать распределенные системы управления устройствами, расположенными на значительном удалении друг от друга, в том числе в разных частях света, с использованием облачных технологий. Ключевыми навыками специалиста в компетенции являются: системная инженерия, разработка систем обработки данных, визуализация данных, проектирование интерфейсов приложений систем управления.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Internet of things </strong></p>
<p><strong>Статус компетенции: Презентанционная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R23 </strong></p>
<p><strong>Количество конкурсантов в команде: 2</strong></p>', 3, 6, 30, 5, 2, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (23, 'Разработка мобильных приложений', 1, true, '<p>Смартфоны продаются и продажи только растут. Компании всё больше вкладывают в развитие мобильных технологий, благодаря чему потребители из просто пользователей плавно превращаются в тех, кто использует мобильные устройства везде и всегда: на работе, дома, на отдыхе, что приводит к важным последствиям для компаний-разработчиков мобильных приложений. Спрос на mobile-программистов, способных выполнять множество профессиональных задач, растёт высокими темпами, а подходящих профессионалов на рынке сейчас появляется крайне мало. Основная задача специалиста по разработке мобильных приложений &ndash; создание мобильного приложения, сочетающего в себе такие обязательные качества, как безотказная работа на одной из мобильных операционных платформ (Apple iOS, Google Android, Windows Phone), удобный пользовательский интерфейс, многофункциональность.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Mobile application development </strong></p>
<p><strong>Статус компете', 2, 7, 32, 9, 1, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (24, 'Промышленный дизайн', 6, true, '<p>Компетенция &laquo;Промышленный дизайн&raquo; &ndash; это прототипирование бытовой техники, производственных установок и их интерфейсов, наземного и воздушного транспорта, в том числе автомобилей, самолётов, поездов, разнообразного инвентаря. Компетенция определяет функциональные и эстетические качества продукции и соединяет технологичность с элементами искусства, науки, маркетинга. <br /><br />Необходимые навыки:<br /><br />- операции с киберфизическими системами,<br />&nbsp;&nbsp;<br />- 3D-моделирование, проектирование и визуализация данных,<br /><br />- понимание различных целевых рынков,<br /><br />- знание принципов эстетического и творческого дизайна и понимание концепции и конкретных элементов дизайна,<br /><br />- знание технических стандартов и понимание свойств современных материалов и формообразования,&nbsp;<br />&nbsp;&nbsp;<br />- знание технологий и технологических процессов, &nbsp;<br /><br />- использование корректирующих эргономических таблиц и справочников,<br /><', 2, 9, 15, 8, 10, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (25, 'Корпоративная защита от внутренних угроз информационной безопасности', 1, true, '<p>Одна из главных угроз информационной безопасности корпораций &ndash; это утечка данных из-за действий сотрудников. Причины утечки могут быть разными, от халатности и неосторожности до злого умысла. Специалист по корпоративной защите от внутренних угроз информационной безопасности предотвращает любые утечки данных.</p>
<p>&nbsp;</p>
<p>Необходимые навыки:</p>
<p>- операции с киберфизическими системами,</p>
<p>- владение DLP-системами и технологиями для обеспечения информационной безопасности,</p>
<p>- выявление инцидентов в перехваченном трафике,</p>
<p>- установка, конфигурирование и устранение неисправностей в системе корпоративной защиты от внутренних угроз,</p>
<p>- обследование объекта информатизации,</p>
<p>- разработка политики безопасности в системе корпоративной защиты от внутренних угроз,</p>
<p>- технологии агентского мониторинга,</p>
<p>- анализ выявленных инцидентов,</p>
<p>- подготовка отчётов, классификация угроз и инцидентов,</p>
<p>- организация работы и управление,<', 2, 6, 28, 8, 5, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (26, 'Разработка виртуальной и дополненной реальности', 1, true, '<p>Разработчик виртуальной и дополненной реальности использует современное оборудование и инструменты для создания самых разных продуктов: сайтов, приложений, игр. Для этого специалисту по AR/VR необходимо сочетать навыки прототипирования, программирования, 3D-моделирования и художественного дизайна.</p>
<p><br />Необходимые навыки: <br /><br />- программирование,<br /><br />- прототипирование на современных AR- / VR-движках,&nbsp;<br /><br />- создание 3D-моделей, спецэффектов, удобного интерфейса,&nbsp;<br /><br />- оптимизация и сборка приложений в дополненной и виртуальной реальности,<br /><br />- составление дизайн-документов, отражающих работу будущих приложений,<br /><br />&nbsp;- художественный дизайн,<br /><br />&nbsp;- коммуникабельность,<br /><br />&nbsp;- работа в команде,<br /><br />&nbsp;- выявление и решение проблем,<br /><br />&nbsp;- креативное мышление,<br /><br />&nbsp;- инновационность и инициативность</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Virt', 4, 10, 24, 10, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (28, 'Квантовые технологии', 1, true, '<p>Квантовое шифрование применяют для защиты информации, так как безопасность передачи данных в этом случае гарантируют сами фундаментальные законы физики. Квантовые технологии позволяют моментально обнаружить компрометацию распределения ключевых документов в линии связи, а значит, пользователи могут быть уверены, что злоумышленник не получит доступ к их информации.<br /><br />Необходимые навыки: <br /><br />- знание основ квантовой физики,<br /><br />- понимание физики процессов, используемых в квантовой криптографии,<br /><br />- понимание принципов работы оптических и электронно-оптических компонентов,<br /><br />- знание устройства и принципов работы автокомпенсационной двухпроходной схемы распределения квантового ключа,<br /><br />- знание устройства и принципов работы сварочного аппарата ВОЛС,<br /><br />- умение пользоваться стандартным лабораторным оборудованием (осциллографом, измерителем оптической мощности),<br /><br />- понимание принципов работы квантового компьютера,<br /', 2, 10, 16, 6, 6, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (29, 'Машинное обучение и большие данные', 1, false, '<p>Эта компетенция подразумевает способность организовать распознавание, анализ и обработку большого объема данных, в том числе неструктурированных, без использования чётких детерминированных алгоритмов. Компетенция позволяет решать множество практических задач. А благодаря большому опыту в области машинного обучения, накопленному индустрией, и новым инструментам становится возможным прогнозировать развитие проблем и использовать графику для его моделирования.<br /><br />Необходимые навыки:<br /><br />- корректная обработка данных,<br /><br />- эффективный обмен данными,<br /><br />- проведение базовой разведки больших сложных наборов данных,<br /><br />- знание языков программирования (Python, R),<br /><br />- выявление и решение проблем,<br /><br />- инновационность и инициативность,<br /><br />- обучаемость,<br /><br />- усидчивость,<br /><br />- ответственность.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Machine learning and big data</strong></p>
<p><strong>Статус ', 3, 9, 40, 6, 4, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (30, 'Цифровой модельер', 6, true, '<p><strong>&nbsp;</strong></p>
<p>Задачи цифрового модельера &ndash; проектирование, демонстрация и испытание свойств одежды в виртуальной среде. <br /><br />Цифровые технологии в моделировании позволяют определить качество посадки, удобство эксплуатации и конечный внешний вид без создания физического образца модели. Такой способ моделирования делает доступным массовое производство продукции по индивидуальным заказам.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Digital fashion designer </strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: T32 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 2, 10, 35, 6, 1, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (31, 'Информационные кабельные сети', 1, false, '<p><strong>&nbsp;</strong></p>
<p>Информационные кабельные сети присутствуют во всех сферах нашей жизни и являются фундаментом при построении сетей мобильной связи, локальных вычислительных сетей, сетей кабельного телевидения, глобальных компьютерных сетей (WAN), сетей видеонаблюдения и других слаботочных сетей.</p>
<p>Специалист по &laquo;Информационным кабельным сетям&raquo; способен создавать инфраструктуру практически для всех видов телекоммуникационных сетей, в соответствии со знаниями, пониманием требований стандартов отрасли и конкретными навыками, которые лежат в основе лучшей практики в области профессионального исполнения.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Information Network Cabling </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 02 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 7, 22, 7, 3, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (32, 'Программные решения для бизнеса', 1, false, '<p>Спрос на ИТ-специалистов растет в целом ряде отраслей, одной из которых является предоставление программных решений для бизнеса.</p>
<p>Разработка программных решений для повышения производительности бизнеса охватывает многочисленные компетенции и дисциплины. Профессионалы в области программных решений всегда тесно сотрудничают с клиентами для модификации существующих или создания новых систем. Они могут модифицировать готовое программное обеспечение и интегрировать его в существующие системы. Они часто работают в составе команды профессиональных программистов, отвечающих за спецификацию требований, системный анализ и проектирование, построение, испытание, обучение и развертывание, а также техническое обслуживание коммерческих программных систем.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: IT Software Solutions for Business </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 09 </strong></p>
<p><stro', 4, 7, 38, 6, 0, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (33, 'Полиграфические технологии', 1, false, '<p>Техник-технолог в области печатных технологий вовлечен во все этапы процесса печати, начиная от первоначального планирования и подготовки и заканчивая тиражированием издания. Он осуществляет проверку качества и выполняет завершающие операции после печати тиража. Работа, как правило, представляет собой крупномасштабное производство печатных материалов для широкого круга потребителей.</p>
<p>Техник-технолог в области печатных технологий в прессе должен владеть основами технического обслуживания оборудования, уметь обнаружить и устранить неисправность, а также обеспечить правильный технологический процесс, когда все элементы печатного процесса выбраны правильно и соответствуют друг другу: печатная краска, бумага, оборудование. Кроме того, он должен обладать навыками смешивания индивидуальных цветов (Pantone) и работать на резальном оборудовании для выполнения заказа в соответствии с требованиями заказчика. Обязательным является процесс контроля качества с применением контрольно-измерит', 3, 7, 29, 8, 5, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (34, 'Веб-дизайн и разработка', 1, false, '<p>Веб-разработчик является динамичной, постоянно меняющейся профессией, сферой деятельности которой является создание и функционирование веб-сайтов. Веб-разработчики используют для создания веб-сайтов специальные программы и языки программирования и разметки, которые связывают ссылки на различные веб-страницы, другие веб-сайты, графические элементы, текст и фото в единый функциональный и удобный информационный продукт.</p>
<p>Веб-разработчик осведомлен как в области технологий, так и в графическом дизайне. Творческие способности нужны веб-разработчикам при подборе цветов, шрифтов и графики, для поддержки эффективной рабочей коммуникации с профессиональными дизайнерами, а также при разработке структуры сайта. Веб-разработчик также обязан знать основы проектной работы, продукцию, которой посвящен контент сайта, знать технологии и методы программирования на стороне сервера и клиента, разбираться в основах программной архитектуры и базах данных для хранения информации и организации сложны', 4, 9, 27, 10, 8, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (35, 'Сетевое и системное администрирование', 1, false, '<p>Сетевое и системное администрирование требует широких познаний в области информационных технологий. В связи с быстрым развитием этой области требования к администраторам постоянно возрастают.</p>
<p>Системный и сетевой администратор должен уметь разрабатывать и развертывать комплексную информационную инфраструктуру предприятий, развертывать основные сервисы, использовать широкий набор операционных систем и серверного ПО, эффективно организовывать защищенные соединения сетей предприятий, доступ в Интернет и иные сети, устанавливать и настраивать устройства беспроводной сети, коммутаторы, маршрутизаторы и средства защиты информации. Он должен организовывать защиту информации от несанкционированного доступа, разрабатывать документацию информационной структуры предприятия, устанавливать, настраивать и отлаживать программные и аппаратные средства VoIP, сервисы на базе протоколов IPv4 и IPv6, осуществлять поиск и устранение неисправностей в работе информационных систем и сетей.</p>
<p>&nb', 3, 10, 20, 7, 7, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (36, 'ИТ-решения для бизнеса на платформе "1С: Предприятие 8"', 1, false, '<p>В современных условиях хорошая автоматизация управления и учета является существенным фактором повышения эффективности бизнеса. ИТ-специалисты, владеющие технологиями 1С, востребованы в крупных, средних и малых компаниях в качестве программистов, консультантов, аналитиков.</p>
<p>Работа в области автоматизации бизнеса требует знаний и навыков в разнообразных областях: от анализа требований &ndash; до выбора эффективных инструментов разработки, от проектирования систем &ndash; до обучения пользователей и эффективных коммуникаций в команде. Разработанное ИТ-решение должно соответствовать требованиям заказчика, быть работоспособным и следовать современным отраслевым стандартам.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: IT Software Solutions for Business "1C: Enterprise 8" </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R71 </strong></p>
<p><strong>Количество конкурсантов в команде:', 2, 7, 33, 8, 6, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (37, 'Разработка компьютерных игр и мультимедийных приложений', 1, false, '<p><strong>&nbsp;</strong></p>
<p>Разработка компьютерных игр и мультимедийных приложений &ndash; процесс создания компьютерных программ, предназначенных для обучения и развлечения пользователей. Игры и мультимедийные приложения относятся к классу программных систем высокой сложности. Разработка их требует высокой квалификации. Проектирование игр, как программных систем, требует от специалиста умений анализа требований к программной системе, навыков программирования, особенностей технических средств и сред разработки. Кроме того, реализация компьютерных игр требует знаний в области разработки алгоритмов, проектирования и разработки интерактивных приложений, двумерной и трехмерной компьютерной графики, кроссплатформенном программировании и т.д. В процесс разработки входит анализ и постановка задачи, разработка игровых объектов и анимаций, настройка физики и методов взаимодействия пользователя с игровыми объектами, разработка алгоритмов поиска пути и элементов искусственного интеллекта, ', 2, 7, 36, 10, 7, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (39, 'Информационная безопасность', 1, false, '<p>Специалист по анализу безопасности информационных систем обеспечивает защиту компьютерных сетей и систем организации от проникновения злоумышленников и хищения конфиденциальных данных. Работодателями часто выступают поставщики ИТ-услуг, банковские и финансовые организации, государственные ведомства и медицинские компании.</p>
<p>Работа специалиста по анализу безопасности информационных систем, как правило, связана с установкой межсетевых защитных экранов и программного обеспечения шифрования данных для защиты конфиденциальной информации. В круг обязанностей такого специалиста входит контроль сети организации, выявление &laquo;взломов&raquo; в системе безопасности и расследование возникающих нарушений. Штатных специалистов по анализу безопасности информационных систем часто привлекают к разработке и исполнению планов по ликвидации последствий чрезвычайной ситуации, в которых определены действия и процедуры восстановления надлежащей работы информационных систем и сетей организации пос', 3, 10, 29, 9, 8, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (41, 'Преподавание в младших классах', 2, false, '<p>Квалифицированные специалисты в сфере начального общего образования владеют широким спектром современных технологий, позволяющих эффективно решать задачи, связанные с обучением и воспитанием, созданием условий для всестороннего развития личности ребенка.</p>
<p>Преподаватель обладает достаточным уровнем развития общей культуры, профессиональной этики, специальных знаний и навыков, активно использует в профессиональной деятельности интерактивное оборудование. Готовность к переменам, мобильность, способность к нестандартным трудовым действиям, ответственность и самостоятельность в принятии решений &ndash; все эти характеристики деятельности успешного профессионала в полной мере относятся и к специалисту по работе с детьми младшего школьного возраста. Осуществляя профессиональную деятельность, преподаватель младших классов должен обладать комплексом универсальных знаний фундаментального характера; умениями, навыками и опытом самостоятельной деятельности; личной ответственностью, способ', 3, 8, 29, 10, 3, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (42, 'Дошкольное воспитание', 2, false, '<p>&nbsp;</p>
<p>Воспитатель детей дошкольного возраста осуществляет присмотр и уход за детьми в соответствии с санитарными нормами и правилами безопасности жизни и здоровья детей дошкольного возраста, организует и проводит мероприятия, направленные на укрепление здоровья ребенка и его физическое развитие, организует и проводит различные виды деятельности (игровую, исследовательскую, проектную, познавательную и т.д.) и общение детей, организует и проводит занятия по основным общеобразовательным программам дошкольного образования, взаимодействует с родителями и сотрудниками образовательной организации, организует методическое обеспечение образовательного процесса. Также в сферу его ответственности входит соблюдение техники безопасности и санитарных норм.</p>
<p>Воспитатель детей дошкольного возраста организует виды деятельности, способствующие развитию мышления, речи, общения, воображения и детского творчества, личностного, физического и художественно-эстетического развития детей. Подде', 4, 8, 27, 5, 4, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (43, 'Преподавание музыки в школе', 2, false, '<p>Компетенция &laquo;Преподавание музыки в школе&raquo; построена не только на обучении и воспитании, но и на самовыражении, креативности, коммуникации, эмпатии, что позволяет создавать новые формы взаимодействия, раскрывая творческий потенциал детской аудитории в специально организованном образовательном пространстве.</p>
<p>Профессионально-педагогическая компетентность учителя музыки требует многоуровневой, квалифицированной подготовки, так как она синтезирует основные виды музыкально-творческой деятельности. Гармоничное сочетание учителем музыки разнообразных видов творческой, музыкальной и интеллектуальной деятельности в образовательном процессе выражается в умении вовлечь ребенка в творческий процесс, создании благоприятной эстетической атмосферы на занятии, помощи школьникам в корректировке своего мировосприятия с духовными и аксиологическими ориентирами, в том числе и в области музыкального искусства, &ndash; это показатель высокого профессионализма специалиста в области музыка', 2, 8, 31, 7, 10, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (44, 'Физическая культура, спорт и фитнес', 2, false, '<p>Компетенция &laquo;Физическая культура, спорт и фитнес&raquo; включает в себя совокупность специальностей: физическая культура и адаптивная физическая культура.</p>
<p>Специалист в области физической культуры и спорта организует и проводит учебные занятия для обучающихся, организует физкультурно-спортивную, физкультурно-оздоровительную деятельность обучающихся в рамках реализации программ дополнительного образования и различных возрастных групп населения, осуществляет педагогический контроль, осуществляет подбор и подготовку необходимого методического материала, спортивного оборудования и инвентаря к занятиям, мотивирует обучающихся и население различных возрастных групп на здоровый образ жизни.</p>
<p>Готовность к переменам, мобильность, способность к нестандартным трудовым действиям, ответственность и самостоятельность в принятии решений &ndash; все эти характеристики деятельности успешного профессионала в полной мере относятся и к специалисту в области физической культуры и спорт', 4, 6, 32, 6, 5, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (45, 'Полимеханика и автоматизация', 3, false, '<p>К специалистам в области полимеханики и автоматики относятся механики-монтажники и наладчики, работающие на промышленных предприятиях. Используя обрабатывающие инструменты, специалисты по полимеханике и автоматике могут изготавливать и устанавливать комплектующие для производственных механизмов и оборудования. Данная профессия требует достаточной компетенции в области автоматики и логического управления, соответствующих базовых знаний о работе с электричеством и электрическими цепями. Автоматика часто подразумевает работу с пневмоаппаратами, поэтому требуется также базовое понимание и навыки соответствующих технологий.</p>
<p>Специалист должен обладать следующими навыками: чтение технической документации (стандарты ISO), понимание терминологии и условных обозначений, используемых в инженерных чертежах и спецификациях, производство деталей с применением металлорежущих станков, обработка, проверка и поддержание точности размеров в пределах погрешностей, монтаж изготовленных деталей со', 4, 6, 28, 6, 10, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (46, 'Мехатроника', 3, false, '<p>&nbsp;</p>
<p>Мехатроника &ndash; это область науки и техники, основанная на объединении узлов точной механики с электронными, электротехническими, пневматическими и компьютерными компонентами. Специалисты в области мехатроники занимаются проектированием, производством и пуско-наладкой систем с интеллектуальным управлением.</p>
<p>Специалисты в области мехатроники должны читать, понимать и проектировать принципиальные и монтажные схемы и чертежи (электрика, механика), проводить монтаж и пуско-наладку мехатронных систем по имеющимся схемам, чертежам и описаниям, а также подключать, конфигурировать и программировать ПЛК (программируемые логические контроллеры), настраивать промышленные сети, включать в состав мехатронных систем устройства человеко-машинного интерфейса и обнаруживать, локализовать и находить пути устранения неисправностей в мехатронных системах.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Mechatronics </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<', 4, 10, 29, 5, 5, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (47, 'Токарные работы на станках с ЧПУ', 3, false, '<p>&nbsp;</p>
<p>Токарный станок с технологией числового программного управления позволил специалисту в этой области значительно повысить сложность производимых изделий, а также увеличить скорость и точность их производства. К имеющимся знаниям токаря добавилось компьютерное программирование в CAD/CAM системах и умение управлять станком с ЧПУ.</p>
<p>Станок с ЧПУ оснащен компьютером, который читает инструкции (&laquo;G-коды&raquo;) и приводит в действие станок, используемый для производства деталей посредством выборочного удаления материала. Для этого необходима программа, состоящая из &laquo;G-кодов&raquo;, которая может создаваться вручную и/или автоматически, при помощи программного обеспечения CAD/CAM, дополняемого необходимыми станочными циклами.</p>
<p>Специалист должен уметь читать чертеж, определять базовые поверхности выполняемой детали, подбирать необходимый инструмент для выполнения задачи, иметь навыки наладки и управления токарным станком с ЧПУ, а также написания программы', 2, 10, 33, 6, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (48, 'Фрезерные работы на станках с ЧПУ', 3, false, '<p>Фрезерный станок с технологией числового программного управления позволил специалисту в этой области значительно повысить сложность производимых изделий, а также увеличить скорость и точность их производства. К имеющимся знаниям токаря добавилось компьютерное программирование в CAD/CAM системах и умение управлять станком с ЧПУ.</p>
<p>Станок с ЧПУ оснащен компьютером, который читает инструкции (&laquo;G-коды&raquo;) и приводит в действие станок, используемый для производства деталей посредством выборочного удаления материала. Для этого необходима программа, состоящая из &laquo;G-кодов&raquo;, которая может создаваться вручную и/или автоматически, при помощи программного обеспечения CAD/CAM, дополняемого необходимыми станочными циклами.</p>
<p>Специалист должен уметь читать чертеж, определять базовые поверхности выполняемой детали, подбирать необходимый инструмент для выполнения задач, иметь навыки наладки и управления фрезерным станком с ЧПУ, а также написания программы.</p>
<p><str', 2, 6, 17, 6, 4, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (49, 'Сварочные технологии', 3, false, '<p>Сварка является ключевым процессом, который находится под контролем как национальных, так и международных стандартов и спецификаций, регулирующих качество материалов и квалификацию сварщика.</p>
<p>Сварщик подготавливает и осуществляет соединение ряда металлов и металлических сплавов. Им необходимо разбираться в электричестве и в том, как оно используется в сварочных технологиях. Сварщики соединяют элементы конструкций, труб и пластин, а также изготавливают крупно и малогабаритные резервуары высокого давления. Они используют шлифовальное и режущее оборудование для подготовки сварных соединений. Современные методики соединения, а также вышеперечисленные технологии включают механизированные процессы, например, дуговую сварку под флюсом, плазменную дуговую сварку, приварку шпилек и лазерную сварку. Сварщик должен уметь интерпретировать инженерные чертежи, стандарты и символы и правильно применять эти требования в практической работе. Сварщики должны обладать глубокими знаниями и понима', 3, 10, 31, 9, 0, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (50, 'Электроника', 3, false, '<p>Компетенция &laquo;Электроника&raquo; представляет высокотехнологичную индустрию, охватывающую на современном этапе развития почти все сферы деятельности человечества, где в той или иной форме применяются электронные устройства.</p>
<p>Квалифицированные специалисты в данной области занимаются вопросами разработки электронного оборудования, приборов и устройств. Выполняют работы по их сборке и подключению, производят установку оборудования и вводят его в эксплуатацию, а также осуществляют обслуживание оборудования в процессе эксплуатации и производят его ремонт. В процессе своей работы специалисты используют сложное специализированное оборудование и широкий набор инструментов, включая измерительные приборы, паяльное оборудование. Также активно применяют компьютеры и специальные средства разработки программного обеспечения для создания программ для встроенных систем, программируемых устройств и настольных систем.</p>
<p>В рамках выполнения конкурсных заданий участники должны продемонс', 4, 6, 25, 7, 7, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (51, 'Промышленная автоматика', 3, false, '<p>Промышленная автоматизация заключается в использовании &laquo;интеллектуальных&raquo; приборов, которые позволяют минимизировать участие человека в технологическом процессе. Автоматизация предполагает применение различных систем управления, которые заставляют технологическое оборудование практически без вмешательства человека выполнять задачи, требующие скорости, точности и выносливости, недоступных человеку.</p>
<p>От специалиста по промышленной автоматике требуется широкий спектр технических компетенций, включая монтаж каналов, кабелей, приборов, устройств ввода/вывода и программируемых логических контроллеров. Кроме того, специалист по промышленной автоматике проектирует электрические цепи, программирует логические контроллеры, параметрирует магистральные системы и конфигурирует человеко-машинные интерфейсы. Одним из важных навыков специалиста по промышленной автоматике является диагностика, куда входит идентификация проблем во время монтажа установок в составе нового предприятия', 4, 6, 22, 9, 4, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (52, 'Мобильная робототехника', 3, false, '<p>Мобильная робототехника является важной частью промышленности с прикладным применением в разнообразных отраслях, включая обрабатывающую промышленность, сельское хозяйство, аэрокосмическую промышленность, горнодобывающую промышленность и медицину. Техник-робототехник и инженер-робототехник проектируют, обслуживают, разрабатывают новые приложения и проводят исследования, расширяющие потенциал применения роботов.</p>
<p>Специалист должен быть хорошо знаком с логикой, микропроцессорами, компьютерным программированием, механическими, электрическими и управляющими системами, чтобы быть в состоянии создать робота для любого применения. Он также должен подготавливать спецификации для поведения робота в его рабочей среде. Кроме того, техник или инженер-робототехник отвечает за экономически эффективное проектирование, калькуляцию цены производства и контроль качества.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Mobile Robotics </strong></p>
<p><strong>Статус компетенции: Основ', 3, 9, 32, 5, 0, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (53, 'Производство металлоконструкций', 3, false, '<p>Производство металлоконструкций применяется в таких отраслях промышленности как производство молочной, фармацевтической и химической продукции, а также в проектах по строительству дорог и гражданских сооружений, которые могут включать металлоконструкции для зданий, мостов или подъемного оборудования.</p>
<p>Оператор по производству металлоконструкций должен иметь хорошие знания в области математических вычислений и геометрических методов, должен уметь читать простые и сложные технические чертежи, изготавливать небольшие и крупные конструкции, проверять их на корректность размеров, прямоугольность, параллельность и гладкость. Он должен обладать всесторонними знаниями о процессах промышленной резки и формовки, подходящих для различных материалов. Специалист использует различный режущий и формовочный инструмент и оборудование, чтобы подготовить секции для сборки, использует различные виды стандартных сварочных процессов, чтобы собрать и присоединить эти материалы к конструкциям и проду', 2, 9, 34, 9, 10, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (54, 'Изготовление изделий из полимерных материалов', 3, false, '<p><strong>&nbsp;</strong></p>
<p>Технология изготовления изделий из полимерных материалов применяется в сфере массового производства высококачественных пластиковых изделий с низкой себестоимостью. Проектирование и обработка формы для литья осуществляются с помощью систем автоматизированного проектирования и систем автоматизированной обработки. Обработка в основном осуществляется обрабатывающими центрами с ЧПУ. Затем производятся полировка обработанных частей в соответствии с требованиями и их сборка по чертежам для последующих испытаний.</p>
<p>Специалист должен иметь навыки проектирования трехмерной модели, моделирования пресс-формы и разработки обрабатывающей программы для обрабатывающего центра с ЧПУ. Он должен уметь использовать слесарное оборудование для доведения изготовленной пресс-формы до соответствия условиям чертежа, а также использовать литьевую машину для получения итогового изделия.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Plastic Die ', 4, 9, 36, 8, 2, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (55, 'Инженерный дизайн CAD', 3, false, '<p><strong>&nbsp;</strong></p>
<p>Термином &laquo;Инженерный дизайн CAD (САПР)&raquo; обозначается процесс использования систем автоматизированного проектирования (САПР, CAD) при подготовке электронных моделей, чертежей и файлов, содержащих всю информацию, необходимую для изготовления и документирования деталей и сборочных единиц для решения механических инженерных задач, с которыми сталкиваются работники отрасли. Решения должны соответствовать стандартам промышленности и актуальной версии стандартов ЕСКД (либо стандарта ISO).</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Mechanical Engineering CAD </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 05 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 2, 9, 17, 8, 2, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (56, 'Производственная сборка изделий авиационной техники', 3, false, '<p>Данная компетенция представляет собой производство сборочных единиц самолетов, вертолетов и прочих летательных аппаратов, сборка летательных аппаратов различных типов, а также сборка опытных и экспериментальных изделий, комплексная отработка и проверка взаимодействия систем собранных изделий.&nbsp;</p>
<p>Специалист проводит сборку и клепку в стапелях и вне стапелей узловых соединений всеми видами и способами клепки заклепками.&nbsp; Специалист должен уметь проводить подгонку, разметку, сверление, зенкование и клепку авиационных узлов и соединений с криволинейной поверхностью. Контролировать перпендикулярности осей отверстий и глубины отзенкованных гнезд с использованием мерительного инструмента. Он должен уметь проводить подналадку отдельных узлов и механизмов обслуживаемого оборудования в процессе работы.</p>
<p><strong>Название ENG: Aircraft Assembly </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R49 </strong', 3, 7, 34, 7, 7, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (57, 'Лабораторный химический анализ', 3, false, '<p>&nbsp;</p>
<p>Специалисты данной области проводят пробоподготовку, подготовку оборудования и реактивов в соответствии с нормативной документацией. Профессионалы данной компетенции осуществляют качественный и количественный анализ природных и промышленных материалов химическими и физико-химическими методами. Работа лаборанта химического анализа является основой качества производимой продукции во многих отраслях промышленности. Химический анализ необходим для контроля соответствия свойств входного сырья, промежуточных продуктов технологического процесса и готовой продукции существующим нормативам.</p>
<p>Лаборант химического анализа занимается выполнением лабораторных анализов, испытаний, измерений, направленных на определение качественного химического состава вещества и количественных соотношений в нем химических элементов и соединений, обработкой полученных данных, оформлением результатов анализов и других видов лабораторных работ в соответствии с требованиями стандартов и техническ', 4, 10, 21, 10, 0, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (58, 'Обработка листового металла', 3, false, '<p>Компетенция &laquo;Обработка листового металла&raquo; представляет собой изготовление изделий из листового металла. Участник разрабатывает заготовки изделия в программе AutoCAD, далее посредством машинной или ручной резки выполняет раскрой, придаёт нужную форму листа и производит сборку изделия. При сборке участник применяет различные соединения (сварка, клепка, резьбовые соединения).</p>
<p>Работнику компетенции необходимо интерпретировать чертежи с помощью компьютерной программы, разбираться в любой структуре порезов и формы листа, изготавливать из металла сложные формы и осуществлять сборку как вручную, так и машинным способом. Специалист работает с различными материалами, в том числе черными и цветными металлами, поэтому должен понимать присоединение и крепление всех этих материалов. Работнику компетенции необходимо работать всеми видами сварочного оборудования, ручного и электроинструмента. Специалисты при изготовлении используют углошлифовальную машину, дрель, шуруповерт, свар', 4, 10, 19, 5, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (59, 'Промышленная механика и монтаж', 3, false, '<p>Квалифицированные специалисты в данной области выполняют монтаж и демонтаж оборудования, ремонтные и пусконаладочные работы, а также выполняют техническое обслуживание на предприятиях машиностроения, легкой и тяжёлой промышленности.</p>
<p>Участники компетенции &laquo;Промышленная механика и монтаж&raquo; выполняют токарные и фрезерные работы на универсальных станках, сварочные работы на аппарате полуавтоматической сварке в среде защитного газа, техническое и профилактическое обслуживание промышленного оборудования.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Industrial Mechanics Millwright </strong></p>
<p><strong>Статус компетенции: Презентанционная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 48 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 2, 6, 38, 9, 0, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (67, 'Водные технологии', 3, false, '<p>Инженер-техник по водоснабжению проверяет образцы воды, следит за системами фильтрации, обрабатывает трубы из металла и пластика и выполняет техническое обслуживание и ремонт трубопроводов и малых электрических устройств. Такие специалисты заняты в муниципальных и промышленных компаниях водоснабжения. Независимо от того, работает ли инженер-техник этого профиля в предприятии водоснабжения или в компании по очистке сточных вод, его задача заключается в наблюдении за оборудованием, идентификации и регистрации проблем, оформлении различных отчетов, а также в техническом обслуживании, регулировке и ремонте оборудования и контроле технологических процессов как на промышленных предприятиях, так и в коммунальных сетях. Для этих целей такой специалист должен иметь знания и опыт в механике, химии, биологии, электротехнике, автоматизации и защите окружающей среды.</p>
<p>Инженеры по водоснабжению должны также иметь превосходные аналитические навыки, навыки работы в коллективе и решения пробле', 2, 7, 32, 5, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (68, 'Архитектурная обработка камня', 4, false, '<p>Область профессиональной деятельности архитектурной обработки камня: применение натурального камня в различных отраслях строительства, архитектуры и ландшафтной архитектуры, а также изготовление скульптуры, создание орнаментов и изготовление надписей. Современная камне-добывающая и обрабатывающая промышленность имеет очень широкий спектр сфер применения, в каждой из которых требуется высокий профессионализм, глубокие знания и титанический труд. Всё больше процессов в данной области механизируется. Вся работа выполняется в соответствии с действующими сводами правил.</p>
<p>Работа камнетеса включает в себя чтение и изготовление шаблонов, перенос на каменный материал, высекание архитектурных элементов, резка букв и гравировка рисунка.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Architectural Stonemasonry </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 08 </strong></p>
<p><strong>Количество конкурсан', 3, 6, 29, 8, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (69, 'Облицовка плиткой', 4, false, '<p><strong>&nbsp;</strong></p>
<p>Работа плиточника включает в себя укладку керамической плитки, мозаики и натурального камня на стены, пол и лестницы в домах, коммерческих, промышленных и общественных зданиях, церквях, бассейнах, наружных установок и фасадов, в целях создания защитной и декоративной отделки. Работа также включает в себя строительство малых стен и ступеней из кирпича или блоков.</p>
<p>Специалист выполняет рисунки, делает разметку, измеряет, удаляет любое существующее покрытие, подготавливает поверхность, укладывает плитку по образцу, заливает раствором, стремясь представить свою работу на высшем уровне. Организация процесса работы и самоорганизация, коммуникативные навыки и личностные качества, способность решения проблем, инновационный потенциал и креативность, точность работы &ndash; всё это является универсальными атрибутами выдающегося плиточника. Для выполнения работы на высшем уровне важен каждый шаг &ndash; от безопасности и аккуратности работы до точного плани', 4, 7, 17, 9, 3, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (70, 'Сантехника и отопление', 4, false, '<p>Компетенция &laquo;Сантехника и отопление&raquo; представляет собой монтаж трубопроводов систем отопления, холодного и горячего водоснабжения, канализации, санитарно-технических устройств, пуско-наладка систем и их эксплуатация, а также выявление и устранение неисправностей в системах.</p>
<p>Квалифицированные специалисты используют необходимые для монтажа любых систем инструменты и оборудование, современные компьютерные программы и мобильные приложения, позволяющие управлять системами.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Plumbing and Heating </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 15 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 3, 8, 18, 6, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (71, 'Электромонтаж', 4, false, '<p>&nbsp;</p>
<p>Электромонтаж &ndash; комплекс работ, включающий в себя все аспекты, касающиеся электроснабжения: монтаж различных кабеленесущих систем, прокладка силовых и информационных кабелей, подключение различных устройств и приборов, монтаж розеток, выключателей, рубильников, осветительных приборов, элементов систем автоматизации зданий.</p>
<p>При выполнении работ электромонтажник должен соблюдать требования техники безопасности и охраны труда, уметь организовать свое рабочее место, уметь планировать работы, выбирать и устанавливать электрооборудование, тестировать и сдавать в эксплуатацию электроустановки, готовить отчетную документацию, выполнять техническое обслуживание, уметь находить неисправности и выполнять ремонт.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Electrical Installations </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 18 </strong></p>
<p><strong>Количество конкурсантов в ', 3, 8, 18, 9, 5, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (72, 'Кирпичная кладка', 4, false, '<p>Каменщик работает внутри и снаружи помещений, в том числе в домах клиентов или на строительных площадках, в любых погодных условиях на больших и малых объектах. Он занимается толкованием чертежей, разметкой и измерениями, осуществляет сооружение и отделку кладки по высоким стандартам.</p>
<p>Организация работы и самоорганизация, навыки общения и межличностных отношений, решение проблем, изобретательность и творческие способности, аккуратная работа являются универсальными атрибутами квалифицированного каменщика. Независимо от того, работает ли он в одиночку или в команде, каменщик принимает на себя высокий уровень персональной ответственности и самостоятельности.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Bricklaying </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 20 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 3, 8, 28, 5, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (73, 'Сухое строительство и штукатурные работы', 4, false, '<p>Квалифицированный штукатур может осуществлять как внутренние, так и наружные штукатурные работы, равно как и наружную цементную отделку.</p>
<p>Традиционные штукатурные работы состоят из приготовления подготовительных смесей перед нанесением слоя штукатурки. Штукатур должен будет подготовить необходимые материалы с соблюдением всех нормативных указаний и методических рекомендаций, касающихся приготовления и использования материалов. Помимо штукатурных работ на плоских поверхностях квалифицированный штукатур должен будет выполнить декоративную лепку. Также штукатур осуществляет ремонтно-восстановительные работы. Профессиональный штукатур демонстрирует высокий уровень четкости, внимания и мастерства. Подготовительные этапы к штукатурным работам включают сложные математические расчеты. Специалист должен быть способен читать, воспринимать и анализировать сложные спецификации, содержащие необходимые требования для выполнения работ, и реализовывать их на практике.</p>
<p>&nbsp;</p>
<p><st', 3, 6, 16, 9, 8, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (74, 'Малярные и декоративные работы', 4, false, '<p><strong>&nbsp;</strong></p>
<p>Малярные и декоративные работы предполагают выполнение отделочных работ как внутри, так и снаружи помещений.</p>
<p>Специалист должен уметь осуществлять приемку рабочей площадки, изготавливать эскизы, обладать навыками типирования отделочных материалов, подготовки поверхности стен для различных отделочных материалов. Осуществлять работу по наклеиванию обоев, фресок трафаретов и т.д. Уметь подбирать цвета и осуществлять построение фрески согласно заданному чертежу, используя кисти и малярную ленту. Он должен уметь использовать современные отделочные материалы, декоративные штукатурки всех типов, выполнять реставрационные работы на рабочей поверхности. В рамках производимой работы специалисты используют необходимые инструменты, шлифовальное оборудование, измерительные инструменты.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Painting and Decorating </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </st', 2, 10, 15, 5, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (75, 'Производство мебели', 4, false, '<p>Компетенция &laquo;Производство мебели&raquo; включает в себя изготовление отдельно стоящих и встроенных готовых предметов мебели или их секций с использованием дерева в качестве единственного или основного материала. Компетенция &laquo;Производство мебели&raquo; отличается от компетенции &laquo;Столярное дело&raquo; качеством дерева и сопутствующих материалов, сложностью выделки и эстетическим качеством конечной продукции.</p>
<p>Мебельщик обладает отличными навыками подготовки чертежа, чтения чертежа, а при необходимости и внесении изменений в чертеж, на высоком уровне делает разметку, производит измерения, пилит, изготавливает соединения, осуществляет сборку изделия, при необходимости, выполняет установку изделия и его финишную отделку. Качество его работы проявляется в выборе древесины и других материалов, технике изготовления, максимально точной подгонке каждой части, которой предшествуют точные измерения, раскрой и сборка и др. Для достижения превосходного результата в процесс', 3, 10, 21, 5, 2, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (76, 'Столярное дело', 4, false, '<p>Столяр &ndash; квалифицированный специалист, изготавливающий изделия из дерева или изделия на основе дерева. Столяры изготавливают двери, окна, лестницы и другие архитектурные объекты.</p>
<p>Данный специалист работает ручным, электрифицированным инструментом и на деревообрабатывающих станках. Столяр должен знать свойства древесины разных пород, способы ее обработки, дефекты древесины, способы изготовления, пригонки и навески столярных изделий, технологию и оборудование.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Joinery </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 25 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 8, 16, 10, 4, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (77, 'Плотницкое дело', 4, false, '<p>Плотник занимается проектами в сфере строительства: внешние и внутренние отделочные работы, установка и ремонт лестниц, дверей, окон, и прочих элементов, создание деревянных сооружений для придания параметров бетонным конструкциям (опалубка), установка элементов внутренней и внешней отделки общественных и коммерческих построек (сайдинга, ставен, кровельных материалов), изготовление и монтаж малых архитектурных форм (гаражей, кладовых, садовых беседок, пергол и домиков для игр).</p>
<p>Плотник читает чертежи, делает замеры, режет материал различными инструментами, занимается монтажом, установкой и отделкой на профессиональном уровне. Умение организовать и планировать свою работу, навыки межличностного общения, способность решать производственные и технологические задачи, креативность, также аккуратность и точность &ndash; качества, характерные для профессионального плотника. Каждый шаг в рабочем процессе имеет значение: ошибки исправить крайне сложно, и это требует больших затрат. Эт', 4, 9, 17, 8, 10, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (78, 'Ландшафтный дизайн', 4, false, '<p>Основной функцией ландшафтного дизайна является проектирование и разбивка садов и зеленых насаждений, а также уход за ними.</p>
<p>Ландшафтный дизайнер должен четко понимать пожелания заказчиков, поскольку ему предстоит обсуждать с ними предложенные проекты и консультировать их по практическим аспектам. Ландшафтный дизайнер может участвовать во всех стадиях работы над проектом от предварительного консультирования и проектирования до разработки руководства по дальнейшему уходу за садом по мере роста используемых растений. В его сферу компетенции также входит посадка зеленых насаждений, уход за ними, управление проектом. Он должен уметь разрабатывать новаторские проекты в соответствии с запросами клиента, нормативно-технической документацией и законодательством, и гармонично интегрировать готовый проект в окружающую среду, обеспечивая органичное взаимодействие зеленых насаждений с городской средой.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Landscape Gardening </stron', 4, 9, 34, 5, 5, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (79, 'Холодильная техника и системы кондиционирования', 4, false, '<p>Инженер по охлаждению и кондиционированию воздуха работает над коммерческими, жилыми, общественными, промышленными проектами, включая транспортировку и хранение.</p>
<p>Он планирует и проектирует, устанавливает, тестирует, вводит в эксплуатацию, обслуживает, выявляет неисправности и ремонтирует системы на высоком уровне. Организация работы и самоорганизация, навыки общения и межличностных отношений, решение проблем, гибкость и совокупность глубоких знаний являются универсальными атрибутами первоклассного специалиста. Независимо от задачи важнейшее значение имеют такие навыки, как концентрация, точность, аккуратность, внимание к деталям на всех этапах.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Refrigeration and Air Conditioning </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 38 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 10, 31, 8, 7, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (80, 'Геодезия', 4, false, '<p>Профессиональная деятельность геодезиста связана с производством геодезических работ в строительстве, при планировке и застройке городов, геодезических работ на промышленных площадках, при проектировании и строительстве гидротехнических сооружений, при строительстве тоннелей и подземных сооружений, геодезических работ для земельного кадастра.</p>
<p>Геодезисты должны владеть технологией выполнения работ при инженерно-геодезических изысканиях, выполнять автоматизированную съемку с использованием электронных тахеометров и спутниковых измерений, владеть комплексными автоматизированными технологиями CREDO, оформлять проектную документацию с использованием компьютерных систем.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Surveying </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R60 </strong></p>
<p><strong>Количество конкурсантов в команде: 2</strong></p>', 3, 9, 32, 8, 9, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (81, 'Бетонные и строительные работы', 4, false, '<p>Специалист по выполнению бетонных работ обычно работает в промышленном и гражданском строительстве коммерческих и жилищных проектов.</p>
<p>Специалист должен уметь читать строительные чертежи, заниматься разметкой и измерениями, осуществлять возведение бетонных конструкций по высоким стандартам. Организация работы и самоорганизация, навыки общения, межличностных отношений и решения проблем, изобретательность, творческие способности и аккуратная работа &ndash; все это универсальные атрибуты квалифицированного специалиста-практика по бетонным строительным работам. Специалист по выполнению бетонных работ действует в команде. Каждый член группы берет на себя высокую степень личной ответственности и работает максимально самостоятельно. Безопасная и аккуратная работа, в ходе которой производится прочный и долговечный продукт, четкое планирование и организация, точность, концентрация и внимание к деталям для достижения отличного качества &ndash; каждый шаг имеет значение.</p>
<p><strong>&n', 4, 8, 39, 9, 4, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (82, 'Каркасное домостроение', 4, false, '<p>Сборщик каркасных домов &ndash; специалист, осуществляющий полный цикл работ по возведению каркасного дома, а также его внутренней и внешней отделке. Специалист должен знать основы строительной физики и технических измерений, правила чтения строительных чертежей, способы устройства каркасов стен, чистых обшивок и временных сооружений, устройство и последовательность сборки конструкций стен, перекрытий и кровель. Он также должен уметь выполнять нарезку деталей в размер для конструкций стен, перекрытий и кровли и их механическую фиксацию, применять различные технологии по укладке и установке различных герметизирующих, несущих и отделочных материалов. Специалист умеет размечать, подгонять, закреплять элементы ендовы, ребра карнизного свеса, парапетов и других сложных или уникальных элементов, относящихся к каркасному домостроению и многое другое.</p>', 4, 8, 38, 7, 6, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (83, 'Парикмахерское искусство', 5, false, '<p>Парикмахеры предлагают широкий спектр услуг, включающих стрижку, окрашивание, укладку, химические трансформации и различные виды ухода за волосами. Парикмахер может иметь специализацию, например, быть мастером по мужским или женским прическам, или быть колористом. Независимо от этого, он обязательно должен обладать хорошими управленческими и коммуникативными способностями, заботиться о клиентах, уметь анализировать типы волос, работать с косметическими средствами согласно инструкции производителя.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Hairdressing </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 29 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 3, 8, 40, 5, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (84, 'Эстетическая косметология', 5, false, '<p>Предоставление услуг по косметическому уходу за лицом и телом путем механического, физического и химического воздействия в целях омоложения и коррекции проблемных зон, а также придания лицу индивидуальной выразительности, с использованием косметических средств. Услуги выполняются для удовлетворения эстетических потребностей клиента в соответствии с его пожеланиями, направлениями моды и с учетом его индивидуальных особенностей.</p>
<p>Компетенция требует от участника знаний в области санитарии и гигиены основ дерматологии и кожных болезней, косметической химии и космецевтики, основ аппаратной косметологии, профессиональной этики и основ бизнеса в индустрии красоты и другие.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Beauty Therapy </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 30 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 9, 27, 10, 1, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (240, 'Пожарная безопасность', 5, false, '<p>Пожарная безопасность &mdash; это состояние защищённости личности,<br />имущества, общества и государства от пожаров.&nbsp;<br />Будущие пожарные &nbsp;соревнуются в сборе и выезде по тревоге с боевым расчетом, тушении пожара в реальных условиях, навыкам работы с пожарной мотопомпой, а также работают со штурмовой пожарной лестницей и эвакуацией пострадавших.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Fire Safety </strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: T65 </strong></p>
<p><strong>Количество конкурсантов в команде: 5</strong></p>', 2, 9, 16, 6, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (85, 'Кондитерское дело', 5, false, '<p>Высококвалифицированные специалисты в сфере кондитерского дела производят широкий спектр сложных в изготовлении изделий, преимущественно сладостей.</p>
<p>Для развития требуемой компетенции кондитерам необходим высокий уровень специальных знаний и навыков, а также многолетняя практика. Это предполагает освоение профессиональных техник изготовления и украшения кондитерских изделий. Требуются художественный талант, чувство стиля в кулинарии, а также способность работать эффективно и экономично для достижения выдающихся результатов в установленное время и в соответствии с заданным бюджетом. Эксперт в этой сфере использует большое количество специализированного оборудования и материалов. Кондитеры должны принимать во внимание качество ингредиентов, бережно обращаться с ними, а также соблюдать высокие стандарты гигиены, технику безопасности и нормы охраны здоровья.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: P&acirc;tisserie and Confectionery </strong></p>
<p><strong>Стат', 2, 9, 22, 9, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (86, 'Поварское дело', 5, false, '<p>Повар работает в индустрии питания, включая элитные рестораны, кафе, бары, а также в сфере социального обслуживания (больницах и домах престарелых), предоставляя питание гостям и персоналу.</p>
<p>Помимо мастерства приготовления блюд, должность повара требует определенных навыков, связанных с коммерческим аспектом деятельности. К этим навыкам относится составление меню, оформление заявки на пищевые продукты, их приобретение, контроль за хранением, использованием и реализацией готовой продукцией, управление деятельностью производства через планирование, обмен информацией, взаимодействия с персоналом. Организации питания оснащены высокотехнологичным оборудованием, при работе с которым необходимо соблюдать технику безопасности и правила охраны труда. Рабочее место представляет собой зону с опасными факторами, где сотрудники работают в стрессовых ситуациях, часто в ограниченном пространстве. Профессиональная кухня является пространством повышенного давления, где команды поваров, специал', 2, 6, 28, 5, 7, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (87, 'Ресторанный сервис', 5, false, '<p>Специалист по ресторанному сервису предоставляет гостям высококачественные услуги питания.</p>
<p>Высококачественное обслуживание в сфере еды и питья требует от специалиста обширных знаний международной кухни, напитков и вин. Специалист должен обладать исчерпывающими знаниями правил обслуживания и специфики приготовления особых блюд и напитков за столом гостя или на баре. Официант &ndash; самый важный человек во всем, что касается оказания внимания гостям и предоставления им возможности насладиться едой. Для него крайне необходимы опыт и изобретательность, хорошие манеры, превосходные навыки общения с гостями, уверенность в себе, исключительные навыки личной гигиены и гигиены общественного питания, опрятный вид и практические навыки.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Restaurant Service </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 35 </strong></p>
<p><strong>Количество конкурсантов в ', 2, 9, 20, 9, 8, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (88, 'Медицинский и социальный уход', 5, false, '<p>Специалисты в сфере медицинского и социального ухода оказывают помощь в учреждениях медицинского и социального ухода, в медицинских организациях различного профиля (дома престарелых, больницы, однодневные стационары и социальные приюты, хосписы и центры сестринского ухода) и на дому.</p>
<p>Медицинский и социальный уход тесно связан с медициной и охватывает широкий спектр умений и видов деятельности, связанных с поддержкой хорошего состояния здоровья, физического и психосоциального состояния, роста и развития пациента/клиента, уход за ним и содействие в реабилитации и поддержке пациентов/клиентов и их семей. Высококвалифицированные специалисты должны демонстрировать высокий уровень персональной ответственности и самостоятельности на всех этапах работы от оценки потребностей клиента/пациента, до установления отношений с ним. Обеспечить качественный уход в различных обстоятельствах, учитывать все мелочи, во избежание ошибок, которые могут повлечь за собой серьезные последствия вплоть ', 4, 8, 30, 8, 4, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (89, 'Хлебопечение', 5, false, '<p>Хлебопечение &ndash; это получение продукта путем сложного труда, который включает в себя несколько этапов производства.</p>
<p>Пекарь производит широкий ассортимент хлебобулочных, сдобных, слоеных, гастрономических и мучных кондитерских изделий. Он составляет рецептуры или пользуется утвержденными, выбирает исходные ингредиенты, использует различные методы тестоведения, формования и выпечки. Профессиональный пекарь должен учитывать качество ингредиентов, работать, соблюдая санитарные нормы, личную гигиену и правила техники безопасности. Выполнять работу эффективно и экономично, достигая результатов в установленные сроки. Пекарю необходима физическая выносливость, тонкое обоняние, вкусовая чувствительность, четкая координация движений рук, наблюдательность, опрятность, творческие навыки, а также высокая степень знаний в области хлебопечения. Он может работать в ресторанах, кафе, пекарнях и хлебозаводах.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Bakery </strong></p>
<p><strong>Стату', 2, 9, 22, 7, 4, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (90, 'Администрирование отеля', 5, false, '<p>Ключевой ролью при создании любого отеля является роль портье. Находясь в зоне отдела приема и размещения гостей, гость отеля получает первое впечатление о гостинице, а также свой первый опыт пребывания в гостинице. В этом месте устанавливается первоначальный контакт с персоналом отеля. Качество, этикет и быстрота обслуживания могут сильно повлиять, на то, какое отношение сложится у гостя к гостинице во время его пребывания. В свою очередь, это влияет на репутацию отеля и продолжение его работы.</p>
<p>Администратору отеля необходимо постоянно применять широкий диапазон навыков: знание местной и общей туристической информации, хороший разговорный и письменный уровень английского языка, знание компьютерных программ, хорошие манеры и поведение, а также наличие отличных коммуникативных и социальных навыков, умение разрешать проблемы, компетентность в работе с цифрами и денежными средствами, навык обработки и применения процедур бронирования, приема и выписки гостей из отеля. Это по-нас', 4, 8, 34, 8, 0, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (91, 'Лабораторный медицинский анализ', 5, false, '<p>Сегодня лабораторная диагностика &ndash; это широкий спектр автоматизированных высокочувствительных методов, позволяющий оперативно получить достоверную информацию о состоянии внутренней среды пациента.</p>
<p>Медицинский лабораторный техник клинико-диагностической, гистологической, бактериологической, санитарно-гигиенической лабораторий выполняет исследования в соответствии с квалификационными требованиями, подготавливает рабочее место, дезинфицирующие растворы, регистрирует поступающий в лабораторию биологический материал для исследования, в том числе с использованием персонального компьютера, проводит обработку материала и подготовку к исследованию, стерилизацию лабораторного инструментария в соответствии с действующими инструкциями, ведет необходимую медицинскую документацию, соблюдает правила техники безопасности и производственной санитарии согласно требованиям санитарно-эпидемиологического режима, участвует в контроле качества проводимых в лаборатории исследований.</p>
<p>Мед', 4, 9, 40, 10, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (92, 'Туризм', 5, false, '<p>Специалист по туризму &ndash; разработчик туристских маршрутов, формирующий туристский продукт для его продвижения и реализации. Специалист по туризму обеспечивает взаимодействие предприятий туристской индустрии, подготавливает рекламно-информационную базу, рассчитывает стоимость туристского продукта и организует взаимодействие их с турагентской сетью для последующего продвижения и реализации туристских пакетов. Специалист по туризму обеспечивает взаимодействие между представителями туристкой индустрии, а также партнёрами за рубежом.</p>
<p>Специалист по туризму обладает практическими навыками для профессионального выполнения работы по предоставлению турагентских, туроператорских и экскурсионных услуг, услуг по продвижению и реализации турпродукта.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Tourism </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R9 </strong></p>
<p><strong>Количество конкурсантов', 3, 10, 18, 9, 6, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (93, 'Спасательные работы', 5, false, '<p>Аварийно-спасательные и другие неотложные работы &ndash; совокупность первоочередных работ в зоне ЧС, заключающихся в спасении и оказании помощи людям, локализации и подавления очагов поражающих воздействий, предотвращении возникновения вторичных поражающих факторов, защите и спасении материальных и культурных ценностей, восстановлении минимально необходимого жизнеобеспечения.</p>
<p>Конкурсант должен уметь работать с различными аварийно-спасательными инструментами, альпинистским снаряжением и оборудованием, пожарно-техническим вооружением, оказывать первую помощь и транспортировать пострадавших, выстраивать алгоритм действий команды при производстве аварийно-спасательных работ и многое другое.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Rescue Service </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R10 </strong></p>
<p><strong>Количество конкурсантов в команде: 5</strong></p>', 2, 10, 15, 6, 10, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (94, 'Предпринимательство', 5, false, '<p>Компетенция представляет собой командные соревнования в области коммерческой деятельности. В группах по два человека участники разрабатывают бизнес-план, создают компании и управляют ими на протяжении конкурса, решая каждый день различные задачи. На практике это означает, что соревнующиеся команды работают в условиях, приближенных к настоящей работе в офисе, выполняя задачи, указанные в проекте.</p>
<p>Конкурсанты должны знать и понимать бизнес-процессы, роль и значение бизнес-плана, различные маркетинговые стратегии, финансовые инструменты и многое другое.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Entrepreneurship </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: R11 </strong></p>
<p><strong>Количество конкурсантов в команде: 2</strong></p>', 4, 9, 29, 7, 5, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (95, 'Выпечка осетинских пирогов', 5, false, '<p>Осетинские пироги &ndash; это национальное блюдо, которому уже несколько сотен лет. Готовятся осетинские пироги по старинному традиционному рецепту, повторить который способен не каждый повар. Настоящими, вкусными считаются осетинские пироги с тонким слоем теста и сочной, обильной начинкой, в качестве которой используется многочисленное разнообразие экологически чистых продуктов, таких как осетинский сыр, мясо, свекольные листья, картофель, тыква и т.д.</p>
<p>Профессиональный пекарь осетинских пирогов должен организовать и провести работы по подготовке сырья и выпечке осетинских пирогов, включая: формование, выпечку и подачу осетинских пирогов. Он должен проверять органолептическим способом качество основных продуктов и дополнительных ингредиентов к осетинским пирогам, организовать рабочее место, выбирать производственный инвентарь и оборудование, рассчитать количество ингредиентов, которое будет использовано на приготовление осетинских пирогов, готовить различные фарши, разделять ', 4, 9, 36, 9, 1, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (96, 'Ветеринария', 5, false, '<p>Область профессиональной деятельности ветеринарного специалиста: организация и осуществление деятельности по оказанию ветеринарных услуг путем проведения профилактических, диагностических и лечебных мероприятий.</p>
<p>Ветеринары следят за соблюдением правил зоогигиены при содержании животных, контролируют соблюдение правил их эксплуатации, участвуют в соблюдении эпизоотической обстановки в регионах, являются санитарными экспертами пищевых продуктов животного происхождения. В случае несоответствия нормам, ветеринар вправе запретить поступление в продажу некачественной продукции или провести её конфискацию. Только благодаря скрупулезной и постоянной работе специалистов ветеринарной медицины удается избежать вспышек тяжелых заболеваний, в том числе общих для человека и животных.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Veterinary </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R56 </strong></p>
<', 4, 10, 38, 6, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (97, 'Организация экскурсионных услуг', 5, false, '<p>В данной компетенции проверяются навыки таких специалистов экскурсионной сферы, как организатор экскурсий и экскурсовод.</p>
<p>Организатор экскурсий определяет потребности экскурсантов в экскурсионных услугах, принимает и анализирует заявки, планирует экскурсионные маршруты и программы экскурсий, оформляет документацию к экскурсионным маршрутам, разрабатывает новые формы и методы проведения экскурсий, формирует и анализирует программы экскурсий, составляет программы обслуживания, контролирует соблюдение программ экскурсий, качество проведения экскурсий, соблюдение протокольных мероприятий.</p>
<p>Экскурсовод предоставляет экскурсионные услуги в соответствии с утвержденными руководителем экскурсионного бюро маршрутами, технологическими картами согласно методикам проведения экскурсий, контрольным текстам и иным документам, предусмотренным национальными стандартами. Экскурсовод готовит индивидуальные тексты экскурсий, участвует в разработке новых тем экскурсий, проводит экскурсию, зап', 3, 9, 22, 5, 6, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (98, 'Эксплуатация и обслуживание многоквартирного дома', 5, false, '<p>общим имуществом, а также качественное предоставление коммунальных услуг.</p>
<p>Специалисты по управлению, эксплуатации и обслуживанию многоквартирного дома занимается организацией и проведением работ по обеспечению сохранности общего имущества многоквартирного дома, комфортных и безопасных условий проживания жильцов, решают вопросы пользования этим имуществом, обеспечивают предоставление коммунальных услуг жильцам дома. Следовательно, специалист по эксплуатации и обслуживанию многоквартирного дома должен знать нормативные и законодательные акты, требования СНиПов, ГОСТов, технические условия на техдокументацию, термины по своей специализации. Также он должен представлять, как работают КИП, как ими пользоваться, а также владеть техническими характеристиками оборудования. Так как эти лица материально-ответственные, то им нужно знать правила оформления бухгалтерской документации. Взаимодействуя с персоналом и жителями МКД, специалист должен знать и соблюдать правила техники безопасно', 2, 8, 21, 9, 1, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (99, 'Охрана труда', 5, false, '<p>&laquo;Охрана труда&raquo; &ndash; это система сохранения жизни и здоровья работников организации в процессе трудовой деятельности, которая включает в себя правовые, социально-экономические, организационно-технические, санитарно-гигиенические, лечебно-профилактические, реабилитационные и иные мероприятия. Специалисты в данной области обеспечивают функционирование системы управления охраной труда, контролируют выполнение требований законодательства в этой области, организуют обучение и следят за безопасностью жизни и здоровья работников организации.</p>
<p>Специалист по охране труда должен знать техническую документацию и трудовое законодательство, быть немного юристом и не в последнюю очередь &ndash; оратором. Ведь одна из его обязанностей &ndash; проведение инструктажа. Охраной труда должен заниматься коммуникабельный и активный человек, способный быстро сориентироваться в ситуации. Конкурсное задание направлено на проверку профессиональной компетенции специалиста по охране труда, ', 3, 6, 18, 5, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (100, 'Ювелирное дело', 6, false, '<p>Профессия ювелира, прежде всего, связана с ручным трудом, работой с драгоценными и полудрагоценными металлами, камнями и т.п. Как правило, ювелир работает по детализированным чертежам, создаваемым дизайнером ювелирных изделий. Поэтому ювелир должен уметь правильно интерпретировать такие чертежи для создания ювелирных изделий в соответствии с замыслом дизайнера.</p>
<p>При работе с драгоценными металлами от ювелира требуется точность, экономность и умение избегать неэффективного использования материалов. Такая работа характеризуется обилием и сложностью деталей, а также требует высокого уровня профессионализма, внимания и концентрации. Ювелир должен иметь некоторые знания в других областях ювелирного дела. Например, он должен иметь представление о драгоценных камнях, их характеристиках, видах огранки, способах использования и влиянии на готовое изделие. Также ювелир должен знать, из каких этапов состоит производство методом литья и иметь представление о программировании и 3D моделиро', 2, 10, 17, 8, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (101, 'Флористика', 6, false, '<p>Специалист данной сферы должен обладать деловой хваткой и отличной коммуникабельностью, проявлять творчество и креативность в оформлении помещений и интерьеров, обслуживании праздничных мероприятий.</p>
<p>Создание флористической композиции, будь то небольшой букет или крупная инсталляция для значимого события, требует, чтобы флорист демонстрировал новаторство, творчество, профессионализм и талант, как с эстетической, так и с практической точек зрения. Флорист должен применять правила и теорию композиции, цвета и техники, используемых во всем мире, и показывать четкие представления о принципах и элементах цветочного дизайна. Флорист использует экспертные знания и знание цветов, растений, ботанических материалов и аксессуаров в своей работе.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Floristry </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 28 </strong></p>
<p><strong>Количество конкурсантов в ко', 3, 10, 32, 8, 1, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (102, 'Технологии моды', 6, false, '<p>&nbsp;</p>
<p>Компетенция &laquo;Технологии моды&raquo; демонстрирует процессы создания одежды. Квалифицированные специалисты в этой области владеют основами дизайна одежды, различными системами конструирования и техниками кроя, технологическими приёмами изготовления и окончательной отделки изделий. Специалисты используют САПР одежды, современное швейное оборудование, инструменты, приспособления и материалы для создания изделий высокого качества.</p>
<p>Специалист должен бережно относиться к сырью, с которым он работает, а также иметь обширные познания в сфере эффективного поиска, приобретения, использования, хранения всех материалов и обращения с ними. Дизайнер моды обладает новаторским, творческим мышлением и художественной одаренностью. Данный специалист должен знать и применять правила и теорию композиции с использованием элементов и принципов дизайна, и применимые к ним технологии изготовления.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Fashion Technology </str', 2, 8, 23, 6, 2, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (103, 'Графический дизайн', 6, false, '<p>Компетенция &laquo;Графический дизайн&raquo; представляет собой способность визуализировать оформление окружающей среды средствами графики.</p>
<p>Квалифицированные специалисты этой компетенции работают над дизайном вывесок, рекламных щитов, плакатов, а также заботятся об удобочитаемости необходимой информации, такой как интернет-сайты, журналы, газеты, листовки, обложки книг и дисков, меню в ресторане и т.д. Специалисты создают продукты при помощи программного обеспечения и подготавливают их к исполнению в печати или онлайн.</p>
<p>В сфере графического дизайна ценятся развитые навыки взаимодействия, исследовательские, дизайнерские, технические навыки. От них требуется понимание целевой аудитории, рынков, тенденций, культурных различий и желаний клиента. Кроме того, эта сфера характеризуется непосредственным взаимодействием с клиентом, что требует развитых навыков коммуникации для успешного достижения целей, поставленных заказчиком.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Назв', 3, 8, 17, 7, 1, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (104, 'Визуальный мерчандайзинг', 6, false, '<p>Компетенция &laquo;Визуальный мерчендайзинг&raquo; представляет собой оформление витрин с демонстрацией товаров. Основной задачей визуального мерчендайзера является максимальное увеличение продаж путем взаимодействия и общения с целевой аудиторией и создания положительной атмосферы.</p>
<p>Организация работы и самоорганизация, коммуникации и компетенции межличностного общения, решение проблем, инновации и креативность, способность разрабатывать оригинальные &laquo;притягивающие внимание&raquo; концепции с &laquo;вау-эффектом&raquo;, которые позитивно вовлекут целевой рынок, а также внимание к деталям, окончательному оформлению &ndash; универсальные качества превосходного визуального мерчендайзера.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Visual Merchandising </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 44 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 10, 36, 7, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (105, 'Видеопроизводство', 6, false, '<p>Видеопроизводство является динамично меняющейся областью медиа индустрии, сферой деятельности которой является создание экранного аудиовизуального произведения.</p>
<p>Специалисту в данной компетенции необходимо в полной мере знать все этапы видеопроизводства, владеть навыками видеооператора, осветителя, видеомонтажера, звукооператора и звукорежиссера, знать основы цветокоррекции. При работе с цветом и композицией конкурсанты проявляют свои творческие способности. Понимание технических особенностей работы с камерой, осветительным и звуковым оборудованием снимает ограничения на творческую реализацию. Владение программами монтажа позволяет собрать снятое и записанное в единое целое аудиовизуальное произведение. Специалист обязан знать технические требования для публикаций аудиовизуального произведения в интернете, на телевидении, в кинотеатре, а также обращать внимание на Закон об авторском праве и этические вопросы.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Video Pr', 4, 8, 23, 10, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (106, 'Фотография', 6, false, '<p>Документальная точность фотографических изображений и простой способ их получения открыли широчайшие возможности использования фотографии в самых различных областях человеческой деятельности.</p>
<p>Специалист должен обладать соответствующими техническими знаниями и навыками, художественным видением, умением пользоваться выразительными средствами для решения различных задач, от съёмки классического натюрморта до выполнения съёмки на официальные документы.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Floristry </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: WSI </strong></p>
<p><strong>№ CIS: 28 </strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 4, 6, 23, 5, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (107, 'Звукорежиссура', 6, false, '<p>Звукорежиссура &ndash; сфера профессиональной деятельности по озвучиванию представлений, подготовке аудиоматериала для передачи в эфир (живой звук, интернет-вещание и запись), фиксации аудиоматериала во время съёмок кино и видеоматериала и его последующей обработки, а также запись, редакция, сведение и финальная обработка (мастеринг) музыкального материала всех возможных стилей, запись, редакция и подготовка к выпуску аудиокниг и т.п.</p>
<p>Выпускаемый в результате звукорежиссерской деятельности аудиоматериал должен соответствовать общепринятым стандартам звуковой индустрии и коррелировать с международными стандартами AES/EBU, MPEG, OIRT, ISO и т.п. в их части, касающейся аудиопроизводства, а также Закону об авторском праве и этическим вопросам.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Sound Engineering </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: R26 </strong></p>
<p><strong>Количество кон', 2, 6, 38, 6, 10, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (108, 'Огранка ювелирных вставок', 6, false, '<p>Одно из отличительных свойств ювелирных камней &ndash; привлекательность, зачастую выявленная определенной степенью обработки, будь то механическое удаление &laquo;лишнего&raquo; объема минерала или химическое, или физическое, облагораживание качества или цвета камня. Так знание оптических констант в совокупности с пониманием параметров качества поверхностей и термо-физических процессов изменения текстуры камня способны помочь в создании практически из любого куска породы произведения искусства, как результат, к которому должны стремится все мастера декоративно-прикладного творчества.</p>
<p>Основная задача для специалиста не просто научиться обрабатывать кристаллы, но и самим составлять подробные технологические схемы, а также художественные эскизы, по которым будет возможность строить определенные последовательности и принципы работы.</p>
<p>Специалист должен уметь определять вид и технологическую последовательность огранки ювелирных вставок, подбирать и настраивать приспособления', 3, 10, 40, 7, 5, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (111, 'Кузовной ремонт', 7, false, '<p>&nbsp;</p>
<p>Кузовной ремонт представляет собой исправление перекосов кузова автомобиля, как правило, удаление поврежденных структурных элементов, и неструктурных деталей, которые заменяются новыми деталями или их частями, используя различные сварочные процессы и/или заклепки и клеи. В случае слабых повреждений заменяются или ремонтируются неструктурные панели до состояния пригодного для последующей покраски.</p>
<p>Квалифицированные специалисты в данной области могут использовать стенд исправления геометрии кузова (стапель) в совокупности с измерительным оборудованием как средство оценки степени повреждения и восстановления структуры к своему первоначальному состоянию. Кроме того, специалист должен быть опытным сварщиком способным соединить различные типы металлов, такие как низкоуглеродистые стали, высокопрочные стали или алюминиевые сплавы, используя сварку в среде защитного газа (MAG), тугоплавким вольфрамовым электродом в среде защитного газа (TIG), и точечной сваркой.</p>
<p>', 4, 10, 31, 5, 0, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (112, 'Обслуживание авиационной техники', 7, false, '<p>В российской практике рынка труда квалификация техник по обслуживанию воздушных судов не применяется, согласно ЕТКС и профессиональных стандартов к обслуживанию воздушных судов привлекаются работники, имеющие следующие квалификации: слесарь сборщик летательных аппаратов, слесарь сборщик двигателей и агрегатов, сборщик клепальщик, авиационный техник по планеру и двигателям.</p>
<p>Они должны владеть профессиональной терминологией, разбираться в сборочных чертежах агрегатов и систем воздушного судна. Иметь навык по работе с пневмооборудованием, гибочными станками, бароскопом (эндоскопом). Осуществлять осмотр, обслуживание, устранение неполадок, снятие, установка, оснастка, тестирование и ремонт воздушных судов. Должны знать технологию испытания агрегатов и воздушного судна наземными стендами и установками для испытаний, а также брать на себя высокий уровень личной ответственности за результат деятельности.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Aircraft Maintenance </strong></p>
<', 2, 6, 32, 8, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (292, 'Управление перевозочным процессом на железнодорожном транспорте', 7, false, '<p>Компетенция разработана для демонстрации и оценки квалификации специалиста по организации и осуществлению перевозочного процесса, управлению движением поездов, производством маневровой работы на раздельных пунктах при обеспечении безопасности движения поездов, выполнении графика движения поездов. Качественная работа специалистов дирекции движения - залог безопасности пассажиров и перевозок грузов.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Rail Transportation Management</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T53</strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 2, 9, 40, 10, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (113, 'Ремонт и обслуживание легковых автомобилей', 7, false, '<p>Компетенция &laquo;Ремонт и обслуживание легковых автомобилей&raquo; &ndash; это демонстрация практических умений и навыков в проведении диагностики, технического обслуживания и текущего ремонта двигателя, трансмиссии, ходовой части, систем управления&nbsp;автомобилем, источников и потребителей электроэнергии современного автомобиля.</p>
<p>&nbsp;</p>
<p>Высококвалифицированный автомеханик всегда в курсе текущих изменений в своем секторе независимо от того, касаются ли они эксплуатационных характеристик автомобилей и деталей, безопасности или экологически чистых источников энергии. Он на глубоком уровне понимает принцип работы электрических и электронных систем автомобилей, их взаимодействие; обладает физической выносливостью, хорошей координацией, развитыми кинестетическими навыками, гибкостью. Он должен уметь применять для обнаружения неисправностей современное диагностическое оборудование, проводить метрологические измерения, определяя степень износа деталей. Работы должны провод', 2, 7, 16, 10, 6, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (114, 'Обслуживание тяжелой техники', 7, false, '<p>Специалист по техническому обслуживанию грузовой техники поддерживает и ремонтирует грузовые автомобили различных производителей.</p>
<p>Техник по ремонту должен уметь поддерживать в исправном состоянии и восстанавливать двигатели внутреннего сгорания и подвижные и неподвижные детали на грузовиках, перевозящих различные виды грузов.</p>
<p>Обслуживание и ремонт могут включать отдельные агрегаты или все системы, и требует от техника по ремонту умение работать с двигателями, трансмиссией, электроникой, тормозными системами, и др. Техник по ремонту должен использовать определенные инструменты, чтобы диагностировать работоспособность, восстановить или заменить дефектные детали или агрегаты, проверить качество ремонта, уметь читать инструкции в техническом руководстве, писать сервисные отчеты и гарантировать, что работа соответствует техническим требованиям изготовителя и требованиям законодательства.</p>
<p>&nbsp;</p>
<p><strong>Название </strong><strong>ENG</strong><strong>: </strong><', 3, 10, 16, 9, 2, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (115, 'Эксплуатация сельскохозяйственных машин', 7, false, '<p>Техник-механик по обслуживанию сельскохозяйственных машин эксплуатирует, ремонтирует и обслуживает сельскохозяйственную технику. Эта техника может включать в свой перечень тракторы, кормоуборочные комбайны, пресс-подборщики, косилки, комбайны, опрыскиватели сельскохозяйственных культур и другие машины. Техники также должны уметь работать с техникой как самостоятельно, так и в команде, в разные смены, а также на предприятии работодателя, в здании клиента или на улице, как в городской, так и сельской местности, независимо от погоды.</p>
<p>&nbsp;</p>
<p>Техник по обслуживанию сельскохозяйственных машин должен быть специалистом с сильным диагностическим и аналитическим навыком. Он должен владеть специальными инструментами для диагностики, отладки, ремонта или замены неисправных компонентов и систем, тестирования, ремонта для надлежащей работы, интерпретации указаний в технических руководствах, написания отчетов по обслуживанию, и обеспечивать соответствие работы техническим условиям пр', 2, 7, 29, 9, 4, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (116, 'Сервис на воздушном транспорте', 7, false, '<p>Компетенция &laquo;Сервис на воздушном транспорте&raquo; представляет собой сферу обслуживания пассажиров в аэропорту, в процессе которой конкурсанты выполняют мероприятия, связанные с регистрацией пассажиров на рейс и предполётным досмотром.</p>
<p>Для выполнения конкурсных заданий специалисты воздушной гавани применяют современные автоматизированные системы регистрации и технические средства досмотра.</p>
<p>Специалист должен обладать высоким уровнем обслуживания пассажиров, клиентоориентированностью, умением применять автоматизированные системы регистрации пассажиров и багажа, знанием требований нормативных документов, регламентирующих деятельность в области гражданской авиации, умением грамотно применять технические средства досмотра и выявлять запрещенные к перевозке предметы и вещества.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Service in Air Transport </strong></p>
<p><strong>Статус компетенции: Основная </strong></p>
<p><strong>Тип: RU </strong></p>
<p><str', 2, 10, 15, 8, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (117, 'Экспедирование грузов', 7, false, '<p>Экспедитор управляет перемещением грузов из одного места в другое от имени заказчика. К способам транспортировки относится перевозка автомобильным, железнодорожным, воздушным или морским транспортом, а также их сочетание. Экспедитор должен обладать специальными знаниями для обеспечения того, чтобы вся необходимая документация соответствовала требованиям таможни, страхования и законодательства.</p>
<p>Компетенция &laquo;Экспедирование грузов&raquo; представляет собой целостный комплекс услуг, направленных на доставку грузов от двери до двери (от продавца покупателю) различными видами транспорта, их полное сопровождение и документальное оформление. Квалифицированные специалисты в данной области могут организовывать транспортировку грузов любых весогабаритных характеристик и видов, выстраивая надежные и экономически целесообразные цепи поставок. Для этого специалисты должны обладать знаниями в области логистики, внешнеэкономической деятельности, таможенного права, клиентского сервиса, ', 4, 7, 19, 8, 1, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (119, 'Обслуживание грузовой техники', 7, false, '<p>Специалист по техническому обслуживанию грузовой техники поддерживает и ремонтирует грузовые автомобили различных производителей.</p>
<p>Техник по ремонту должен уметь поддерживать в исправном состоянии и восстанавливать двигатели внутреннего сгорания и подвижные и неподвижные детали на грузовиках, перевозящих различные виды грузов.</p>
<p>Обслуживание и ремонт могут включать отдельные агрегаты или все системы, и требует от техника по ремонту умение работать с двигателями, трансмиссией, электроникой, тормозными системами, и др. Техник по ремонту должен использовать определенные инструменты, чтобы диагностировать работоспособность, восстановить или заменить дефектные детали или агрегаты, проверить качество ремонта, уметь читать инструкции в техническом руководстве, писать сервисные отчеты и гарантировать, что работа соответствует техническим требованиям изготовителя и требованиям законодательства.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Heavy Vehicle Maintenance </strong></p>
<p><', 2, 8, 16, 7, 7, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (241, 'Управление локомотивом', 7, false, '<p>Машинисты локомотивов &ndash; это специалисты, которые обладают высокими практическими навыками для профессионального выполнения работы, связанной с безопасностью движения поездов, безопасностью перевозки грузов и пассажиров, со строжайшим соблюдением выполнения графика движения поездов и выполнением технологического процесса работы железных дорог.</p>
<p>Для достижения соответствия качественным требованиям машиниста локомотива, он должен уметь управлять локомотивом и автотормозами поезда, знать их устройство и принцип действия, умело разбираться в их чертежах и схемах, применять необходимые новые технологии и разбираться в характеристиках новейших разработок железнодорожной техники. Также он должен знать технику безопасности при обслуживании локомотива и ведении поезда.</p>', 2, 7, 30, 9, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (242, 'Разработка решений с использованием блокчейн-технологий', 1, false, NULL, 3, 8, 17, 7, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (244, 'Управление жизненным циклом/управление программой', 3, true, '<p>Содержание компетенции &laquo;Управление жизненным циклом&raquo; - процесс,</p>
<p>состоящий из комплекса мероприятий, охватывающих все этапы развития проекта: от</p>
<p>разработки его концепции, через проектирование и производство до продаж,</p>
<p>послепродажного обслуживания и утилизации.</p>
<p>Соревнования по компетенции представляют собой конкурентную работу кросс</p>
<p>функциональных проектных групп, осуществляющих виртуальное управление проектом</p>
<p>по заданному техническому заданию на всех стадиях жизненного цикла.</p>
<p>Разработка проекта включает в себя следующие этапы: формирование</p>
<p>эффективной команды, разработка проектного решения (концепция, дорожная карта,</p>
<p>конструкторская и технологическая документация, финансовая модель, план</p>
<p>производства, HR-стратегия, маркетинговая политика, управление рисками, ППО),</p>
<p>презентация проекта экспертам.</p>
<p>При этом в соревновании применяются следующие sort-skills: управление</p>
<p>командой проекта, м', 2, 8, 22, 7, 5, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (246, 'Кибербезопасность', 1, true, '<p>В наши дни один из наиболее актуальных вопросов защиты</p>
<p>корпоративной информации &ndash; обеспечение безопасности от внутренних</p>
<p>утечек по техническим каналам связи.</p>
<p>Технологии корпоративной защиты от внутренних угроз</p>
<p>информационной безопасности,</p>
<p>позволяют выявлять и предотвращать утечки конфиденциальной</p>
<p>информации и персональных данных, защищать компании от</p>
<p>мошенничества, воровства и коррупции, детектировать неправомерные</p>
<p>действия сотрудников и нецелевое использование корпоративных ресурсов.</p>
<p>Системы корпоративной безопасности позволяют однозначно выявлять</p>
<p>инциденты и дают весь необходимый набор инструментов для проведения</p>
<p>внутренних расследований и дальнейшей правовой защиты корпоративных</p>
<p>интересов.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Cyber security </strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong', 3, 7, 29, 8, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (247, 'Проектирование нейроинтерфейсов', 1, false, '<p>Проектирование нейроинтерфейсов-это изготовление и испытание независимой аппаратной нейросистемы, которая подразумевает регистрацию и анализ электрических сигналов мозга пациента (заказчика) для выбора устойчивого эмоционального управляющего состояния. Кроме того, участники компетенции проектируют и создают из элементарной базы неинвазивное аппаратное устройство распознавания &alpha;-&beta;-ритмов нейронов головного мозга человека с биозащитой по изменению сердечного ритма заказчика. А также создают программный код</p>
<p>интерфейса &laquo;Мозг-Компьютер&raquo;, производят исследование низкоуровневых драйверов аппаратных частей системы на предмет работоспособности, исправляют ошибки в программном коде до состояния, в котором независимый аппаратный интерфейс корректно определит все составляющие нейросистемы.</p>
<p>Квалифицированные специалисты в данной области занимаются разработкой совместимых с нервной системой человека интерфейсов для управления компьютерами, виртуальными и визуа', 4, 10, 25, 9, 8, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (248, 'Биофотоника', 3, false, NULL, 2, 9, 26, 5, 1, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (250, 'Синтез и обработка минералов', 3, false, NULL, 2, 8, 20, 5, 10, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (253, 'Цифровая метрология', 3, false, '<p>&nbsp;</p>
<p>Цифровая&nbsp; метрология -это автоматический контроль качества продукции, который &nbsp;широко используются для снижения стоимости контроля, уменьшения числа ошибок, смягчения последствий нехватки персонала, уменьшения длительности контроля, а также для избежания монотонности в работе контролера. &nbsp;</p>
<p>Компетенция &laquo;Цифровая метрология&raquo; создана при поддержке Mitutoyo Corporation. В соответствии с философией компании, одной из ключевых целей компетенции является активное продвижение знаний и опыта, накопленного специалистами в различных странах, с целью профессиональной поддержки специалистов-метрологов на промышленных предприятиях, а также учащихся технических учебных заведений.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Digital Metrology </strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную </strong></p>
<p><strong>Тип: RU </strong></p>
<p><strong>№ CIS: T64 </strong></p>
<p><strong>Количество конкурсантов в кома', 4, 10, 20, 8, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (254, 'Преподавание в основной и средней школе', 2, false, '<p>Ведущая функция современного учителя основной и средней школы - содействие образованию школьника, создание при помощи средств педагогической деятельности условий для проявления самостоятельности, творчества, ответственности учеников. Современный учитель основной и средней школы обучает и воспитывает своих подопечных с учетом их индивидуальных и возрастных особенностей, а также специфики своего учебного предмета. Он создает условия для формирования и развития общей культуры личности, социализации, осознанного выбора и освоения образовательных программ. Применяет современные образовательные технологии, включая информационные, а также цифровые образовательные ресурсы. Использует разнообразные формы, приемы, методы и средства обучения, оказывает помощь в проектировании индивидуальных учебных планов и обучении по ним.</p>
<p>&nbsp;Учитель основной и средней школы выбирает оптимальные программы и учебно-методическое обеспечение, ориентируясь на современные технологические тренды.</p>
<p>У', 4, 9, 40, 9, 0, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (255, 'Фармацевтика', 5, false, '<p>Фармацевт организовывает и выполняет работы на фармацевтических и медицинских предприятиях, которая включает: приемку, контроль и отпуск лекарственных препаратов, оформление витрин с использованием элементов мерчандайзинга и товаров аптечных товаров, а также изготавливает лекарственные препараты по рецептам врача и требованиям медицинских и ветеринарных организаций.</p>
<p>Квалифицированные специалисты данной области осуществляют полный контроль за движением товаров аптечного ассортимента от момента поступления в аптечную организацию до конечного отпуска покупателю, проводят профессиональную фармацевтическую консультацию посетителей аптеки, занимаются производством лекарственных препаратов по рецептам.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Pharmaceutics</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>Блок: Сфера услуг</strong></p>
<p><strong>№ CIS: R35</strong></p>
<p><strong>Количество конкурсантов в команде:', 2, 10, 17, 7, 1, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (256, 'Пчеловодство', 5, false, '<p>Пчеловод должен знать роль и значение своей отрасли в системе агропромышленного комплекса:</p>
<p>- основные представления по биологии пчелиной семьи;</p>
<p>- основные проблемы содержания пчелиных семей в течение круглого года;</p>
<p>- основные вопросы организации кормовой базы и использования пчел на опылении энтомофильных сельскохозяйственных культур.</p>
<p>Работа пчеловода также включает в себя умение:</p>
<p>- применять полученные знания при изучении кормовой базы пчеловодства и в последующей деятельности зоотехника;</p>
<p>- анализировать причинно-следственные отношения в генезе болезней и вредителей медоносных пчел;</p>
<p>- планировать и осуществлять экспериментальные исследования;</p>
<p>- обрабатывать их и делать научно обоснованные выводы из результатов;</p>
<p>- давать самостоятельную оценку различным концепциям, теориям, направлениям в пчеловодстве с позиции современных научных достижений.</p>
<p>Пчеловод должен владеть:</p>
<p>- методами оценки медовых запасов местно', 3, 9, 37, 10, 5, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (257, 'Социальная работа', 5, false, '<p>Социальный работник предоставляет гражданам социальные услуги и государственную социальную помощь в целях улучшения условий их жизни и расширения их возможностей.</p>
<p>Это особый вид деятельности, связанный с оказанием помощи и поддержки слабозащищенным категориям населения, содействие человеку, оказавшемуся в трудной жизненной ситуации. Профессия &laquo;социальная работа&raquo; реализуется, в первую очередь, в системе социальной защиты населения, но востребована в государственных органах управления на различных уровнях власти, в государственных и негосударственных организациях, учреждениях сферы здравоохранения и образования, юстиции и внутренних дел, обороны и МЧС, в профильных подразделениях производственных организаций, в структурах социально-ориентированного бизнеса и общественных организациях.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Social Work</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><st', 4, 8, 27, 9, 0, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (258, 'Реставрация произведений из дерева', 5, false, '<p>Специалист по реставрации произведений из дерева работает с&nbsp;предметами интерьера.</p>
<p>Деятельность реставратора осуществляется в двух, тесно связанных направлениях - исследование и практика. Исследовательская часть состоит из определения категории сохранности, практическая из консервации, восстановления и реконструкции.</p>
<p>Умение организовать и планировать свою работу, навыки межличностного общения, способность решать производственные и технологические задачи, креативность, аккуратность и точность - качества, характерные для профессионального реставратора. Каждый реставратор принимает на себя большую ответственность, независимо от того, работает ли он самостоятельно или в команде.</p>
<p>Каждый шаг в рабочем процессе имеет важное значение: ошибки реставратора могут нанести непоправимый вред историческому объекту и крайне сложно исправимы. Это означает, что реставратор должен работать аккуратно и надежно, быть энергичным, демонстрировать умение</p>
<p>планировать и органи', 4, 7, 16, 9, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (260, 'Эксплуатация кабельных линий электропередачи', 1, false, '<p>Силовые кабельные линии электропередач применяются для подземной и подводной передачи электроэнергии на высоком и низком напряжениях. Соединение и оконцевание кабелей осуществляется при помощи кабельных муфт и воронок. Электромонтёр по ремонту и монтажу кабельных линий электропередачи -перспективная и востребованная профессия на рынке труда РФ. Основные задачи специалиста&nbsp;&nbsp; -работы по демонтажу, ремонту и монтажу кабельных линий, вводных устройств кабельной арматуры, разметка и разделка кабеля с применением слесарного инструмента и приспособлений, ремонт и монтаж концевых и соединительных муфт.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Cable Power Line Maintenance</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: R88</strong></p>
<p><strong>Количество конкурсантов в команде: 1 </strong></p>', 3, 10, 32, 9, 4, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (261, 'Рекрутинг', 5, false, '<p>Сегодня компетенция &laquo;рекрутер&raquo; является одной из самых актуальных и востребованных. Современные предприятия предъявляют высокие требования к профессиональным качествам сотрудников, их способности управлять производством, модернизировать технологии, создавать конкуренцию на рынке. Подбор квалифицированного персонала, максимально отвечающего требованиям руководства, является одной из основных функций HR-менеджеров и рекрутеров. Правильный подбор кандидатов на должность ведет к росту производительности труда, повышению корпоративной культуры и уровня лояльности сотрудников, снижению текучести кадров и недовольства сотрудников работой. Все это непосредственно влияет на деловую репутацию компании, качество производимой продукции и оказываемых услуг, и как следствие ведет повышению конкурентоспособности предприятия на рынке труда.</p>
<p>Участие конкурсантов в соревнованиях по данной компетенции обеспечивает профессиональный рост сотрудников служб подбора персонала и решает за', 2, 6, 16, 6, 5, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (262, 'Финансы', 5, false, '<p>Профессиональная компетенция соответствует профессиональному стандарту "Специалист по внутреннему контролю (внутренний контролер)". Предполагает наличие навыков и умений по следующим основным видам деятельности:</p>
<ul>
<li>финансово-экономическое планирование в секторе государственного и муниципального управления и организация исполнения бюджетов бюджетной системы Российской Федерации;</li>
<li>ведение расчетов с бюджетами бюджетной системы Российской Федерации;</li>
<li>участие в управлении финансами организаций и осуществление финансовых операций;</li>
<li>участие в организации и осуществлении финансового контроля.</li>
</ul>
<p>&nbsp;</p>
<p><strong>Название ENG: Finance</strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T78</strong></p>', 3, 9, 15, 9, 8, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (263, 'Преподавание технологии', 2, false, '<p>Основное направление такой деятельности &ndash;введение учащихся в мир техники и технологий, знакомство с производством и профессиями через организацию практической и проектной деятельности учащихся, формирование опыта трудовой, созидательной деятельности, формирование профессиональных умений и навыков.</p>
<p>Серьезное обновление средств производства, изменение характера труда в постиндустриальном обществе требуют от технологической подготовки учащихся соответствовать требованиям современной инновационной экономики. Для этого педагог в области технологического образования должен обладать серьезной подготовкой в естественнонаучной и гуманитарной областях, математике, знать основы предпринимательской деятельности. Современный педагог должен иметь подготовку, открывающую возможность научить учащихся решению современных производственно-технологических задач (проектных, конструкторских, технологических, управленческих, предпринимательских) в процессе моделирования и создания объектов тр', 3, 9, 20, 6, 1, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (265, 'Цифровое земледелие', 3, false, '<p>&nbsp;</p>
<p>В настоящее время сельскохозяйственное производство находится на этапе цифровой</p>
<p>трансформации, обеспечивающей ресурсосбережение, экологизацию и экономию времени.</p>
<p>Специалист в области &laquo;Цифрового земледелия&raquo; - цифровой агротехнолог должен обладать</p>
<p>универсальным пакетом компетенций агронома, оператора беспилотных летательных систем,</p>
<p>оператора современной сельскохозяйственной техники и оборудования, механика, IT-</p>
<p>специалиста с навыками применения программного обеспечения (в том числе специального) и</p>
<p>программирования.</p>
<p>Цифровой агротехнолог должен быть в курсе инновационных современных разработок в сельскохозяйственных технологиях и оборудовании для помощи производителю в увеличении количества продукции и при этом максимально сохранять окружающую среду; использовать сетевые сервисы для налаживания коммуникаций с потребителями.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Digital farming</strong></p>
', 2, 10, 26, 5, 0, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (266, 'Архитектура', 6, false, '<p>&nbsp;</p>
<p>Архитектор &mdash; одна из самых популярных специальностей в мире и хорошо востребована на современном рынке труда. В настоящее время архитектор &mdash; специалист широкого профиля, который занимается архитектурным проектированием разработкой планов зданий, их фасадов &mdash; в целом и в деталях жилых домов, производственных и общественных зданий, реконструкцией объектов строительного и историко-культурного назначения, градостроительным проектированием населенных пунктов, а также ландшафтным дизайном и разработкой интерьеров зданий любого назначения.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Architecture</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T23</strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>', 3, 10, 23, 9, 9, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (267, 'Организация строительного производства', 4, false, '<p>&nbsp;</p>
<p>Организатор строительного производства (прораб, мастер) осуществляет организацию строительного производства на возглавляемом участке производства работ и управление персоналом возглавляемого участка; обеспечение соответствия результатов выполняемых видов строительных работ требованиям технических регламентов, сводов правил и национальных стандартов в области строительства, а также требованиям проектной и технологической документации.</p>
<p>Трудовыми функциями специалистов данной компетенции являются:</p>
<ul>
<li>организация производства строительных работ;</li>
<li>организация производства строительных работ на объекте капитального строительства;</li>
<li>организация строительного производства на участке строительства (объектах капитального строительства);</li>
<li>материально-техническое обеспечение производства строительных работ, на объекте капитального строительства, участке строительства (объектах капитального строительства);</li>
<li>оперативное управление прои', 4, 6, 29, 9, 1, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (268, 'Агент страховой', 5, false, '<p>Страховой агент &ndash; связующее звено крупной компании и людей, которые хотят сделать свою жизнь безопаснее. Страховой агент обязан выяснить желания клиента, рассказать ему о возможных условиях страхования, действующих тарифах и компенсационных выплатах. После данных действий производится заключение договора страхования на наиболее выгодных для клиента условиях. Профессия страхового агента предполагает постоянный контакт с людьми и ведение переговоров. Представитель профессии продает услуги страхования, которые являются сложными для понимания. Поэтому очень важно наличие у специалиста хороших коммуникативных навыков, умения работать с информацией, слушать и убеждать, чтобы достичь успеха в этой сфере. Данный специалист выясняет потребности клиента, предлагает необходимые варианты страхования, разъясняет нюансы страховых тарифов, условия компенсационных выплат, заключает договора от имени страховой компании и контролирует их исполнение.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: In', 3, 8, 35, 5, 6, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (269, 'Интернет-маркетинг', 5, false, '<p>Компетенция предполагает использование набора цифровых инструментов, которые позволяют предприятиям и различного рода компаниям позиционировать себя: как бренд, как работодателя, как надежного партнера. С помощью интернет- маркетинга компании внедряют свою корпоративную культуру, идеологию, социальную и кадровую политику, свои товары, услуги и сервисы.</p>
<p>В случае интернет-маркетинга контакты пользователей в виде заявок, заказов или проявления интереса к тому или иному виду товаров и услуг, а также их деньги в виде онлайн-оплат, обмениваются на то, что они могут получить непосредственно, находясь в сети Интернет: информацию, товар или услугу. Все это активно используется в рамках мероприятий по диверсификации производства компаний промышленного сектора экономики, а также стимулирует спрос на новую высокотехнологичную гражданскую продукцию.</p>
<p>Квалифицированные специалисты в данной области занимаются формированием клиентского опыта с выгодой для имиджа организации или корпора', 3, 8, 15, 9, 2, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (270, 'Реклама', 5, false, '<p>Реклама выполняет важнейшую функцию рыночной экономики &ndash; стимулирование сбыта и обеспечивает тем самым связь между производством и потреблением. Реклама, выступая как элемент конкуренции, способствует постоянному совершенствованию выпускаемой продукции.</p>
<p>В стандарт рекламы WSR включены как традиционные формы исследования рынка и организации рекламной кампании, так и новейшие технологии, такие как создание, публикация и СЕО-оптимизация рекламных сообщений в интернете.</p>
<p>Все семь модулей компетенции реклама включают в себя цифровые компоненты и технологии.</p>
<p>Объектами профессиональной деятельности рекламиста являются:</p>
<ul>
<li>Рекламная кампания;</li>
<li>Рекламные коммуникации;</li>
<li>Технологические процессы изготовления рекламного продукта</li>
<li>Рекламные продукты: рекламные тексты, рекламная фотография, рекламное видео, наружная реклама, корпоративная и имиджевая рекламная продукция включая сувениры, сайты, полиграфическая продукция.</li>
</ul>
<p>&n', 2, 7, 17, 6, 9, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (271, 'Документационное обеспечение управления и архивоведение', 5, false, '<p>Организационное и документационное обеспечение является основой управления. Уровень и качество этого определяет оперативность, четкость и слаженность работы организации, влияет на деловую репутацию и, в конечном счете, на развитие фирмы. Для такой работы требуются квалифицированные специалисты по документационному обеспечению управления, обладающие профессиональными знаниями и хорошо владеющие компьютерной техникой.&nbsp; Именно они осуществляют организацию делопроизводства на предприятиях, а при больших объемах работы этим направлением деятельности занимаются целые подразделения &mdash; управления делами, общие отделы, канцелярии, секретариат.</p>
<p>Специалист отвечает за организацию документационного обеспечения управления и функционирования организации, организацию архивной и справочно-информационной работы по документам организации.</p>
<p>Компетенция включает знания и умения по следующим направлениям:</p>
<p>- Компьютерная обработка документов</p>
<p>- Организация документообо', 4, 6, 39, 7, 5, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (272, 'Охрана окружающей среды', 5, false, '<p>Квалифицированные специалисты в данной области могут проанализировать сложившуюся экологическую ситуацию, оценить необходимость принятия мер по охране окружающей среды, разработать мероприятия для снижение влияния и сокращение поступлений в природную среду загрязняющих компонентов, стабилизации, а затем и уменьшения существующего уровня загрязненности атмосферного воздуха, поверхностных и грунтовых вод, почвы. Специалисты в области охраны окружающей среды обладают знаниями в области мониторинга и контроля показателей качества окружающей среды, а при необходимости должны принимать решения для улучшения санитарно-гигиенической обстановки и ослабления физических факторов воздействия на здоровье человека на окружающей нормируемой территории.</p>
<p>Специалисты экологи обладают следующими профессиональными навыками и знаниями:</p>
<p>навыки работы с экологическим законодательством, законами, кодексами, стандартами и нормативами, используемыми в природоохранной деятельности;</p>
<p>знание', 4, 9, 22, 6, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (273, 'Работы на токарных универсальных станках', 3, false, '<p>Компетенция &laquo;Работы на токарных универсальных станках&raquo; представляет собой изготовление различных деталей из металла и других материалов, в соответствии с требованиями конструкторской документации. Для этого используются токарные универсальные станки различных моделей. Руководствуясь чертежом детали, станочник определяет последовательность ее изготовления, подбирает необходимые для этого инструменты. Использует справочники и производит необходимые расчеты. Выбирает режим резания, проводит наладку станка, устанавливает инструмент и заготовку. Пользуясь чертежом детали или эскизом, преобразует прочитанную им информацию в определенную последовательность движения рук и воздействует на органы управления станком.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Universal Lathe Machine Operation</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: R37</strong></p>
<p><strong>Количе', 2, 10, 21, 8, 5, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (274, 'Эксплуатация сервисных роботов', 3, false, '<p>&nbsp;</p>
<p>В ближайшем будущем всех нас будут окружать множество бытовых роботов. Уже сегодня видна необходимость в создании профессии, связанной с эксплуатацией, ремонтом и настройкой сервисных роботов. В рамках данной профессиональной компетенции важными навыками участника являются умения настраивать и администрировать ПО роботов различного уровня, разбираться в механике и электронике для модульного ремонта роботов.</p>
<p>Участники должны ориентироваться в современных технологиях, используемых при создании и управлении сервисными роботами и уметь применять эти знания на практике.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T75</strong></p>
<p><strong>Количество конкурсантов в команде: 1 </strong></p>', 4, 7, 32, 7, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (275, 'Ремесленная керамика', 6, false, '<p>Профессиональный керамист должен обладать обширным спектром знаний и навыков, так как в область его профессиональной деятельности входят: технологические процессы изготовления керамических изделий, широкий спектр материалов для формования и декорирования изделий,</p>
<p>специализированное оборудование и инструменты (гончарный круг, печь для обжига, экструдер для массозаготовки и т. д.), общение с заказчиком и составление технического задания, эстетическая, творческая и эргономическая разработка изделий, эскизирование и техническая документация, изготовление, декорирование и тиражирование изделий различного функционала.</p>
<p>Керамист может работать как индивидуально, создавая авторские изделия на продажу или заказ, так и быть штатным сотрудником в мастерской, которая занимается мелкосерийным производством керамических изделий.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Handicraft Ceramics</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</', 2, 8, 24, 7, 10, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (276, 'Эксплуатация судов водного транспорта', 7, false, '<p>Эксплуатация грузового речного транспорта &ndash; это комплекс профессиональных мероприятий, включающих в себя:</p>
<p>- приемку судна в эксплуатацию;</p>
<p>- использование судна по его назначению;</p>
<p>- техническое обслуживание и ремонт судна без вывода его из эксплуатации;</p>
<p>- обеспечение безопасности жизнедеятельности на судне, выполнение мероприятий по борьбе за живучесть судна, оставлению судна, оказанию помощи пострадавшим и терпящим бедствие;</p>
<p>- вывод судна из эксплуатации.</p>
<p>В рамках данной профессиональной компетенции профессиональными навыками Конкурсантов являются навыки в области:</p>
<p>- морского судовождения и судовождения на внутренних водных путях;</p>
<p>- эксплуатации и ремонта судовых энергетических установок и другого судового оборудования;</p>
<p>- безопасности жизнедеятельности на судне;</p>
<p>- выполнения такелажных работ.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Water Transport Vessels Operation</strong></p>
<p><strong', 3, 6, 30, 7, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (277, 'Обслуживание и ремонт оборудования релейной защиты и автоматики', 3, false, '<p>Сложные режимы работы электрооборудования в трехфазных электрических сетях требуют квалифицированного обслуживания и своевременного устранения неполадок. Повреждения, связанные с нарушением изоляции, разрывом проводов и кабелей могут привести к замыканиям фаз и серьезным сбоям в работе электрических сетей. Для предупреждения аварий необходимо оперативно реагировать на изменение режимов работы, своевременно выявить повреждения и включать при необходимости резервные источники питания.</p>
<p>Специалистам данной компетенции необходимо обладать навыками по техническому обслуживанию аппаратуры релейной защиты и автоматики линии электропередач 10 кВт и навыками регулировки электромеханической релейной аппаратуры. В работе используются специальные инструменты, проверочные установки, измерительные приборы и компьютеры.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Relay Protection and Automation Devices Maintenance</strong></p>
<p><strong>Статус компетенции: Основная</strong><', 2, 6, 27, 6, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (278, 'Электрослесарь подземный', 3, false, '<p>Электрослесарь подземный обеспечивает обслуживание электрооборудования горных машин и механизмов, выполняя всю работу в соответствии с действующими сводами правил в подземных горных условиях.</p>
<p>Электрослесарь подземный должен диагностировать и устранять неисправности, выполнять монтаж, демонтаж, опробование и сдачу в эксплуатацию электрооборудования горных машин и механизмов, а также высоковольтного электрооборудования и аппаратуры управления и защиты.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Underground Electrician</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: R61</strong></p>', 2, 8, 36, 6, 3, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (279, 'Аппаратчик химических технологий', 3, false, '<p>&nbsp;</p>
<p>Аппаратчик химических технологий осуществляет профессиональную техническую деятельность по управлению химическим процессом, происходящим в технологической установке в коммерческих, частных, и государственных предприятиях.</p>
<p>Существует множество направлений работ аппаратчика в рамках химической и нефтегазоперерабатывающих отраслях. Данный специалист работает как внутри помещений, так и снаружи. Аппаратчик должен уметь выдавать технические решения, независимо от того, работает он один или в команде. Специалисту необходимо уметь принимать на себя высокий уровень ответственности. Аппаратчик должен работать в соответствии с законодательством РФ, действующими стандартами и с соблюдением всех правил охраны труда и техники безопасности. Любые ошибки могут быть необратимы, дорогостоящими и подвергать опасности окружающих.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Chemical Operator</strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную</strong></p>
<p><str', 3, 9, 33, 8, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (280, 'Роботизированная сварка', 3, false, '<p>Роботизированная сварка &mdash; это автоматизированный процесс, который реализуется посредством использования роботов-манипуляторов и другого сварочного оборудования. Сварочный аппарат управляется не вручную, а заложенной в робот программой. При этом автоматизирован не только сварочный процесс, но и действия по перемещению и обработке деталей. Участие человека в производственном процессе требуется лишь на этапе написания программы для робота и контроля качества готового изделия. Главные преимущества роботизированной сварки - высокая производительность, низкий процент брака, безупречное качество готовых изделий и идеальная точность сварных швов, которой не смогли бы достичь даже опытные сварщики.</p>
<p>Область применения роботизированной сварки с каждым годом расширяется. На сегодняшний день при сварке используется около 20% промышленных роботов.</p>
<p>&nbsp;</p>
<p><strong>Название ENG: Robotic Welding</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><s', 3, 9, 21, 6, 3, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (281, 'Сити-фермерство', 3, false, '<p>Цель сити-фермерства - создание и обслуживание удобных в эксплуатации в городских условиях установок для выращивания агрокультур с использованием гидро- и аэропонных систем.</p>
<p>Сити &ndash; фермерство включает в себя элементы конструирования и агротехнологии. Специалист в этой области обустраивает и обслуживает агропромышленные хозяйства, которые будут выращивать продукты питания на крышах и стенах небоскребов крупных городов.</p>
<p>Навыки наиболее важные для сити &ndash; фермера:</p>
<ul>
<li>системное мышление (умение определять сложные системы и работать с ними, в том числе системная инженерия);</li>
<li>умение управлять проектами и процессами;</li>
<li>бережливое производство, управление производственным процессом, основанное на постоянном стремлении к устранению всех видов потерь, что предполагает вовлечение в процесс оптимизации бизнеса каждого сотрудника и максимальную ориентацию на потребителя;</li>
<li>знать физический смысл аэро-и гидропонных систем. Принцип работы. С', 2, 9, 15, 9, 8, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (282, 'Внешнее пилотирование и эксплуатация беспилотных воздушных судов', 7, false, '<p>&nbsp;</p>
<p>&laquo;Внешнее пилотирование и эксплуатация беспилотных воздушных судов&raquo; позволяет экипажам, куда входит оператор управления беспилотного воздушного судна (номинальный командир экипажа) и техник-оператор целевого оборудования, продемонстрировать навыки и умения в области эксплуатации дистанционно-пилотируемых воздушных судов различных модификаций: самолетного типа по схеме &laquo;высокоплан&raquo; с двигателем внутреннего сгорания, самолетного типа по схеме &laquo;летающее крыло&raquo; с электродвигателем, вертолетного типа.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Remote Control and Maintenance of Unmanned Aircraft</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T38</strong></p>
<p><strong>Количество конкурсантов в команде: 2 </strong></p>', 4, 6, 17, 10, 0, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (283, 'Правоохранительная деятельность (Полицейский)', 5, false, '<p>Профессиональные обязанности полицейского включают в себя знание нормативных правовых актов МВД России, регламентирующих деятельность полиции по охране общественного порядка и обеспечению общественной безопасности; назначение, функции и задачи подразделений патрульно-постовой службы и умение осуществлять оперативно-служебную деятельность в составе патрульно-постовых нарядов, преследовать, задерживать и доставлять в органы внутренних дел лиц, совершивших правонарушение, правомерно применять физическую силу, специальные средства, огнестрельное оружие, умение принимать процессуально значимые решения и документировать их.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Law enforcement (police officer)</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T11</strong></p>
<p><strong>Количество конкурсантов в команде: 5 </strong></p>
<p><strong>&nbsp;</strong></p>
<p>&nbsp;</p>', 4, 9, 40, 7, 3, 2);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (284, 'Неразрушающий контроль', 3, false, '<p>Компетенция &laquo;Неразрушающий контроль&raquo; заключается в проведении технической диагностики оборудования и оперативном выявлении дефектов с целью повышения надежности промышленных объектов и минимизации рисков промышленных катастроф.</p>
<p>На сегодняшний день разработан целый ряд методов реализации неразрушающего контроля, ни один из которых не является универсальным. С целью обеспечения полномасштабного контроля промышленные предприятия сочетают два или более различных метода, самыми распространенными из которых являются капиллярный, ультразвуковой, радиографический, визуальный и измерительный.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Nondestructive inspection</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: R96</strong></p>
<p><strong>Количество конкурсантов в команде: 1 </strong></p>
<p>&nbsp;</p>', 3, 8, 22, 8, 9, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (285, 'Печное дело', 4, false, '<p>Печник работает внутри и снаружи помещений, включая большие и мелкие проекты домов и квартир заказчика. Печник должен планировать, проектировать системы отопления, выбирать и устанавливать печи, камины и дымовые трубы. Сдавать в эксплуатацию печи (камины и дымовые трубы), проверять их, готовить отчетную документацию, выполнять техническое обслуживание, уметь находить неисправности и выполнять ремонт в печах (каминах и дымовых трубах). Организация работы, самоорганизация, коммуникация и межличностное общение, умение решать проблемы, гибкость и глубокие знания своего дела &ndash; вот универсальные качества печника.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Masonry Heater Building</strong></p>
<p><strong>Статус компетенции: Кандидат в презентанционную</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: R93</strong></p>
<p><strong>Количество конкурсантов в команде: 1</strong></p>
<p>&nbsp;</p>', 2, 7, 40, 6, 5, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (286, 'Сельскохозяйственные биотехнологии', 3, false, '<p>Биотехнолог &ndash; это специалист, занимающийся переработкой биологического сырья с помощью микроорганизмов, культур и клеток растений и животных. Работа биотехнолога включает в себя реализацию технологий клонального размножения и адаптации растений; осуществление выращивания, хранения, транспортировки и предпродажной подготовки продукции растениеводства; управление работами по производству продукции растениеводства.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название ENG: Agricultural biotechnology</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T9</strong></p>
<p><strong>Количество конкурсантов в команде: 1 </strong></p>
<p>&nbsp;</p>', 4, 8, 25, 9, 0, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (287, 'Визаж и стилистика', 5, false, '<p>Компетенция предусматривает оказание услуг по визажу (макияжу) и подбору стиля. Услуги выполняются для удовлетворения эстетических потребностей клиента в соответствии с его пожеланиями, направлениями моды и с учетом его индивидуальных особенностей, так же визажист- стилист выполняет услуги для корпоративных заказчиков с целью создания и поддержания корпоративного имиджа сотрудников компаний. Наравне с этим визажисты выполняю работы по макияжу, создают образы для мира моды, театра, кино, для шоу бизнеса, рекламы и медиа сферы.</p>
<p>&nbsp;</p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T31</strong></p>
<p><strong>Количество конкурсантов в команде: 1 </strong></p>
<p><strong>&nbsp;</strong></p>', 4, 8, 24, 6, 0, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (288, 'Инженер-технолог машиностроения', 3, false, '<p>Специалист в данной области занимается разработкой и организацией производственных и технологических процессов в соответствии с требованиями нормативной документации. В сферу его деятельности входит подбор необходимых инструментов, материалов, комплектующих, оборудования и технологической оснастки; контроль за качеством и эффективностью выполнения технологических процессов; разработка нормативов времени на выполнение операций; составление плана выпуска продукции.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Название</strong><strong> ENG: Manufacturing Process Engineer</strong></p>
<p><strong>Статус компетенции: Презентанционная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: R95</strong></p>
<p><strong>Количество конкурсантов в команде: 1 </strong></p>', 4, 6, 27, 6, 4, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (289, 'Турагентская деятельность', 5, false, '<p>&nbsp;</p>
<p>Специалист туристического агентства:</p>
<p>1) ведет прием и первичную обработку обращений в туристскую организацию, осуществляет поиск, сбор, первичную обработку и анализ информации по туру, анализирует предложения туроператоров и/или систем &ndash; агрегаторов в соответствии с запросом клиента, организует поиск, сбор, первичную обработку и анализ информации по туризму, географии, истории, архитектуре, религии, достопримечательностям, социально-экономическому и политическому устройству стран и др.</p>
<p>2) осуществляет анализ потребностей заказчика и на его основе подбирает туристский продукт / туристские услуги согласно запросу клиента, формирует оптимальные предложения для клиента, консультирует заказчика о правилах оформления бронирования / туристских услуг, входящих в состав турпродукта и/или отдельных услугах;</p>
<p>3) ведет работу в специализированных системах бронирования: осуществляет бронирование и подтверждение туристских услуг (билетов, мест в гостиницах,', 4, 6, 28, 7, 10, 1);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (290, 'Туроператорская деятельность', 5, false, '<p>Специалист туроператорской компании:</p>
<p>1) анализирует рынок партнеров (поставщиков услуг) по предоставлению и осуществлению туристских услуг, изучает конъюнктуру и тенденции развития рынка туристских продуктов, а также спрос на реализуемые туристские продукты, потребности туристов и других заказчиков услуг.</p>
<p>Специалист туроператорской компании осуществляет поиск, сбор, первичную обработку и анализ информации для формирования туристских продуктов, разрабатывает концепцию, программу и расчет стоимости туристского продукта, разрабатывает схемы бронирования туристских продуктов, их подтверждения и оформления, создает базу данных по туристским продуктам, подготавливает документацию, необходимую заказчику для осуществления пользования туристскими услугами.</p>
<p>2) взаимодействует с туристскими организациями с целью продвижения турпродукта, разрабатывает и проводит мероприятия по продвижению турпродукта, информирует турагентства обо всех аспектах работы туристской организации,', 4, 7, 29, 6, 0, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (291, 'Водитель грузовика', 7, false, '<p>Водитель грузовика &mdash; это квалифицированный специалист, осуществляющий перемещение грузов с помощью грузового автомобиля.</p>
<p>Водитель грузового автомобиля (грузовика) -</p>
<p>должен знать:</p>
<p>&nbsp;-&nbsp; правила дорожного движения;</p>
<p>&nbsp;- назначение, принцип работы, эксплуатационные и технические характеристики, систему технического обслуживания и ремонта грузового автомобиля;</p>
<p>- требования техники безопасности, производственной санитарии, пожарной безопасности и охраны окружающей среды.</p>
<p>&nbsp;должен уметь:</p>
<p>- управлять грузовым автомобилем в любых погодных условиях;</p>
<p>- оценивать изменяющуюся дорожную ситуацию с точки зрения ПДД</p>
<p>- применять навыки безопасной езды;</p>
<p>- выполнять основные операции технического осмотра;</p>
<p>- устранять возникшие по время работы на линии неисправности автомобиля</p>
<p>Водителю грузовика необходимы хорошее здоровье, физическая сила и выносливость, высокая острота слуха и зрения, высокая ско', 4, 7, 34, 8, 9, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (293, 'Агрономия', 3, false, '<p>Профессиональный агроном обеспечивает организацию и выполнение работ по производству, первичной обработке, хранению и транспортировке растений.</p>
<p>Объекты его профессиональной деятельности: сельскохозяйственные культуры, их сорта и гибриды, семена и посадочный материал, товарная продукция; почва и ее плодородие; удобрения, пестициды, гербициды; сельскохозяйственная техника и оборудование; технологии производства продукции растениеводства и ее первичной обработки; технологии хранения, транспортировки и предпродажной подготовки растений; процессы организации и управления структурным подразделением сельскохозяйственного производства, малым предприятием; первичные трудовые коллективы.</p>
<p>Работа агронома также включает в себя:</p>
<ol>
<li>реализацию агротехнологий различной интенсивности и первичная</li>
</ol>
<p>обработка продукции растениеводства;</p>
<ol start="2">
<li>защиту почв от эрозии и дефляции, воспроизводство их плодородия;</li>
<li>осуществление хранения, транспорти', 4, 7, 31, 6, 0, 3);
INSERT INTO public.skill (id, title, skill_block_id, is_future, description, square_workplace, square_experts, square_briefing, square_warehouse, square_try_a_skills, members_count) VALUES (294, 'Технологии информационного моделирования BIM', 3, false, '<p>Деятельность в данной компетенции предполагает междисциплинарный подход к решению задач в области проектирования объектов капитального строительства. Архитекторы и инженеры-проектировщики строительной отрасли разрабатывают информационную модель здания, создают комплект чертежей, обмениваются данными с участниками инвестиционного строительства. Специализация направлена на повышение производительности и эффективности строительства, снижение себестоимости и затрат, обеспечение высокого качества проекта. Все это достигается за счет сквозного управления жизненным циклом строительного объекта &ndash; от разработки проекта до сноса и утилизации здания.</p>
<p>&nbsp;</p>
<p><strong>Название</strong><strong> ENG: Building Information Modeling</strong></p>
<p><strong>Статус компетенции: Основная</strong></p>
<p><strong>Тип: RU</strong></p>
<p><strong>№ CIS: T33</strong></p>
<p><strong>Количество конкурсантов в команде: 2 </strong></p>
<p><strong>&nbsp;</strong></p>', 2, 8, 24, 10, 5, 1);


--
-- Data for Name: skill_block; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skill_block (id, title) VALUES (1, 'Информационные и коммуникационные технологии');
INSERT INTO public.skill_block (id, title) VALUES (2, 'Образование');
INSERT INTO public.skill_block (id, title) VALUES (3, 'Производство и инженерные технологии');
INSERT INTO public.skill_block (id, title) VALUES (4, 'Строительство и строительные технологии');
INSERT INTO public.skill_block (id, title) VALUES (5, 'Сфера услуг');
INSERT INTO public.skill_block (id, title) VALUES (6, 'Творчество и дизайн');
INSERT INTO public.skill_block (id, title) VALUES (7, 'Транспорт и логистика');
INSERT INTO public.skill_block (id, title) VALUES (8, 'Future Skills');


--
-- Data for Name: users_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1, 'Пересторонин Михаил Онисимович', 'м', 'BwQeaaBt', 28570, '2000-09-29', 1, 21, 76, 1, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (2, 'Тёмкин Адам Евстафиевич', 'м', '@@tdGgjh', 98025, '1973-08-26', 2, 37, 45, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (3, 'Андронов Ян Назарович', 'м', '7ccYtusD', 33216, '1977-08-03', 2, 35, 22, 1, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (4, 'Кооскора Юлия Агафоновна', 'ж', '$GelyzsU', 99791, '1998-12-13', 1, 18, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (5, 'Свечин Севастьян Викентиевич', 'м', 'K1j8!36F', 61681, '1978-11-11', 2, 22, 8, 2, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (6, 'Друганин Агафон Артемиевич', 'м', 'J!LWiHEo', 55634, '1999-02-11', 1, 37, 71, 3, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (7, 'Сиясинов Мечислав Елисеевич', 'м', 'KGaPDuZL', 18704, '1989-10-29', 2, 26, 33, 0, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (8, 'Грибкова Элеонора Романовна', 'ж', 'iplPpkP8', 44806, '1991-10-29', 2, 7, 74, 3, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (9, 'Янечко Ольга Родионовна', 'ж', 'qQsZ!I5u', 34419, '2000-01-07', 1, 33, 41, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (10, 'Рекунов Эрнест Федорович', 'м', 'abl@S6Sk', 53696, '2000-08-13', 1, 13, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (11, 'Широких Платон Глебович', 'м', 'OSifoGXQ', 24054, '1999-09-08', 1, 2, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (14, 'Осолодкина Светлана Эрнестовна', 'ж', '4CLqBP7Z', 21915, '2000-05-06', 1, 31, 31, 1, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (15, 'Нюнка Евдоким Маркович', 'м', 'j3m8fMKr', 53686, '1983-08-04', 2, 2, 52, 1, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (16, 'Загидуллин Феоктист Аполлинариевич', 'м', 'VTLE24#4', 31520, '1989-03-27', 4, 1, 8, 3, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (17, 'Филиппов Вацлав Панкратиевич', 'м', 'SKD8CR!a', 18950, '1999-10-10', 1, 10, 61, 3, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (18, 'Лясковец Рюрик Платонович', 'м', 'U@#9HBbs', 76256, '1966-12-26', 2, 19, 60, 3, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (19, 'Бурдакова Злата Трофимовна', 'ж', 'kxt8G2nc', 60218, '2000-03-19', 1, 20, 65, 2, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (20, 'Ломовцева Пелагея Леонидовна', 'ж', 'tBBgyL3G', 35581, '1962-07-26', 2, 7, 2, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (21, 'Просвирнин Сергей Никифорович', 'м', '$IUzV6#m', 79979, '1999-11-29', 1, 24, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (22, 'Приходько Ипатий Саввевич', 'м', 'SVbpdRsE', 98590, '2000-02-06', 1, 33, 84, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (23, 'Батурин Евстигней Епифанович', 'м', '8G7gL3zb', 35463, '1971-06-18', 2, 37, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (25, 'Шангина Дина Чеславовна', 'ж', 'z!sO9imE', 47461, '1999-11-03', 1, 7, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (27, 'Пасхин Чеслав Федосиевич', 'м', '4fznAurD', 99073, '2000-05-02', 1, 46, 83, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (28, 'Чалый Серафим Егорович', 'м', 'ueVTx08C', 26293, '1999-07-08', 1, 6, 34, 1, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (30, 'Лапин Антип Игоревич', 'м', '4jmwa6yH', 37291, '1978-10-25', 4, 29, 71, 3, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (31, 'Любимцева Вероника Тихоновна', 'ж', 'nuiBJozD', 60331, '1999-04-19', 1, 27, 15, 3, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (32, 'Сиянкин Глеб Никифорович', 'м', 'MNIN3vJI', 14715, '1976-06-03', 2, 23, 81, 1, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (33, 'Зуев Архип Всеволодович', 'м', 'GuRPwS$f', 75383, '1990-06-30', 2, 12, 67, 3, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (34, 'Балаева Тамара Егоровна', 'ж', '87LSGtVF', 58446, '2000-10-07', 1, 28, 72, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (35, 'Фомичев Кузьма Карлович', 'м', 'V$qsosSa', 69742, '1999-11-23', 1, 23, 22, 1, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (36, 'Ямбаев Даниил Артемович', 'м', 'BQ9!TDty', 36795, '1999-08-06', 1, 34, 14, 3, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (37, 'Набадчиков Севастьян Глебович', 'м', '#nM3m5Uy', 58863, '1985-02-18', 2, 34, 65, 2, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (38, 'Ясеневский Никита Демьянович', 'м', 'Xn!KFR@F', 52161, '1990-10-06', 2, 35, 63, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (41, 'Ямбаев Валентин Никитевич', 'м', '#51vGIbx', 75975, '2000-01-02', 1, 14, 40, 3, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (43, 'Путилов Юрий Ипатович', 'м', 'kZZSQ51b', 16767, '2000-01-12', 1, 7, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (44, 'Комиссаров Тимур Платонович', 'м', 'Gn!uBIc3', 81704, '1999-04-09', 1, 37, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (45, 'Завражный Аристарх Владиславович', 'м', 'yOhynAuK', 77241, '1994-01-05', 3, 2, 33, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (46, 'Яркин Всеволод Адамович', 'м', 'FM9GsP3U', 20493, '1980-08-25', 2, 18, 77, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (47, 'Власов Захар Брониславович', 'м', 'X#6wkUkj', 45708, '2000-10-23', 1, 44, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (48, 'Самошин Богдан Сигизмундович', 'м', 'xl#SFt0c', 73943, '1984-05-01', 4, 21, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (49, 'Рошет Всеволод Зиновиевич', 'м', 'UKmkgwsd', 43354, '2000-02-24', 1, 39, 56, 2, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (50, 'Шкловский Данил Назарович', 'м', 'wrfgjt$V', 21873, '1991-10-12', 2, 19, 6, 2, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (51, 'Сагадиев Артем Ираклиевич', 'м', 'rzpnonVe', 47719, '2000-09-11', 1, 34, 66, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (52, 'Глушаков Владлен Владиславович', 'м', 'H0pI4MAa', 58797, '1993-09-14', 2, 6, 28, 0, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (53, 'Ювелев Адриан Яковович', 'м', 'ppU$ktDw', 14804, '2000-10-30', 1, 8, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (54, 'Хлопонина Лада Артеименовна', 'ж', 'esdntzm@', 89441, '2000-06-18', 1, 21, 51, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (55, 'Калакуцкий Фока Потапович', 'м', 'U1V7f0oB', 95117, '2000-03-05', 1, 11, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (56, 'Яловенко Харитон Карлович', 'м', 'WNi9s5RI', 36426, '2000-10-14', 1, 6, 61, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (57, 'Тычкин Борис Федотович', 'м', 'Fc37vJWS', 48978, '2000-02-12', 1, 23, 28, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (58, 'Булкин Лавр Казимирович', 'м', 'xcE!UxHQ', 37003, '1999-06-15', 1, 27, 40, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (59, 'Басманова Любовь Евграфовна', 'ж', 'LwqEMWqg', 70529, '2000-05-24', 1, 13, 53, 2, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (60, 'Красенков Вениамин Проклович', 'м', '@f5FejSV', 35700, '1970-11-08', 2, 13, 65, 0, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (63, 'Чесноков Эрнст Кондратиевич', 'м', 'Pd3vW84r', 78482, '1988-02-12', 2, 14, 73, 3, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (64, 'Первак Андрон Эдуардович', 'м', '!28JiYfC', 38889, '1999-05-03', 1, 12, 61, 0, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (65, 'Курбанова Кристина Натановна', 'ж', 'MpGaVuT1', 14528, '1973-11-18', 2, 12, 10, 1, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (67, 'Фанин Антип Миронович', 'м', 'fbn2WhC!', 62711, '1999-10-27', 1, 4, 82, 0, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (68, 'Успенская Ефросиния Трофимовна', 'ж', 'I3SwH0Ig', 94112, '1999-03-02', 1, 8, 79, 3, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (69, 'Гурская Лариса Фомевна', 'ж', 'zuQiCW3c', 97455, '2000-03-31', 1, 18, 16, 1, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (70, 'Гришко Петр Данилевич', 'м', 'yw3y57SK', 89265, '1969-07-12', 2, 37, 25, 0, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (72, 'Кувыкин Чеслав Викентиевич', 'м', 'SweVN20I', 23632, '2000-04-28', 1, 27, 88, 1, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (73, 'Белов Савелий Моисеевич', 'м', 'aWQFkKH1', 40216, '1992-07-16', 3, 39, 57, 1, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (74, 'Белорусов Авдей Потапович', 'м', '!BW$pe1o', 10629, '1994-11-30', 2, 33, 2, 1, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (76, 'Яхненко Татьяна Тихоновна', 'ж', 'SPNtof@F', 51245, '1975-07-06', 2, 19, 44, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (77, 'Забродин Кондрат Самсонович', 'м', 'ZFiSl88Z', 95811, '1999-11-20', 1, 9, 39, 2, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (79, 'Шибалов Егор Агапович', 'м', 'QRAW4BFX', 21511, '1962-03-01', 2, 30, 13, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (80, 'Богров Остап Иннокентиевич', 'м', '#an1uoWY', 72620, '1962-07-15', 2, 46, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (81, 'Астанкова Ефросинья Виссарионовна', 'ж', '893hZUV4', 57027, '2000-07-05', 1, 18, 71, 2, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (82, 'Зыкина Вера Аристарховна', 'ж', 'K0qHJsTn', 37568, '1973-12-22', 2, 14, 49, 3, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (83, 'Мозговая Милена Якубовна', 'ж', 'ZsT#goDN', 45897, '2000-12-22', 1, 34, 65, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (84, 'Устимович Эдуард Платонович', 'м', 'hhFK0sOq', 77489, '1960-07-25', 2, 27, 10, 2, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (85, 'Пирогов Рубен Еремеевич', 'м', 'jwI7v2Sa', 76523, '2000-01-08', 1, 21, 60, 2, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (86, 'Григолюк Всеволод Саввевич', 'м', 'sNgtLv7b', 30945, '2000-04-17', 1, 9, 11, 3, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (87, 'Яговенко Тит Тихонович', 'м', 'fJMCVPtI', 72328, '1972-05-16', 2, 35, 27, 2, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (89, 'Осина Таисия Максимовна', 'ж', 'XqmuobH7', 91645, '2000-08-27', 1, 31, 61, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (90, 'Яценковская Анисья Василиевна', 'ж', '!V!GzNmj', 41839, '1979-01-25', 2, 22, 17, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (91, 'Бесчастныха Анастасия Емельяновна', 'ж', 'xyXKxMA$', 72805, '2000-08-14', 1, 25, 83, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (92, 'Бенедиктова Ефросиния Давидовна', 'ж', 'ykB!gInB', 24192, '2000-03-12', 1, 35, 79, 0, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (93, 'Кобелев Лев Агапович', 'м', '0F08j7gW', 89881, '2000-12-08', 1, 29, 36, 2, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (94, 'Лукьяненко Прокофий Мартьянович', 'м', 'hx4VsK6$', 90257, '1999-09-23', 1, 27, 19, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (96, 'Венедиктов Ярослав Ерофеевич', 'м', 'tXzztYE0', 95035, '1973-12-30', 2, 14, 43, 1, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (97, 'Форопонов Серафим Касьянович', 'м', 'ULPA!03I', 84736, '2000-03-21', 1, 23, 76, 2, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (98, 'Лазарев Радион Феоктистович', 'м', '0#k0wE1H', 19801, '2000-12-01', 1, 1, 12, 1, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (99, 'Квитко Всеслава Ираклиевна', 'ж', '7UYTkUnI', 99322, '1961-11-05', 2, 30, 60, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (100, 'Гребенщиков Евстигней Анатолиевич', 'м', 'qFf0PM6z', 94855, '1994-02-20', 2, 27, 73, 0, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (101, 'Арефьев Нестор Ульянович', 'м', '5A3SIw!Y', 26320, '1971-09-14', 2, 16, 27, 1, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (102, 'Кучерова Роза Юрьевна', 'ж', 'qY5$H5jc', 91941, '1979-11-22', 2, 39, 59, 2, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (105, 'Басманов Виктор Андроникович', 'м', 'JWmOW1!n', 54615, '1987-09-06', 2, 27, 40, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (106, 'Рунов Дементий Моисеевич', 'м', '$mt1fw5O', 32679, '2000-09-20', 1, 34, 42, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (107, 'Зюлёва Роза Харитоновна', 'ж', '$hmxoGzz', 82850, '1979-02-02', 2, 41, 15, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (108, 'Клоков Венедикт Гаврилевич', 'м', 'IAj5EgtO', 41654, '1982-04-27', 2, 1, 33, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (109, 'Свечин Рюрик Никифорович', 'м', '4#g2mjf@', 62440, '2000-08-16', 1, 16, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (110, 'Тимашёв Измаил Панкратиевич', 'м', 'nWBFZRHi', 68802, '1999-10-18', 1, 31, 38, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (112, 'Ячиков Самсон Остапович', 'м', 'vo2KGPGU', 73189, '1961-01-16', 2, 10, 24, 1, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (113, 'Агафонов Аким Климентович', 'м', '3z3u@Lh9', 60054, '1966-08-11', 2, 16, 19, 1, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (114, 'Кумиров Герасим Фролович', 'м', 'PKCk3UYw', 41321, '2000-06-08', 1, 32, 31, 0, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (115, 'Ёлкин Модест Касьянович', 'м', '!OEroX$!', 93961, '1980-11-05', 2, 8, 50, 2, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (116, 'Кожевина Ирина Захаровна', 'ж', 'mQrSeDl0', 60876, '2000-04-06', 1, 1, 33, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (117, 'Сорокина Аза Гаврииловна', 'ж', 'w!tZ7uvd', 18251, '1985-10-19', 2, 8, 5, 0, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (118, 'Пичугин Измаил Валериевич', 'м', '96WlLEZL', 12115, '1973-02-04', 2, 29, 21, 3, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (119, 'Драке Наум Евстафиевич', 'м', 'RUsb5dQJ', 89252, '1969-09-28', 2, 35, 56, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (120, 'Новожилов Феликс Олегович', 'м', 'gP7F5mAM', 12892, '1964-07-31', 3, 1, 45, 1, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (121, 'Курпатова Регина Самсоновна', 'ж', 'z2jflG15', 16904, '1985-09-18', 2, 44, 46, 0, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (122, 'Листунов Валерий Никитевич', 'м', 'GAov$JUZ', 97382, '1998-12-30', 1, 11, 66, 1, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (123, 'Нестерова Милена Никаровна', 'ж', 'O#KWBnsB', 54613, '1999-12-30', 1, 8, 37, 2, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (124, 'Ярошенко Берта Клавдиевна', 'ж', 'HS9ZcO6O', 14521, '1999-08-05', 1, 24, 42, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (125, 'Едемская Варвара Федотовна', 'ж', 'ZajvGOQ8', 91118, '1999-03-04', 1, 16, 83, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (126, 'Яранцева Марина Данилевна', 'ж', '$8$C7SKD', 35281, '1988-10-05', 2, 12, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (127, 'Житкова Надежда Сигизмундовна', 'ж', 'Qm3QyVt9', 35173, '1989-02-20', 2, 44, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (128, 'Мащенко Алла Семеновна', 'ж', 'p9XnnQtS', 51085, '1983-10-24', 2, 24, 55, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (129, 'Яржемковский Сидор Всеволодович', 'м', 'lQqZRwlA', 41491, '1999-03-22', 1, 8, 50, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (130, 'Макаров Арсений Карлович', 'м', 'W61rinaP', 66724, '1999-05-20', 1, 20, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (131, 'Тимирёва Марфа Андрияновна', 'ж', 'Xwo5oPIF', 40517, '1995-04-08', 2, 37, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (132, 'Воеводин Михей Онуфриевич', 'м', 'hzda63i$', 27440, '1971-08-18', 2, 28, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (133, 'Куделин Григорий Гордеевич', 'м', 'sD29k@6F', 85723, '1965-02-12', 2, 41, 12, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (134, 'Калошин Карл Модестович', 'м', 'p1Ht#rW7', 11979, '2000-12-22', 1, 46, 47, 1, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (135, 'Цыганов Поликарп Евлампиевич', 'м', 'IefS9hgN', 52915, '1980-11-01', 2, 35, 4, 2, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (136, 'Лозанова Софья Измаиловна', 'ж', 'DDxPysZ7', 76246, '1991-07-13', 2, 25, 5, 0, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (137, 'Явид Модест Федотович', 'м', '1w#ZmiVI', 42221, '1968-06-12', 2, 46, 79, 3, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (138, 'Кудяшов Василий Никанорович', 'м', 'OAVSo#Cf', 42694, '1967-03-27', 2, 12, 82, 0, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (139, 'Ярошевич Елисей Артемович', 'м', 'rw78tWUu', 80617, '2000-03-10', 1, 25, 66, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (140, 'Кулумбаева Любава Капитоновна', 'ж', 'VXrs7OeM', 44528, '1999-11-01', 1, 20, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (141, 'Крылаева Регина Артемовна', 'ж', '88OPWEAV', 94142, '1962-06-29', 2, 23, 67, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (142, 'Топорков Игнат Леонидович', 'м', 'X$9rJpYU', 93039, '2000-02-28', 1, 10, 24, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (143, 'Серебрякова Ева Игнатьеивна', 'ж', 'TqINctiL', 24874, '1990-02-08', 4, 9, 47, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (144, 'Блатов Яков Венедиктович', 'м', 'C@g4Q$zI', 47049, '1999-10-15', 1, 14, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (145, 'Можаев Ерофей Гордеевич', 'м', 'ALZPcFoi', 88002, '1975-01-09', 2, 24, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (146, 'Сарана Герман Кириллович', 'м', 'cerbREq0', 22398, '1981-06-22', 2, 34, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (147, 'Попова Раиса Артемовна', 'ж', 'WK2$xVSI', 67673, '1978-03-19', 2, 29, 13, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (148, 'Каценеленбогена Людмила Клавдиевна', 'ж', 'mSb$F9kI', 13436, '1989-09-18', 2, 5, 84, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (149, 'Зиновьев Кирилл Прохорович', 'м', 'eJ4ALGWn', 87815, '1993-03-07', 2, 33, 2, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (150, 'Косарёв Степан Ипатиевич', 'м', 'L1hD7j3P', 26707, '1972-09-27', 2, 41, 87, 3, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (151, 'Холопова Евгения Герасимовна', 'ж', 'p1aFN$bo', 44354, '1981-03-16', 2, 9, 20, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (152, 'Егорова Зинаида Андриановна', 'ж', 'YR5nW0tO', 93564, '1999-06-28', 1, 2, 80, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (153, 'Ревягин Иларион Всеволодович', 'м', 'WG0p7$!s', 82656, '1967-05-10', 4, 57, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (154, 'Конак Григорий Измаилович', 'м', 'rusHg8Vd', 25304, '2000-06-26', 1, 29, 23, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (156, 'Кирилишен Капитон Гордеевич', 'м', 'x1Yq8jQb', 75500, '1969-04-20', 2, 9, 39, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (157, 'Яворова Мирослава Сергеевна', 'ж', '5!47BTtF', 90713, '1972-08-20', 2, 2, 7, 1, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (158, 'Лялюшкин Денис Фролович', 'м', 'ZqAMt3VW', 14110, '1990-07-06', 3, 25, 8, 0, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (159, 'Комиссаров Марк Валерьянович', 'м', '96BMbdGJ', 92734, '1965-08-31', 2, 31, 66, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (160, 'Камбарова Жанна Чеславовна', 'ж', '!Yi4BVPz', 42412, '1985-05-05', 2, 9, 7, 3, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (161, 'Сизая Марина Лукьяновна', 'ж', 'VSMCgjdE', 17423, '1983-09-19', 2, 44, 14, 3, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (162, 'Мишуринский Вячеслав Семенович', 'м', 'AHIi4Os1', 54151, '2000-05-05', 1, 27, 73, 2, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (163, 'Силаев Мстислав Михеевич', 'м', 'dAY$cRtj', 74924, '1968-04-24', 2, 13, 53, 1, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (164, 'Фарест Мечислав Савелиевич', 'м', 'zd4QWt1b', 80714, '1985-09-24', 2, 31, 61, 3, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (165, 'Кирилов Анатолий Даниилович', 'м', 'JFX2s4Bq', 20171, '1991-12-02', 2, 34, 42, 3, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (166, 'Лепёхина Лиана Савелиевна', 'ж', '1RxxSdS5', 28628, '1983-09-23', 2, 44, 43, 1, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (167, 'Блок Ульяна Сидоровна', 'ж', 'oOOhk9@U', 63849, '1999-04-04', 1, 28, 39, 1, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (168, 'Губин Артемий Егорович', 'м', 'l86wa!b2', 48541, '1992-08-26', 2, 12, 10, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (169, 'Чечуров Всеслав Игоревич', 'м', '3GrZCM4@', 58943, '2000-05-16', 1, 10, 34, 3, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (170, 'Гремпель Марианна Измаиловна', 'ж', 'PgnzqXc0', 71979, '1975-12-05', 2, 12, 61, 1, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (171, 'Зубкова Евдокия Вячеславовна', 'ж', 'kmQLz0l6', 19344, '1999-05-26', 1, 21, 16, 3, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (172, 'Миронов Феликс Онисимович', 'м', 'q#rVaWpN', 34563, '1978-02-22', 2, 39, 70, 3, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (173, 'Ульянин Ефим Титович', 'м', 'VieSD#YJ', 15170, '1964-12-04', 2, 2, 7, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (176, 'Сазонов Эрнест Геннадиевич', 'м', 'I!MHNRfg', 97902, '1982-06-06', 2, 33, 47, 2, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (177, 'Суходолина Лада Варфоломеевна', 'ж', 'lhdmYpTy', 28565, '2000-01-21', 1, 32, 13, 0, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (178, 'Ямщикова Лиана Александровна', 'ж', '8FMEjC$d', 67846, '1986-08-18', 2, 4, 58, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (179, 'Шишкин Вениамин Давидович', 'м', 'd#pWA$Nr', 26258, '1963-08-21', 4, 2, 37, 0, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (180, 'Лясина Валерия Валентиновна', 'ж', 'WOZ#Q7fN', 87326, '1992-01-03', 2, 16, 47, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (181, 'Муратова Ангелина Валентиновна', 'ж', 'Nl$6BhSw', 16662, '2000-08-31', 1, 44, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (182, 'Майсака Эльвира Дмитриевна', 'ж', 'YUCvvZqx', 16755, '1964-05-11', 2, 9, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (183, 'Немцов Виталий Наумович', 'м', 'mDhLasuB', 30345, '1999-07-23', 1, 30, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (184, 'Шкуратов Рубен Севастьянович', 'м', 'sA3OU2z8', 27044, '1999-04-29', 1, 27, 64, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (185, 'Янишпольский Арсений Якубович', 'м', 'LZp!VpfJ', 78995, '1999-07-15', 1, 9, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (186, 'Маслак Игнатий Прохорович', 'м', 'lRg3WTdh', 72707, '1999-08-01', 1, 14, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (187, 'Каткова Инна Александровна', 'ж', 'TwwqGZKy', 95914, '1974-11-15', 3, 29, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (189, 'Халтурин Аскольд Кондратиевич', 'м', 'ggxAOJOK', 62026, '1999-01-07', 1, 27, 86, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (190, 'Успенский Сидор Панкратиевич', 'м', '4euoexFJ', 21263, '1977-04-25', 2, 16, 56, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (192, 'Смышляев Гавриил Несторович', 'м', '4nowzct5', 91818, '1981-11-08', 2, 23, 71, 2, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (193, 'Евлентьев Илья Михеевич', 'м', 'sVRVXVh#', 18485, '2000-01-23', 1, 25, 12, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (195, 'Алифанова Рада Потаповна', 'ж', 'rDPmA$#n', 91903, '1993-06-06', 2, 14, 48, 0, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (197, 'Пустов Илья Давыдович', 'м', 'sAjOQEtF', 93545, '1976-02-17', 2, 57, 62, 2, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (198, 'Кравчикова Эвелина Тимофеевна', 'ж', 'D!m$lJz2', 51069, '1988-04-27', 2, 13, 40, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (200, 'Ягуткина Дарья Никифоровна', 'ж', 'UBHjHiPn', 34356, '1993-08-17', 2, 18, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (201, 'Черенчиков Семен Иосифович', 'м', '2xTX9QPI', 67579, '1973-02-04', 3, 28, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (202, 'Лимаров Аким Филиппович', 'м', '3F2Ux9bU', 66840, '2000-09-19', 1, 32, 52, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (203, 'Аристархов Зиновий Никифорович', 'м', 'QAd3G9Sh', 61709, '1970-06-01', 4, 6, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (204, 'Евтушенкова Инга Арсентиевна', 'ж', 'cldZ!pOQ', 30788, '1985-02-16', 2, 26, 17, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (205, 'Кубланова Алла Олеговна', 'ж', 'CttHF44i', 55266, '1994-01-24', 2, 37, 71, 0, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (206, 'Каверин Леондий Юриевич', 'м', '291ZhLpu', 83390, '2000-06-15', 1, 26, 81, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (208, 'Глоба Агап Самсонович', 'м', 'UR6#t6cs', 61729, '2000-10-27', 1, 30, 13, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (209, 'Селидов Эмиль Кириллович', 'м', 'JH2D2QMw', 13814, '2000-03-10', 1, 23, 71, 0, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (210, 'Филин Матвей Елизарович', 'м', 'YeF7hZ6@', 47323, '1999-10-16', 1, 39, 29, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (211, 'Паринов Саввелий Ираклиевич', 'м', 'MSE2y$3B', 53910, '2000-03-16', 1, 23, 45, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (212, 'Клиева Любовь Рюриковна', 'ж', 'EknofNaB', 26848, '2000-11-15', 1, 57, 78, 3, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (213, 'Николаенко Святослав Родионович', 'м', 'DFYOWPmo', 97467, '1973-01-19', 2, 27, 88, 0, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (217, 'Платущихин Гавриил Кондратович', 'м', 'Y2tIXLiJ', 84191, '1974-06-30', 2, 12, 35, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (218, 'Ялчевский Никанор Тихонович', 'м', 'oO71A8Ws', 36073, '1964-07-31', 4, 13, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (219, 'Марков Евсей Мирославович', 'м', 'd0RxEPgM', 86657, '1973-09-14', 2, 6, 4, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (220, 'Буряков Варфоломей Архипович', 'м', 'gySshj9z', 50949, '1999-06-01', 1, 31, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (221, 'Гаврилов Ростислав Натанович', 'м', '3sXdrbk7', 70859, '1969-10-25', 2, 46, 27, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (222, 'Чекина Ефросинья Андриановна', 'ж', 'r92zE6@A', 85615, '1993-08-11', 2, 21, 70, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (223, 'Крупин Радислав Игнатиевич', 'м', 'jYoG1PBt', 62683, '1999-02-07', 1, 31, 39, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (225, 'Комарова Валерия Евсеевна', 'ж', 'txDO6c6T', 41910, '1978-09-07', 2, 39, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (226, 'Пересторонина Марта Терентьевна', 'ж', 'DYE#RlIi', 61325, '1962-07-22', 4, 33, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (227, 'Галицков Иосиф Онисимович', 'м', 'Au6qYnbc', 97393, '1984-06-29', 2, 57, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (228, 'Шаров Феоктист Вячеславович', 'м', 'nLp1IYrn', 83773, '1989-03-02', 2, 25, 66, 0, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (229, 'Наумова Ариадна Руслановна', 'ж', '9pUXmdbE', 38114, '1976-07-20', 2, 30, 8, 1, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (230, 'Хохлова Варвара Федоровна', 'ж', 'UPoeo2$N', 34784, '2000-08-03', 1, 28, 19, 0, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (231, 'Юркова Юнона Лаврентиевна', 'ж', 'j6wqcPqW', 38422, '1979-01-25', 2, 5, 74, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (232, 'Куксов Герасим Казимирович', 'м', 'Qd0yalbJ', 35400, '2000-05-22', 1, 37, 61, 0, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (233, 'Лоскутов Ефрем Евгениевич', 'м', '3foqv16z', 62028, '1978-11-17', 2, 1, 8, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (234, 'Агабабян Матвей Изяславович', 'м', 'ZNiEu5vT', 35856, '1999-10-09', 1, 46, 50, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (235, 'Шишкарёв Бронислав Тимурович', 'м', 'wFOzanIc', 28019, '1974-02-10', 2, 11, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (236, 'Бабыкина Кира Мартыновна', 'ж', 'sQEqiC95', 39085, '2000-04-28', 1, 28, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (237, 'Созонова Алиса Игнатьеивна', 'ж', '3be1cqaT', 33064, '1980-12-02', 2, 6, 32, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (238, 'Морозова Агафья Вацлавовна', 'ж', '#vPELqHj', 49605, '1977-01-13', 2, 33, 25, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (239, 'Илюхин Афанасий Несторович', 'м', 'fbAlSPP!', 50271, '1974-01-17', 2, 30, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (240, 'Крак Марианна Яновна', 'ж', 'tk7RRx61', 94335, '1966-11-15', 3, 33, 88, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (241, 'Новохацкий Всеслав Анатолиевич', 'м', '#VtXdklQ', 23292, '2000-11-04', 1, 14, 48, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (242, 'Левицкий Рюрик Филиппович', 'м', '@aXEEk5C', 97489, '1966-07-25', 2, 26, 36, 1, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (244, 'Кимаска Бронислава Захаровна', 'ж', '44MDYIzm', 99298, '1988-12-27', 2, 25, 5, 1, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (247, 'Ясинов Григорий Изяславович', 'м', '#kZIWRI3', 90150, '2000-05-04', 1, 9, 77, 2, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (248, 'Ежов Харитон Онуфриевич', 'м', 'HMI2zpdV', 44122, '1975-08-20', 2, 11, 12, 2, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (249, 'Механтьев Радислав Сидорович', 'м', '370ZM@c$', 58297, '2000-11-14', 1, 16, 32, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (250, 'Ишеев Архип Ипатиевич', 'м', 'gkdrxZ0P', 48870, '1991-08-04', 2, 41, 74, 2, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (251, 'Дудинова Агафья Венедиктовна', 'ж', 'JGMAc4up', 70066, '2000-02-18', 1, 16, 68, 2, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (252, 'Оськина Ариадна Арсентиевна', 'ж', '4WYbXmdp', 10883, '1999-03-28', 1, 46, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (253, 'Колиух Максим Тимурович', 'м', 'G5dtjMtZ', 73552, '1975-03-30', 4, 36, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (254, 'Островерх Мирон Эдуардович', 'м', 'P55DxjHd', 62398, '1971-10-09', 2, 10, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (255, 'Витвинин Вячеслав Давидович', 'м', 'kmUK0oh9', 39552, '1960-07-20', 2, 39, 7, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (256, 'Арчибасов Федор Давидович', 'м', '3NPMlas7', 64889, '1989-09-14', 2, 19, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (257, 'Чекудаев Сократ Измаилович', 'м', 'Ekdra1bN', 25002, '1992-08-10', 2, 44, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (258, 'Староверова Ева Юрьевна', 'ж', 'm@Obgxzt', 98661, '2000-04-22', 1, 30, 60, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (259, 'Андрющенко Изольда Иларионовна', 'ж', 'YZT3Alb6', 91220, '1989-06-21', 2, 9, 88, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (260, 'Михалёв Мартын Евграфович', 'м', 'VRkEFq62', 44267, '1962-03-19', 4, 27, 17, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (261, 'Набадчиков Глеб Тимурович', 'м', 'HKZdXBrN', 64812, '1970-10-08', 2, 7, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (262, 'Александрин Игорь Адрианович', 'м', 'e1Q68u6$', 75593, '1974-09-07', 2, 8, 35, 1, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (263, 'Ларионова Клара Андриановна', 'ж', 'XdqGV7XF', 65265, '2000-12-29', 1, 23, 34, 1, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (264, 'Липина Римма Максимовна', 'ж', 'k@cYHVFF', 45258, '1984-04-28', 2, 37, 44, 1, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (265, 'Хрущёва Ирина Сократовна', 'ж', 'XTIMtSq#', 53612, '1989-06-28', 2, 34, 13, 2, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (266, 'Турбин Тимофей Федорович', 'м', 'h7P1Jle0', 98492, '2000-01-18', 1, 10, 68, 0, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (267, 'Сигаев Аркадий Даниилович', 'м', 'IoNtzj6Y', 39177, '1992-01-15', 2, 22, 34, 3, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (268, 'Коденко Леонид Феликсович', 'м', 'U3HajSqC', 86421, '1971-02-02', 2, 4, 8, 0, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (269, 'Эзерина Инна Виссарионовна', 'ж', 'KeC9SRdU', 79079, '1967-06-23', 2, 34, 89, 1, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (271, 'Деменок Кондратий Зиновиевич', 'м', 'r#wi#4um', 24211, '1971-04-12', 4, 14, 40, 2, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (272, 'Ярославцев Федосий Ермолаевич', 'м', 'resWp9Iz', 42645, '1992-06-23', 2, 31, 38, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (273, 'Кораблин Ростислав Адамович', 'м', 'iy$4DNN@', 62803, '1999-02-09', 1, 25, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (274, 'Коржев Андрей Ерофеевич', 'м', 'RgopBl@Q', 91653, '1999-11-06', 1, 2, 29, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (275, 'Устюжанина Алиса Пахомовна', 'ж', 'teS!lxpo', 54542, '1977-06-20', 2, 34, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (276, 'Казючиц Эмилия Антоновна', 'ж', 'DjiJdOji', 25212, '1986-04-22', 2, 29, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (277, 'Сагунова Татьяна Гаврииловна', 'ж', '4zZf3tJ7', 75199, '1986-11-21', 2, 13, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (278, 'Фененко Емельян Филимонович', 'м', 'l9XPXVe5', 25431, '1960-02-29', 2, 1, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (279, 'Мячиков Владислав Владиславович', 'м', 'Ao$wvopa', 70936, '1967-04-27', 2, 8, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (281, 'Тетерев Вячеслав Куприянович', 'м', 'n7u6SIND', 95623, '1999-02-13', 1, 8, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (282, 'Соболев Олег Севастьянович', 'м', 'WkPSbZUi', 25700, '1984-12-26', 4, 28, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (283, 'Штыков Лаврентий Григориевич', 'м', 'zJZz#v7W', 98840, '1982-07-11', 2, 30, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (284, 'Теплов Аристарх Левович', 'м', 'lQmK!8$6', 68887, '2000-11-10', 1, 13, 40, 1, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (285, 'Калюта Эдуард Александрович', 'м', '9TNz5m9B', 21502, '1999-06-14', 1, 21, 74, 3, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (286, 'Зырянова Берта Серафимовна', 'ж', 'd5RpBZ$u', 90895, '1973-04-18', 2, 36, 1, 3, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (287, 'Чигракова Мария Леонидовна', 'ж', 'L$whUHqj', 87901, '1962-07-26', 2, 28, 32, 2, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (288, 'Белочкина Алина Бориславовна', 'ж', 'UsUJykeL', 77919, '1999-07-15', 1, 36, 60, 0, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (289, 'Сукачёва Изабелла Кузьмевна', 'ж', 'yy3iyth4', 48837, '1987-08-10', 3, 11, 40, 2, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (290, 'Фадеев Мстислав Гаврилевич', 'м', 'Jvj2swYo', 40833, '1977-04-04', 2, 28, 39, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (291, 'Петрунин Нестор Денисович', 'м', 'ZuXTkX1n', 21100, '2000-08-07', 1, 36, 66, 1, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (292, 'Грабарь Юлия Варфоломеевна', 'ж', '6Qa9#QOS', 34810, '2000-06-26', 1, 11, 18, 3, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (293, 'Илькун Юлиан Прохорович', 'м', 'EXD$iMfN', 22712, '1980-06-18', 2, 46, 47, 0, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (294, 'Балашов Станислав Модестович', 'м', 'hfMMUZcv', 70542, '1985-11-20', 2, 4, 55, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (295, 'Кузькин Модест Гордеевич', 'м', 'ouI6UTib', 62690, '1960-02-17', 2, 4, 59, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (296, 'Мажов Ипполит Глебович', 'м', '87UjP46m', 13781, '1977-07-30', 2, 34, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (297, 'Галдин Георгий Никанорович', 'м', 'SL#Qwaxw', 68993, '1963-05-29', 2, 34, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (298, 'Чернобровин Ярослав Чеславович', 'м', 'bcrVk9TB', 52499, '2000-06-21', 1, 32, 25, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (299, 'Воробьёва Анна Клавдиевна', 'ж', 'To@hu$Ww', 34412, '1970-12-22', 2, 46, 85, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (300, 'Минаев Рюрик Макарович', 'м', 'pk@GF!FK', 65052, '1968-10-12', 3, 39, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (301, 'Иванцова Владлена Николаевна', 'ж', 'NQOB$JOx', 36474, '1999-02-01', 1, 26, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (302, 'Мадулина Ярослава Давидовна', 'ж', '1pFGW0sM', 53948, '2000-05-04', 1, 33, 55, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (304, 'Рожков Валерьян Венедиктович', 'м', 'qDajRTME', 17789, '1967-09-17', 2, 6, 61, 3, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (305, 'Кадцын Осип Адамович', 'м', 'YTKgnkNd', 53116, '1969-04-21', 2, 4, 84, 0, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (306, 'Завражин Эммануил Евграфович', 'м', 'E9@0cbM1', 55357, '1999-09-16', 1, 57, 64, 1, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (307, 'Большов Онисим Никонович', 'м', 'vORrkl33', 92929, '2000-05-30', 1, 4, 25, 1, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (308, 'Низовцова Екатерина Бориславовна', 'ж', 'qQ8O0s2e', 41394, '1976-10-25', 2, 39, 29, 0, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (309, 'Фарышева Лилия Никитевна', 'ж', '!rX3dhxs', 82652, '1960-05-31', 2, 5, 53, 0, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (310, 'Каменчук Таисия Моисеевна', 'ж', '5YaL5vQ$', 74937, '1963-07-19', 4, 34, 32, 2, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (312, 'Слепцов Назар Эрнстович', 'м', '#Wjd18TZ', 66204, '1978-07-09', 2, 23, 45, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (314, 'Умская Роза Богдановна', 'ж', 'i6XqZCh6', 91937, '1999-03-26', 1, 10, 31, 0, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (315, 'Щетинина Дарья Савелиевна', 'ж', '$FpHuVS9', 23629, '1970-08-01', 2, 8, 42, 3, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (316, 'Кузькин Владлен Юриевич', 'м', 'QbVgKft#', 79788, '1980-05-09', 4, 44, 44, 1, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (317, 'Константинов Борис Самсонович', 'м', 'y0TzQV#t', 43540, '1979-12-09', 2, 21, 9, 3, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (318, 'Жирова Лариса Наумовна', 'ж', 'ZylZrv0#', 56975, '2000-12-21', 1, 36, 18, 0, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (319, 'Форофонтова Нина Ярославовна', 'ж', 'z3FF4CqV', 45810, '1970-03-06', 2, 10, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (320, 'Кольцов Савелий Трофимович', 'м', 'tgf0ptJG', 58106, '1979-08-08', 2, 34, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (322, 'Верица Глеб Валерьянович', 'м', 'k$$2RYqq', 87531, '2000-05-01', 1, 36, 15, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (323, 'Витинский Иларион Тарасович', 'м', 'f6!!uhsu', 15456, '1980-09-07', 2, 39, 60, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (324, 'Проничев Евдоким Савелиевич', 'м', 'kkdM9Bs0', 26818, '1971-09-17', 2, 33, 84, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (325, 'Цицианов Авдей Онуфриевич', 'м', 'tdVQiZJI', 95676, '1999-07-02', 1, 46, 85, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (326, 'Куратник Карп Левович', 'м', 'DT!ek59I', 93829, '1977-07-05', 2, 16, 83, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (327, 'Еськов Вячеслав Самуилович', 'м', 'wFbf$LbB', 80594, '1975-08-05', 2, 23, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (328, 'Северов Демьян Викентиевич', 'м', 'l9dXMhPb', 61371, '2000-11-04', 1, 16, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (329, 'Ясюлевич Маргарита Потаповна', 'ж', 'vCmdhsv$', 48209, '1981-04-14', 2, 18, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (330, 'Рыкова Наталья Зиновьевна', 'ж', 'pHfVPRr3', 66175, '1973-04-30', 2, 44, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (331, 'Гроссман Прохор Ипатиевич', 'м', 'NH9ZLNWt', 66679, '1979-02-23', 2, 30, 29, 2, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (332, 'Пайкова Пелагея Никитевна', 'ж', 'JIFdlgu$', 77219, '1960-07-11', 2, 23, 7, 0, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (333, 'Крымова Стела Юрьевна', 'ж', '7w7AO5Md', 25289, '1999-10-22', 1, 41, 37, 1, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (334, 'Перфильев Пахом Капитонович', 'м', 'IvG#d$6q', 47188, '1991-12-11', 2, 7, 27, 2, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (335, 'Яночкин Фома Елисеевич', 'м', '2wdhNf#I', 25766, '1973-09-12', 4, 31, 62, 0, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (336, 'Кярбера Зинаида Мстиславовна', 'ж', 'CYpi4PI6', 94079, '2000-04-17', 1, 34, 89, 0, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (338, 'Бушуев Емельян Сигизмундович', 'м', '7W3cnVxj', 75288, '1988-01-07', 2, 14, 9, 1, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (339, 'Хромов Аскольд Кондратович', 'м', 'd!!xJ5Di', 18210, '1991-06-23', 2, 21, 51, 0, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (340, 'Панарин Николай Капитонович', 'м', 'lV!MRw8E', 50514, '1981-10-19', 2, 35, 4, 3, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (341, 'Яцунов Даниил Самуилович', 'м', 'SkNhCZiS', 88143, '1960-08-08', 2, 30, 28, 1, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (344, 'Михеева Рада Эдуардовна', 'ж', 'sEiGKXP@', 85056, '1965-02-11', 2, 41, 4, 2, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (346, 'Сукин Прохор Геннадиевич', 'м', 'cTuLhBoO', 26634, '1999-08-18', 1, 33, 66, 0, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (347, 'Мамкина Нона Владиславовна', 'ж', '0O$0M!jK', 82079, '1999-09-30', 1, 29, 73, 1, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (348, 'Котельникова Светлана Герасимовна', 'ж', 'pK9eX@sb', 48542, '1973-04-30', 2, 19, 14, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (349, 'Федосеева Антонина Эммануиловна', 'ж', 'WCFpN59J', 77623, '1962-12-01', 2, 8, 37, 2, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (350, 'Швечиков Адам Якубович', 'м', 'edbc8ljy', 15549, '1990-11-13', 2, 16, 32, 1, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (351, 'Бережной Емельян Измаилович', 'м', 'YblfI0DE', 61945, '1999-08-08', 1, 9, 88, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (352, 'Карманов Адриан Яковович', 'м', 'iqVq1YOu', 98987, '1974-11-30', 2, 10, 71, 2, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (353, 'Педича Алина Харитоновна', 'ж', 'gavdi3Ku', 20515, '1999-11-27', 1, 57, 70, 3, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (355, 'Чигиркин Соломон Леонидович', 'м', '8#MB4GKs', 12029, '1989-12-31', 2, 18, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (356, 'Собчак Доминика Мироновна', 'ж', '#!QfEEeQ', 41395, '1977-10-25', 2, 2, 50, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (357, 'Янпольская Юлия Аристарховна', 'ж', 'EwPyyxzb', 45529, '1962-01-08', 2, 18, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (358, 'Сахаров Поликарп Вячеславович', 'м', '2E6!Y4@#', 14892, '1994-07-15', 2, 27, 64, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (359, 'Чазов Тарас Сократович', 'м', 'kkh5N7w4', 89631, '1968-02-11', 3, 36, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (360, 'Икашева Ефросиния Елисеевна', 'ж', 'iNLgrQrD', 10449, '2000-12-12', 1, 35, 63, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (361, 'Бендлина Галина Федоровна', 'ж', '6V#IvqN0', 13900, '1972-09-13', 2, 16, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (362, 'Бабченко Милена Емельяновна', 'ж', 'uHbv#ORn', 11078, '1989-02-19', 2, 5, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (363, 'Завражин Викентий Касьянович', 'м', 'pcPsSgsO', 32641, '1987-02-10', 2, 46, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (364, 'Домышева Диана Семеновна', 'ж', 'RJ#UKzAt', 33389, '2000-05-28', 1, 5, 84, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (365, 'Янкилевская Доминика Станиславовна', 'ж', 'pV!ULrPU', 93956, '1999-06-25', 1, 4, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (366, 'Дагин Сократ Тихонович', 'м', 'FXw8V!Xg', 63236, '1993-07-26', 2, 26, 35, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (367, 'Январев Феофан Вадимович', 'м', 'Ym2zhALD', 72335, '1993-10-25', 2, 8, 38, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (368, 'Мурогов Александр Дмитриевич', 'м', 'bn0oHQkg', 87975, '1963-03-14', 2, 41, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (369, 'Блок Артём Эрнстович', 'м', 'JpgolmTC', 12597, '1994-06-29', 2, 24, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (370, 'Ядрова Рената Якововна', 'ж', '$c97ztRi', 80227, '2000-09-12', 1, 36, 81, 1, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (371, 'Дудинов Виктор Семенович', 'м', 'q4atEUbn', 45372, '1970-11-10', 2, 19, 78, 0, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (372, 'Сюкосев Мирослав Иннокентиевич', 'м', '#tiuFsu7', 48206, '1969-06-04', 2, 5, 50, 2, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (374, 'Левченко Изабелла Самсоновна', 'ж', 'oc23yPvY', 78222, '1986-08-15', 2, 11, 6, 0, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (375, 'Посохова Валентина Кондратьевна', 'ж', '929QrpPr', 46448, '1962-01-27', 4, 4, 27, 0, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (376, 'Рыченкова Анфиса Евремовна', 'ж', 'IahBcrE2', 73026, '1987-09-20', 2, 10, 80, 0, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (378, 'Кожевина Христина Данииловна', 'ж', 'iw5oJjfG', 20231, '1971-09-08', 2, 7, 73, 2, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (379, 'Гурин Станислав Яковович', 'м', 'uGClJ5ES', 79780, '2000-08-22', 1, 41, 12, 3, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (380, 'Коченков Константин Эмилевич', 'м', 'ZWbcNF$a', 80945, '1999-05-16', 1, 14, 16, 0, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (381, 'Полков Иван Архипович', 'м', 'H#BoDv09', 47765, '1965-09-03', 2, 28, 19, 1, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (382, 'Кияк Игнатий Несторович', 'м', 'ONQ3hRkK', 14515, '2000-09-19', 1, 8, 38, 2, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (383, 'Фунтусова Розалия Мефодиевна', 'ж', 'OJPAp9nX', 56200, '1998-12-15', 1, 12, 35, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (384, 'Туржанский Фадей Мирославович', 'м', 'aL!kbAJ0', 68165, '1999-02-02', 1, 57, 58, 3, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (385, 'Якупова Варвара Виссарионовна', 'ж', 'rDzlfC$7', 14184, '2000-02-21', 1, 27, 44, 3, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (387, 'Михайлова Мария Ярославовна', 'ж', 'QQVBnOcX', 17227, '1999-11-23', 1, 26, 86, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (388, 'Терехов Кузьма Мартьянович', 'м', 'qdX90Joo', 39654, '1967-02-15', 2, 27, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (389, 'Бутиков Иларион Миронович', 'м', 'hNouII7K', 69926, '2000-06-20', 1, 19, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (390, 'Сахарова Тамара Остаповна', 'ж', 'L0S5rXRk', 21201, '1981-06-15', 2, 5, 33, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (392, 'Чуканова Инесса Владимировна', 'ж', 'btfu6lwU', 42316, '2000-07-12', 1, 23, 60, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (393, 'Порсев Данила Валериевич', 'м', 'TgW8iN8q', 61387, '2000-04-15', 1, 24, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (394, 'Воронов Мечислав Дмитриевич', 'м', 'MpiZ85Ov', 54467, '1987-03-08', 2, 5, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (395, 'Балдагуева Ираида Геннадиевна', 'ж', '9E!X#Kgh', 77312, '1985-03-15', 2, 5, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (396, 'Бобрик Юлиан Андреевич', 'м', 'zaCCb1Ng', 74429, '1989-12-28', 2, 30, 17, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (397, 'Яровый Панкратий Изяславович', 'м', 'KDBsz4fY', 85999, '1974-11-06', 2, 23, 22, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (398, 'Жербина Янина Ираклиевна', 'ж', 'VDIkOvkE', 77821, '1987-01-14', 2, 9, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (399, 'Шерешевская Кристина Денисовна', 'ж', '0LM6qims', 61829, '1987-12-30', 2, 33, 55, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (400, 'Суриков Федор Федосиевич', 'м', 'ZA$JSZ6t', 72633, '1999-04-26', 1, 36, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (401, 'Ярилова Эмилия Антиповна', 'ж', 'vTWFu$rZ', 82126, '1999-08-23', 1, 22, 71, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (402, 'Пахомов Ерофей Ермолаевич', 'м', 'bYdpmudS', 77616, '1999-11-10', 1, 14, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (403, 'Иванникова Розалия Платоновна', 'ж', 'lru@IhlV', 25941, '2000-10-08', 1, 26, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (404, 'Губанов Леондий Моисеевич', 'м', 'lFt9yZD7', 38921, '1975-01-26', 2, 20, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (405, 'Калитин Елизар Андреевич', 'м', 'COLPmE83', 26872, '1982-06-12', 2, 27, 10, 2, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (406, 'Викариев Чеслав Богданович', 'м', 'hjPHfc#Y', 53575, '1999-03-26', 1, 7, 43, 2, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (407, 'Кочнева Эльвира Петровна', 'ж', 'ahvyq$k1', 24594, '1995-01-09', 2, 32, 52, 2, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (408, 'Чернобровина Альбина Несторовна', 'ж', 'Y0s9#CR1', 27995, '1999-11-15', 1, 12, 38, 0, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (409, 'Холодов Филипп Брониславович', 'м', 'YUqQNGdJ', 90652, '1980-08-29', 2, 39, 32, 3, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (410, 'Янушкене Виктория Евремовна', 'ж', 'mpkZlrex', 94655, '1999-10-24', 1, 35, 27, 3, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (411, 'Дуркин Порфирий Демьянович', 'м', 'htXUvAQB', 86931, '1984-03-12', 2, 4, 8, 2, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (412, 'Дульцев Ипполит Ростиславович', 'м', 'qh60Rtj4', 95512, '1963-08-17', 2, 12, 38, 3, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (413, 'Коченков Дементий Измаилович', 'м', 'xdQnzd0y', 40925, '1999-08-28', 1, 7, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (414, 'Явчуновский Семён Макарович', 'м', 'one3SJYa', 84559, '1999-12-07', 1, 11, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (415, 'Васильев Вадим Савелиевич', 'м', 'KbFNbXDi', 19760, '1999-05-12', 1, 46, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (416, 'Ефимов Василий Иванович', 'м', 'xHzhY$KO', 75039, '1963-01-14', 2, 13, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (417, 'Замятин Ираклий Куприянович', 'м', 'Nj5P87QI', 95170, '1963-02-15', 2, 39, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (418, 'Журавлёв Игнатий Самуилович', 'м', 'IOSpfhwq', 40158, '2000-09-13', 1, 21, 70, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (420, 'Янушевская Марина Леонидовна', 'ж', 'DwJU@4FK', 99791, '1985-08-24', 2, 34, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (422, 'Куусинен Харитон Адрианович', 'м', 'QH@r444e', 26271, '1994-06-05', 2, 20, 89, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (423, 'Шуйский Павел Захарович', 'м', 'gNbDzEa2', 43020, '2000-09-27', 1, 6, 64, 2, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (424, 'Койтасбаев Владилен Мартьянович', 'м', 'C2RDgJ2K', 11793, '2000-03-18', 1, 57, 70, 2, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (425, 'Рыжков Артемий Алексеевич', 'м', 'GWsp7@CG', 98314, '1999-01-18', 1, 12, 44, 1, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (427, 'Салтанов Порфирий Маркович', 'м', 'WMDTRfQy', 68141, '1993-11-26', 2, 57, 64, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (428, 'Яшагин Артём Евгениевич', 'м', '0s5XkQZE', 20777, '1968-07-31', 2, 26, 4, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (429, 'Каипов Семен Севастьянович', 'м', '@nd0Hj5m', 91624, '2000-03-26', 1, 22, 21, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (430, 'Ивашечкин Никифор Мирославович', 'м', 'uNNeQR1#', 54355, '1964-06-20', 2, 10, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (432, 'Сухомлина Ариадна Ростиславовна', 'ж', 'cvOhgaAu', 37919, '1994-08-18', 2, 6, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (433, 'Полторак Анатолий Прокофиевич', 'м', 'S3#$veIk', 68990, '1965-07-02', 2, 28, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (434, 'Сёмин Андрей Андриянович', 'м', '@pcsTAug', 83093, '1998-12-26', 1, 24, 38, 3, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (435, 'Жуков Георгий Давыдович', 'м', 'S4GiadUX', 41725, '1978-10-01', 2, 16, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (436, 'Рябцев Гаврила Ипполитович', 'м', 'xJn5g48O', 95047, '1999-08-03', 1, 5, 74, 1, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (437, 'Барболина Розалия Гавриловна', 'ж', 'hKpTHbLG', 76434, '1980-06-18', 2, 7, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (438, 'Красильников Нестор Игоревич', 'м', 'HQGTBS2G', 14228, '1999-08-29', 1, 2, 49, 2, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (439, 'Банин Макар Куприянович', 'м', 'kGj1NJMv', 77392, '1979-05-21', 2, 26, 86, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (440, 'Паршиков Капитон Елисеевич', 'м', 'Na#6VBLy', 11007, '1986-02-13', 2, 20, 24, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (442, 'Осокин Всеслав Евграфович', 'м', 'cDpzx59t', 79501, '1999-06-10', 1, 10, 46, 0, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (443, 'Полтанов Тимофей Зиновиевич', 'м', 'Ej3ydhMc', 44421, '1970-01-17', 2, 25, 12, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (444, 'Беляков Нестор Аникитевич', 'м', 'bN1LwKzR', 53039, '1999-06-22', 1, 39, 60, 0, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (445, 'Жиленкова Ярослава Игнатьеивна', 'ж', 'wjMY3nuF', 64311, '1986-08-25', 2, 30, 8, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (446, 'Анюков Эммануил Иннокентиевич', 'м', '$HbUaYJq', 56463, '1999-04-07', 1, 37, 63, 1, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (447, 'Цекало Пахом Елизарович', 'м', 'ndp!ek24', 41386, '1964-01-09', 2, 36, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (448, 'Яловегина Злата Павловна', 'ж', 'XqhpzQlA', 16556, '1976-01-22', 2, 25, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (449, 'Ярусова Фаина Ипполитовна', 'ж', 'kja4rURq', 82925, '1973-12-29', 2, 44, 77, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (450, 'Сюкосев Яков Евграфович', 'м', 'ki@lViFe', 40334, '1999-12-29', 1, 4, 23, 0, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (451, 'Артемьев Мстислав Ипполитович', 'м', 'a9oDfMaO', 30509, '1986-04-26', 2, 18, 71, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (453, 'Кривчиков Ираклий Яковович', 'м', 'UgCYw8KE', 85246, '1973-05-05', 2, 1, 53, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (454, 'Колобков Казимир Прохорович', 'м', '$4gne7uO', 56803, '1999-10-16', 1, 19, 87, 1, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (456, 'Бесфамильнова Инга Остаповна', 'ж', 'XUqoK!M3', 85856, '2000-06-23', 1, 39, 32, 1, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (458, 'Мухов Владислав Евстафиевич', 'м', 'TvsGQHzA', 68739, '1978-07-20', 2, 36, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (459, 'Ковтунов Эрнест Онисимович', 'м', 'yAaF77wJ', 47093, '1981-03-20', 2, 36, 24, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (461, 'Хрустицкий Якуб Андронович', 'м', 'a5Gk8giU', 31699, '1962-03-22', 3, 44, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (462, 'Явлюхина Рада Эдуардовна', 'ж', '6MX!fxjK', 18701, '1999-01-15', 1, 22, 17, 2, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (463, 'Рыжкова Елена Аскольдовна', 'ж', 'NzUeHcnH', 47371, '1983-05-11', 2, 11, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (464, 'Яценко Аскольд Богданович', 'м', '!wu@Kj16', 97668, '1994-12-21', 2, 10, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (465, 'Левкович Венедикт Ульянович', 'м', 'Kzy!kEHP', 33872, '1970-11-04', 2, 10, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (466, 'Анисимов Евдоким Тихонович', 'м', 'rPlCIme3', 10926, '2000-12-18', 1, 44, 73, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (467, 'Котов Фока Остапович', 'м', '1bKoaQvQ', 80621, '1988-12-11', 2, 35, 84, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (468, 'Яцков Филимон Артемиевич', 'м', 'c#6iM!Ix', 27767, '1999-05-27', 1, 33, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (469, 'Рязанцев Андрей Глебович', 'м', '5sICbNgN', 83397, '2000-03-03', 1, 25, 59, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (470, 'Букова Раиса Владленовна', 'ж', 'KOMv8utI', 22884, '1965-04-04', 2, 1, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (471, 'Яковиченко Агап Юриевич', 'м', '31NRBnaZ', 16863, '2000-08-01', 1, 2, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (473, 'Цуцков Прокофий Маркович', 'м', 'z2ujMhYv', 19493, '1960-03-13', 2, 22, 88, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (474, 'Колпачёв Трофим Савелиевич', 'м', 'QT#YV0U0', 37432, '1968-06-19', 2, 28, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (476, 'Майструк Станислав Богданович', 'м', 'rKw#ZUs!', 16572, '1999-11-26', 1, 24, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (477, 'Пугин Ефрем Денисович', 'м', 'oo7YTlRN', 70924, '1999-06-24', 1, 21, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (478, 'Пименов Рубен Сократович', 'м', 'BdB5Td6z', 89347, '1991-09-09', 2, 19, 87, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (479, 'Сиян Эммануил Александрович', 'м', 'OGGiJgwB', 93391, '1999-08-04', 1, 35, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (480, 'Енютин Гаврила Адрианович', 'м', '7pXH4zao', 52573, '1966-02-20', 2, 21, 60, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (482, 'Малинова Людмила Моисеевна', 'ж', 'ftQPowkI', 51597, '1980-03-07', 2, 2, 29, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (483, 'Яфарова Римма Прохоровна', 'ж', '3yWwvIot', 82799, '1999-03-06', 1, 1, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (484, 'Кандаков Данил Самсонович', 'м', 'lY4YcFQu', 36334, '2000-10-24', 1, 31, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (485, 'Коврова Эмма Федотовна', 'ж', 'WMsIBTXE', 81388, '1976-10-05', 2, 5, 59, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (486, 'Дуркина Галина Агаповна', 'ж', 'c6mODxg2', 89606, '1978-10-23', 3, 14, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (487, 'Явленский Порфирий Елизарович', 'м', '9f7IPWjP', 16887, '2000-05-26', 1, 20, 66, 2, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (488, 'Грибова Изольда Данилаивна', 'ж', 'XGYujE$o', 86795, '1960-09-23', 2, 37, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (489, 'Гремпель Аскольд Святославович', 'м', 'cg6PERcA', 39379, '1978-10-18', 2, 36, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (490, 'Островский Поликарп Климентович', 'м', 'QpWuUoWQ', 72100, '1963-08-24', 2, 2, 81, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (493, 'Сарнычев Даниил Феликсович', 'м', 'P!4cMkGv', 63976, '1966-07-21', 2, 19, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (494, 'Моренов Гавриил Никитевич', 'м', 'cVQ6N2yA', 53181, '1981-11-06', 2, 24, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (495, 'Форопонова Янина Артеименовна', 'ж', 'B0EReNyW', 35872, '1984-05-10', 4, 22, 35, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (496, 'Кириченко Лиана Ефимовна', 'ж', 'U6UM$FIZ', 37937, '1960-01-28', 2, 14, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (497, 'Хахалина Клара Серафимовна', 'ж', 'msCjLmXA', 55598, '1999-11-19', 1, 26, 17, 3, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (498, 'Путинова Жанна Мечиславовна', 'ж', 'lRaUViOL', 27232, '1984-05-16', 2, 57, 70, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (499, 'Шурупина Эмма Артуровна', 'ж', 'ZSiAHySC', 43530, '1999-11-12', 1, 28, 59, 1, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (500, 'Яглинцева Наталья Вацлавовна', 'ж', 'ijPbRuih', 74343, '1978-03-19', 2, 44, 2, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (501, 'Лелух Иван Георгиевич', 'м', 'QxXhzaRC', 20325, '1999-06-08', 1, 9, 84, 1, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (502, 'Кайназаров Евлампий Прокофиевич', 'м', 'crYII6sK', 20563, '2000-05-16', 1, 11, 65, 2, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (503, 'Цуканова Оксана Аристарховна', 'ж', 'dgbwrLoC', 53017, '1979-01-24', 2, 46, 50, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (504, 'Соколова Мария Радионовна', 'ж', 'Bul39t1h', 58325, '2000-09-19', 1, 28, 37, 0, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (505, 'Рошет Афанасий Онуфриевич', 'м', 'ExLZ0!PO', 68317, '1974-12-07', 2, 29, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (506, 'Благово Парфен Агапович', 'м', 'b4cf1u$W', 69622, '2000-04-03', 1, 16, 19, 0, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (507, 'Погребной Василий Иванович', 'м', '#GzR7NI8', 52617, '1999-03-19', 1, 2, 86, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (508, 'Цейдлерин Чеслав Наумович', 'м', 'DaZt3FA2', 51161, '1974-04-26', 2, 5, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (509, 'Спанов Еремей Феликсович', 'м', 'NlFn7419', 16044, '1965-05-21', 2, 13, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (510, 'Аслаханов Натан Феоктистович', 'м', 'iLABDmIi', 34699, '1993-04-18', 2, 5, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (511, 'Широнин Павел Леонович', 'м', 'NqYWFo@3', 30583, '1994-01-08', 2, 26, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (512, 'Ягодинский Владислав Ираклиевич', 'м', 'QP2#TrZ8', 21664, '1974-08-13', 4, 10, 29, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (513, 'Веселов Макар Иванович', 'м', '5Uz$FECV', 91693, '1999-01-09', 1, 7, 52, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (514, 'Куделькина Елена Григоргиевна', 'ж', 'gDxFxm5l', 33462, '1999-10-10', 1, 12, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (515, 'Яицкий Вацлав Карлович', 'м', '2hE$gZfz', 66506, '1968-09-01', 3, 10, 25, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (516, 'Проскура Ольга Макаровна', 'ж', 'qFMg9P71', 12539, '1994-03-25', 3, 5, 10, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (517, 'Языков Феликс Игнатиевич', 'м', 'Owv58oQ!', 12274, '1963-09-15', 2, 31, 39, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (518, 'Кратенко Геннадий Ильевич', 'м', 'zvaKEDml', 38832, '1974-05-13', 2, 21, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (519, 'Сиянин Онуфрий Андреевич', 'м', 'XHX@YFY0', 89557, '1973-05-28', 2, 14, 33, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (520, 'Ястржембский Богдан Алексеевич', 'м', 'e2cTNYyJ', 49081, '1999-06-15', 1, 5, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (521, 'Низовкин Потап Модестович', 'м', 'vRjlOrcq', 47531, '1999-07-08', 1, 41, 15, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (522, 'Тимофеева Бронислава Аркадиевна', 'ж', 'D33cfjbU', 84524, '2000-01-31', 1, 32, 80, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (523, 'Юдицкая Кристина Афанасиевна', 'ж', 'k6dovBwJ', 27881, '1962-07-28', 2, 14, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (524, 'Шамило Якуб Вячеславович', 'м', 'y7HXZFhA', 58650, '2000-04-23', 1, 26, 19, 0, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (525, 'Капитонова Регина Викторовна', 'ж', 'lRHBDJpC', 90507, '1990-11-17', 2, 20, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (526, 'Соломинцев Пимен Кондратович', 'м', 'DTtmmym$', 11562, '1994-09-08', 2, 37, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (527, 'Элефтеров Ефим Евгениевич', 'м', '@UOD#3G8', 81950, '2000-12-18', 1, 19, 89, 2, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (528, 'Бесфамильный Измаил Данилевич', 'м', 'cY$nn95s', 25436, '1966-10-27', 3, 32, 7, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (529, 'Князев Валерий Климентович', 'м', 'k8Z55n4y', 89572, '1999-04-14', 1, 18, 77, 0, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (530, 'Ягафаров Юрий Проклович', 'м', 'sgDCFXPN', 41179, '1986-09-10', 2, 24, 42, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (531, 'Язынина Изольда Агаповна', 'ж', 'HrRFhdmh', 46401, '1971-12-01', 2, 25, 59, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (532, 'Белорусова Каролина Леонидовна', 'ж', 'l47MQwVW', 68176, '1968-09-12', 2, 31, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (533, 'Дубровин Адриан Серафимович', 'м', '8#prsYdg', 84158, '1986-06-08', 2, 46, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (534, 'Бурякова Маргарита Антиповна', 'ж', '2i@ofQ42', 76367, '1999-03-31', 1, 16, 27, 1, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (535, 'Кузинкова Диана Руслановна', 'ж', 's!0bdGk0', 47904, '1981-04-18', 2, 19, 30, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (536, 'Юшков Макар Михеевич', 'м', 'K1WAln6#', 72241, '2000-05-28', 1, 41, 74, 2, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (537, 'Миров Онисим Афанасиевич', 'м', '#lw5Xmix', 44178, '1993-04-10', 2, 41, 81, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (538, 'Горохов Арсений Маркович', 'м', 'IP21fEAH', 31656, '1999-11-13', 1, 14, 73, 0, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (539, 'Никашин Елисей Олегович', 'м', 'c$nHs22Z', 88365, '2000-10-02', 1, 39, 79, 1, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (540, 'Тукаев Фадей Родионович', 'м', '8lfZYEih', 53464, '2000-11-27', 1, 1, 25, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (541, 'Носатенко Еремей Федорович', 'м', '!cWFV8aM', 78174, '1987-08-16', 2, 31, 10, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (542, 'Шеломова Зоя Валерьевна', 'ж', 'e34QAHK#', 36154, '1968-12-02', 2, 41, 4, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (543, 'Зубок Даниил Ефремович', 'м', '$pGSq5WK', 12061, '1975-11-28', 2, 22, 82, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (544, 'Ягренев Евгений Ипатович', 'м', 'DJDz8oCA', 56908, '1999-05-28', 1, 20, 22, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (545, 'Кулагин Ипатий Валериевич', 'м', 'OEY0FGRb', 24596, '1999-12-16', 1, 33, 25, 1, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (546, 'Якобсон Александр Федосиевич', 'м', 'i8l!NM5o', 53710, '2000-04-28', 1, 9, 20, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (547, 'Кадцына Диана Иннокентиевна', 'ж', 'k!WWS@5T', 40765, '2000-02-26', 1, 12, 82, 0, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (548, 'Султанова Кира Тарасовна', 'ж', 'ywAKbYsq', 69479, '1999-11-06', 1, 29, 21, 1, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (549, 'Кризько Евгения Никоновна', 'ж', 'lEyO$01x', 23685, '1999-12-22', 1, 1, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (550, 'Пыстогов Мартын Алексеевич', 'м', '!FEgmUEI', 13758, '1982-12-11', 2, 20, 22, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (551, 'Костомаров Ярослав Тимурович', 'м', 'zLeNGJ65', 93433, '2000-11-15', 1, 20, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (552, 'Косомов Касьян Эрнстович', 'м', 'mivz5Nfh', 53875, '1999-04-29', 1, 29, 13, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (554, 'Савватимова Василиса Емельяновна', 'ж', 'bsZhpIjR', 24470, '1971-07-13', 2, 11, 39, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (555, 'Есенина Софья Михеевна', 'ж', 'T@Q1uGtn', 40777, '2000-12-26', 1, 1, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (556, 'Мирохина Наталия Леонидовна', 'ж', '3Z!jtdYU', 45336, '1986-04-05', 2, 18, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (557, 'Веденеев Илья Потапович', 'м', '2PpDzf8S', 77245, '2000-05-26', 1, 5, 53, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (558, 'Уланов Федот Макарович', 'м', 'mP6NrLmb', 97125, '1994-10-30', 2, 31, 47, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (559, 'Чичерин Никон Левович', 'м', 'Ue9x5@0P', 12312, '1994-01-16', 3, 37, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (561, 'Агабабян Михей Георгиевич', 'м', 'oeTCllvl', 66590, '1999-03-30', 1, 26, 35, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (562, 'Низов Харитон Арсениевич', 'м', 'rmb$3237', 97627, '1992-05-09', 2, 13, 13, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (563, 'Половцев Эдуард Эмилевич', 'м', '7eppPa6l', 35130, '2000-04-04', 1, 34, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (564, 'Коптильников Иннокентий Александрович', 'м', 'yENmvmEw', 31719, '1999-08-22', 1, 19, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (566, 'Ягубский Осип Эрнстович', 'м', 'KB3WZNMd', 18678, '2000-05-22', 1, 24, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (567, 'Шкуратов Павел Леонидович', 'м', 'fZaKN!Zm', 29427, '1960-04-01', 2, 20, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (569, 'Веденина Наталия Всеволодовна', 'ж', 'SNZuaP0s', 69310, '1993-06-11', 2, 1, 25, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (570, 'Званцева Клара Ипполитовна', 'ж', 'Zfo1i7P4', 28886, '1960-07-04', 4, 8, 83, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (572, 'Воликов Мартьян Федорович', 'м', '2D$w$jAL', 24555, '1999-10-11', 1, 35, 84, 3, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (573, 'Ярков Елисей Мартьянович', 'м', 'Lwwh2$vi', 70836, '1977-04-19', 2, 22, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (574, 'Энтский Гаврила Остапович', 'м', 'JDB@AqXQ', 75305, '1980-12-13', 2, 36, 15, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (575, 'Кунаева Владлена Феликсовна', 'ж', 'PCAnFgp0', 17474, '1999-12-30', 1, 25, 89, 2, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (576, 'Янаслов Порфирий Пахомович', 'м', 'pWZNZZYV', 50358, '1982-12-10', 2, 28, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (577, 'Преображенский Аристарх Прокофиевич', 'м', 'jSaeUZNr', 22090, '1999-01-16', 1, 39, 69, 2, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (578, 'Андреев Роман Евстафиевич', 'м', 'ZjMNs5i2', 41902, '2000-08-22', 1, 10, 76, 1, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (579, 'Ячменькова Полина Филимоновна', 'ж', 'SL#Iqomk', 47470, '1984-02-05', 3, 18, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (580, 'Чичканова Алиса Юлиевна', 'ж', '!4hV9b$V', 55419, '1999-08-06', 1, 16, 47, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (581, 'Носов Самуил Фомевич', 'м', 'lNIU$fM2', 84418, '2000-06-21', 1, 44, 85, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (582, 'Рябоконь Валерьян Тихонович', 'м', 'YtWnzn@5', 62248, '2000-07-11', 1, 41, 87, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (583, 'Кабацкая Ева Филимоновна', 'ж', 'jX$!uhRe', 75856, '1978-06-03', 3, 24, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (584, 'Фунтусов Наум Михаилович', 'м', '97NzfDob', 28420, '2000-08-31', 1, 22, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (585, 'Астрединова Арина Харитоновна', 'ж', 'qHUDHGlV', 54277, '1979-03-20', 2, 10, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (586, 'Каценеленбоген Варфоломей Ильевич', 'м', '2mL6MPE9', 21203, '1979-12-03', 4, 37, 28, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (587, 'Дуболадова Римма Эммануиловна', 'ж', 'tetdfIGq', 32430, '1999-11-03', 1, 14, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (588, 'Шеховцова Вероника Иларионовна', 'ж', 'eanIa!Lv', 51686, '1962-11-12', 2, 21, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (589, 'Карачёв Вениамин Андронович', 'м', '7Gv5$doy', 59495, '1999-05-03', 1, 35, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (590, 'Носачёв Лукьян Адамович', 'м', 'kLTuqV38', 18560, '2000-08-15', 1, 22, 82, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (591, 'Кульчицкий Ким Эрнестович', 'м', '9015uJqL', 26269, '2000-06-11', 1, 6, 28, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (592, 'Якимов Парфен Андроникович', 'м', 'kZzPdUeX', 11706, '1978-10-07', 2, 2, 51, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (593, 'Аптекарь Саввелий Егорович', 'м', 'a4eQXo5G', 88806, '1966-01-28', 4, 7, 27, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (594, 'Попкова Кира Феликсовна', 'ж', 'zTyuU1sE', 95208, '1980-08-14', 2, 6, 12, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (595, 'Теплухин Александр Андроникович', 'м', '2#gNhq$h', 25248, '1975-04-21', 2, 18, 10, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (596, 'Карандасов Аркадий Тарасович', 'м', 'xVZxXBf2', 38400, '1981-05-16', 2, 41, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (597, 'Сухих Наум Архипович', 'м', 'CLPydo0W', 28879, '1999-10-09', 1, 41, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (598, 'Цицианова Арина Юлиевна', 'ж', 'ha938FWK', 62861, '1981-03-25', 2, 44, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (599, 'Аршавина Валентина Никаровна', 'ж', 'doEux7Eb', 63625, '2000-01-23', 1, 36, 24, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (600, 'Фамусов Никифор Натанович', 'м', 'QqDKdQNY', 71766, '1966-06-09', 2, 14, 40, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (602, 'Яшнов Геннадий Ильевич', 'м', 'G8eYV$hL', 17337, '1960-08-17', 3, 26, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (603, 'Ходяев Марк Ермолаевич', 'м', '9tFBWRmy', 52096, '2000-01-28', 1, 5, 50, 0, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (604, 'Державин Панкратий Денисович', 'м', '5ksRgw$V', 50665, '1991-08-28', 2, 19, 89, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (605, 'Власов Андриян Наумович', 'м', 'yJdrrQ9q', 81275, '2000-09-10', 1, 41, 58, 0, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (606, 'Юмашев Мир Михаилович', 'м', '2fYUL#pj', 11887, '1978-01-14', 4, 23, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (607, 'Тарин Наум Матвеевич', 'м', 'SeVKlCth', 98164, '1984-07-21', 2, 21, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (608, 'Шуйский Савелий Филимонович', 'м', 'pbMomygJ', 98553, '1984-11-10', 2, 20, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (609, 'Шулепин Игорь Платонович', 'м', 'pStMV1JM', 93616, '1985-11-17', 2, 32, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (610, 'Селиванов Парфен Георгиевич', 'м', 'qf1lh0sO', 86507, '1986-07-05', 2, 25, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (611, 'Щеглов Ярослав Алексеевич', 'м', 'uK6$6vU6', 34030, '1963-09-17', 2, 23, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (612, 'Воронин Пахом Святославович', 'м', 'XxUsa2xQ', 44425, '1999-10-03', 1, 30, 29, 0, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (613, 'Курневич Ульяна Никифоровна', 'ж', 'Th7@RWSP', 45105, '2000-01-10', 1, 24, 43, 0, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (614, 'Мигунова Анисья Назаровна', 'ж', 'B4BUFVJr', 77846, '1980-04-25', 2, 22, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (615, 'Никоненко Захар Ильевич', 'м', 'VqDV!q!8', 25944, '1988-06-11', 2, 20, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (616, 'Фахриев Борислав Никонович', 'м', 'zPUPWFIm', 17184, '1999-01-02', 1, 28, 60, 3, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (617, 'Валюхов Михей Артемович', 'м', 'mun5nVOV', 80272, '1983-01-20', 2, 11, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (618, 'Янин Сигизмунд Егорович', 'м', 'MaV$Uyyy', 30066, '1988-03-24', 2, 1, 8, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (619, 'Сапалёв Всеволод Афанасиевич', 'м', 'MGynjP0x', 68166, '2000-01-23', 1, 13, 72, 2, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (620, 'Елизаров Дементий Валериевич', 'м', 'yv6t#W4L', 30669, '1962-01-24', 2, 2, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (621, 'Кабацкая Дина Алексеевна', 'ж', 'HMgECMWU', 93714, '2000-10-06', 1, 36, 69, 3, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (622, 'Головаха Чеслав Валериевич', 'м', 'dKz7OZa3', 69272, '2000-09-12', 1, 2, 52, 2, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (623, 'Бухарин Самуил Богданович', 'м', 'dqH8uBhg', 54556, '1999-08-27', 1, 32, 18, 2, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (624, 'Ненашев Юлиан Андронович', 'м', '6fmH9vyV', 63081, '1998-12-13', 1, 14, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (625, 'Ямскова Марта Аркадиевна', 'ж', 'JqFZLlf5', 94832, '1986-12-29', 2, 23, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (626, 'Гуринов Валерий Мечиславович', 'м', 'P5SxKH8n', 88354, '1979-08-08', 2, 26, 4, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (628, 'Кочнев Карп Тарасович', 'м', 'Meq93I2q', 29761, '1975-07-08', 2, 37, 29, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (629, 'Хадеев Юлиан Родионович', 'м', 'RIfT4PSz', 89413, '1999-07-23', 1, 4, 75, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (630, 'Пырьева Антонина Авдеевна', 'ж', 'nudl7I!5', 93668, '1970-10-06', 2, 29, 41, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (631, 'Кондра Полина Данииловна', 'ж', 'n$NaV7l7', 12857, '1960-06-20', 4, 32, 8, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (632, 'Русинова Ксения Тимуровна', 'ж', 'gjMtsuI8', 87468, '1986-11-14', 2, 2, 86, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (634, 'Блинова Лидия Пахомовна', 'ж', 'ItfLYF39', 23260, '1981-06-10', 2, 32, 63, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (635, 'Ульянова Майя Максимильяновна', 'ж', 'QcJ6beMj', 25890, '1987-10-18', 3, 35, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (638, 'Касимов Капитон Ерофеевич', 'м', 'qlibSUOR', 41300, '1999-11-28', 1, 46, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (639, 'Медникова Татьяна Евстигнеевна', 'ж', 'ElZLpMql', 47301, '2000-05-15', 1, 14, 33, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (640, 'Казарезова Агафья Карповна', 'ж', 'j0GOON2E', 75691, '1976-02-12', 4, 18, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (641, 'Смолянинов Мирон Чеславович', 'м', 'sGXca#Yw', 15285, '1978-11-15', 2, 29, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (642, 'Висенин Данил Никитевич', 'м', 'VLak0@$h', 29266, '1971-07-22', 2, 20, 8, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (643, 'Силин Еремей Андриянович', 'м', '5ZaxMFa1', 80329, '1989-09-19', 3, 21, 24, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (644, 'Проскура Владилен Захарович', 'м', 'AS0QqFvI', 18090, '1969-09-27', 2, 26, 81, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (645, 'Мячиков Юлий Остапович', 'м', 'i$FzGbRL', 73409, '1999-06-03', 1, 4, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (647, 'Якушков Трофим Аполлинариевич', 'м', 'hUs7$V2z', 85272, '1973-02-02', 2, 18, 48, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (648, 'Колиух Наталия Глебовна', 'ж', 'mxf3#sRP', 82796, '2000-07-05', 1, 11, 52, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (649, 'Ледовской Пимен Эмилевич', 'м', 'adO38G$I', 15203, '1991-08-12', 2, 4, 59, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (650, 'Сафонов Гавриил Владимирович', 'м', '2#JYBLPI', 48164, '1999-10-07', 1, 5, 33, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (651, 'Викаш Якуб Агапович', 'м', 'F7OZwQqy', 58674, '2000-03-26', 1, 26, 33, 3, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (652, 'Фотеев Клавдий Артемиевич', 'м', '@Hpzn#Rb', 43137, '2000-06-06', 1, 39, 70, 3, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (653, 'Зиновьев Мстислав Арсениевич', 'м', 'KTSV@dPG', 27373, '2000-06-14', 1, 35, 26, 1, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (654, 'Язина Василиса Тарасовна', 'ж', 'mJ62V4SR', 18645, '1973-09-30', 2, 21, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (655, 'Пивоварова Вера Елизаровна', 'ж', 'a2io94DS', 16395, '1979-05-21', 2, 7, 52, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (657, 'Юнкин Карл Эрнестович', 'м', 'JHeYL8Tl', 34655, '1986-05-24', 2, 28, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (658, 'Юренев Кондрат Никанорович', 'м', 'v8qtumaj', 24071, '1968-09-17', 2, 57, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (659, 'Окладникова Рената Назаровна', 'ж', '!lIsKWkq', 23291, '1967-04-22', 2, 35, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (660, 'Березин Илья Никонович', 'м', 'DqqSGUE2', 38640, '2000-03-14', 1, 8, 62, 1, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (661, 'Татаринов Мир Святославович', 'м', 'N#d4C!@v', 72814, '1973-02-10', 2, 14, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (662, 'Шишмарёва Оксана Степановна', 'ж', 'q20NljFy', 22136, '1999-11-01', 1, 25, 20, 0, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (663, 'Ивашин Ефрем Святославович', 'м', 'BSWaoCHu', 91890, '2000-04-28', 1, 37, 18, 1, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (664, 'Сурикова Бронислава Наумовна', 'ж', 'AerI@!NF', 33420, '2000-10-09', 1, 19, 27, 2, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (665, 'Недельский Эмиль Миронович', 'м', 'dBJvIvqH', 97138, '1999-01-19', 1, 27, 75, 1, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (666, 'Поздова Янина Кондратьевна', 'ж', 'u!!CqiDD', 66285, '1999-09-07', 1, 6, 12, 3, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (667, 'Салтыкова Евдокия Константиновна', 'ж', 'SBw2NlM0', 75290, '1969-01-07', 2, 26, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (668, 'Барановский Радион Модестович', 'м', 'hMDkM65G', 66892, '2000-08-07', 1, 36, 73, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (669, 'Пронина Ангелина Самуиловна', 'ж', '7Mqzr9j@', 62221, '1999-06-27', 1, 5, 59, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (670, 'Кочкорбаев Степан Валерьянович', 'м', 'Gr3uSHN7', 36600, '1999-07-03', 1, 26, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (671, 'Закрятин Ростислав Епифанович', 'м', '0Fd#xMH9', 41377, '1999-02-28', 1, 13, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (672, 'Эмских Евгений Демьянович', 'м', 'X#LiKwV#', 22175, '1979-11-08', 2, 9, 7, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (673, 'Крупин Ефим Несторович', 'м', 'O95CTokl', 48594, '1999-06-06', 1, 10, 64, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (674, 'Малахов Якуб Адрианович', 'м', 'wOXF1#JX', 37120, '1998-12-21', 1, 31, 47, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (675, 'Юбкина Изабелла Анатолиевна', 'ж', '4!bqSFhX', 56885, '1960-09-29', 2, 8, 5, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (676, 'Лелух Тит Александрович', 'м', '7A!@ST!q', 11185, '1999-02-10', 1, 13, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (677, 'Бойдало Василий Кириллович', 'м', '@UKjkjM@', 67607, '1990-09-10', 3, 8, 27, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (678, 'Манин Виталий Евлампиевич', 'м', 'vOjrQlkN', 58480, '1986-04-23', 2, 14, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (679, 'Случевский Агафон Аполлинариевич', 'м', 's4@!zXZF', 75758, '2000-06-16', 1, 37, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (680, 'Суханов Борислав Афанасиевич', 'м', 'N$10wBHF', 91271, '1999-05-02', 1, 18, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (681, 'Паулкин Матвей Родионович', 'м', 'CYP@$pJv', 85061, '1999-09-08', 1, 36, 27, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (682, 'Соловьев Павел Ипатиевич', 'м', 'mTls!Xhj', 24945, '2000-03-01', 1, 24, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (683, 'Коренёв Кондратий Сергеевич', 'м', 'FEfl9HP0', 24317, '1960-04-16', 2, 36, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (684, 'Лукашенко Марианна Самсоновна', 'ж', 'gE2zT$$8', 89147, '2000-12-03', 1, 44, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (685, 'Созыкина Александра Вениаминовна', 'ж', 'EF4Rct#K', 88063, '2000-01-24', 1, 6, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (687, 'Боярова Влада Михеевна', 'ж', 'Gg2Jfi@M', 95640, '1981-06-27', 3, 9, 53, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (688, 'Дагиров Моисей Андронович', 'м', 'Evkb7Vp4', 51040, '1969-05-12', 2, 1, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (689, 'Лаврентьев Харитон Гордеевич', 'м', '6d0pwqg#', 92457, '2000-07-04', 1, 35, 44, 0, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (690, 'Горохов Захар Ипатович', 'м', 'F1o!UC4C', 30882, '1993-01-23', 3, 22, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (691, 'Шабанова Лилия Адамовна', 'ж', 'jt3eq@c5', 89580, '1982-10-12', 2, 29, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (692, 'Сафронова Владислава Ильевна', 'ж', 'EZnFWLfK', 70503, '1987-07-27', 2, 36, 60, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (693, 'Шелепов Елисей Адамович', 'м', 'qq#JRKvp', 21490, '1983-05-17', 2, 2, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (694, 'Жеффре Терентий Сидорович', 'м', '0FVNb5kg', 36057, '1979-11-22', 4, 12, 35, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (695, 'Шастин Валерий Измаилович', 'м', 'uJ@EivoR', 15009, '1983-03-14', 2, 22, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (696, 'Рудина Оксана Игнатиевна', 'ж', 'gFxxK5K7', 26537, '1980-11-11', 2, 24, 4, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (697, 'Булдаков Остап Эрнестович', 'м', 'jAUfGpmG', 14237, '1974-10-30', 3, 23, 13, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (698, 'Бурцев Сократ Кондратович', 'м', 'rRwOLgfH', 92026, '2000-07-13', 1, 20, 23, 3, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (699, 'Сыров Максимильян Владиславович', 'м', 'C3uJYppM', 38873, '1999-04-10', 1, 12, 77, 2, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (700, 'Грязнов Олег Давыдович', 'м', 'NBd5pZMW', 56659, '1982-10-01', 2, 22, 64, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (701, 'Бессмертных Самсон Наумович', 'м', 'Lz4CUr2f', 11622, '1977-05-03', 2, 4, 23, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (703, 'Угличинина Анна Радионовна', 'ж', 'stBfE8Le', 56411, '1983-03-17', 2, 25, 20, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (704, 'Селезнев Терентий Феоктистович', 'м', '$qFDoILi', 14079, '1999-11-02', 1, 32, 25, 2, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (705, 'Ожогин Леондий Владимирович', 'м', 'UZb0T5Pd', 57918, '1999-02-18', 1, 35, 22, 1, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (706, 'Жиренков Максим Денисович', 'м', 'QBW#mTcN', 74895, '2000-04-28', 1, 46, 67, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (707, 'Каштанов Федосий Семенович', 'м', 'OHsdujvw', 81138, '2000-06-21', 1, 19, 60, 1, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (708, 'Кресанов Елисей Титович', 'м', 'izPc3D6m', 74835, '2000-08-18', 1, 29, 16, 0, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (709, 'Просвирнина Александра Поликарповна', 'ж', 'AtRjrauy', 65247, '2000-10-30', 1, 37, 45, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (710, 'Корнеева Альбина Матвеевна', 'ж', 'Z4Wsh5GE', 95590, '1963-07-23', 2, 20, 8, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (711, 'Блантер Леонид Несторович', 'м', 'XnbnzSv9', 57120, '1999-04-24', 1, 33, 44, 3, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (712, 'Кандаков Потап Тимурович', 'м', '0hPXgfo4', 11133, '1999-03-25', 1, 7, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (713, 'Машуков Степан Филимонович', 'м', '0E48ognU', 32677, '1990-11-23', 4, 35, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (714, 'Ануфриев Клавдий Семенович', 'м', 'ZCw9hyI2', 11270, '1970-03-14', 2, 18, 10, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (715, 'Эфиров Ираклий Фомевич', 'м', '$2yZGYA$', 89948, '1999-05-08', 1, 20, 89, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (716, 'Свечникова Берта Руслановна', 'ж', 'VOxjR#b8', 19773, '1998-12-25', 1, 18, 48, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (717, 'Ожогин Пимен Богданович', 'м', 'iBzR1QD7', 22949, '1978-07-12', 2, 24, 38, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (718, 'Кудряшова Христина Тимофеевна', 'ж', 'FHGkOkwB', 27981, '1980-03-11', 2, 24, 52, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (719, 'Шагидзянов Богдан Евграфович', 'м', 'oL@SBLIv', 91456, '2000-04-12', 1, 6, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (720, 'Барановский Архип Аполлинариевич', 'м', '9Mq$aqOZ', 96336, '1993-05-29', 2, 29, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (721, 'Топоров Петр Андреевич', 'м', '0HxNTc24', 39955, '1999-04-23', 1, 22, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (723, 'Ярская Дина Никитевна', 'ж', 'NVqrxluA', 94009, '1983-01-09', 2, 29, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (724, 'Шигаева Ника Денисовна', 'ж', 'vJtcsbiW', 34606, '1980-01-07', 2, 57, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (725, 'Романенко Анастасия Владиславовна', 'ж', 'cbqcBw!l', 27611, '1994-01-22', 2, 14, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (726, 'Панков Никон Кириллович', 'м', '50WF!QfG', 30012, '1971-10-22', 2, 57, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (727, 'Сытникова Вероника Ильевна', 'ж', 'DRVh!lAZ', 13394, '1993-01-26', 4, 30, 40, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (728, 'Пороник Зиновий Сократович', 'м', 'JNXtRwUM', 53329, '1999-09-03', 1, 19, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (729, 'Приказчиков Данила Феликсович', 'м', 'jcE1k2#i', 68403, '1983-06-22', 2, 31, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (730, 'Энговатова Елизавета Константиновна', 'ж', 'w1Pe5o1Y', 97648, '1976-03-24', 4, 25, 71, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (731, 'Порсев Мир Казимирович', 'м', 'WnqN96Ep', 98243, '1962-12-01', 2, 37, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (732, 'Подшивалов Глеб Федотович', 'м', 'l1igMvDy', 40304, '1998-12-26', 1, 34, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (733, 'Чекмарёв Кузьма Ипполитович', 'м', 'MEEQUYFG', 45905, '2000-12-18', 1, 30, 28, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (734, 'Куделькина Инесса Геннадиевна', 'ж', 'l#qFu#xv', 22778, '1990-09-24', 2, 41, 70, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (735, 'Нилин Святослав Евлампиевич', 'м', 'wzNg!Sv!', 13134, '1973-02-27', 2, 22, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (736, 'Щедрин Саввелий Фролович', 'м', 'vHHXfIC8', 43285, '1960-10-29', 2, 12, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (737, 'Архаткин Адам Леонидович', 'м', 'EpPBiF1i', 17759, '1999-12-17', 1, 5, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (738, 'Позон Захар Герасимович', 'м', 'ilbT0okC', 17966, '1999-04-27', 1, 32, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (739, 'Ямалтдинова Анна Глебовна', 'ж', 'WeCcB1K!', 35006, '2000-11-07', 1, 31, 11, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (740, 'Недельский Роман Андроникович', 'м', '0@A$iLBQ', 60782, '1981-05-03', 2, 16, 41, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (741, 'Бобр Вячеслав Саввевич', 'м', 'QUK7TL6j', 49251, '1985-10-16', 2, 39, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (742, 'Климушин Феоктист Михеевич', 'м', 'yDkP5EoW', 30661, '1979-05-01', 2, 57, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (743, 'Шумов Вадим Геннадиевич', 'м', 'v4XN38wV', 23774, '1993-05-24', 2, 33, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (744, 'Усоева Христина Игнатиевна', 'ж', 'Nx0XpNX4', 45395, '1987-05-04', 2, 35, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (745, 'Эристов Сергей Андриянович', 'м', 'V$w3HHI7', 31082, '1968-01-15', 2, 27, 15, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (746, 'Платущихин Елизар Вадимович', 'м', '1hLlFcGM', 33167, '1979-10-19', 2, 57, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (748, 'Улицкий Мирослав Проклович', 'м', 'KMU366LD', 15493, '1988-10-14', 2, 27, 14, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (749, 'Углов Мирон Сидорович', 'м', 'uOJ0HVZ!', 17188, '1993-04-13', 2, 34, 17, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (750, 'Яламов Борис Елисеевич', 'м', 'UL1fq24J', 28335, '2000-06-11', 1, 28, 57, 1, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (751, 'Орехов Герасим Епифанович', 'м', 'huM6y@DJ', 98626, '1992-06-06', 2, 11, 65, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (752, 'Петрищев Прокофий Александрович', 'м', 'TK0TYDIR', 81318, '2000-11-04', 1, 46, 19, 2, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (753, 'Зверев Руслан Владимирович', 'м', 'mwRcY1vJ', 42866, '1999-01-13', 1, 39, 18, 0, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (755, 'Пятосина Виктория Николаевна', 'ж', 'e#AQp0E3', 25269, '1999-08-10', 1, 44, 14, 0, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (756, 'Жвикова Марфа Евремовна', 'ж', '$H5AA1Uy', 25360, '1999-09-18', 1, 41, 70, 0, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (757, 'Набокин Герасим Владимирович', 'м', 'QdhtGlxJ', 31790, '1966-08-24', 2, 9, 77, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (758, 'Фирсов Сергей Давыдович', 'м', 'AmJOv#cb', 89264, '1999-11-20', 1, 26, 21, 1, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (759, 'Кетов Анатолий Никанорович', 'м', 'K2Nf1ui0', 86745, '1981-06-01', 2, 23, 7, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (760, 'Туржанская Любава Лаврентиевна', 'ж', 'u$zTdx4u', 78454, '1986-03-17', 2, 37, 61, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (761, 'Харитонов Никанор Гаврилевич', 'м', 'MqzOzimN', 10237, '1982-10-22', 2, 32, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (762, 'Кидирбаев Пимен Григориевич', 'м', 'wQvwKROj', 93137, '2000-03-22', 1, 57, 19, 2, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (763, 'Булгаков Геннадий Сигизмундович', 'м', 'fJ$Y41WV', 57126, '2000-03-31', 1, 5, 36, 1, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (764, 'Курташкина Валентина Олеговна', 'ж', 'JeHgbD@1', 85025, '1971-09-16', 2, 9, 84, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (765, 'Невьянцева Анастасия Артемовна', 'ж', 'stu1rND6', 61147, '2000-07-21', 1, 37, 29, 1, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (766, 'Колвецкая Надежда Иларионовна', 'ж', 'xC5e$Yi4', 19321, '1964-03-11', 2, 21, 28, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (767, 'Гибазов Эмиль Даниилович', 'м', '0rdd$#Hx', 11737, '2000-08-06', 1, 18, 37, 3, 8);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (768, 'Маюров Николай Матвеевич', 'м', 'Wcssx7XY', 63120, '1987-04-23', 2, 8, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (770, 'Аводков Агафон Иосифович', 'м', 'i9BEcAvT', 74540, '1985-12-20', 2, 24, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (771, 'Модзалевский Егор Натанович', 'м', '!xiueIRQ', 67267, '1976-12-09', 2, 28, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (772, 'Яматин Вениамин Яковович', 'м', 'r$Jsawli', 70086, '2000-02-16', 1, 33, 15, 2, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (773, 'Кучава Алексей Ираклиевич', 'м', 'qZ4NJ9bM', 39880, '2000-08-09', 1, 28, 78, 1, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (775, 'Дубина Ираида Аскольдовна', 'ж', 'TYPoHQ57', 71046, '1986-01-10', 2, 37, 63, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (776, 'Усова Софья Кировна', 'ж', 'GE6I77L!', 63803, '2000-08-13', 1, 33, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (777, 'Петрунина Юнона Степановна', 'ж', 'g#16onmO', 62026, '2000-06-07', 1, 44, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (778, 'Яшагина Нина Самуиловна', 'ж', 'j#Tq2PP7', 53223, '2000-07-12', 1, 23, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (779, 'Нечаева Пелагея Яновна', 'ж', 'V7Du#0Vv', 33081, '1999-05-11', 1, 4, 84, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (780, 'Усенко Анфиса Вадимовна', 'ж', 'OJMj5GVf', 47273, '1980-01-31', 2, 8, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (781, 'Лисицын Фома Леонтиевич', 'м', '5cno6$3D', 74487, '1992-01-22', 2, 9, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (782, 'Паулкин Эрнст Проклович', 'м', 'pHd2J$3j', 81836, '1987-03-11', 2, 2, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (783, 'Мармазов Агап Эдуардович', 'м', 'N3SpRcFX', 66880, '1962-08-14', 2, 11, 52, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (784, 'Милюкова Алина Федотовна', 'ж', 'kTCPPWFR', 90792, '1992-08-05', 2, 24, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (785, 'Рассказов Дмитрий Викентиевич', 'м', 'j3tocfNV', 28902, '2000-11-24', 1, 6, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (786, 'Бабиков Леонид Григориевич', 'м', 'rQAovdje', 68342, '1975-02-08', 2, 9, 48, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (787, 'Фотеева Инна Якубовна', 'ж', 'A#Dp2jYK', 31767, '2000-04-23', 1, 9, 16, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (788, 'Окладникова Валерия Георгиевна', 'ж', 'eThhBzVF', 41451, '1985-01-21', 2, 8, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (789, 'Сахаровский Платон Натанович', 'м', 'OWKVBx$5', 57683, '1970-03-04', 2, 39, 42, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (790, 'Якимовский Иларион Арсениевич', 'м', '84QftSsS', 40492, '1987-10-25', 3, 20, 83, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (791, 'Дудко Виссарион Иннокентиевич', 'м', '!#OyfqK7', 80303, '1989-08-31', 2, 16, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (792, 'Королёв Данила Святославович', 'м', 'ln9XokQJ', 29923, '1973-09-02', 2, 13, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (793, 'Арсеиньев Мартьян Григориевич', 'м', '$!93W3Fl', 79430, '1999-03-17', 1, 23, 81, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (794, 'Горюшин Мефодий Захарович', 'м', 'x@gDolH6', 79022, '1999-02-17', 1, 24, 52, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (795, 'Кононов Зиновий Анатолиевич', 'м', '@U4fFLfE', 65304, '1984-08-27', 2, 1, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (796, 'Винокуров Лавр Тарасович', 'м', '@@FmQZK3', 57897, '1970-09-25', 2, 1, 12, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (797, 'Дейнекин Иннокентий Мартьянович', 'м', 'Z9PPuJbM', 81309, '1967-06-21', 3, 31, 41, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (798, 'Квятковский Ипполит Федотович', 'м', 'gpg9PYKs', 68744, '2000-05-31', 1, 46, 27, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (799, 'Коломников Фадей Эрнестович', 'м', 'sFpGd60D', 62685, '1980-06-29', 4, 24, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (800, 'Яловегин Иван Иннокентиевич', 'м', 'W2$0#1A2', 81800, '1988-02-10', 2, 1, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (801, 'Старцева Аза Германовна', 'ж', 'G0#0@2L6', 90134, '2000-06-18', 1, 12, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (802, 'Исламов Федор Эдуардович', 'м', 'Zsn!flYw', 97479, '1999-02-26', 1, 30, 17, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (803, 'Аносов Измаил Игоревич', 'м', '006Ffnyr', 67484, '1990-04-13', 2, 23, 28, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (804, 'Модзалевский Тимур Вячеславович', 'м', '@WTefHP3', 83919, '1961-06-28', 2, 6, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (805, 'Гришина Тамара Лукьяновна', 'ж', 'q#my4KVR', 96495, '1975-11-04', 4, 26, 87, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (806, 'Толбугина Эльвира Натановна', 'ж', '7hRe@bIa', 66025, '1972-01-04', 2, 6, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (807, 'Юматов Ираклий Капитонович', 'м', 'FA@gpLFJ', 38718, '1984-03-14', 2, 29, 23, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (808, 'Русанов Никон Венедиктович', 'м', 'R1YK@VXr', 62662, '1988-06-17', 2, 4, 75, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (810, 'Эйбоженко Инга Ивановна', 'ж', 'zOQ5inpM', 17295, '1994-04-08', 3, 7, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (811, 'Тёмкина Влада Вячеславовна', 'ж', 'qx65@Rp#', 26699, '1999-05-07', 1, 22, 64, 1, 18);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (812, 'Колтышев Мефодий Владимирович', 'м', 'qWOvG6TJ', 87734, '1999-09-26', 1, 18, 38, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (813, 'Авандеев Сократ Потапович', 'м', 'bEwZ92A@', 77100, '2000-05-10', 1, 37, 73, 2, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (814, 'Филиппов Яков Анатолиевич', 'м', '3JWwldnz', 64899, '1984-05-13', 3, 6, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (815, 'Никишин Михаил Серафимович', 'м', '6S$ijZuP', 27218, '1969-05-26', 2, 23, 60, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (816, 'Рогозин Валентин Геннадиевич', 'м', 'ii#CvSyV', 26742, '1972-12-21', 3, 30, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (817, 'Корявов Артем Эмилевич', 'м', 'Kplgd59s', 39565, '1999-01-14', 1, 30, 49, 2, 6);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (818, 'Егоров Поликарп Трофимович', 'м', '8C$rD6!y', 54335, '1985-05-16', 2, 16, 66, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (819, 'Яхимович Кирилл Казимирович', 'м', 'OpK81ddJ', 81089, '2000-11-12', 1, 20, 24, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (820, 'Каравашкин Тарас Касьянович', 'м', 'ET6GU0zi', 58391, '2000-12-03', 1, 31, 47, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (821, 'Ясенев Кондратий Прохорович', 'м', 'JgMBdydV', 58951, '1961-01-21', 2, 35, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (822, 'Лобза Дарья Кондратьевна', 'ж', 'SUdtmOIm', 37273, '1999-05-11', 1, 8, 35, 1, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (823, 'Суворкина Зоя Несторовна', 'ж', 'xntOd83a', 72194, '1977-12-02', 2, 18, 38, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (824, 'Косма Фаина Самуиловна', 'ж', 'KK40QsNi', 35754, '1995-01-13', 2, 36, 81, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (826, 'Жигунов Артемий Ермолаевич', 'м', 'cmAOeRcr', 42141, '1971-01-01', 2, 31, 47, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (827, 'Чичканов Платон Леонидович', 'м', 'Tk0!xNb@', 70578, '1991-06-06', 4, 16, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (828, 'Рыжанов Демьян Артемович', 'м', 'VK5QSl8O', 21495, '1961-05-09', 2, 29, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (829, 'Афанасьева Вера Мстиславовна', 'ж', 'X2m#piCU', 66530, '1995-01-05', 2, 5, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (830, 'Ипатьев Моисей Онисимович', 'м', 'qrmpNueJ', 98162, '1982-07-17', 2, 21, 29, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (831, 'Илькун Моисей Трофимович', 'м', '6QlU3eb@', 43958, '2000-09-25', 1, 1, 53, 2, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (833, 'Гурина Ефросинья Андрияновна', 'ж', '7WEnMzcf', 77937, '1994-10-24', 2, 12, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (835, 'Катасонова Екатерина Гавриловна', 'ж', 'ce!beauh', 41295, '1998-12-27', 1, 30, 41, 1, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (836, 'Люба Георгий Даниилович', 'м', '!IMifLsJ', 65677, '2000-04-07', 1, 19, 14, 2, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (837, 'Дерновая Лидия Антиповна', 'ж', 'WmNWCrMU', 12507, '1999-05-15', 1, 10, 71, 1, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (838, 'Мишутин Елизар Вадимович', 'м', 'vmrXo3WU', 12065, '2000-12-31', 1, 7, 49, 0, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (839, 'Кугушев Мартьян Андроникович', 'м', 'nV8bi4oO', 93515, '1986-03-13', 2, 31, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (840, 'Вышегородских Фока Валерьянович', 'м', 'f$Msr!Ys', 77890, '1960-07-08', 2, 26, 36, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (841, 'Грибалев Леондий Игнатиевич', 'м', 'zgCpxflp', 68776, '1976-07-14', 2, 28, 60, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (842, 'Васнецова Полина Родионовна', 'ж', 'PT7LEwyB', 40780, '1987-01-08', 2, 34, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (843, 'Шведова Юнона Мирославовна', 'ж', 'XdRG6Yj1', 45243, '1999-05-08', 1, 19, 46, 1, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (844, 'Яндульский Аким Агапович', 'м', 'gSJfjEHD', 85390, '1975-01-23', 2, 18, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (845, 'Эзерин Адриан Артемиевич', 'м', 'oWRSMPJ6', 14645, '1986-03-17', 2, 41, 24, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (846, 'Северинов Владимир Артемович', 'м', 'GKYQIZLG', 53250, '1991-01-29', 2, 44, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (847, 'Суружу Раиса Прокловна', 'ж', 'ezPSDP@d', 61258, '2000-12-19', 1, 39, 42, 0, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (848, 'Мухина Стела Феодосьевна', 'ж', '#uBOOL4w', 22687, '1986-02-01', 2, 27, 86, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (850, 'Тычкин Варфоломей Афанасиевич', 'м', 'frybFn6s', 24405, '1975-02-06', 4, 20, 3, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (852, 'Жмылев Венедикт Георгиевич', 'м', '4QtAn$7O', 53616, '2000-11-11', 1, 44, 43, 3, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (853, 'Телицына Рената Борисовна', 'ж', '9WmaWV#T', 68714, '1984-03-28', 2, 19, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (855, 'Яворская Эмилия Соломоновна', 'ж', '#sN$j#iX', 88740, '1988-04-20', 2, 11, 63, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (856, 'Дагин Мечислав Прокофиевич', 'м', 'hw!zDQPU', 49612, '2000-11-19', 1, 29, 11, 2, 19);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (857, 'Ермолин Виссарион Демьянович', 'м', 'L$K3lh5f', 53325, '1991-06-02', 3, 4, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (858, 'Тетерина Елизавета Архиповна', 'ж', 'I!@YOkNR', 69605, '1962-09-02', 2, 2, 80, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (859, 'Путинцев Богдан Сергеевич', 'м', 'puOZV9Nj', 99926, '1974-06-15', 2, 31, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (860, 'Смольников Никифор Серафимович', 'м', 'ST5e@5u#', 26905, '1967-06-29', 2, 11, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (861, 'Еромеев Станислав Фомевич', 'м', 'aU!jyi6W', 26306, '1981-11-12', 3, 16, 23, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (863, 'Набатников Михей Иванович', 'м', '09yBiXfV', 94000, '1999-07-21', 1, 8, 42, 0, 12);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (864, 'Сочеванов Эрнст Елизарович', 'м', '47izo1Df', 36032, '1973-03-31', 2, 33, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (865, 'Балин Юрий Никифорович', 'м', 'r1!jD3#m', 34459, '2000-04-05', 1, 41, 81, 1, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (866, 'Уваров Елизар Епифанович', 'м', 'Z@pgb1z6', 92679, '2000-06-02', 1, 39, 59, 3, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (867, 'Шеповалова Нона Иннокентиевна', 'ж', '#dnYr#ps', 87421, '1981-07-06', 2, 28, 59, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (868, 'Трохин Соломон Ипатович', 'м', 'BGlHW!75', 43619, '1991-03-01', 3, 41, 82, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (869, 'Крымов Герман Леонович', 'м', 'jpyBoypQ', 92128, '1966-11-21', 2, 32, 10, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (870, 'Базанов Евлампий Назарович', 'м', 'Zcxj6qGl', 71299, '2000-01-22', 1, 6, 31, 3, 7);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (871, 'Дорохов Федот Ростиславович', 'м', '3bfovWZM', 76208, '1984-04-27', 2, 10, 46, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (872, 'Старостина Елизавета Ульяновна', 'ж', 'M0pJkfxa', 42231, '2000-05-18', 1, 25, 23, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (873, 'Домышев Федот Михаилович', 'м', 'GwOXKzbn', 49335, '2000-05-21', 1, 20, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (875, 'Хорошилов Клавдий Сократович', 'м', 'Keuf!1OR', 39535, '1999-09-01', 1, 29, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (876, 'Яушева Жанна Кирилловна', 'ж', 'QAPqh51u', 84044, '1974-03-13', 3, 57, 26, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (877, 'Колонтаева Элеонора Алексеевна', 'ж', 'lnvRE!VG', 35929, '1984-05-11', 2, 27, 75, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (878, 'Катрановский Арсений Андронович', 'м', 'b$4oSYXW', 65789, '2000-05-25', 1, 57, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (879, 'Авдиенко Евгения Елисеевна', 'ж', 'lqD9PW5S', 92099, '1999-07-01', 1, 28, 32, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (880, 'Курбатова Лилия Петровна', 'ж', 'PrKi5ZBv', 36196, '1981-03-17', 3, 19, 85, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (881, 'Александровича Ксения Никаровна', 'ж', 'BRzbgeOi', 34761, '1980-01-07', 2, 25, 67, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (882, 'Крутой Назар Назарович', 'м', 'A0uO8fdO', 75715, '1964-12-27', 2, 30, 41, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (883, 'Брынских Архип Иосифович', 'м', '21nRJPdx', 75494, '1975-11-18', 2, 6, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (884, 'Решетников Никифор Чеславович', 'м', 'AP1K3xR3', 60032, '1969-12-29', 2, 12, 77, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (885, 'Сочинская Ангелина Дмитриевна', 'ж', 'lu95Logh', 12965, '2000-10-30', 1, 22, 88, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (886, 'Покровский Антон Фомевич', 'м', '4uW!!n7P', 60606, '1999-04-25', 1, 16, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (887, 'Муханова Агния Андрияновна', 'ж', '08wdNCSO', 71933, '2000-10-06', 1, 33, 47, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (888, 'Колонтаев Федот Еремеевич', 'м', '$QZQIuQP', 90687, '1987-11-19', 2, 1, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (889, 'Гребенщиков Венедикт Арсениевич', 'м', 'cDPoa21h', 86338, '1966-07-15', 2, 4, 62, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (890, 'Леонидов Моисей Маркович', 'м', 'jta0EI6Q', 99447, '1986-07-16', 2, 36, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (891, 'Цорн Давид Брониславович', 'м', 'bSDE5#ci', 64564, '1985-11-15', 4, 39, 48, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (893, 'Корнейчук Матвей Елизарович', 'м', 'GRXo7FrT', 38966, '1999-05-06', 1, 1, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (894, 'Экземплярская Ксения Егоровна', 'ж', 'IYjfrO8e', 30479, '1993-08-24', 2, 10, 64, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (896, 'Хлебов Радислав Чеславович', 'м', 'Txto22Sn', 79509, '1983-11-08', 2, 57, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (897, 'Ягупов Радион Климентович', 'м', 'yV0AyCp0', 67483, '1987-11-24', 2, 19, 27, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (898, 'Маркелов Саввелий Чеславович', 'м', '8@uxE5Z2', 52970, '1994-03-07', 2, 4, 82, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (899, 'Лысов Антон Фролович', 'м', 'M$f!eDt$', 83447, '2000-03-15', 1, 21, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (900, 'Николина Зинаида Вацлавовна', 'ж', 'Ieh22VBb', 42039, '1994-07-24', 2, 25, 89, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (901, 'Бысова Эвелина Моисеевна', 'ж', 'We1lyrPg', 80429, '1973-03-12', 2, 13, 56, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (902, 'Ямсков Герасим Ильевич', 'м', 'O$L9SHaq', 85283, '1967-05-30', 2, 35, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (904, 'Полыгалов Семён Пахомович', 'м', 'gZ$uPRcE', 80255, '2000-01-16', 1, 34, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (905, 'Боварина Каролина Радиславовна', 'ж', 'rh0SOIMA', 62416, '1961-10-07', 3, 12, 48, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (906, 'Ямзин Валерьян Ипатович', 'м', '7f$yRjOe', 64554, '1999-08-14', 1, 23, 67, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (907, 'Чежеков Владислав Вадимович', 'м', 'KssOzrW0', 66669, '2000-09-01', 1, 11, 36, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (908, 'Островерх Ипполит Ираклиевич', 'м', 'ZMIOVrDm', 78742, '1999-11-08', 1, 2, 50, 1, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (909, 'Дарюшина Альбина Рубеновна', 'ж', 'g@NWIRmK', 53909, '1967-05-01', 2, 57, 70, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (910, 'Авилов Владлен Зиновиевич', 'м', 'SRWEHT9I', 50112, '1999-06-18', 1, 9, 58, 3, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (911, 'Бойков Модест Миронович', 'м', 'tZ5$mWjb', 30973, '1999-12-27', 1, 32, 63, 0, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (912, 'Козлитин Фадей Всеволодович', 'м', 'hCli$KPe', 97931, '1987-02-09', 2, 32, 80, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (913, 'Магазинер Семён Игнатиевич', 'м', 'KZLn2zW2', 95925, '1999-02-16', 1, 44, 77, 3, 13);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (914, 'Задков Карл Кондратович', 'м', '!AggYfsK', 26382, '1979-07-18', 2, 33, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (915, 'Янибеков Андрей Гаврилевич', 'м', 'RsLiSYAw', 13376, '1977-10-17', 2, 24, 4, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (916, 'Мишнев Николай Эдуардович', 'м', 'Fbp$Wqtc', 14622, '1983-03-10', 2, 44, 85, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (917, 'Бехтерев Емельян Севастьянович', 'м', 'kWEccS3E', 62990, '2000-12-13', 1, 10, 80, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (918, 'Кирьякова Владлена Аскольдовна', 'ж', 'QlYN!kqW', 96839, '1974-02-16', 2, 21, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (919, 'Меншиков Иннокентий Герасимович', 'м', 'qItQrTXi', 18478, '1999-08-23', 1, 7, 27, 2, 20);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (920, 'Аглеева Нина Михаиловна', 'ж', 'Bw826HAX', 46179, '1963-03-19', 2, 36, 27, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (921, 'Кондрат Платон Ефремович', 'м', '4RMLdpQo', 17644, '1988-12-16', 2, 32, 18, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (922, 'Брюханов Радислав Герасимович', 'м', 'Pz!2ONmm', 71982, '1990-10-26', 2, 28, 78, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (923, 'Гусенков Антон Сергеевич', 'м', '!$67YJop', 81200, '1973-08-27', 2, 20, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (924, 'Аверина Людмила Дмитриевна', 'ж', '8JSnK3$v', 32983, '2000-11-03', 1, 25, 76, 0, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (925, 'Ященко Аза Ефимовна', 'ж', '1$qpGgc9', 22209, '1971-06-06', 2, 11, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (927, 'Александрина Марта Захаровна', 'ж', 'e#zrTi34', 58464, '1999-11-27', 1, 18, 65, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (928, 'Щербакова Анисья Андреевна', 'ж', '7lMowSbW', 72694, '1992-08-11', 2, 44, 2, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (929, 'Барндык Евлампий Куприянович', 'м', 'D0VpBd8f', 12843, '1999-11-02', 1, 29, 14, 2, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (931, 'Вирановский Тарас Самуилович', 'м', 'MsErVoRN', 44794, '1993-02-26', 4, 41, 30, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (934, 'Корзоватых Мирослав Герасимович', 'м', 'g3XZGR1E', 72086, '1972-11-04', 2, 7, 49, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (935, 'Трифонов Онуфрий Валерьянович', 'м', '4NPBlDVy', 97235, '1994-08-08', 2, 39, 7, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (936, 'Пищиков Лев Архипович', 'м', 'IdLZW7jI', 31471, '1990-03-18', 2, 34, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (937, 'Манякина Владислава Георгиевна', 'ж', 'qDggUXLp', 67564, '2000-02-12', 1, 1, 11, 0, 5);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (938, 'Топоркова Лада Семеновна', 'ж', 'ctnoEMBU', 82011, '1999-10-15', 1, 57, 34, 0, 15);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (939, 'Фурманов Серафим Климентович', 'м', 'qi5R0guX', 66837, '1979-06-01', 2, 21, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (940, 'Мальцов Валентин Остапович', 'м', 'orA9CE3B', 63443, '1999-02-09', 1, 35, 78, 2, 14);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (941, 'Кризько Аристарх Якубович', 'м', '0klyr0Ge', 44075, '1999-11-30', 1, 30, 61, 1, 3);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (942, 'Киселёва Майя Терентьевна', 'ж', 'V5qwp0UO', 46561, '1981-08-25', 2, 32, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (943, 'Юматов Евсей Венедиктович', 'м', '5o78O3E5', 34759, '1976-03-05', 2, 24, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (944, 'Банина Виктория Авдеевна', 'ж', 'aOKek$hc', 37320, '1993-01-10', 2, 46, 11, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (945, 'Яшагин Лукьян Леонтиевич', 'м', 'a!FxkIkZ', 98381, '1978-05-11', 2, 7, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (946, 'Созонтов Святослав Иосифович', 'м', 'wKTqDf3a', 17850, '1999-02-21', 1, 2, 81, 3, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (947, 'Гибазов Егор Иванович', 'м', 'NOkKe4GK', 93650, '1971-01-16', 2, 7, 41, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (948, 'Ясенев Марк Андреевич', 'м', 'u8pU5#xJ', 97548, '2000-12-22', 1, 30, 76, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (950, 'Катасонов Артем Серафимович', 'м', 'RKX6PISx', 81156, '1979-12-15', 2, 6, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (951, 'Шулепина Таисия Евдокимовна', 'ж', '4eVWxtp2', 89417, '1999-12-06', 1, 6, 32, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (952, 'Пастух Агния Казимировна', 'ж', '$s$RQLrW', 11882, '2000-02-09', 1, 31, 43, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (953, 'Подоров Виссарион Феоктистович', 'м', 'CwSA2lu8', 94646, '2000-12-08', 1, 11, 63, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (954, 'Сигова Майя Евгениевна', 'ж', 'hbt0RkiD', 55291, '2000-11-26', 1, 2, 51, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (955, 'Капица Феоктист Наумович', 'м', 'zESkjsgw', 85528, '1986-03-27', 2, 41, 37, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (956, 'Януть Антон Владиславович', 'м', 'k$utwkrz', 93215, '1979-03-16', 2, 32, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (957, 'Ведерникова Алла Максимильяновна', 'ж', 'M9B8emNr', 48355, '1976-09-27', 4, 5, 69, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (958, 'Ягодина Злата Кузьмевна', 'ж', 'hildhQnW', 90455, '1963-11-10', 2, 32, 10, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (959, 'Юракин Виссарион Денисович', 'м', '3mnXXyC1', 41221, '1985-04-08', 2, 26, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (961, 'Кабинова Каролина Рубеновна', 'ж', 'ranT0ObN', 23342, '1999-06-23', 1, 24, 55, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (962, 'Мордвинов Аркадий Филиппович', 'м', 'pbfuKl4Y', 17886, '1966-08-14', 2, 13, 34, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (964, 'Самохин Эрнест Левович', 'м', 'bRAvPKds', 26054, '2000-08-05', 1, 12, 54, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (965, 'Буланов Севастьян Макарович', 'м', '#2CQddoy', 63119, '1999-01-29', 1, 37, 25, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (966, 'Ячменьков Евдоким Данилевич', 'м', '7u4I0#2k', 70463, '1988-10-15', 2, 4, 86, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (967, 'Тимиряев Феофан Панкратиевич', 'м', 'jGF27cZa', 14810, '1991-12-25', 2, 16, 68, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (968, 'Дубов Лаврентий Левович', 'м', 'DkVgfzYo', 25808, '1962-08-19', 2, 8, 77, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (969, 'Тамахина Мирослава Станиславовна', 'ж', '!4dtvaTy', 61866, '1991-04-07', 2, 10, 61, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (970, 'Чепурин Валерьян Зиновиевич', 'м', 'b7dBVgJG', 98868, '1999-01-12', 1, 57, 70, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (971, 'Вольваков Денис Еремеевич', 'м', 'xYwuiRkw', 83498, '1999-07-08', 1, 8, 77, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (972, 'Зухин Прокофий Кондратиевич', 'м', '!wofAy7V', 88137, '1977-10-04', 2, 4, 25, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (973, 'Табаков Прокл Аникитевич', 'м', 'XQMmaI@C', 50104, '1974-11-19', 2, 13, 9, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (974, 'Ермушин Артур Ерофеевич', 'м', 'ren5KKmm', 47815, '1965-06-14', 2, 12, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (976, 'Толоконский Потап Трофимович', 'м', '3ghYyii3', 71129, '1999-04-11', 1, 13, 13, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (978, 'Никольский Изяслав Потапович', 'м', '$!quG93h', 80472, '1977-02-17', 2, 30, 61, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (979, 'Тюрин Якуб Евлампиевич', 'м', 'NQekHFpT', 22531, '1999-10-22', 1, 21, 28, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (981, 'Ремизов Прокл Демьянович', 'м', 'opkdiWMT', 27064, '1972-11-16', 2, 13, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (982, 'Мягков Руслан Эрнстович', 'м', '#gw9AJHs', 52974, '1999-08-28', 1, 29, 41, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (983, 'Яромеева Ираида Венедиктовна', 'ж', 'URGhy3yh', 28120, '1978-04-01', 2, 7, 2, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (984, 'Аспидов Феликс Трофимович', 'м', 'rbdSbMrZ', 45601, '1999-09-06', 1, 7, 74, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (985, 'Амелин Валентин Юриевич', 'м', 'lOKT@2Qc', 39077, '1978-12-26', 3, 13, 42, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (986, 'Мухоморов Олег Ерофеевич', 'м', 'jsA!s0Gh', 84203, '1966-03-26', 2, 6, 64, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (987, 'Потрепалов Викентий Федорович', 'м', 'oTsMa3Ld', 80622, '2000-09-16', 1, 5, 58, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (988, 'Фанин Карп Сократович', 'м', 'YqCxXjZr', 27991, '2000-08-31', 1, 22, 49, 3, 9);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (989, 'Сопова Ирина Романовна', 'ж', '5h5nQPXv', 80671, '2000-08-01', 1, 44, 19, 1, 2);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (990, 'Бильбасова Наталья Натановна', 'ж', '46dXxHJi', 21697, '1999-07-10', 1, 22, 14, 3, 1);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (991, 'Малиновская Александра Федоровна', 'ж', 'P13SEjOB', 20331, '1999-08-24', 1, 11, 12, 2, 11);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (992, 'Бережной Юрий Сигизмундович', 'м', 'FZgF5o0q', 93176, '1972-05-10', 2, 25, 23, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (993, 'Цельнер Максим Давидович', 'м', 'mJZgJzpH', 26360, '1999-06-09', 1, 32, 57, 2, 17);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (994, 'Бочкарёв Артемий Эрнестович', 'м', 'ua4E8DLS', 50808, '1999-09-04', 1, 19, 30, 0, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (996, 'Волков Викентий Леонтиевич', 'м', '9B3YfTEL', 68519, '2000-06-19', 1, 1, 31, 3, 4);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (997, 'Островерхов Михаил Онуфриевич', 'м', 'dknc6P1#', 40676, '1999-01-13', 1, 16, 41, 1, 10);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (998, 'Жданова Анфиса Артемовна', 'ж', 'wsoEojgy', 24920, '1960-07-16', 2, 25, 83, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (999, 'Поливанова Маргарита Игоревна', 'ж', 'I!Kj!f!J', 49902, '1971-01-22', 3, 27, 89, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1000, 'Лагутов Геннадий Родионович', 'м', 'XarV25Mx', 89977, '1961-12-01', 2, 29, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1001, 'Саянова Агния Рюриковна', 'ж', '34WQQL@H', 95452, '1973-06-25', 2, 57, 70, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1002, 'Антиповская Лариса Брониславовна', 'ж', 'J542jrlw', 40902, '2000-12-07', 1, 18, 21, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1003, 'Калашников Никита Дмитриевич', 'м', 'LySfcua2', 22353, '2000-09-13', 1, 32, 72, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1004, 'Старицкая Лидия Никифоровна', 'ж', 'GeDDyYTQ', 99879, '1966-10-31', 2, 27, 19, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1005, 'Малинин Ипатий Эмилевич', 'м', 'JFF8p7vV', 35858, '1979-12-13', 4, 19, 44, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1006, 'Зубарев Давид Серафимович', 'м', 'FV5iT8aw', 40728, '1999-08-16', 1, 25, 67, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1007, 'Шостенко Надежда Порфириевна', 'ж', 'LMKwlclj', 85639, '1994-06-16', 3, 46, 79, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1008, 'Кондакова Инесса Святославовна', 'ж', 'Serj85pL', 54669, '1994-01-29', 2, 35, 26, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1009, 'Кучумеева Арина Лукьяновна', 'ж', 'r4XjLP7Q', 60157, '1999-05-28', 1, 12, 67, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1010, 'Кораблина Василиса Кондратьевна', 'ж', 'fdb9i$Lz', 37066, '1999-02-17', 1, 34, 17, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1011, 'Уваров Захар Михаилович', 'м', 'gZIFI!v5', 83022, '1981-12-23', 2, 46, 67, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1012, 'Мананников Николай Ульянович', 'м', 'jyXCKdzN', 75201, '1962-04-01', 2, 22, 71, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1014, 'Привалов Никанор Матвеевич', 'м', 'NqR27KF#', 35977, '2000-01-12', 1, 9, 48, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1015, 'Нырцева Яна Евлампиевна', 'ж', 'pn2@hXlx', 19796, '1966-06-18', 2, 33, 15, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1016, 'Андреюшкин Фока Гаврилевич', 'м', '1nYz!GLL', 24258, '1960-10-31', 2, 33, 57, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1017, 'Журавлев Виктор Аникитевич', 'м', 'leCRCoDs', 82519, '1965-01-27', 2, 11, 6, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1018, 'Калитин Саввелий Игоревич', 'м', 'rhV9RQ87', 69332, '1968-12-05', 4, 46, 87, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1019, 'Палагута Влада Ярославовна', 'ж', 'qnIdc5Gu', 86884, '1980-01-31', 2, 31, 10, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1020, 'Пережогин Ефим Ефремович', 'м', 'cq#kpfpM', 30457, '1968-12-06', 4, 11, 31, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1021, 'Сталин Филимон Никонович', 'м', 'bJB569Lr', 82669, '2000-01-08', 1, 21, 29, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1022, 'Меликова Антонина Мартыновна', 'ж', 'd9$RNtPB', 57607, '1962-07-11', 2, 6, 4, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1024, 'Первак Родион Феликсович', 'м', 'uAPr!2MC', 16951, '1993-05-07', 2, 7, 73, NULL, NULL);
INSERT INTO public.users_results (id, full_name, gender, password, pin, date_of_birth, role_id, skill_id, region_id, place, competition) VALUES (1025, 'Бочаров Юлий Аполлинариевич', 'м', 'GniIQ1n!', 60346, '1998-12-20', 1, 57, 62, NULL, NULL);


--
-- Name: competition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.competition_id_seq', 1, false);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 6, true);


--
-- Name: skill_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_block_id_seq', 8, true);


--
-- Name: skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_id_seq', 1, false);


--
-- Name: users_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_results_id_seq', 1, false);


--
-- Name: competition competition_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition
    ADD CONSTRAINT competition_pk PRIMARY KEY (id);


--
-- Name: regions regions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pk PRIMARY KEY (id);


--
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (id);


--
-- Name: skill_block skill_block_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_block
    ADD CONSTRAINT skill_block_pk PRIMARY KEY (id);


--
-- Name: skill skill_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_pk PRIMARY KEY (id);


--
-- Name: competition_skill competition_skill_skill_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition_skill
    ADD CONSTRAINT competition_skill_skill_id_fk FOREIGN KEY (competition_id) REFERENCES public.competition(id);


--
-- Name: competition_skill competition_skill_skill_id_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition_skill
    ADD CONSTRAINT competition_skill_skill_id_fk2 FOREIGN KEY (skill_id) REFERENCES public.skill(id);


--
-- Name: skill skill_skill_block_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_skill_block_id_fk FOREIGN KEY (skill_block_id) REFERENCES public.skill_block(id);


--
-- Name: users_results users_results_competition_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_results
    ADD CONSTRAINT users_results_competition_id_fk FOREIGN KEY (competition) REFERENCES public.competition(id);


--
-- Name: users_results users_results_regions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_results
    ADD CONSTRAINT users_results_regions_id_fk FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: users_results users_results_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_results
    ADD CONSTRAINT users_results_role_id_fk FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: users_results users_results_skill_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_results
    ADD CONSTRAINT users_results_skill_id_fk FOREIGN KEY (skill_id) REFERENCES public.skill(id);


--
-- PostgreSQL database dump complete
--

