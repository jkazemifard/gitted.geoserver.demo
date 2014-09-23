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
-- Name: geom_eu34_nuts2006_poly; Type: TABLE; Schema: public; Owner: aire; Tablespace: 
--

CREATE TABLE geom_eu34_nuts2006_poly (
    ogc_fid integer NOT NULL,
    wkb_geometry geometry,
    id character(10),
    CONSTRAINT enforce_dims_wkb_geometry CHECK ((st_ndims(wkb_geometry) = 2)),
    CONSTRAINT enforce_srid_wkb_geometry CHECK ((srid(wkb_geometry) = 3035))
);


ALTER TABLE public.geom_eu34_nuts2006_poly OWNER TO aire;

--
-- Name: geom_eu34_nuts2006_poly_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: aire
--

CREATE SEQUENCE geom_eu34_nuts2006_poly_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geom_eu34_nuts2006_poly_ogc_fid_seq OWNER TO aire;

--
-- Name: geom_eu34_nuts2006_poly_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aire
--

ALTER SEQUENCE geom_eu34_nuts2006_poly_ogc_fid_seq OWNED BY geom_eu34_nuts2006_poly.ogc_fid;


--
-- Name: ogc_fid; Type: DEFAULT; Schema: public; Owner: aire
--

ALTER TABLE ONLY geom_eu34_nuts2006_poly ALTER COLUMN ogc_fid SET DEFAULT nextval('geom_eu34_nuts2006_poly_ogc_fid_seq'::regclass);


--
-- Name: geom_eu34_nuts2006_poly_pk; Type: CONSTRAINT; Schema: public; Owner: aire; Tablespace: 
--

ALTER TABLE ONLY geom_eu34_nuts2006_poly
    ADD CONSTRAINT geom_eu34_nuts2006_poly_pk PRIMARY KEY (ogc_fid);


--
-- Name: geom_eu34_nuts2006_poly_geom_idx; Type: INDEX; Schema: public; Owner: aire; Tablespace: 
--

CREATE INDEX geom_eu34_nuts2006_poly_geom_idx ON geom_eu34_nuts2006_poly USING gist (wkb_geometry);


--
-- PostgreSQL database dump complete
--

