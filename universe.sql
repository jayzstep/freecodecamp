--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    shape text,
    diameter_parsecs integer,
    quasar_active boolean
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
    name character varying(30),
    planet_id integer,
    diameter_km integer,
    color character varying(15) NOT NULL
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    star_id integer,
    type text
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
-- Name: planets_visited; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_visited (
    planets_visited_id integer NOT NULL,
    visit_date date NOT NULL,
    rating integer NOT NULL,
    planet_id integer,
    name character varying(30)
);


ALTER TABLE public.planets_visited OWNER TO freecodecamp;

--
-- Name: planets_visited_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_visited_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_visited_visit_id_seq OWNER TO freecodecamp;

--
-- Name: planets_visited_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_visited_visit_id_seq OWNED BY public.planets_visited.planets_visited_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    age_in_billions numeric(3,1) NOT NULL
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
-- Name: planets_visited planets_visited_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_visited ALTER COLUMN planets_visited_id SET DEFAULT nextval('public.planets_visited_visit_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'spiral', 5000, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 4500, false);
INSERT INTO public.galaxy VALUES (3, 'NGC 4414', 'irreqular', 9900, true);
INSERT INTO public.galaxy VALUES (4, 'Samsung', 'rectangle', 2, false);
INSERT INTO public.galaxy VALUES (5, 'Super Mario', 'elliptical', 15000, false);
INSERT INTO public.galaxy VALUES (6, 'Dusty', 'ring', 42, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'the moon', 16, 3200, 'silver');
INSERT INTO public.moon VALUES (2, 'phobos', 17, 1800, 'red');
INSERT INTO public.moon VALUES (3, 'deimos', 17, 4100, 'orange');
INSERT INTO public.moon VALUES (4, 'europa', 18, 4300, 'blue');
INSERT INTO public.moon VALUES (5, 'ganymede', 18, 1450, 'green');
INSERT INTO public.moon VALUES (6, 'io', 18, 2200, 'white');
INSERT INTO public.moon VALUES (7, 'callisto', 18, 5200, 'yellow');
INSERT INTO public.moon VALUES (8, 'nuMoon', 21, 2500, 'blue');
INSERT INTO public.moon VALUES (9, 'shrimp', 22, 9800, 'grey');
INSERT INTO public.moon VALUES (10, 'oyster', 22, 1300, 'gold');
INSERT INTO public.moon VALUES (11, 'Y', 23, 4100, 'brown');
INSERT INTO public.moon VALUES (12, 'Z', 23, 8000, 'pink');
INSERT INTO public.moon VALUES (13, 'giraffe', 24, 1000, 'blue');
INSERT INTO public.moon VALUES (14, 'dog', 24, 130, 'orange');
INSERT INTO public.moon VALUES (15, 'bird', 24, 45, 'green');
INSERT INTO public.moon VALUES (16, 'party', 25, 900, 'pink');
INSERT INTO public.moon VALUES (17, 'joke', 25, 7300, 'red');
INSERT INTO public.moon VALUES (18, 'mom', 26, 4800, 'black');
INSERT INTO public.moon VALUES (19, 'dad', 26, 2400, 'white');
INSERT INTO public.moon VALUES (20, 'jazz', 27, 3700, 'lightblue');
INSERT INTO public.moon VALUES (21, 'pop', 27, 88, 'violet');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (16, 'earth', true, 1, 'rock');
INSERT INTO public.planet VALUES (17, 'mars', false, 1, 'rock');
INSERT INTO public.planet VALUES (18, 'jupiter', false, 1, 'gas');
INSERT INTO public.planet VALUES (19, 'venus', false, 1, 'rock');
INSERT INTO public.planet VALUES (20, 'pluto', false, 1, 'ice');
INSERT INTO public.planet VALUES (21, 'nuEarth', true, 7, 'jungle');
INSERT INTO public.planet VALUES (22, 'welp', false, 3, 'water');
INSERT INTO public.planet VALUES (23, 'X', false, 7, 'metal');
INSERT INTO public.planet VALUES (24, 'Animal', true, 4, 'furry');
INSERT INTO public.planet VALUES (25, 'Fun', false, 4, 'plastic');
INSERT INTO public.planet VALUES (26, 'Babies', true, 5, 'cotton');
INSERT INTO public.planet VALUES (27, 'Music', false, 5, 'abstract');
INSERT INTO public.planet VALUES (28, 'Giga', false, 6, 'glass');
INSERT INTO public.planet VALUES (29, 'Mega', false, 6, 'grass');
INSERT INTO public.planet VALUES (30, 'Kilo', true, 6, 'brass');


--
-- Data for Name: planets_visited; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_visited VALUES (1, '1988-10-11', 10, 16, NULL);
INSERT INTO public.planets_visited VALUES (2, '2001-03-30', 8, 19, NULL);
INSERT INTO public.planets_visited VALUES (3, '2022-05-28', 4, 24, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'our home star', 1, 4.3);
INSERT INTO public.star VALUES (3, 'sirius', 'brightest star in the sky', 1, 14.4);
INSERT INTO public.star VALUES (4, 'vega', 'arguably the next most important star after sun', 1, 9.8);
INSERT INTO public.star VALUES (5, 'dapaduu', 'small, weird green star', 2, 0.2);
INSERT INTO public.star VALUES (6, 'Reeta', 'blonde, cute, sporty star', 2, 3.1);
INSERT INTO public.star VALUES (7, 'pqxz333-åäö', 'jazzy, party star', 3, 15.5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 30, true);


--
-- Name: planets_visited_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_visited_visit_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: moon moonn_name__unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moonn_name__unq UNIQUE (name);


--
-- Name: planets_visited name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_visited
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: galaxy name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unq UNIQUE (name);


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
-- Name: planets_visited planets_visited_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_visited
    ADD CONSTRAINT planets_visited_pkey PRIMARY KEY (planets_visited_id);


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
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: planets_visited visit_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_visited
    ADD CONSTRAINT visit_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

