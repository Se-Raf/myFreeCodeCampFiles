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
    name character varying(30),
    galaxy_type character varying(50) NOT NULL,
    distance_in_light_years numeric(15,2),
    diameter_in_light_years numeric(15,2)
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
    orbital_period_days numeric(10,2) NOT NULL,
    radius_km numeric(10,2) NOT NULL
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
    name character varying(30),
    star_id integer,
    planet_type character varying(30) NOT NULL,
    orbital_period_days numeric(10,2) NOT NULL,
    is_habitable boolean DEFAULT false,
    description text,
    has_atmosphere boolean DEFAULT false
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
    name character varying(30),
    galaxy_id integer,
    stellar_class_id bigint NOT NULL,
    mass_solar_units numeric(8,4) NOT NULL
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
-- Name: stellar_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar_class (
    stellar_class_id integer NOT NULL,
    name character varying(30),
    spectral_type character(1) NOT NULL,
    temperature_min_kelvin integer NOT NULL,
    temperature_max_kelvin integer NOT NULL
);


ALTER TABLE public.stellar_class OWNER TO freecodecamp;

--
-- Name: stellar_class_stellar_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stellar_class_stellar_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stellar_class_stellar_class_id_seq OWNER TO freecodecamp;

--
-- Name: stellar_class_stellar_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stellar_class_stellar_class_id_seq OWNED BY public.stellar_class.stellar_class_id;


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
-- Name: stellar_class stellar_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_class ALTER COLUMN stellar_class_id SET DEFAULT nextval('public.stellar_class_stellar_class_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, 100000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, 220000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000.00, 60000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000.00, 76000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 29000000.00, 50000.00);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53000000.00, 120000.00);
INSERT INTO public.galaxy VALUES (7, 'IC 1101', 'Elliptical', 1045000000.00, 6000000.00);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Irregular', 163000.00, 14000.00);
INSERT INTO public.galaxy VALUES (9, 'Small Magellanic Cloud', 'Irregular', 200000.00, 7000.00);
INSERT INTO public.galaxy VALUES (10, 'NGC 1300', 'Barred Spiral', 61000000.00, 110000.00);
INSERT INTO public.galaxy VALUES (11, 'NGC 4414', 'Spiral', 62000000.00, 56000.00);
INSERT INTO public.galaxy VALUES (12, 'NGC 6744', 'Spiral', 30000000.00, 175000.00);
INSERT INTO public.galaxy VALUES (13, 'NGC 2841', 'Spiral', 46000000.00, 150000.00);
INSERT INTO public.galaxy VALUES (14, 'Cartwheel', 'Ring', 500000000.00, 150000.00);
INSERT INTO public.galaxy VALUES (15, 'Hoags Object', 'Ring', 600000000.00, 120000.00);
INSERT INTO public.galaxy VALUES (16, 'NGC 4449', 'Irregular', 12000000.00, 20000.00);
INSERT INTO public.galaxy VALUES (17, 'NGC 55', 'Barred Spiral', 7000000.00, 70000.00);
INSERT INTO public.galaxy VALUES (18, 'NGC 300', 'Spiral', 6000000.00, 94000.00);
INSERT INTO public.galaxy VALUES (19, 'NGC 2403', 'Spiral', 10000000.00, 50000.00);
INSERT INTO public.galaxy VALUES (20, 'NGC 6946', 'Spiral', 22000000.00, 40000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27.30, 1737.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.30, 11.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.30, 6.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.80, 1821.00);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.50, 1560.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.10, 2634.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.70, 2410.00);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 15.90, 2575.00);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1.40, 252.00);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 0.90, 198.00);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 5.90, 1353.00);
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 13.50, 761.00);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 8.70, 789.00);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 2.50, 578.00);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 4.10, 584.00);
INSERT INTO public.moon VALUES (16, 'Charon', 9, 6.40, 606.00);
INSERT INTO public.moon VALUES (17, 'Nix', 9, 24.90, 49.00);
INSERT INTO public.moon VALUES (18, 'Hydra', 9, 38.20, 51.00);
INSERT INTO public.moon VALUES (19, 'Dione', 6, 2.70, 561.00);
INSERT INTO public.moon VALUES (20, 'Rhea', 6, 4.50, 763.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88.00, false, 'Small rocky planet', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225.00, false, 'Dense toxic atmosphere', true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365.00, true, 'Supports life', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687.00, false, 'Thin atmosphere', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4333.00, false, 'Largest planet', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 10759.00, false, 'Ring system', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 30687.00, false, 'Tilted axis', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 60190.00, false, 'Strong winds', true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', 11.20, true, 'Potentially habitable', true);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 20, 'Super-Earth', 289.00, true, 'Ocean world candidate', true);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 20, 'Super-Earth', 385.00, true, 'Earth-like orbit', true);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 5, 'Hot Jupiter', 3.50, false, 'Evaporating atmosphere', true);
INSERT INTO public.planet VALUES (13, 'Gliese 581g', 19, 'Terrestrial', 37.00, true, 'Habitable zone', true);
INSERT INTO public.planet VALUES (14, 'WASP-12b', 5, 'Hot Jupiter', 1.10, false, 'Extreme heat', true);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1d', 4, 'Terrestrial', 4.05, true, 'Compact system', true);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1e', 4, 'Terrestrial', 6.10, true, 'Best habitability candidate', true);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1f', 4, 'Terrestrial', 9.20, false, 'Icy surface', true);
INSERT INTO public.planet VALUES (18, 'TRAPPIST-1g', 4, 'Terrestrial', 12.30, false, 'Cold atmosphere', true);
INSERT INTO public.planet VALUES (19, '55 Cancri e', 2, 'Super-Earth', 0.70, false, 'Carbon-rich', true);
INSERT INTO public.planet VALUES (20, 'LHS 1140 b', 19, 'Super-Earth', 24.70, true, 'Dense atmosphere', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 6, 1.0000);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 6, 1.1000);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 7, 0.9070);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 8, 0.1221);
INSERT INTO public.star VALUES (5, 'Sirius A', 1, 4, 2.0200);
INSERT INTO public.star VALUES (6, 'Sirius B', 1, 10, 1.0200);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 1, 9, 11.6000);
INSERT INTO public.star VALUES (8, 'Rigel', 1, 2, 21.0000);
INSERT INTO public.star VALUES (9, 'Vega', 1, 4, 2.1350);
INSERT INTO public.star VALUES (10, 'Polaris', 1, 13, 5.4000);
INSERT INTO public.star VALUES (11, 'Deneb', 1, 13, 19.0000);
INSERT INTO public.star VALUES (12, 'Antares', 1, 9, 12.4000);
INSERT INTO public.star VALUES (13, 'Arcturus', 1, 9, 1.0800);
INSERT INTO public.star VALUES (14, 'Aldebaran', 1, 9, 1.1600);
INSERT INTO public.star VALUES (15, 'Altair', 1, 5, 1.7900);
INSERT INTO public.star VALUES (16, 'Spica', 1, 2, 10.2500);
INSERT INTO public.star VALUES (17, 'Fomalhaut', 1, 5, 1.9200);
INSERT INTO public.star VALUES (18, 'Regulus', 1, 4, 3.8000);
INSERT INTO public.star VALUES (19, 'Barnards Star', 1, 8, 0.1440);
INSERT INTO public.star VALUES (20, 'Tau Ceti', 1, 6, 0.7830);


