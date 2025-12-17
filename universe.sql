--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    period_in_years integer NOT NULL,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(30) NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_planet numeric NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_star numeric NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    temperature numeric NOT NULL,
    is_spherical boolean NOT NULL,
    has_planets boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Most famous periodic comet', 76, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Very bright long-period comet', 2533, false);
INSERT INTO public.comet VALUES (3, 'Encke', 'Short-period comet', 3, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 0, 13600, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 'Spiral', 2537000, 10000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 'Spiral', 3000000, 12000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral', 'Spiral', 23000000, 400, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with bright nucleus', 'Elliptical', 29000000, 13000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Supergiant elliptical galaxy', 'Elliptical', 53000000, 13000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth natural satellite', 4500, 384.4, true, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Larger moon of Mars', 4500, 9.4, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Smaller moon of Mars', 4500, 23.5, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanically active moon', 4500, 421.7, true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon with subsurface ocean', 4500, 670.9, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the Solar System', 4500, 1070.4, true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered moon', 4500, 1882.7, true, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Moon with thick atmosphere', 4500, 1221.9, true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Moon with geysers', 4500, 238, true, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Moon with Herschel crater', 4500, 185.5, true, false);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 'Retrograde orbit moon', 4500, 354.8, true, true);
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 'Highly eccentric orbit moon', 4500, 5513.4, false, false);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 'Outer moon of Uranus', 4500, 583.5, true, false);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 'Largest moon of Uranus', 4500, 435.9, true, false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Dark surface moon', 4500, 266, true, false);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Brightest Uranian moon', 4500, 191, true, false);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 'Moon with extreme cliffs', 4500, 129.9, true, false);
INSERT INTO public.moon VALUES (18, 'Charon', 9, 'Large moon of Proxima b', 4000, 19.6, true, false);
INSERT INTO public.moon VALUES (19, 'Sirius Moon A', 10, 'Hypothetical moon', 100, 15, true, false);
INSERT INTO public.moon VALUES (20, 'Rigel Moon 1', 11, 'Gas giant moon', 8000, 200, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Closest planet to the Sun', 4500, 57.9, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hottest planet in the Solar System', 4500, 108.2, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Only known planet with life', 4500, 149.6, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The red planet', 4500, 227.9, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet in the Solar System', 4500, 778.5, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Planet with prominent rings', 4500, 1434, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant with axial tilt', 4500, 2871, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Farthest known planet', 4500, 4495, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet orbiting Proxima Centauri', 4800, 7.5, true, true);
INSERT INTO public.planet VALUES (10, 'Sirius b', 3, 'White dwarf companion of Sirius', 120, 20, false, true);
INSERT INTO public.planet VALUES (11, 'Rigel I', 5, 'Gas giant around Rigel', 8000, 300, false, true);
INSERT INTO public.planet VALUES (12, 'Andromeda I', 6, 'Exoplanet in Andromeda system', 1000, 500, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Star at the center of the Solar System', 4600, 5778, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Closest known star to the Sun', 4500, 3042, true, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Brightest star in the night sky', 242, 9940, true, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant star', 8000, 3500, true, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Blue supergiant star', 8000, 12100, true, false);
INSERT INTO public.star VALUES (6, 'Alpha Andromedae', 2, 'Brightest star in Andromeda', 60, 13800, true, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

