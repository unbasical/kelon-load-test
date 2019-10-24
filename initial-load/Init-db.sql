--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0 (Debian 12.0-2.pgdg100+1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-10-24 05:31:43 UTC

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

--
-- TOC entry 8 (class 2615 OID 16385)
-- Name: appstore; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA appstore;


ALTER SCHEMA appstore OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16386)
-- Name: app; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.app (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    description character varying(10000),
    title character varying(255),
    update_date timestamp without time zone,
    views bigint NOT NULL,
    logo_id bigint,
    user_id bigint
);


ALTER TABLE appstore.app OWNER TO admin;

--
-- TOC entry 204 (class 1259 OID 16394)
-- Name: app_comments; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.app_comments (
    app_id bigint NOT NULL,
    comments_id bigint NOT NULL
);


ALTER TABLE appstore.app_comments OWNER TO admin;

--
-- TOC entry 205 (class 1259 OID 16397)
-- Name: app_ratings; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.app_ratings (
    app_id bigint NOT NULL,
    ratings_id bigint NOT NULL
);


ALTER TABLE appstore.app_ratings OWNER TO admin;

--
-- TOC entry 206 (class 1259 OID 16400)
-- Name: app_screenshots; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.app_screenshots (
    app_id bigint NOT NULL,
    screenshots_id bigint NOT NULL
);


ALTER TABLE appstore.app_screenshots OWNER TO admin;

--
-- TOC entry 207 (class 1259 OID 16403)
-- Name: app_tags; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.app_tags (
    app_id bigint NOT NULL,
    tags_id bigint NOT NULL
);


ALTER TABLE appstore.app_tags OWNER TO admin;

--
-- TOC entry 208 (class 1259 OID 16408)
-- Name: comment; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.comment (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    text character varying(255),
    user_id bigint
);


ALTER TABLE appstore.comment OWNER TO admin;

--
-- TOC entry 209 (class 1259 OID 16413)
-- Name: feedback; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.feedback (
    id bigint NOT NULL,
    content character varying(255),
    subject character varying(255)
);


ALTER TABLE appstore.feedback OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 16463)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: appstore; Owner: admin
--

CREATE SEQUENCE appstore.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE appstore.hibernate_sequence OWNER TO admin;

--
-- TOC entry 210 (class 1259 OID 16421)
-- Name: logo; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.logo (
    id bigint NOT NULL,
    content_type character varying(255),
    filename character varying(255),
    image_data bytea
);


ALTER TABLE appstore.logo OWNER TO admin;

--
-- TOC entry 211 (class 1259 OID 16429)
-- Name: rating; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.rating (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    stars integer NOT NULL,
    user_id bigint
);


ALTER TABLE appstore.rating OWNER TO admin;

--
-- TOC entry 212 (class 1259 OID 16434)
-- Name: screenshot; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.screenshot (
    id bigint NOT NULL,
    content_type character varying(255),
    filename character varying(255),
    image_data bytea
);


ALTER TABLE appstore.screenshot OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 16442)
-- Name: tag; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.tag (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE appstore.tag OWNER TO admin;

--
-- TOC entry 214 (class 1259 OID 16447)
-- Name: users; Type: TABLE; Schema: appstore; Owner: admin
--

CREATE TABLE appstore.users (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    role character varying(255),
    update_date timestamp without time zone
);


ALTER TABLE appstore.users OWNER TO admin;

--
-- TOC entry 2991 (class 0 OID 16386)
-- Dependencies: 203
-- Data for Name: app; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.app (id, create_date, description, title, update_date, views, logo_id, user_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 16394)
-- Dependencies: 204
-- Data for Name: app_comments; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.app_comments (app_id, comments_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 16397)
-- Dependencies: 205
-- Data for Name: app_ratings; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.app_ratings (app_id, ratings_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 16400)
-- Dependencies: 206
-- Data for Name: app_screenshots; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.app_screenshots (app_id, screenshots_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 16403)
-- Dependencies: 207
-- Data for Name: app_tags; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.app_tags (app_id, tags_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 16408)
-- Dependencies: 208
-- Data for Name: comment; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.comment (id, create_date, text, user_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 16413)
-- Dependencies: 209
-- Data for Name: feedback; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.feedback (id, content, subject) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 16421)
-- Dependencies: 210
-- Data for Name: logo; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.logo (id, content_type, filename, image_data) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 16429)
-- Dependencies: 211
-- Data for Name: rating; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.rating (id, create_date, stars, user_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 16434)
-- Dependencies: 212
-- Data for Name: screenshot; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.screenshot (id, content_type, filename, image_data) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 16442)
-- Dependencies: 213
-- Data for Name: tag; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.tag (id, name) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 16447)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: appstore; Owner: admin
--

COPY appstore.users (id, create_date, email, name, password, role, update_date) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 215
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: appstore; Owner: admin
--

SELECT pg_catalog.setval('appstore.hibernate_sequence', 1, true);


--
-- TOC entry 2828 (class 2606 OID 16393)
-- Name: app app_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app
    ADD CONSTRAINT app_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 16407)
-- Name: app_tags app_tags_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_tags
    ADD CONSTRAINT app_tags_pkey PRIMARY KEY (app_id, tags_id);


--
-- TOC entry 2840 (class 2606 OID 16412)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 16420)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 16428)
-- Name: logo logo_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.logo
    ADD CONSTRAINT logo_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 16433)
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 16441)
-- Name: screenshot screenshot_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.screenshot
    ADD CONSTRAINT screenshot_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 16446)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 16460)
