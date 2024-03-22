--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-10 23:06:18 EST

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
-- TOC entry 3666 (class 1262 OID 16384)
-- Name: indian_medicine_data; Type: DATABASE; Schema: -; Owner: nagamanasapalaparthi
--

CREATE DATABASE indian_medicine_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE indian_medicine_data OWNER TO nagamanasapalaparthi;

\connect indian_medicine_data

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: nagamanasapalaparthi
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO nagamanasapalaparthi;

--
-- TOC entry 221 (class 1255 OID 16533)
-- Name: log_product_update(); Type: FUNCTION; Schema: public; Owner: nagamanasapalaparthi
--

CREATE FUNCTION public.log_product_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO product_info_update_log (product_id, old_price, new_price, updated_at)
    VALUES (NEW.product_id, OLD.product_price, NEW.product_price, NOW());
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.log_product_update() OWNER TO nagamanasapalaparthi;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16385)
-- Name: Basic Product Info; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Basic Product Info" (
    product_id integer NOT NULL,
    sub_category_id integer,
    manufacturer_id integer,
    product_name text,
    product_price double precision
);


ALTER TABLE public."Basic Product Info" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 210 (class 1259 OID 16390)
-- Name: Drug Interactions Table; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Drug Interactions Table" (
    product_id integer,
    interaction text,
    interaction_id integer NOT NULL
);


ALTER TABLE public."Drug Interactions Table" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 217 (class 1259 OID 16470)
-- Name: manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE SEQUENCE public.manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manufacturer_id_seq OWNER TO nagamanasapalaparthi;

--
-- TOC entry 211 (class 1259 OID 16395)
-- Name: Manufacturer Table; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Manufacturer Table" (
    manufacturer_id integer DEFAULT nextval('public.manufacturer_id_seq'::regclass) NOT NULL,
    product_manufactured text
);


ALTER TABLE public."Manufacturer Table" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 218 (class 1259 OID 16472)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO nagamanasapalaparthi;

--
-- TOC entry 212 (class 1259 OID 16400)
-- Name: Medicine Details; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Medicine Details" (
    product_id integer DEFAULT nextval('public.product_id_seq'::regclass) NOT NULL,
    medicine_desc text,
    side_effects text
);


ALTER TABLE public."Medicine Details" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 213 (class 1259 OID 16405)
-- Name: Product Drug Interactions; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Product Drug Interactions" (
    product_id integer NOT NULL,
    interaction_id integer NOT NULL
);


ALTER TABLE public."Product Drug Interactions" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 214 (class 1259 OID 16408)
-- Name: Product Salt Composition; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Product Salt Composition" (
    product_id integer NOT NULL,
    salt_id integer NOT NULL
);


ALTER TABLE public."Product Salt Composition" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 215 (class 1259 OID 16411)
-- Name: Salt Composition; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Salt Composition" (
    salt_id integer NOT NULL,
    salt_composition text
);


ALTER TABLE public."Salt Composition" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 216 (class 1259 OID 16416)
-- Name: Sub Category; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public."Sub Category" (
    sub_category_id integer NOT NULL,
    sub_category text
);


ALTER TABLE public."Sub Category" OWNER TO nagamanasapalaparthi;

--
-- TOC entry 220 (class 1259 OID 16527)
-- Name: product_info_update_log; Type: TABLE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TABLE public.product_info_update_log (
    log_id integer NOT NULL,
    product_id integer,
    old_price double precision,
    new_price double precision,
    updated_at timestamp without time zone
);


ALTER TABLE public.product_info_update_log OWNER TO nagamanasapalaparthi;

--
-- TOC entry 219 (class 1259 OID 16526)
-- Name: product_info_update_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: nagamanasapalaparthi
--

CREATE SEQUENCE public.product_info_update_log_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_info_update_log_log_id_seq OWNER TO nagamanasapalaparthi;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_info_update_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nagamanasapalaparthi
--

ALTER SEQUENCE public.product_info_update_log_log_id_seq OWNED BY public.product_info_update_log.log_id;


--
-- TOC entry 3489 (class 2604 OID 16530)
-- Name: product_info_update_log log_id; Type: DEFAULT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public.product_info_update_log ALTER COLUMN log_id SET DEFAULT nextval('public.product_info_update_log_log_id_seq'::regclass);


--
-- TOC entry 3491 (class 2606 OID 16445)
-- Name: Basic Product Info Basic Product Info_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Basic Product Info"
    ADD CONSTRAINT "Basic Product Info_pkey" PRIMARY KEY (product_id);


--
-- TOC entry 3495 (class 2606 OID 16459)
-- Name: Drug Interactions Table Drug Interactions Table_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Drug Interactions Table"
    ADD CONSTRAINT "Drug Interactions Table_pkey" PRIMARY KEY (interaction_id);


--
-- TOC entry 3497 (class 2606 OID 16429)
-- Name: Manufacturer Table Manufacturer Table_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Manufacturer Table"
    ADD CONSTRAINT "Manufacturer Table_pkey" PRIMARY KEY (manufacturer_id);


--
-- TOC entry 3502 (class 2606 OID 16490)
-- Name: Product Drug Interactions Product Drug Interactions_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Product Drug Interactions"
    ADD CONSTRAINT "Product Drug Interactions_pkey" PRIMARY KEY (product_id, interaction_id);


