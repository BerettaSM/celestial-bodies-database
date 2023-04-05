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
    name character varying(100) NOT NULL,
    description text,
    radius_in_light_years integer,
    distance_from_earth_in_light_years integer,
    galaxy_type_id integer NOT NULL
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    age_in_millions_of_years numeric(12,1)
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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(12,1),
    star_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric(12,1)
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', NULL, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (4, 'ESO 162-17', NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', NULL, NULL, NULL, 2);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Spiral galaxies can be recognized by their wide, flat disks of rotating gas and dust.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Elliptical galaxies are given their name because of their oblong shape and lack of overall structure. Some are nearly spherical, while others are shaped more like a cigar. They can range in size from just a few light years across to being larger than our Milky Way.');
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', 'Irregular galaxies are galaxies that don’t fall under any of the three galaxy types mentioned above. These galaxies tend to be small, dwarf galaxies that lack any distinguishable shape. Many of these galaxies are companions or satellites to larger galaxies.');
INSERT INTO public.galaxy_type VALUES (3, 'Peculiar', 'Peculiar galaxies are almost always the result of a galactic collision. Galactic collisions aren’t as action packed as you might imagine. Since galaxies are mostly comprised of empty space, it’s unlikely that any two given stars will collide during the event of a galactic collision. It is believed that peculiar galaxies compose 5 to 10 percent of all known galaxies. So, it’s safe to say that galactic collisions are a common occurrence in our own universe!');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', NULL, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', NULL, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', NULL, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Sinope', NULL, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Lysithea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Carme', NULL, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Ananke', NULL, 5, NULL);
INSERT INTO public.moon VALUES (16, 'Leda', NULL, 5, NULL);
INSERT INTO public.moon VALUES (17, 'Thebe', NULL, 5, NULL);
INSERT INTO public.moon VALUES (18, 'Adrastea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (19, 'Metis', NULL, 5, NULL);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', NULL, 5, NULL);
INSERT INTO public.moon VALUES (21, 'Themisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (22, 'Megaclite', NULL, 5, NULL);
INSERT INTO public.moon VALUES (23, 'Titan', NULL, 6, NULL);
INSERT INTO public.moon VALUES (24, 'Rosalind', NULL, 8, NULL);
INSERT INTO public.moon VALUES (25, 'Sao', NULL, 7, NULL);
INSERT INTO public.moon VALUES (26, 'Hydra', NULL, 9, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, NULL, NULL, NULL, 39);
INSERT INTO public.planet VALUES (11, 'AB Aurigae b', NULL, NULL, NULL, NULL, 40);
INSERT INTO public.planet VALUES (12, 'Beta Pictoris b', NULL, NULL, NULL, NULL, 41);
INSERT INTO public.planet VALUES (13, '51 Eridani b', NULL, NULL, NULL, NULL, 42);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (40, 'AB Aurigae', NULL, 3, NULL);
INSERT INTO public.star VALUES (41, 'Beta Pictoris', NULL, 3, NULL);
INSERT INTO public.star VALUES (42, '51 Eridani', NULL, 3, NULL);
INSERT INTO public.star VALUES (34, 'Sirius', NULL, 3, NULL);
INSERT INTO public.star VALUES (35, 'Betelgeuse', NULL, 3, NULL);
INSERT INTO public.star VALUES (36, 'Rigel', NULL, 3, NULL);
INSERT INTO public.star VALUES (37, 'Vega', NULL, 3, NULL);
INSERT INTO public.star VALUES (38, 'Antares', NULL, 3, NULL);
INSERT INTO public.star VALUES (39, 'Sun', NULL, 3, NULL);
INSERT INTO public.star VALUES (3, 'Polaris', NULL, 3, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 42, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- PostgreSQL database dump complete
--

