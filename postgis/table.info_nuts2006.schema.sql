--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: info_nuts2006; Type: TABLE; Schema: public; Owner: aire; Tablespace: 
--

CREATE TABLE info_nuts2006 (
    ogc_fid integer NOT NULL,
    wkb_geometry geometry,
    id character varying,
    name character varying,
    nuts0 integer,
    nuts1 integer,
    nuts2 integer,
    nuts23 integer,
    nuts3 integer,
    zoning character varying,
    CONSTRAINT enforce_dims_wkb_geometry CHECK ((st_ndims(wkb_geometry) = 2)),
    CONSTRAINT enforce_srid_wkb_geometry CHECK ((st_srid(wkb_geometry) = (-1)))
);


ALTER TABLE public.info_nuts2006 OWNER TO aire;

--
-- Name: info_nuts2006_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: aire
--

CREATE SEQUENCE info_nuts2006_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.info_nuts2006_ogc_fid_seq OWNER TO aire;

--
-- Name: info_nuts2006_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aire
--

ALTER SEQUENCE info_nuts2006_ogc_fid_seq OWNED BY info_nuts2006.ogc_fid;


--
-- Name: ogc_fid; Type: DEFAULT; Schema: public; Owner: aire
--

ALTER TABLE ONLY info_nuts2006 ALTER COLUMN ogc_fid SET DEFAULT nextval('info_nuts2006_ogc_fid_seq'::regclass);


--
-- Name: info_nuts2006_pk; Type: CONSTRAINT; Schema: public; Owner: aire; Tablespace: 
--

ALTER TABLE ONLY info_nuts2006
    ADD CONSTRAINT info_nuts2006_pk PRIMARY KEY (ogc_fid);


--
-- Name: info_nuts2006_geom_idx; Type: INDEX; Schema: public; Owner: aire; Tablespace: 
--

CREATE INDEX info_nuts2006_geom_idx ON info_nuts2006 USING gist (wkb_geometry);


--
-- PostgreSQL database dump complete
--

