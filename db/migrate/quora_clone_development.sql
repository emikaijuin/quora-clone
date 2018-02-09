--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answer_users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE answer_users (
    id integer NOT NULL,
    user_id integer,
    answer_id integer
);


ALTER TABLE public.answer_users OWNER TO ubuntu;

--
-- Name: answer_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE answer_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_users_id_seq OWNER TO ubuntu;

--
-- Name: answer_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE answer_users_id_seq OWNED BY answer_users.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    answer character varying,
    votes integer,
    question_id integer
);


ALTER TABLE public.answers OWNER TO ubuntu;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO ubuntu;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO ubuntu;

--
-- Name: question_users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE question_users (
    id integer NOT NULL,
    user_id integer,
    question_id integer
);


ALTER TABLE public.question_users OWNER TO ubuntu;

--
-- Name: question_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE question_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_users_id_seq OWNER TO ubuntu;

--
-- Name: question_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE question_users_id_seq OWNED BY question_users.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    question character varying,
    description character varying,
    votes integer,
    user_id integer
);


ALTER TABLE public.questions OWNER TO ubuntu;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO ubuntu;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ubuntu;

--
-- Name: user_answers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE user_answers (
    id integer NOT NULL,
    user_id integer,
    answer_id integer
);


ALTER TABLE public.user_answers OWNER TO ubuntu;

--
-- Name: user_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE user_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_answers_id_seq OWNER TO ubuntu;

--
-- Name: user_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE user_answers_id_seq OWNED BY user_answers.id;


--
-- Name: user_questions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE user_questions (
    id integer NOT NULL,
    user_id integer,
    question_id integer
);


ALTER TABLE public.user_questions OWNER TO ubuntu;

--
-- Name: user_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE user_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_questions_id_seq OWNER TO ubuntu;

--
-- Name: user_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE user_questions_id_seq OWNED BY user_questions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying,
    cookie_key character varying,
    password_digest character varying
);


ALTER TABLE public.users OWNER TO ubuntu;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ubuntu;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY answer_users ALTER COLUMN id SET DEFAULT nextval('answer_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY question_users ALTER COLUMN id SET DEFAULT nextval('question_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY user_answers ALTER COLUMN id SET DEFAULT nextval('user_answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY user_questions ALTER COLUMN id SET DEFAULT nextval('user_questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: answer_users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY answer_users (id, user_id, answer_id) FROM stdin;
1	4	6
2	6	10
3	4	10
4	4	7
\.


--
-- Name: answer_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('answer_users_id_seq', 4, true);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY answers (id, answer, votes, question_id) FROM stdin;
8	I have two questions instead	2	6
9	I have a quesiton!!	4	6
6	He's a farthingale	3	5
10	I hope I can vote on this answer	3	7
7	He's fibrous like a napa cabbage	2	5
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('answers_id_seq', 10, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2018-02-08 09:12:46.609962	2018-02-08 09:12:46.609962
\.


--
-- Data for Name: question_users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY question_users (id, user_id, question_id) FROM stdin;
\.


--
-- Name: question_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('question_users_id_seq', 1, false);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY questions (id, question, description, votes, user_id) FROM stdin;
5	Do you think Pedro is cool?	I do!!!	5	4
6	Who has a question?	I have a question 	4	5
7	Is this test going to work?		1	6
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('questions_id_seq', 7, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY schema_migrations (version) FROM stdin;
20180207053954
20180207054005
20180208034245
20180208034246
20180208080249
20180208084431
20180208091106
20180208091124
20180208094504
20180208094512
20180208095209
20180208095359
20180208102147
20180208102212
20180208095210
20180208095360
\.


--
-- Data for Name: user_answers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY user_answers (id, user_id, answer_id) FROM stdin;
\.


--
-- Name: user_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('user_answers_id_seq', 1, false);


--
-- Data for Name: user_questions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY user_questions (id, user_id, question_id) FROM stdin;
\.


--
-- Name: user_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('user_questions_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY users (id, username, cookie_key, password_digest) FROM stdin;
4	alberteinstein	d0e4f7a703e668a4eab50d3801e9c855	$2a$10$eh.WEkikeGmKJZ/KzzbEYOFk0.Xg.eqYXWvFi4fmEICkwC0tk9bCa
5	PPP 	0ebbfe62c36f4224c6f07da41554b687	$2a$10$C0RCSuHZDhbsXbM3lGVHEu5LQxYJIBVLBeFqKUqnHk9umqDDPSYhO
6	emikaijuin	4a86b6098bbad04a9aef108874ab0bab	$2a$10$cJyTFLToicZNr/LX6dByMOt5JYd2/BxNjb3MIB5jngX.a2GZIJY4O
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('users_id_seq', 6, true);


--
-- Name: answer_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY answer_users
    ADD CONSTRAINT answer_users_pkey PRIMARY KEY (id);


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: question_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY question_users
    ADD CONSTRAINT question_users_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: user_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY user_answers
    ADD CONSTRAINT user_answers_pkey PRIMARY KEY (id);


--
-- Name: user_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY user_questions
    ADD CONSTRAINT user_questions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_answer_users_on_answer_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_answer_users_on_answer_id ON answer_users USING btree (answer_id);


--
-- Name: index_answer_users_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_answer_users_on_user_id ON answer_users USING btree (user_id);


--
-- Name: index_question_users_on_question_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_question_users_on_question_id ON question_users USING btree (question_id);


--
-- Name: index_question_users_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_question_users_on_user_id ON question_users USING btree (user_id);


--
-- Name: index_user_answers_on_answer_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_user_answers_on_answer_id ON user_answers USING btree (answer_id);


--
-- Name: index_user_answers_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_user_answers_on_user_id ON user_answers USING btree (user_id);


--
-- Name: index_user_questions_on_question_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_user_questions_on_question_id ON user_questions USING btree (question_id);


--
-- Name: index_user_questions_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_user_questions_on_user_id ON user_questions USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_047ab75908; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT fk_rails_047ab75908 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_234d43ec7e; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY user_questions
    ADD CONSTRAINT fk_rails_234d43ec7e FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: fk_rails_29957b18ea; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY user_answers
    ADD CONSTRAINT fk_rails_29957b18ea FOREIGN KEY (answer_id) REFERENCES answers(id);


--
-- Name: fk_rails_3a345593b5; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY question_users
    ADD CONSTRAINT fk_rails_3a345593b5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_3d5ed4418f; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT fk_rails_3d5ed4418f FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: fk_rails_6404987cdd; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY answer_users
    ADD CONSTRAINT fk_rails_6404987cdd FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_65de0e5ca4; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY user_questions
    ADD CONSTRAINT fk_rails_65de0e5ca4 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_6618f3e4a7; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY question_users
    ADD CONSTRAINT fk_rails_6618f3e4a7 FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: fk_rails_b8a843d293; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY user_answers
    ADD CONSTRAINT fk_rails_b8a843d293 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_ed4975c0c5; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY answer_users
    ADD CONSTRAINT fk_rails_ed4975c0c5 FOREIGN KEY (answer_id) REFERENCES answers(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

