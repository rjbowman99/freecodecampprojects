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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    age_in_million_of_years numeric(5,1)
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
    description text NOT NULL,
    planet_id integer,
    has_life boolean
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
    description text NOT NULL,
    star_id integer,
    has_life boolean,
    number_of_moons integer
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
    description text NOT NULL,
    galaxy_id integer,
    number_of_planets integer
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

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 'Halleys Comet, Comet Halley, or sometimes simply Halley, officially designated 1P/Halley, is the only known short-period comet that is consistently visible to the naked eye from Earth, appearing every 75–79 years. It last appeared in the inner parts of the Solar System in 1986 and will next appear in mid-2061');
INSERT INTO public.comet VALUES (2, '81P/Wild', 'Comet 81P/Wild, also known as Wild 2, is a comet named after Swiss astronomer Paul Wild, who discovered it on January 6, 1978, using a 40-cm Schmidt telescope at Zimmerwald, Switzerland. For most of its 4.5 billion-year lifetime, Wild 2 probably had a more distant and circular orbit.');
INSERT INTO public.comet VALUES (3, '12P/Pons–Brooks', '12P/Pons–Brooks is a periodic comet with an orbital period of 71 years. Comets with an orbital period of 20–200 years are referred to as Halley-type comets. It is one of the brightest known periodic comets, reaching an absolute visual magnitude of about 5 in its approach to perihelion');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'where we live', false, 4000.1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda
', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', false, 5000.2);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 'Appearance is similar to an insect antennae.', false, 6000.3);
INSERT INTO public.galaxy VALUES (4, 'Backward', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', false, 7000.4);
INSERT INTO public.galaxy VALUES (5, 'Bear Paw', 'It resembles the appearance of a bear claw.', false, 3000.9);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'It has a spectacular dark band of absorbing dust in front of the galaxy bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, 2000.8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is Earths only natural satellite. It orbits at an average distance of 384,400 km, about 30 times the diameter of Earth. Over time Earths gravity has caused tidal locking, causing the same side of the Moon to always face Earth.', 1, true);
INSERT INTO public.moon VALUES (2, 'Thebe', 'Thebe, also known as Jupiter XIV, is the fourth of Jupiters moons by distance from the planet. It was discovered by Stephen P. Synnott in images from the Voyager 1 space probe taken on March 5, 1979, while making its flyby of Jupiter. In 1983, it was officially named after the mythological nymph Thebe.', 2, false);
INSERT INTO public.moon VALUES (3, 'Cyllene', 'Cyllene, also known as Jupiter XLVIII, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, receiving the temporary designation S/2003 J 13.', 3, false);
INSERT INTO public.moon VALUES (4, 'Themisto', 'Themisto, also known as Jupiter XVIII, is a small prograde irregular satellite of Jupiter. It was discovered in 1975, subsequently lost, and rediscovered in 2000.', 4, false);
INSERT INTO public.moon VALUES (5, 'Herse', 'Herse, or Jupiter L, previously known by its provisional designation of S/2003 J 17, is a natural satellite of Jupiter. It was discovered on 8 February 2003 by the astronomers Brett J. Gladman, John J. Kavelaars, Jean-Marc Petit, and Lynne Allen and also by a team of astronomers at the University of Hawaii.', 5, false);
INSERT INTO public.moon VALUES (6, 'Callirrhoe', 'Callirrhoe, also known as Jupiter XVII, is one of Jupiters outer natural satellites. It is an irregular moon that orbits in a retrograde direction. Callirrhoe was imaged by Spacewatch at Kitt Peak National Observatory from October 6 through November 4, 1999, and originally designated as asteroid 1999 UX', 6, false);
INSERT INTO public.moon VALUES (7, 'Europa', 'Europa, or Jupiter II, is the smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet of all the 95 known moons of Jupiter. It is also the sixth-largest moon in the Solar System.', 7, false);
INSERT INTO public.moon VALUES (8, 'S/2003 J 2', 'S/2003 J 2 is a retrograde irregular satellite of Jupiter. The moon was discovered on 5 February 2003 by a team of astronomers from the University of Hawaii led by Scott S. Sheppard and David C. Jewitt, and was later announced on 4 March 2003', 8, false);
INSERT INTO public.moon VALUES (9, 'Jupiter LXI', 'Jupiter LXI, provisionally known as S/2003 J 19, is a natural satellite of Jupiter. It was discovered by a team of astronomers led by Brett J. Gladman, et al. in 2003.', 9, false);
INSERT INTO public.moon VALUES (10, 'Jupiter LV', 'Jupiter LV, provisionally known as S/2003 J 18, is a natural satellite of Jupiter. It was discovered by a team of astronomers led by Brett J. Gladman in 2003.', 10, false);
INSERT INTO public.moon VALUES (11, 'S/2003 J 23', 'S/2003 J 23 is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard et al. in 2004 from pictures taken in 2003. ', 1, false);
INSERT INTO public.moon VALUES (12, 'S/2003 J 9', 'S/2003 J 9 is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003.', 2, false);
INSERT INTO public.moon VALUES (13, 'S/2003 J 12', 'S/2003 J 12 is a natural satellite of Jupiter, and is one of the smallest known natural satellites in the Solar System. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003.', 3, false);
INSERT INTO public.moon VALUES (14, 'Eukelade', 'Eukelade, also known as Jupiter XLVII, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, and received the temporary designation S/2003 J 1.', 4, false);
INSERT INTO public.moon VALUES (15, 'Jupiter LXXII', 'Jupiter LXXII, originally known as S/2011 J 1, is a natural satellite of Jupiter. It was discovered by Scott Sheppard in 2011. It belongs to the Carme group. This moon was lost after its discovery in 2011. Its recovery was announced on 17 September 2018.', 5, false);
INSERT INTO public.moon VALUES (16, 'Aoede', 'Aoede, also known as Jupiter XLI, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003. It received the temporary designation S/2003 J', 6, false);
INSERT INTO public.moon VALUES (17, 'Iocaste', 'Iocaste, also known as Jupiter XXIV, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii including: David C. Jewitt, Yanga R. Fernandez, and Eugene Magnier led by Scott S. Sheppard in 2000, and given the temporary designation S/2000 J 3.', 7, false);
INSERT INTO public.moon VALUES (18, 'Helike', 'Helike, also known as Jupiter XLV, is a moon of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, and given the temporary designation S/2003 J 6.', 8, false);
INSERT INTO public.moon VALUES (19, 'Jupiter LIV', 'Jupiter LIV, originally known as S/2016 J 1, is an outer natural satellite of Jupiter. It was discovered by Scott S. Sheppard in 2016, but not announced until June 2, 2017 via a Minor Planet Electronic Circular from the Minor Planet Center.', 9, false);
INSERT INTO public.moon VALUES (20, 'Jupiter LIX', 'Jupiter LIX, provisionally known as S/2017 J 1, is an outer natural satellite of Jupiter on a retrograde orbit. It was reported on June 5, 2017, via a Minor Planet Electronic Circular from the Minor Planet Center. It is believed to be about 2 km in diameter. It is a member of the Pasiphae group.', 10, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'perfect', 1, true, 1);
INSERT INTO public.planet VALUES (2, 'mars', 'where men are from', 2, false, 0);
INSERT INTO public.planet VALUES (3, 'neptune', 'green', 3, false, 1);
INSERT INTO public.planet VALUES (4, 'jupiter', 'red eye', 4, false, 2);
INSERT INTO public.planet VALUES (5, 'mercury', 'close to sun', 5, false, 0);
INSERT INTO public.planet VALUES (6, 'uranus', 'full of gas', 6, false, 0);
INSERT INTO public.planet VALUES (7, 'saturn', 'rings', 1, false, 12);
INSERT INTO public.planet VALUES (8, 'venus', 'where women are from', 2, false, 8);
INSERT INTO public.planet VALUES (9, 'pluto', 'not a planet anymore', 3, false, 0);
INSERT INTO public.planet VALUES (10, 'x', 'dog planet', 4, false, 0);
INSERT INTO public.planet VALUES (11, 'y', 'cat planet', 5, false, 0);
INSERT INTO public.planet VALUES (12, 'z', 'hamster planet', 6, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Arcturus', ' Arcturus is the brightest star in the northern constellation of Boötes. With an apparent visual magnitude of −0.05, it is the fourth-brightest star in the night sky, and the brightest in the northern celestial hemisphere.', 1, 10);
INSERT INTO public.star VALUES (2, 'Betelgeuse', ' Betelgeuse is a red supergiant star in the constellation of Orion. It is usually the tenth-brightest star in the night sky and, after Rigel, the second-brightest in its constellation.', 1, 11);
INSERT INTO public.star VALUES (3, 'Antares', ' Antares is the brightest star in the constellation of Scorpius. It has the Bayer designation α Scorpii, which is Latinised to Alpha Scorpii. Often referred to as "the heart of the scorpion", Antares is flanked by σ Scorpii and τ Scorpii near the center of the constellation.', 1, 12);
INSERT INTO public.star VALUES (4, 'Canopus', ' Canopus is the brightest star in the southern constellation of Carina and the second-brightest star in the night sky. It is also designated α Carinae, which is romanized to Alpha Carinae. With a visual apparent magnitude of −0.74, it is outshone only by Sirius. ', 1, 13);
INSERT INTO public.star VALUES (5, 'Delta Canis Majoris', ' Delta Canis Majoris, officially named Wezen, is a star in the constellation of Canis Major. It is a yellow-white F-type supergiant with an apparent magnitude of +1.83. Since 1943, the spectrum of this star has served as one of the stable anchor points by which other stars are classified. ', 1, 14);
INSERT INTO public.star VALUES (6, 'Sirius', ' Sirius is the brightest star in the night sky. Its name is derived from the Greek word Σείριος, meaning lit. "glowing" or "scorching". The star is designated α Canis Majoris, Latinized to Alpha Canis Majoris, and abbreviated α CMa or Alpha CMa.', 1, 15);


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