--
-- TOC entry 3505 (class 2606 OID 16449)
-- Name: Product Salt Composition Product Salt Composition_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Product Salt Composition"
    ADD CONSTRAINT "Product Salt Composition_pkey" PRIMARY KEY (product_id, salt_id);


--
-- TOC entry 3508 (class 2606 OID 16451)
-- Name: Salt Composition Salt Composition_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Salt Composition"
    ADD CONSTRAINT "Salt Composition_pkey" PRIMARY KEY (salt_id);


--
-- TOC entry 3510 (class 2606 OID 16447)
-- Name: Sub Category Sub Category_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Sub Category"
    ADD CONSTRAINT "Sub Category_pkey" PRIMARY KEY (sub_category_id);


--
-- TOC entry 3500 (class 2606 OID 16516)
-- Name: Medicine Details pf_product; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Medicine Details"
    ADD CONSTRAINT pf_product PRIMARY KEY (product_id);


--
-- TOC entry 3512 (class 2606 OID 16532)
-- Name: product_info_update_log product_info_update_log_pkey; Type: CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public.product_info_update_log
    ADD CONSTRAINT product_info_update_log_pkey PRIMARY KEY (log_id);


--
-- TOC entry 3492 (class 1259 OID 16537)
-- Name: idx_basic_product_info_product_id; Type: INDEX; Schema: public; Owner: nagamanasapalaparthi
--

CREATE INDEX idx_basic_product_info_product_id ON public."Basic Product Info" USING btree (product_id);


--
-- TOC entry 3498 (class 1259 OID 16536)
-- Name: idx_medicine_details_product_id; Type: INDEX; Schema: public; Owner: nagamanasapalaparthi
--

CREATE INDEX idx_medicine_details_product_id ON public."Medicine Details" USING btree (product_id);


--
-- TOC entry 3503 (class 1259 OID 16538)
-- Name: idx_product_drug_interactions_product_id; Type: INDEX; Schema: public; Owner: nagamanasapalaparthi
--

CREATE INDEX idx_product_drug_interactions_product_id ON public."Product Drug Interactions" USING btree (product_id);


--
-- TOC entry 3493 (class 1259 OID 16535)
-- Name: idx_product_price; Type: INDEX; Schema: public; Owner: nagamanasapalaparthi
--

CREATE INDEX idx_product_price ON public."Basic Product Info" USING btree (product_price);


--
-- TOC entry 3506 (class 1259 OID 16539)
-- Name: idx_product_salt_composition_product_id; Type: INDEX; Schema: public; Owner: nagamanasapalaparthi
--

CREATE INDEX idx_product_salt_composition_product_id ON public."Product Salt Composition" USING btree (product_id);


--
-- TOC entry 3521 (class 2620 OID 16534)
-- Name: Basic Product Info trigger_product_info_update; Type: TRIGGER; Schema: public; Owner: nagamanasapalaparthi
--

CREATE TRIGGER trigger_product_info_update AFTER UPDATE ON public."Basic Product Info" FOR EACH ROW EXECUTE FUNCTION public.log_product_update();


--
-- TOC entry 3513 (class 2606 OID 16465)
-- Name: Basic Product Info Basic Product Info_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Basic Product Info"
    ADD CONSTRAINT "Basic Product Info_manufacturer_id_fkey" FOREIGN KEY (manufacturer_id) REFERENCES public."Manufacturer Table"(manufacturer_id);


--
-- TOC entry 3514 (class 2606 OID 16460)
-- Name: Basic Product Info Basic Product Info_sub_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Basic Product Info"
    ADD CONSTRAINT "Basic Product Info_sub_category_id_fkey" FOREIGN KEY (sub_category_id) REFERENCES public."Sub Category"(sub_category_id);


--
-- TOC entry 3515 (class 2606 OID 16474)
-- Name: Drug Interactions Table Drug Interactions Table_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Drug Interactions Table"
    ADD CONSTRAINT "Drug Interactions Table_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public."Basic Product Info"(product_id);


--
-- TOC entry 3516 (class 2606 OID 16479)
-- Name: Medicine Details Medicine Details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Medicine Details"
    ADD CONSTRAINT "Medicine Details_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public."Basic Product Info"(product_id);


--
-- TOC entry 3517 (class 2606 OID 16500)
-- Name: Product Drug Interactions fk_interaction; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Product Drug Interactions"
    ADD CONSTRAINT fk_interaction FOREIGN KEY (interaction_id) REFERENCES public."Drug Interactions Table"(interaction_id);


--
-- TOC entry 3518 (class 2606 OID 16495)
-- Name: Product Drug Interactions fk_product; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Product Drug Interactions"
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public."Basic Product Info"(product_id);


--
-- TOC entry 3519 (class 2606 OID 16505)
-- Name: Product Salt Composition fk_product; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Product Salt Composition"
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public."Basic Product Info"(product_id);


--
-- TOC entry 3520 (class 2606 OID 16510)
-- Name: Product Salt Composition fk_salt; Type: FK CONSTRAINT; Schema: public; Owner: nagamanasapalaparthi
--

ALTER TABLE ONLY public."Product Salt Composition"
    ADD CONSTRAINT fk_salt FOREIGN KEY (salt_id) REFERENCES public."Salt Composition"(salt_id);


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: nagamanasapalaparthi
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-12-10 23:06:18 EST

--
-- PostgreSQL database dump complete
--

