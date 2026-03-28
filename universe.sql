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
    description text,
    has_black_hole boolean NOT NULL,
    is_active boolean NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    orbital_period_days integer NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery date NOT NULL,
    last_update date,
    notes text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    gravity numeric(5,2) NOT NULL,
    has_life boolean NOT NULL,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    is_visible boolean NOT NULL,
    temperature_kelvin integer NOT NULL,
    galaxy_id integer
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Nearest spiral galaxy to the Milky Way, massive and bright.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy, containing billions of stars.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A spiral galaxy with a bright nucleus and large central bulge.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous interacting spiral galaxy with striking arms.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Small spiral galaxy, part of the Local Group.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Giant elliptical galaxy known for its supermassive black hole.', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s natural satellite.', 27, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Small irregular moon of Mars.', 0, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Outer moon of Mars.', 1, false, 2);
INSERT INTO public.moon VALUES (4, 'Kepler-22b I', 'Hypothetical moon of Kepler-22b.', 15, true, 3);
INSERT INTO public.moon VALUES (5, 'Kepler-22b II', 'Second hypothetical moon.', 30, true, 3);
INSERT INTO public.moon VALUES (6, 'Betelgeuse I-A', 'Gas giant’s largest moon.', 12, true, 4);
INSERT INTO public.moon VALUES (7, 'Betelgeuse I-B', 'Icy moon with reflective surface.', 20, true, 4);
INSERT INTO public.moon VALUES (8, 'Betelgeuse II-A', 'Rocky moon orbiting Betelgeuse II.', 10, false, 5);
INSERT INTO public.moon VALUES (9, 'Rigel Prime Alpha', 'Massive spherical moon.', 40, true, 6);
INSERT INTO public.moon VALUES (10, 'Rigel Prime Beta', 'Smaller irregular moon.', 8, false, 6);
INSERT INTO public.moon VALUES (11, 'Rigel Minor I', 'Frozen moon orbiting Rigel Minor.', 25, true, 7);
INSERT INTO public.moon VALUES (12, 'Rigel Minor II', 'Tiny irregular moon.', 5, false, 7);
INSERT INTO public.moon VALUES (13, 'M87 Terra I', 'Rocky moon of M87 Terra.', 18, true, 8);
INSERT INTO public.moon VALUES (14, 'M87 Terra II', 'Second moon with eccentric orbit.', 35, true, 8);
INSERT INTO public.moon VALUES (15, 'M87 Aqua I', 'Water-rich moon.', 22, true, 9);
INSERT INTO public.moon VALUES (16, 'Triangulum Alpha I', 'Young moon forming with planet.', 12, false, 10);
INSERT INTO public.moon VALUES (17, 'Triangulum Beta I', 'Large spherical moon with rings.', 50, true, 11);
INSERT INTO public.moon VALUES (18, 'Triangulum Beta II', 'Smaller companion moon.', 15, true, 11);
INSERT INTO public.moon VALUES (19, 'Whirlpool Delta I', 'Bright reflective moon.', 28, true, 12);
INSERT INTO public.moon VALUES (20, 'Whirlpool Delta II', 'Irregular rocky moon.', 7, false, 12);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Andromeda Galaxy Info', '1924-01-01', '2020-05-15', 'Edwin Hubble confirmed Andromeda as a separate galaxy.');
INSERT INTO public.more_info VALUES (2, 'Proxima Centauri Info', '1915-08-18', '2019-11-10', 'Closest star to the Sun, discovered by Robert Innes.');
INSERT INTO public.more_info VALUES (3, 'Kepler-22b Info', '2011-12-05', '2021-07-22', 'First known exoplanet in the habitable zone of a Sun-like star.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet with diverse ecosystems.', 9.81, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The red planet, potential for colonization.', 3.71, false, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-22b', 'Exoplanet in the habitable zone.', 8.50, false, 1);
INSERT INTO public.planet VALUES (4, 'Betelgeuse I', 'Gas giant orbiting Betelgeuse.', 24.00, false, 2);
INSERT INTO public.planet VALUES (5, 'Betelgeuse II', 'Rocky planet with thin atmosphere.', 6.20, false, 2);
INSERT INTO public.planet VALUES (6, 'Rigel Prime', 'Massive planet with strong gravity.', 15.00, false, 3);
INSERT INTO public.planet VALUES (7, 'Rigel Minor', 'Small icy planet orbiting Rigel.', 4.00, false, 3);
INSERT INTO public.planet VALUES (8, 'M87 Terra', 'Hypothetical rocky planet in Messier 87.', 10.00, false, 4);
INSERT INTO public.planet VALUES (9, 'M87 Aqua', 'Water-rich planet candidate.', 11.50, false, 4);
INSERT INTO public.planet VALUES (10, 'Triangulum Alpha', 'Young planet forming in Triangulum.', 7.80, false, 5);
INSERT INTO public.planet VALUES (11, 'Triangulum Beta', 'Gas giant with rings.', 20.00, false, 5);
INSERT INTO public.planet VALUES (12, 'Whirlpool Delta', 'Bright planet in Whirlpool arms.', 9.00, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 'Closest known star to the Sun, a red dwarf.', true, 3042, 2);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Massive red supergiantin Orion, highly luminous.', true, 3500, 2);
INSERT INTO public.star VALUES (3, 'Rigel', 'Blue supergiant star, one of the brightest in Orion.', true, 12000, 2);
INSERT INTO public.star VALUES (4, 'Messier 87 Star A', 'Representative bright star in the giant elliptical galaxy.', false, 8000, 6);
INSERT INTO public.star VALUES (5, 'Triangulum Star X', 'Young, hot star in the Triangulum galaxy.', true, 15000, 5);
INSERT INTO public.star VALUES (6, 'Whirlpool Star Y', 'Bright star located in the spiral arms of Whirlpool.', true, 7000, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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

