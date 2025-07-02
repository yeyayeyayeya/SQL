--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.9

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
-- Name: bang_tong_hop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bang_tong_hop (
    "MaSV" text,
    "HoTen" text,
    "MaMH" text,
    "TenMH" text,
    "Diem" double precision,
    "LanThi" bigint,
    "GPA" double precision,
    "XepLoai" text
);


ALTER TABLE public.bang_tong_hop OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

