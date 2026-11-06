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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer DEFAULT 0 NOT NULL,
    orbit_period integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer DEFAULT 0 NOT NULL,
    stars_count integer
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
    name character varying(200) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer DEFAULT 0 NOT NULL,
    crater_count integer
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
    name character varying(200) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer DEFAULT 0 NOT NULL,
    moons_count integer
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
    name character varying(200) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer DEFAULT 0 NOT NULL,
    planets_count integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Cometa periódico famoso', false, false, 35, 4600, 75);
INSERT INTO public.comet VALUES (2, 'Neowise', 'Cometa muy brillante', false, false, 103, 4600, 6800);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 'Cometa observado en 1997', false, false, 195, 4600, 2533);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Nuestra galaxia', true, false, 0, 13600, 1000);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 'Galaxia espiral cercana', false, false, 2.537, 10000, 2000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Galaxia en la constelación de Virgo', false, false, 29.35, 13000, 800);
INSERT INTO public.galaxy VALUES (4, 'Cigarro', 'Galaxia M82', false, false, 12, 12000, 500);
INSERT INTO public.galaxy VALUES (5, 'Triángulo', 'Galaxia M33', false, false, 2.73, 10000, 400);
INSERT INTO public.galaxy VALUES (6, 'Renacuajo', 'Galaxia con una larga cola de estrellas', false, false, 420, 11000, 300);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Satélite de la Tierra', false, true, 0.00257, 4510, 5000);
INSERT INTO public.moon VALUES (2, 'Fobos', 2, 'Satélite de Marte', false, false, 0.52, 4500, 120);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Satélite menor de Marte', false, false, 0.52, 4500, 80);
INSERT INTO public.moon VALUES (4, 'Ío', 3, 'Satélite volcánico de Júpiter', false, true, 4.2, 4500, 300);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Satélite helado de Júpiter', false, true, 4.2, 4500, 150);
INSERT INTO public.moon VALUES (6, 'Ganímedes', 3, 'Satélite más grande del sistema', false, true, 4.2, 4500, 1000);
INSERT INTO public.moon VALUES (7, 'Calisto', 3, 'Satélite muy craterizado', false, true, 4.2, 4500, 2000);
INSERT INTO public.moon VALUES (8, 'Amaltea', 3, 'Satélite irregular de Júpiter', false, false, 4.2, 4500, 40);
INSERT INTO public.moon VALUES (9, 'Titán', 4, 'Satélite con atmósfera densa', false, true, 8.5, 4500, 200);
INSERT INTO public.moon VALUES (10, 'Encélado', 4, 'Satélite con géiseres', false, true, 8.5, 4500, 100);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 'Satélite con un cráter gigante', false, true, 8.5, 4500, 500);
INSERT INTO public.moon VALUES (12, 'Tetis', 4, 'Satélite de hielo de Saturno', false, true, 8.5, 4500, 350);
INSERT INTO public.moon VALUES (13, 'Dione', 4, 'Satélite denso de Saturno', false, true, 8.5, 4500, 400);
INSERT INTO public.moon VALUES (14, 'Rhea', 4, 'Segundo satélite de Saturno', false, true, 8.5, 4500, 450);
INSERT INTO public.moon VALUES (15, 'Hiperión', 4, 'Satélite de forma porosa', false, false, 8.5, 4500, 60);
INSERT INTO public.moon VALUES (16, 'Jápeto', 4, 'Satélite con dos tonos', false, true, 8.5, 4500, 300);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 'Satélite de Urano', false, true, 18.2, 4500, 180);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 'Satélite brillante de Urano', false, true, 18.2, 4500, 220);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 'Satélite oscuro de Urano', false, true, 18.2, 4500, 290);
INSERT INTO public.moon VALUES (20, 'Titania', 7, 'Satélite mayor de Urano', false, true, 18.2, 4500, 310);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 1, 'Nuestro planeta', true, true, 0, 4540, 1);
INSERT INTO public.planet VALUES (2, 'Marte', 1, 'El planeta rojo', false, true, 0.52, 4600, 2);
INSERT INTO public.planet VALUES (3, 'Júpiter', 1, 'El gigante gaseoso', false, true, 4.2, 4600, 95);
INSERT INTO public.planet VALUES (4, 'Saturno', 1, 'Planeta con anillos', false, true, 8.5, 4500, 146);
INSERT INTO public.planet VALUES (5, 'Mercurio', 1, 'El más cercano al Sol', false, true, 0.61, 4500, 0);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 'El planeta más caliente', false, true, 0.28, 4500, 0);
INSERT INTO public.planet VALUES (7, 'Urano', 1, 'Gigante helado', false, true, 18.2, 4500, 27);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, 'Planeta azul distante', false, true, 29.8, 4500, 14);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 3, 'Planeta habiltable de tamaño terrestre', false, true, 582, 4000, 0);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 3, 'Planeta de diamante', false, true, 41, 8000, 0);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 3, 'Exoplaneta más cercano', false, true, 4.24, 4850, 0);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 3, 'Candidato a agua líquida', false, true, 600, 4000, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'Estrella central del sistema solar', true, true, 0.000015, 4600, 8);
INSERT INTO public.star VALUES (2, 'Sirio', 1, 'Estrella más brillante', false, true, 8.6, 240, 0);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'Estrella del sistema triple', false, true, 4.37, 6000, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Supergigante roja', false, true, 642.5, 10, 0);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Supergigante azul', false, true, 860, 8, 0);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'Estrella de la constelación Lyra', false, true, 25, 455, 0);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

