--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    number_of_stars integer,
    is_visible boolean NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    radius_in_km numeric(10,2) NOT NULL,
    is_natural boolean NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    radius_in_km numeric(10,2) NOT NULL,
    mass_in_kg numeric(30,0) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    temperature integer NOT NULL,
    is_sun boolean NOT NULL,
    age_in_million_years numeric(10,2) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: universe_objects; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_objects (
    universe_objects_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    object_size integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.universe_objects OWNER TO freecodecamp;

--
-- Name: universe_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_objects_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_objects_object_id_seq OWNER TO freecodecamp;

--
-- Name: universe_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_objects_object_id_seq OWNED BY public.universe_objects.universe_objects_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe_objects universe_objects_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_objects ALTER COLUMN universe_objects_id SET DEFAULT nextval('public.universe_objects_object_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 250000000, true, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 1000000000, true, 2540000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 40000000, true, 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, 80000000, false, 29000000.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 76000, 150000000, true, 23000000.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 170000, 100000000, true, 2100000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (10, 'Moon', 13, 1737.40, true, 384400.00);
INSERT INTO public.moon VALUES (11, 'Phobos', 14, 11.27, true, 9376.00);
INSERT INTO public.moon VALUES (12, 'Deimos', 14, 6.20, true, 23458.00);
INSERT INTO public.moon VALUES (13, 'Europa', 15, 1560.80, true, 670900.00);
INSERT INTO public.moon VALUES (14, 'Ganymede', 15, 2634.10, true, 1070400.00);
INSERT INTO public.moon VALUES (15, 'Titan', 16, 2575.50, true, 1221900.00);
INSERT INTO public.moon VALUES (16, 'Enceladus', 16, 252.10, true, 238020.00);
INSERT INTO public.moon VALUES (17, 'Triton', 17, 1353.40, true, 354760.00);
INSERT INTO public.moon VALUES (18, 'Charon', 18, 603.60, true, 19500.00);
INSERT INTO public.moon VALUES (19, 'Thanos', 19, 7102.41, false, 1743822.00);
INSERT INTO public.moon VALUES (20, 'Tias', 19, 7572.41, false, 1748722.00);
INSERT INTO public.moon VALUES (21, 'Vamos', 20, 4102.41, false, 1767382.00);
INSERT INTO public.moon VALUES (22, 'Delirious', 21, 502.41, true, 17676522.00);
INSERT INTO public.moon VALUES (23, 'Calibre', 22, 302.41, false, 3822.00);
INSERT INTO public.moon VALUES (24, 'Luna', 13, 772.41, true, 8722.00);
INSERT INTO public.moon VALUES (25, 'Iara', 15, 41602.41, false, 9850.00);
INSERT INTO public.moon VALUES (26, 'Adoras', 18, 8542.41, false, 8766522.00);
INSERT INTO public.moon VALUES (27, 'Lui', 22, 39498.41, true, 78822.00);
INSERT INTO public.moon VALUES (28, 'Targayen', 23, 97398.41, false, 985522.00);
INSERT INTO public.moon VALUES (29, 'Angel', 21, 1.00, true, 1.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 1, true, 6371.00, 5972000000000000000000000);
INSERT INTO public.planet VALUES (14, 'Mars', 1, false, 3389.50, 641700000000000000000000);
INSERT INTO public.planet VALUES (15, 'Venus', 1, false, 6051.80, 4868000000000000000000000);
INSERT INTO public.planet VALUES (16, 'Mercury', 1, false, 2439.70, 330100000000000000000000);
INSERT INTO public.planet VALUES (17, 'Proxima b', 4, false, 6630.00, 710000000000000000000000);
INSERT INTO public.planet VALUES (18, 'Kepler-22b', 2, true, 2671.00, 589000000000000000000000);
INSERT INTO public.planet VALUES (19, 'Jupiter', 1, false, 69911.00, 1898000000000000000000000000);
INSERT INTO public.planet VALUES (20, 'Saturn', 1, false, 58232.00, 568300000000000000000000000);
INSERT INTO public.planet VALUES (21, 'Uranus', 1, false, 25362.00, 86810000000000000000000000);
INSERT INTO public.planet VALUES (22, 'Neptune', 1, false, 24622.00, 102400000000000000000000000);
INSERT INTO public.planet VALUES (23, 'Alpha Centauri Bb', 5, false, 3191.00, 123400000000000000000000);
INSERT INTO public.planet VALUES (24, 'GJ 667 Cc', 3, true, 4780.00, 523000000000000000000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, 4600.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, false, 242.00);
INSERT INTO public.star VALUES (3, 'Vega', 1, 9600, false, 455.00);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 3050, false, 860.00);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 3, 5790, false, 4800.00);
INSERT INTO public.star VALUES (6, 'Twinkle', 3, 8765, true, 3451.00);


--
-- Data for Name: universe_objects; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_objects VALUES (6, 'Andromeda Galaxy', 'A large spiral galaxy', 10, 1);
INSERT INTO public.universe_objects VALUES (7, 'Proxima Centauri', 'Closest star to the sun', 20, 4);
INSERT INTO public.universe_objects VALUES (8, 'Earth', 'Only planet known to support life', 30, 1);
INSERT INTO public.universe_objects VALUES (9, 'Europa', 'Moon of Jupyter, possibly with an ocean beneath its surface', 40, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_objects_object_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe_objects universe_objects_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_objects
    ADD CONSTRAINT universe_objects_name_key UNIQUE (name);


--
-- Name: universe_objects universe_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_objects
    ADD CONSTRAINT universe_objects_pkey PRIMARY KEY (universe_objects_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universe_objects universe_objects_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_objects
    ADD CONSTRAINT universe_objects_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

