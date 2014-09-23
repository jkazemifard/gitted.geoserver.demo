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
-- Data for Name: geometry_columns; Type: TABLE DATA; Schema: public; Owner: aire
--

COPY geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) FROM stdin;
	public	geom_eu27_grid	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu27_nuts2006_centres	wkb_geometry	2	3035	POINT
	public	geom_eu27_nuts2006_contig	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu27_nuts2006_poly	wkb_geometry	2	3035	GEOMETRY
	public	geom_test_nuts2006_anamorph_d3avg	wkb_geometry	2	3035	GEOMETRY
	public	info_nuts2006	wkb_geometry	2	3035	GEOMETRY
	public	world_wuts5	wkb_geometry	2	900917	GEOMETRY
	public	world_wuts5_centres	wkb_geometry	2	900917	POINT
	public	geom_eu31_nuts2006_centres	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu31_nuts2006_poly	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu31_nuts2006_contig	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu31_grid	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_nuts2006_poly	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_grid	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_nuts2006_contig	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_nuts2006_centres	wkb_geometry	2	3035	GEOMETRY
	public	eu34_nuts3_2006_to_grid	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_gdp2007	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_popt2007	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu27_nuts2006_rd_exp_tot	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_fem_lev_educ_tot3	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_tot_act_pop2	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_lev_educ_tot1	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_lev_educ_tot2	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts0_tot_lev_educ_total	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_lev_educ_tot22	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_mal_lev_educ_tot4	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_nb_empl_tot	wkb_geometry	2	3035	GEOMETRY
	public	anam_nuts2006_nb_empl_tot	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_fem_lev_educ_tot5	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_tot_act_pop3	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_tot_act_pop4	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_tot_act_pop5	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_tot_act_pop6	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_tot_act_pop7	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2006_rd_exp_tot	wkb_geometry	2	-1	GEOMETRY
	public	anam_eu34_nuts2006_rd_exp_tot2	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_nuts2010_grid	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu31_nuts2010_poly	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu31_nuts2010_grid	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu27_nuts2010_grid	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_nuts2010_poly	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu27_nuts2010_poly	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu27_nuts2010_centres	wkb_geometry	2	3035	POINT
	public	geom_eu31_nuts2010_centres	wkb_geometry	2	3035	POINT
	public	geom_eu34_nuts2010_centres	wkb_geometry	2	3035	POINT
	public	geom_eu27_nuts2010_contig	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu31_nuts2010_contig	wkb_geometry	2	3035	GEOMETRY
	public	geom_eu34_nuts2010_contig	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2010_gdp2008	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2010_gdppps2008	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2010_pop15_64_2009	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2010_popt2009	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2010_popt2011	wkb_geometry	2	3035	GEOMETRY
	public	anam_eu34_nuts2010_unemp2009	wkb_geometry	2	3035	GEOMETRY
\.


--
-- PostgreSQL database dump complete
--

