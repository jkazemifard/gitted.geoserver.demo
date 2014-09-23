--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: geometry_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) FROM stdin;
	public	geom_eu27_grid	wkb_geometry	2	3035	GEOMETRY
	public	info_nuts2006	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_nuts2006_poly	wkb_geometry	2	3035	GEOMETRY
\.


--
-- PostgreSQL database dump complete
--