-- Name: app_screenshots uk_8av8qc5t8na8wfhf3q7r1i42e; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_screenshots
    ADD CONSTRAINT uk_8av8qc5t8na8wfhf3q7r1i42e UNIQUE (screenshots_id);


--
-- TOC entry 2832 (class 2606 OID 16458)
-- Name: app_ratings uk_rjv7fqpkp929s5cw3bsjc5tp7; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_ratings
    ADD CONSTRAINT uk_rjv7fqpkp929s5cw3bsjc5tp7 UNIQUE (ratings_id);


--
-- TOC entry 2838 (class 2606 OID 16462)
-- Name: app_tags uk_s0c3otdwaqaegmuivd5ojsuw9; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_tags
    ADD CONSTRAINT uk_s0c3otdwaqaegmuivd5ojsuw9 UNIQUE (tags_id);


--
-- TOC entry 2830 (class 2606 OID 16456)
-- Name: app_comments uk_seqe2d3r54u7f3mdwpgq08ot9; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_comments
    ADD CONSTRAINT uk_seqe2d3r54u7f3mdwpgq08ot9 UNIQUE (comments_id);


--
-- TOC entry 2852 (class 2606 OID 16454)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 16490)
-- Name: app_ratings fk7mu0fqfu19soh60gqppjxheii; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_ratings
    ADD CONSTRAINT fk7mu0fqfu19soh60gqppjxheii FOREIGN KEY (app_id) REFERENCES appstore.app(id);


--
-- TOC entry 2857 (class 2606 OID 16485)
-- Name: app_ratings fk8iuc6gyj3vnftp2cmctc4f0um; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_ratings
    ADD CONSTRAINT fk8iuc6gyj3vnftp2cmctc4f0um FOREIGN KEY (ratings_id) REFERENCES appstore.rating(id);


--
-- TOC entry 2856 (class 2606 OID 16480)
-- Name: app_comments fkc1sltfa9f2a4p5s5wnso0awaw; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_comments
    ADD CONSTRAINT fkc1sltfa9f2a4p5s5wnso0awaw FOREIGN KEY (app_id) REFERENCES appstore.app(id);


--
-- TOC entry 2861 (class 2606 OID 16505)
-- Name: app_tags fkcq7avln6qjj0i8wmr3sre7xw8; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_tags
    ADD CONSTRAINT fkcq7avln6qjj0i8wmr3sre7xw8 FOREIGN KEY (tags_id) REFERENCES appstore.tag(id);


--
-- TOC entry 2859 (class 2606 OID 16495)
-- Name: app_screenshots fkd4u4x15q22fec5i91u2e4f9oy; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_screenshots
    ADD CONSTRAINT fkd4u4x15q22fec5i91u2e4f9oy FOREIGN KEY (screenshots_id) REFERENCES appstore.screenshot(id);


--
-- TOC entry 2864 (class 2606 OID 16520)
-- Name: rating fkf68lgbsbxl310n0jifwpfqgfh; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.rating
    ADD CONSTRAINT fkf68lgbsbxl310n0jifwpfqgfh FOREIGN KEY (user_id) REFERENCES appstore.users(id);


--
-- TOC entry 2860 (class 2606 OID 16500)
-- Name: app_screenshots fkh2co5g7dxk5ox6f0vs2ndmf5q; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_screenshots
    ADD CONSTRAINT fkh2co5g7dxk5ox6f0vs2ndmf5q FOREIGN KEY (app_id) REFERENCES appstore.app(id);


--
-- TOC entry 2853 (class 2606 OID 16465)
-- Name: app fkltcr3g2r4oeq8gsnmb2mtg74v; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app
    ADD CONSTRAINT fkltcr3g2r4oeq8gsnmb2mtg74v FOREIGN KEY (logo_id) REFERENCES appstore.logo(id);


--
-- TOC entry 2855 (class 2606 OID 16475)
-- Name: app_comments fknfvydfrrhxta4x7kn2jw2cy5s; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_comments
    ADD CONSTRAINT fknfvydfrrhxta4x7kn2jw2cy5s FOREIGN KEY (comments_id) REFERENCES appstore.comment(id);


--
-- TOC entry 2862 (class 2606 OID 16510)
-- Name: app_tags fkoml600fijiupv7n2vvjh5y3ij; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app_tags
    ADD CONSTRAINT fkoml600fijiupv7n2vvjh5y3ij FOREIGN KEY (app_id) REFERENCES appstore.app(id);


--
-- TOC entry 2863 (class 2606 OID 16515)
-- Name: comment fkqm52p1v3o13hy268he0wcngr5; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.comment
    ADD CONSTRAINT fkqm52p1v3o13hy268he0wcngr5 FOREIGN KEY (user_id) REFERENCES appstore.users(id);


--
-- TOC entry 2854 (class 2606 OID 16470)
-- Name: app fkrg13kosb7h3l891k21n0ddest; Type: FK CONSTRAINT; Schema: appstore; Owner: admin
--

ALTER TABLE ONLY appstore.app
    ADD CONSTRAINT fkrg13kosb7h3l891k21n0ddest FOREIGN KEY (user_id) REFERENCES appstore.users(id);


-- Completed on 2019-10-24 05:31:44 UTC

--
-- PostgreSQL database dump complete
--