--
-- Data for Name: stellar_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar_class VALUES (1, 'Blue Hypergiant', 'O', 30000, 50000);
INSERT INTO public.stellar_class VALUES (2, 'Blue Giant', 'O', 30000, 40000);
INSERT INTO public.stellar_class VALUES (3, 'Blue-White Star', 'B', 10000, 30000);
INSERT INTO public.stellar_class VALUES (4, 'White Star', 'A', 7500, 10000);
INSERT INTO public.stellar_class VALUES (5, 'Yellow-White Star', 'F', 6000, 7500);
INSERT INTO public.stellar_class VALUES (6, 'Yellow Dwarf', 'G', 5200, 6000);
INSERT INTO public.stellar_class VALUES (7, 'Orange Dwarf', 'K', 3700, 5200);
INSERT INTO public.stellar_class VALUES (8, 'Red Dwarf', 'M', 2400, 3700);
INSERT INTO public.stellar_class VALUES (9, 'Red Giant', 'M', 3000, 4500);
INSERT INTO public.stellar_class VALUES (10, 'White Dwarf', 'D', 8000, 40000);
INSERT INTO public.stellar_class VALUES (11, 'Neutron Star', 'N', 600000, 1000000);
INSERT INTO public.stellar_class VALUES (12, 'Brown Dwarf', 'L', 1000, 2400);
INSERT INTO public.stellar_class VALUES (13, 'Supergiant', 'O', 20000, 45000);
INSERT INTO public.stellar_class VALUES (14, 'Subgiant', 'G', 5000, 6000);
INSERT INTO public.stellar_class VALUES (15, 'Main Sequence F', 'F', 6000, 7500);
INSERT INTO public.stellar_class VALUES (16, 'Main Sequence G', 'G', 5200, 6000);
INSERT INTO public.stellar_class VALUES (17, 'Main Sequence K', 'K', 3700, 5200);
INSERT INTO public.stellar_class VALUES (18, 'Main Sequence M', 'M', 2400, 3700);
INSERT INTO public.stellar_class VALUES (19, 'Carbon Star', 'C', 2500, 3500);
INSERT INTO public.stellar_class VALUES (20, 'Wolf-Rayet', 'W', 30000, 200000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: stellar_class_stellar_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stellar_class_stellar_class_id_seq', 20, true);


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
-- Name: stellar_class stellar_class_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_class
    ADD CONSTRAINT stellar_class_name_key UNIQUE (name);


--
-- Name: stellar_class stellar_class_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_class
    ADD CONSTRAINT stellar_class_pkey PRIMARY KEY (stellar_class_id);


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
-- Name: star star_stellar_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_stellar_class_id_fkey FOREIGN KEY (stellar_class_id) REFERENCES public.stellar_class(stellar_class_id);


--
-- PostgreSQL database dump complete
--

