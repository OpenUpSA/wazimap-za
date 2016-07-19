--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.youth_gender_population_group DROP CONSTRAINT IF EXISTS youth_gender_population_group_pkey;
DROP TABLE IF EXISTS public.youth_gender_population_group;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: youth_gender_population_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE youth_gender_population_group (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    gender character varying(128) NOT NULL,
    "population group" character varying(128) NOT NULL,
    total integer NOT NULL
);


--
-- Data for Name: youth_gender_population_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY youth_gender_population_group (geo_level, geo_code, gender, "population group", total) FROM stdin;
province	WC	Male	Black African	193768
province	WC	Female	Black African	209840
province	WC	Male	Coloured	258935
province	WC	Female	Coloured	262743
province	WC	Male	Indian or Asian	5804
province	WC	Female	Indian or Asian	5198
province	WC	Male	White	55353
province	WC	Female	White	55158
province	WC	Male	Other	8863
province	WC	Female	Other	5394
district	CPT	Male	Black African	144987
district	CPT	Female	Black African	160984
district	CPT	Male	Coloured	143559
district	CPT	Female	Coloured	145162
district	CPT	Male	Indian or Asian	4859
district	CPT	Female	Indian or Asian	4394
district	CPT	Male	White	35073
district	CPT	Female	White	34941
district	CPT	Male	Other	6526
district	CPT	Female	Other	4145
district	DC1	Male	Black African	7261
district	DC1	Female	Black African	7570
district	DC1	Male	Coloured	23485
district	DC1	Female	Coloured	24130
district	DC1	Male	Indian or Asian	223
district	DC1	Female	Indian or Asian	192
district	DC1	Male	White	3235
district	DC1	Female	White	3183
district	DC1	Male	Other	372
district	DC1	Female	Other	163
district	DC2	Male	Black African	20682
district	DC2	Female	Black African	20259
district	DC2	Male	Coloured	46975
district	DC2	Female	Coloured	47280
district	DC2	Male	Indian or Asian	381
district	DC2	Female	Indian or Asian	318
district	DC2	Male	White	9841
district	DC2	Female	White	10076
district	DC2	Male	Other	803
district	DC2	Female	Other	486
district	DC3	Male	Black African	6838
district	DC3	Female	Black African	6325
district	DC3	Male	Coloured	12269
district	DC3	Female	Coloured	12728
district	DC3	Male	Indian or Asian	82
district	DC3	Female	Indian or Asian	53
district	DC3	Male	White	1837
district	DC3	Female	White	1735
district	DC3	Male	Other	308
district	DC3	Female	Other	148
district	DC4	Male	Black African	13186
district	DC4	Female	Black African	13871
district	DC4	Male	Coloured	28007
district	DC4	Female	Coloured	28758
district	DC4	Male	Indian or Asian	231
district	DC4	Female	Indian or Asian	224
district	DC4	Male	White	5004
district	DC4	Female	White	4916
district	DC4	Male	Other	805
district	DC4	Female	Other	429
district	DC5	Male	Black African	814
district	DC5	Female	Black African	830
district	DC5	Male	Coloured	4639
district	DC5	Female	Coloured	4684
district	DC5	Male	Indian or Asian	28
district	DC5	Female	Indian or Asian	17
district	DC5	Male	White	362
district	DC5	Female	White	306
district	DC5	Male	Other	48
district	DC5	Female	Other	23
municipality	CPT	Male	Black African	144987
municipality	CPT	Female	Black African	160984
municipality	CPT	Male	Coloured	143559
municipality	CPT	Female	Coloured	145162
municipality	CPT	Male	Indian or Asian	4859
municipality	CPT	Female	Indian or Asian	4394
municipality	CPT	Male	White	35073
municipality	CPT	Female	White	34941
municipality	CPT	Male	Other	6526
municipality	CPT	Female	Other	4145
municipality	WC011	Male	Black African	736
municipality	WC011	Female	Black African	589
municipality	WC011	Male	Coloured	4692
municipality	WC011	Female	Coloured	4804
municipality	WC011	Male	Indian or Asian	37
municipality	WC011	Female	Indian or Asian	37
municipality	WC011	Male	White	564
municipality	WC011	Female	White	576
municipality	WC011	Male	Other	88
municipality	WC011	Female	Other	63
municipality	WC012	Male	Black African	826
municipality	WC012	Female	Black African	772
municipality	WC012	Male	Coloured	3261
municipality	WC012	Female	Coloured	3250
municipality	WC012	Male	Indian or Asian	22
municipality	WC012	Female	Indian or Asian	17
municipality	WC012	Male	White	275
municipality	WC012	Female	White	251
municipality	WC012	Male	Other	23
municipality	WC012	Female	Other	3
municipality	WC013	Male	Black African	726
municipality	WC013	Female	Black African	1062
municipality	WC013	Male	Coloured	3733
municipality	WC013	Female	Coloured	3959
municipality	WC013	Male	Indian or Asian	27
municipality	WC013	Female	Indian or Asian	17
municipality	WC013	Male	White	526
municipality	WC013	Female	White	512
municipality	WC013	Male	Other	51
municipality	WC013	Female	Other	20
municipality	WC014	Male	Black African	2606
municipality	WC014	Female	Black African	2611
municipality	WC014	Male	Coloured	5113
municipality	WC014	Female	Coloured	5224
municipality	WC014	Male	Indian or Asian	80
municipality	WC014	Female	Indian or Asian	76
municipality	WC014	Male	White	997
municipality	WC014	Female	White	973
municipality	WC014	Male	Other	102
municipality	WC014	Female	Other	33
municipality	WC015	Male	Black African	2366
municipality	WC015	Female	Black African	2537
municipality	WC015	Male	Coloured	6685
municipality	WC015	Female	Coloured	6894
municipality	WC015	Male	Indian or Asian	57
municipality	WC015	Female	Indian or Asian	45
municipality	WC015	Male	White	873
municipality	WC015	Female	White	871
municipality	WC015	Male	Other	109
municipality	WC015	Female	Other	44
municipality	WC022	Male	Black African	3610
municipality	WC022	Female	Black African	2791
municipality	WC022	Male	Coloured	7294
municipality	WC022	Female	Coloured	7255
municipality	WC022	Male	Indian or Asian	46
municipality	WC022	Female	Indian or Asian	22
municipality	WC022	Male	White	670
municipality	WC022	Female	White	421
municipality	WC022	Male	Other	95
municipality	WC022	Female	Other	49
municipality	WC023	Male	Black African	6248
municipality	WC023	Female	Black African	6095
municipality	WC023	Male	Coloured	15500
municipality	WC023	Female	Coloured	15021
municipality	WC023	Male	Indian or Asian	110
municipality	WC023	Female	Indian or Asian	112
municipality	WC023	Male	White	2450
municipality	WC023	Female	White	2694
municipality	WC023	Male	Other	262
municipality	WC023	Female	Other	145
municipality	WC024	Male	Black African	5193
municipality	WC024	Female	Black African	5631
municipality	WC024	Male	Coloured	8106
municipality	WC024	Female	Coloured	8468
municipality	WC024	Male	Indian or Asian	104
municipality	WC024	Female	Indian or Asian	94
municipality	WC024	Male	White	5018
municipality	WC024	Female	White	5377
municipality	WC024	Male	Other	182
municipality	WC024	Female	Other	91
municipality	WC025	Male	Black African	4122
municipality	WC025	Female	Black African	4185
municipality	WC025	Male	Coloured	9701
municipality	WC025	Female	Coloured	10057
municipality	WC025	Male	Indian or Asian	103
municipality	WC025	Female	Indian or Asian	72
municipality	WC025	Male	White	1166
municipality	WC025	Female	White	1043
municipality	WC025	Male	Other	162
municipality	WC025	Female	Other	144
municipality	WC026	Male	Black African	1509
municipality	WC026	Female	Black African	1558
municipality	WC026	Male	Coloured	6373
municipality	WC026	Female	Coloured	6479
municipality	WC026	Male	Indian or Asian	19
municipality	WC026	Female	Indian or Asian	18
municipality	WC026	Male	White	537
municipality	WC026	Female	White	540
municipality	WC026	Male	Other	102
municipality	WC026	Female	Other	56
municipality	WC031	Male	Black African	3156
municipality	WC031	Female	Black African	2672
municipality	WC031	Male	Coloured	6046
municipality	WC031	Female	Coloured	6141
municipality	WC031	Male	Indian or Asian	35
municipality	WC031	Female	Indian or Asian	24
municipality	WC031	Male	White	498
municipality	WC031	Female	White	441
municipality	WC031	Male	Other	140
municipality	WC031	Female	Other	59
municipality	WC032	Male	Black African	2746
municipality	WC032	Female	Black African	2870
municipality	WC032	Male	Coloured	2135
municipality	WC032	Female	Coloured	2235
municipality	WC032	Male	Indian or Asian	27
municipality	WC032	Female	Indian or Asian	14
municipality	WC032	Male	White	734
municipality	WC032	Female	White	775
municipality	WC032	Male	Other	83
municipality	WC032	Female	Other	46
municipality	WC033	Male	Black African	399
municipality	WC033	Female	Black African	376
municipality	WC033	Male	Coloured	1805
municipality	WC033	Female	Coloured	2056
municipality	WC033	Male	Indian or Asian	8
municipality	WC033	Female	Indian or Asian	10
municipality	WC033	Male	White	334
municipality	WC033	Female	White	291
municipality	WC033	Male	Other	38
municipality	WC033	Female	Other	21
municipality	WC034	Male	Black African	537
municipality	WC034	Female	Black African	407
municipality	WC034	Male	Coloured	2282
municipality	WC034	Female	Coloured	2297
municipality	WC034	Male	Indian or Asian	12
municipality	WC034	Female	Indian or Asian	6
municipality	WC034	Male	White	271
municipality	WC034	Female	White	228
municipality	WC034	Male	Other	48
municipality	WC034	Female	Other	21
municipality	WC041	Male	Black African	122
municipality	WC041	Female	Black African	120
municipality	WC041	Male	Coloured	1891
municipality	WC041	Female	Coloured	1864
municipality	WC041	Male	Indian or Asian	3
municipality	WC041	Female	Indian or Asian	5
municipality	WC041	Male	White	113
municipality	WC041	Female	White	101
municipality	WC041	Male	Other	8
municipality	WC041	Female	Other	11
municipality	WC042	Male	Black African	313
municipality	WC042	Female	Black African	262
municipality	WC042	Male	Coloured	2953
municipality	WC042	Female	Coloured	3155
municipality	WC042	Male	Indian or Asian	21
municipality	WC042	Female	Indian or Asian	24
municipality	WC042	Male	White	440
municipality	WC042	Female	White	467
municipality	WC042	Male	Other	22
municipality	WC042	Female	Other	5
municipality	WC043	Male	Black African	2359
municipality	WC043	Female	Black African	2665
municipality	WC043	Male	Coloured	3370
municipality	WC043	Female	Coloured	3450
municipality	WC043	Male	Indian or Asian	45
municipality	WC043	Female	Indian or Asian	38
municipality	WC043	Male	White	894
municipality	WC043	Female	White	916
municipality	WC043	Male	Other	95
municipality	WC043	Female	Other	41
municipality	WC044	Male	Black African	5216
municipality	WC044	Female	Black African	5541
municipality	WC044	Male	Coloured	8988
municipality	WC044	Female	Coloured	9254
municipality	WC044	Male	Indian or Asian	82
municipality	WC044	Female	Indian or Asian	85
municipality	WC044	Male	White	2065
municipality	WC044	Female	White	2055
municipality	WC044	Male	Other	263
municipality	WC044	Female	Other	102
municipality	WC045	Male	Black African	1030
municipality	WC045	Female	Black African	833
municipality	WC045	Male	Coloured	6990
municipality	WC045	Female	Coloured	7090
municipality	WC045	Male	Indian or Asian	37
municipality	WC045	Female	Indian or Asian	20
municipality	WC045	Male	White	621
municipality	WC045	Female	White	544
municipality	WC045	Male	Other	83
municipality	WC045	Female	Other	40
municipality	WC047	Male	Black African	1942
municipality	WC047	Female	Black African	2052
municipality	WC047	Male	Coloured	1334
municipality	WC047	Female	Coloured	1366
municipality	WC047	Male	Indian or Asian	18
municipality	WC047	Female	Indian or Asian	30
municipality	WC047	Male	White	363
municipality	WC047	Female	White	315
municipality	WC047	Male	Other	242
municipality	WC047	Female	Other	186
municipality	WC048	Male	Black African	2204
municipality	WC048	Female	Black African	2398
municipality	WC048	Male	Coloured	2481
municipality	WC048	Female	Coloured	2578
municipality	WC048	Male	Indian or Asian	26
municipality	WC048	Female	Indian or Asian	22
municipality	WC048	Male	White	509
municipality	WC048	Female	White	518
municipality	WC048	Male	Other	94
municipality	WC048	Female	Other	44
municipality	WC051	Male	Black African	58
municipality	WC051	Female	Black African	40
municipality	WC051	Male	Coloured	521
municipality	WC051	Female	Coloured	543
municipality	WC051	Male	White	35
municipality	WC051	Female	White	27
municipality	WC051	Male	Other	6
municipality	WC051	Female	Other	7
municipality	WC052	Male	Black African	31
municipality	WC052	Female	Black African	26
municipality	WC052	Male	Coloured	1030
municipality	WC052	Female	Coloured	1020
municipality	WC052	Male	Indian or Asian	7
municipality	WC052	Female	Indian or Asian	1
municipality	WC052	Male	White	71
municipality	WC052	Female	White	51
municipality	WC052	Male	Other	8
municipality	WC052	Female	Other	1
municipality	WC053	Male	Black African	725
municipality	WC053	Female	Black African	763
municipality	WC053	Male	Coloured	3089
municipality	WC053	Female	Coloured	3121
municipality	WC053	Male	Indian or Asian	21
municipality	WC053	Female	Indian or Asian	16
municipality	WC053	Male	White	256
municipality	WC053	Female	White	228
municipality	WC053	Male	Other	34
municipality	WC053	Female	Other	15
ward	10101001	Male	Black African	98
ward	10101001	Female	Black African	73
ward	10101001	Male	Coloured	674
ward	10101001	Female	Coloured	629
ward	10101001	Male	Indian or Asian	10
ward	10101001	Female	Indian or Asian	2
ward	10101001	Male	White	63
ward	10101001	Female	White	83
ward	10101001	Male	Other	4
ward	10101001	Female	Other	2
ward	10101002	Male	Black African	74
ward	10101002	Female	Black African	56
ward	10101002	Male	Coloured	572
ward	10101002	Female	Coloured	587
ward	10101002	Male	Indian or Asian	5
ward	10101002	Female	Indian or Asian	5
ward	10101002	Male	White	117
ward	10101002	Female	White	109
ward	10101002	Male	Other	1
ward	10101003	Male	Black African	193
ward	10101003	Female	Black African	173
ward	10101003	Male	Coloured	410
ward	10101003	Female	Coloured	492
ward	10101003	Male	Indian or Asian	2
ward	10101003	Female	Indian or Asian	4
ward	10101003	Male	White	6
ward	10101003	Female	White	8
ward	10101003	Male	Other	33
ward	10101003	Female	Other	12
ward	10101004	Male	Black African	58
ward	10101004	Female	Black African	24
ward	10101004	Male	Coloured	917
ward	10101004	Female	Coloured	904
ward	10101004	Male	Indian or Asian	7
ward	10101004	Female	Indian or Asian	8
ward	10101004	Male	White	24
ward	10101004	Female	White	61
ward	10101004	Male	Other	24
ward	10101004	Female	Other	33
ward	10101005	Male	Black African	36
ward	10101005	Female	Black African	31
ward	10101005	Male	Coloured	388
ward	10101005	Female	Coloured	415
ward	10101005	Male	Indian or Asian	6
ward	10101005	Female	Indian or Asian	4
ward	10101005	Male	White	118
ward	10101005	Female	White	123
ward	10101005	Male	Other	1
ward	10101005	Female	Other	1
ward	10101006	Male	Black African	66
ward	10101006	Female	Black African	59
ward	10101006	Male	Coloured	452
ward	10101006	Female	Coloured	518
ward	10101006	Male	Indian or Asian	5
ward	10101006	Female	Indian or Asian	4
ward	10101006	Male	White	43
ward	10101006	Female	White	40
ward	10101006	Male	Other	10
ward	10101006	Female	Other	6
ward	10101007	Male	Black African	118
ward	10101007	Female	Black African	90
ward	10101007	Male	Coloured	617
ward	10101007	Female	Coloured	592
ward	10101007	Male	Indian or Asian	1
ward	10101007	Female	Indian or Asian	6
ward	10101007	Male	White	130
ward	10101007	Female	White	94
ward	10101007	Male	Other	11
ward	10101007	Female	Other	9
ward	10101008	Male	Black African	93
ward	10101008	Female	Black African	82
ward	10101008	Male	Coloured	662
ward	10101008	Female	Coloured	668
ward	10101008	Male	Indian or Asian	1
ward	10101008	Female	Indian or Asian	3
ward	10101008	Male	White	65
ward	10101008	Female	White	57
ward	10101008	Male	Other	4
ward	10102001	Male	Black African	221
ward	10102001	Female	Black African	164
ward	10102001	Male	Coloured	731
ward	10102001	Female	Coloured	724
ward	10102001	Male	Indian or Asian	3
ward	10102001	Female	Indian or Asian	2
ward	10102001	Male	White	36
ward	10102001	Female	White	38
ward	10102001	Male	Other	5
ward	10102001	Female	Other	1
ward	10102002	Male	Black African	132
ward	10102002	Female	Black African	124
ward	10102002	Male	Coloured	483
ward	10102002	Female	Coloured	425
ward	10102002	Female	Indian or Asian	4
ward	10102002	Male	White	55
ward	10102002	Female	White	50
ward	10102002	Male	Other	4
ward	10102002	Female	Other	2
ward	10102003	Male	Black African	158
ward	10102003	Female	Black African	206
ward	10102003	Male	Coloured	434
ward	10102003	Female	Coloured	466
ward	10102003	Male	Indian or Asian	4
ward	10102003	Female	Indian or Asian	3
ward	10102003	Male	White	13
ward	10102003	Female	White	22
ward	10102003	Male	Other	7
ward	10102004	Male	Black African	141
ward	10102004	Female	Black African	125
ward	10102004	Male	Coloured	631
ward	10102004	Female	Coloured	715
ward	10102004	Male	Indian or Asian	10
ward	10102004	Female	Indian or Asian	7
ward	10102004	Male	White	70
ward	10102004	Female	White	47
ward	10102004	Male	Other	2
ward	10102005	Male	Black African	89
ward	10102005	Female	Black African	62
ward	10102005	Male	Coloured	427
ward	10102005	Female	Coloured	438
ward	10102005	Male	Indian or Asian	1
ward	10102005	Male	White	41
ward	10102005	Female	White	43
ward	10102005	Male	Other	2
ward	10102006	Male	Black African	86
ward	10102006	Female	Black African	90
ward	10102006	Male	Coloured	554
ward	10102006	Female	Coloured	482
ward	10102006	Male	Indian or Asian	4
ward	10102006	Female	Indian or Asian	1
ward	10102006	Male	White	59
ward	10102006	Female	White	51
ward	10102006	Male	Other	2
ward	10103001	Male	Black African	134
ward	10103001	Female	Black African	182
ward	10103001	Male	Coloured	602
ward	10103001	Female	Coloured	585
ward	10103001	Male	Indian or Asian	2
ward	10103001	Female	Indian or Asian	5
ward	10103001	Male	White	140
ward	10103001	Female	White	105
ward	10103001	Male	Other	2
ward	10103001	Female	Other	3
ward	10103002	Male	Black African	5
ward	10103002	Male	Coloured	434
ward	10103002	Female	Coloured	459
ward	10103002	Female	Indian or Asian	1
ward	10103002	Male	Other	2
ward	10103003	Male	Black African	65
ward	10103003	Female	Black African	41
ward	10103003	Male	Coloured	476
ward	10103003	Female	Coloured	484
ward	10103003	Male	Indian or Asian	5
ward	10103003	Female	Indian or Asian	4
ward	10103003	Male	White	117
ward	10103003	Female	White	143
ward	10103003	Male	Other	10
ward	10103003	Female	Other	5
ward	10103004	Male	Black African	127
ward	10103004	Female	Black African	117
ward	10103004	Male	Coloured	671
ward	10103004	Female	Coloured	821
ward	10103004	Male	Indian or Asian	7
ward	10103004	Female	Indian or Asian	2
ward	10103004	Male	White	20
ward	10103004	Female	White	14
ward	10103004	Male	Other	11
ward	10103004	Female	Other	3
ward	10103005	Male	Black African	227
ward	10103005	Female	Black African	546
ward	10103005	Male	Coloured	856
ward	10103005	Female	Coloured	833
ward	10103005	Male	Indian or Asian	3
ward	10103005	Male	White	62
ward	10103005	Female	White	76
ward	10103005	Male	Other	12
ward	10103005	Female	Other	8
ward	10103006	Male	Black African	54
ward	10103006	Female	Black African	39
ward	10103006	Male	Coloured	137
ward	10103006	Female	Coloured	160
ward	10103006	Male	Indian or Asian	1
ward	10103006	Female	Indian or Asian	1
ward	10103006	Male	White	35
ward	10103006	Female	White	42
ward	10103007	Male	Black African	113
ward	10103007	Female	Black African	137
ward	10103007	Male	Coloured	557
ward	10103007	Female	Coloured	618
ward	10103007	Male	Indian or Asian	9
ward	10103007	Female	Indian or Asian	4
ward	10103007	Male	White	153
ward	10103007	Female	White	132
ward	10103007	Male	Other	13
ward	10103007	Female	Other	1
ward	10104001	Male	Black African	532
ward	10104001	Female	Black African	509
ward	10104001	Male	Coloured	321
ward	10104001	Female	Coloured	355
ward	10104001	Male	Indian or Asian	17
ward	10104001	Female	Indian or Asian	17
ward	10104001	Female	White	1
ward	10104001	Male	Other	10
ward	10104001	Female	Other	8
ward	10104002	Male	Black African	308
ward	10104002	Female	Black African	320
ward	10104002	Male	Coloured	660
ward	10104002	Female	Coloured	688
ward	10104002	Male	Indian or Asian	5
ward	10104002	Female	Indian or Asian	4
ward	10104002	Male	Other	25
ward	10104003	Male	Black African	276
ward	10104003	Female	Black African	397
ward	10104003	Male	Coloured	319
ward	10104003	Female	Coloured	304
ward	10104003	Male	Indian or Asian	19
ward	10104003	Female	Indian or Asian	13
ward	10104003	Male	White	99
ward	10104003	Female	White	58
ward	10104003	Male	Other	1
ward	10104003	Female	Other	1
ward	10104004	Male	Black African	108
ward	10104004	Female	Black African	96
ward	10104004	Male	Coloured	704
ward	10104004	Female	Coloured	723
ward	10104004	Male	Indian or Asian	8
ward	10104004	Female	Indian or Asian	11
ward	10104004	Male	Other	10
ward	10104004	Female	Other	4
ward	10104005	Male	Black African	54
ward	10104005	Female	Black African	24
ward	10104005	Male	Coloured	159
ward	10104005	Female	Coloured	133
ward	10104005	Male	Indian or Asian	5
ward	10104005	Female	Indian or Asian	4
ward	10104005	Male	White	204
ward	10104005	Female	White	214
ward	10104005	Male	Other	3
ward	10104005	Female	Other	2
ward	10104006	Male	Black African	43
ward	10104006	Female	Black African	65
ward	10104006	Male	Coloured	249
ward	10104006	Female	Coloured	273
ward	10104006	Male	Indian or Asian	2
ward	10104006	Female	Indian or Asian	2
ward	10104006	Male	White	215
ward	10104006	Female	White	201
ward	10104006	Male	Other	11
ward	10104006	Female	Other	3
ward	10104007	Male	Black African	13
ward	10104007	Female	Black African	11
ward	10104007	Male	Coloured	536
ward	10104007	Female	Coloured	517
ward	10104007	Male	Indian or Asian	5
ward	10104007	Female	Indian or Asian	2
ward	10104007	Male	White	69
ward	10104007	Female	White	78
ward	10104007	Male	Other	14
ward	10104007	Female	Other	4
ward	10104008	Male	Black African	69
ward	10104008	Female	Black African	48
ward	10104008	Male	Coloured	185
ward	10104008	Female	Coloured	204
ward	10104008	Female	Indian or Asian	4
ward	10104008	Male	White	184
ward	10104008	Female	White	179
ward	10104008	Male	Other	2
ward	10104008	Female	Other	1
ward	10104009	Male	Black African	759
ward	10104009	Female	Black African	701
ward	10104009	Male	Coloured	117
ward	10104009	Female	Coloured	158
ward	10104009	Male	Indian or Asian	6
ward	10104009	Female	Indian or Asian	4
ward	10104009	Male	White	2
ward	10104009	Male	Other	2
ward	10104009	Female	Other	1
ward	10104010	Male	Black African	23
ward	10104010	Female	Black African	51
ward	10104010	Male	Coloured	435
ward	10104010	Female	Coloured	459
ward	10104010	Male	Indian or Asian	5
ward	10104010	Female	Indian or Asian	6
ward	10104010	Male	White	172
ward	10104010	Female	White	177
ward	10104010	Male	Other	7
ward	10104011	Male	Black African	40
ward	10104011	Female	Black African	40
ward	10104011	Male	Coloured	348
ward	10104011	Female	Coloured	340
ward	10104011	Female	Indian or Asian	1
ward	10104011	Male	White	49
ward	10104011	Female	White	63
ward	10104011	Male	Other	2
ward	10104012	Male	Black African	333
ward	10104012	Female	Black African	305
ward	10104012	Male	Coloured	507
ward	10104012	Female	Coloured	462
ward	10104012	Male	Indian or Asian	2
ward	10104012	Male	White	2
ward	10104012	Male	Other	8
ward	10104012	Female	Other	2
ward	10104013	Male	Black African	46
ward	10104013	Female	Black African	45
ward	10104013	Male	Coloured	574
ward	10104013	Female	Coloured	608
ward	10104013	Male	Indian or Asian	6
ward	10104013	Female	Indian or Asian	8
ward	10104013	Female	White	1
ward	10104013	Male	Other	5
ward	10104013	Female	Other	5
ward	10105001	Male	Black African	472
ward	10105001	Female	Black African	731
ward	10105001	Male	Coloured	467
ward	10105001	Female	Coloured	476
ward	10105001	Male	Indian or Asian	8
ward	10105001	Female	Indian or Asian	7
ward	10105001	Male	White	111
ward	10105001	Female	White	141
ward	10105001	Male	Other	5
ward	10105001	Female	Other	2
ward	10105002	Male	Black African	80
ward	10105002	Female	Black African	86
ward	10105002	Male	Coloured	600
ward	10105002	Female	Coloured	680
ward	10105002	Female	Indian or Asian	1
ward	10105002	Male	White	68
ward	10105002	Female	White	62
ward	10105002	Male	Other	11
ward	10105003	Male	Black African	97
ward	10105003	Female	Black African	58
ward	10105003	Male	Coloured	612
ward	10105003	Female	Coloured	651
ward	10105003	Male	Indian or Asian	2
ward	10105003	Female	Indian or Asian	2
ward	10105003	Male	White	50
ward	10105003	Female	White	40
ward	10105003	Male	Other	1
ward	10105003	Female	Other	4
ward	10105004	Male	Black African	289
ward	10105004	Female	Black African	228
ward	10105004	Male	Coloured	678
ward	10105004	Female	Coloured	730
ward	10105004	Male	Indian or Asian	5
ward	10105004	Female	Indian or Asian	8
ward	10105004	Male	White	82
ward	10105004	Female	White	70
ward	10105004	Male	Other	7
ward	10105004	Female	Other	7
ward	10105005	Male	Black African	66
ward	10105005	Female	Black African	41
ward	10105005	Male	Coloured	426
ward	10105005	Female	Coloured	443
ward	10105005	Male	Indian or Asian	5
ward	10105005	Male	White	51
ward	10105005	Female	White	51
ward	10105005	Male	Other	15
ward	10105005	Female	Other	4
ward	10105006	Male	Black African	72
ward	10105006	Female	Black African	97
ward	10105006	Male	Coloured	556
ward	10105006	Female	Coloured	619
ward	10105006	Male	Indian or Asian	6
ward	10105006	Female	Indian or Asian	7
ward	10105006	Male	White	35
ward	10105006	Female	White	25
ward	10105006	Male	Other	19
ward	10105006	Female	Other	4
ward	10105007	Male	Black African	192
ward	10105007	Female	Black African	159
ward	10105007	Male	Coloured	944
ward	10105007	Female	Coloured	862
ward	10105007	Male	Indian or Asian	5
ward	10105007	Female	Indian or Asian	2
ward	10105007	Male	White	86
ward	10105007	Female	White	64
ward	10105007	Male	Other	10
ward	10105007	Female	Other	1
ward	10105008	Male	Black African	46
ward	10105008	Female	Black African	48
ward	10105008	Male	Coloured	293
ward	10105008	Female	Coloured	350
ward	10105008	Male	Indian or Asian	3
ward	10105008	Female	Indian or Asian	1
ward	10105008	Male	White	122
ward	10105008	Female	White	121
ward	10105008	Male	Other	2
ward	10105008	Female	Other	4
ward	10105009	Male	Black African	753
ward	10105009	Female	Black African	776
ward	10105009	Male	Coloured	162
ward	10105009	Female	Coloured	151
ward	10105009	Male	Indian or Asian	4
ward	10105009	Male	Other	21
ward	10105009	Female	Other	7
ward	10105010	Male	Black African	63
ward	10105010	Female	Black African	63
ward	10105010	Male	Coloured	366
ward	10105010	Female	Coloured	403
ward	10105010	Male	Indian or Asian	7
ward	10105010	Female	Indian or Asian	6
ward	10105010	Male	White	212
ward	10105010	Female	White	228
ward	10105010	Male	Other	7
ward	10105010	Female	Other	8
ward	10105011	Male	Black African	44
ward	10105011	Female	Black African	41
ward	10105011	Male	Coloured	871
ward	10105011	Female	Coloured	854
ward	10105011	Male	Indian or Asian	7
ward	10105011	Male	Other	5
ward	10105012	Male	Black African	191
ward	10105012	Female	Black African	209
ward	10105012	Male	Coloured	711
ward	10105012	Female	Coloured	676
ward	10105012	Male	Indian or Asian	5
ward	10105012	Female	Indian or Asian	11
ward	10105012	Male	White	54
ward	10105012	Female	White	69
ward	10105012	Male	Other	6
ward	10105012	Female	Other	2
ward	10202001	Male	Black African	606
ward	10202001	Female	Black African	768
ward	10202001	Male	Coloured	19
ward	10202001	Female	Coloured	31
ward	10202001	Male	Indian or Asian	2
ward	10202001	Male	Other	10
ward	10202001	Female	Other	10
ward	10202002	Male	Black African	43
ward	10202002	Female	Black African	28
ward	10202002	Male	Coloured	401
ward	10202002	Female	Coloured	513
ward	10202002	Male	White	40
ward	10202002	Female	White	26
ward	10202002	Male	Other	7
ward	10202003	Male	Black African	71
ward	10202003	Female	Black African	51
ward	10202003	Male	Coloured	646
ward	10202003	Female	Coloured	630
ward	10202003	Male	Indian or Asian	6
ward	10202003	Male	White	64
ward	10202003	Female	White	65
ward	10202003	Male	Other	8
ward	10202003	Female	Other	5
ward	10202004	Male	Black African	14
ward	10202004	Female	Black African	15
ward	10202004	Male	Coloured	553
ward	10202004	Female	Coloured	553
ward	10202004	Male	Indian or Asian	1
ward	10202004	Female	Indian or Asian	2
ward	10202004	Male	White	56
ward	10202004	Female	White	72
ward	10202004	Male	Other	8
ward	10202004	Female	Other	10
ward	10202005	Male	Black African	50
ward	10202005	Female	Black African	52
ward	10202005	Male	Coloured	659
ward	10202005	Female	Coloured	623
ward	10202005	Male	Indian or Asian	2
ward	10202005	Female	Indian or Asian	2
ward	10202005	Male	White	69
ward	10202005	Female	White	63
ward	10202005	Male	Other	9
ward	10202005	Female	Other	7
ward	10202006	Male	Black African	22
ward	10202006	Female	Black African	21
ward	10202006	Male	Coloured	986
ward	10202006	Female	Coloured	1026
ward	10202006	Male	Indian or Asian	6
ward	10202006	Female	Indian or Asian	1
ward	10202006	Male	White	10
ward	10202006	Female	White	10
ward	10202006	Male	Other	2
ward	10202006	Female	Other	1
ward	10202007	Male	Black African	225
ward	10202007	Female	Black African	209
ward	10202007	Male	Coloured	1041
ward	10202007	Female	Coloured	1009
ward	10202007	Male	Indian or Asian	4
ward	10202007	Female	Indian or Asian	4
ward	10202007	Male	White	55
ward	10202007	Female	White	53
ward	10202007	Male	Other	19
ward	10202007	Female	Other	6
ward	10202008	Male	Black African	859
ward	10202008	Female	Black African	432
ward	10202008	Male	Coloured	460
ward	10202008	Female	Coloured	426
ward	10202008	Male	Indian or Asian	6
ward	10202008	Female	Indian or Asian	6
ward	10202008	Male	White	18
ward	10202008	Female	White	16
ward	10202008	Male	Other	4
ward	10202008	Female	Other	4
ward	10202009	Male	Black African	600
ward	10202009	Female	Black African	344
ward	10202009	Male	Coloured	574
ward	10202009	Female	Coloured	537
ward	10202009	Male	Indian or Asian	4
ward	10202009	Female	Indian or Asian	2
ward	10202009	Male	White	33
ward	10202009	Female	White	44
ward	10202009	Female	Other	1
ward	10202010	Male	Black African	294
ward	10202010	Female	Black African	225
ward	10202010	Male	Coloured	681
ward	10202010	Female	Coloured	712
ward	10202010	Male	White	14
ward	10202010	Female	White	15
ward	10202010	Male	Other	14
ward	10202010	Female	Other	2
ward	10202011	Male	Black African	273
ward	10202011	Female	Black African	257
ward	10202011	Male	Coloured	757
ward	10202011	Female	Coloured	789
ward	10202011	Male	Indian or Asian	4
ward	10202011	Female	Indian or Asian	2
ward	10202011	Male	White	39
ward	10202011	Female	White	38
ward	10202011	Male	Other	6
ward	10202011	Female	Other	1
ward	10202012	Male	Black African	552
ward	10202012	Female	Black African	388
ward	10202012	Male	Coloured	516
ward	10202012	Female	Coloured	404
ward	10202012	Male	Indian or Asian	11
ward	10202012	Female	Indian or Asian	2
ward	10202012	Male	White	274
ward	10202012	Female	White	19
ward	10202012	Male	Other	8
ward	10202012	Female	Other	3
ward	10203001	Male	Black African	169
ward	10203001	Female	Black African	149
ward	10203001	Male	Coloured	752
ward	10203001	Female	Coloured	763
ward	10203001	Male	Indian or Asian	2
ward	10203001	Female	Indian or Asian	4
ward	10203001	Male	White	111
ward	10203001	Female	White	89
ward	10203001	Male	Other	10
ward	10203001	Female	Other	2
ward	10203002	Male	Black African	45
ward	10203002	Female	Black African	32
ward	10203002	Male	Coloured	58
ward	10203002	Female	Coloured	40
ward	10203002	Female	Indian or Asian	7
ward	10203002	Male	White	321
ward	10203002	Female	White	322
ward	10203002	Female	Other	2
ward	10203003	Male	Black African	288
ward	10203003	Female	Black African	160
ward	10203003	Male	Coloured	788
ward	10203003	Female	Coloured	820
ward	10203003	Female	Indian or Asian	2
ward	10203003	Male	White	120
ward	10203003	Female	White	102
ward	10203003	Male	Other	2
ward	10203003	Female	Other	4
ward	10203004	Male	Black African	140
ward	10203004	Female	Black African	130
ward	10203004	Male	Coloured	55
ward	10203004	Female	Coloured	69
ward	10203004	Male	Indian or Asian	5
ward	10203004	Female	Indian or Asian	6
ward	10203004	Male	White	414
ward	10203004	Female	White	431
ward	10203004	Male	Other	2
ward	10203004	Female	Other	8
ward	10203005	Male	Black African	578
ward	10203005	Female	Black African	619
ward	10203005	Male	Coloured	425
ward	10203005	Female	Coloured	432
ward	10203005	Male	Indian or Asian	1
ward	10203005	Male	Other	29
ward	10203005	Female	Other	15
ward	10203006	Male	Black African	535
ward	10203006	Female	Black African	585
ward	10203006	Male	Coloured	11
ward	10203006	Female	Coloured	27
ward	10203006	Male	Other	7
ward	10203007	Male	Black African	47
ward	10203007	Female	Black African	41
ward	10203007	Male	Coloured	861
ward	10203007	Female	Coloured	919
ward	10203007	Male	Indian or Asian	4
ward	10203007	Female	Indian or Asian	1
ward	10203007	Male	White	9
ward	10203007	Male	Other	11
ward	10203007	Female	Other	1
ward	10203008	Male	Black African	150
ward	10203008	Female	Black African	192
ward	10203008	Male	Coloured	35
ward	10203008	Female	Coloured	44
ward	10203008	Female	Indian or Asian	1
ward	10203008	Male	Other	2
ward	10203008	Female	Other	1
ward	10203009	Male	Black African	697
ward	10203009	Female	Black African	642
ward	10203009	Male	Coloured	5
ward	10203009	Female	Coloured	5
ward	10203009	Male	Indian or Asian	1
ward	10203009	Male	Other	12
ward	10203009	Female	Other	5
ward	10203010	Male	Black African	76
ward	10203010	Female	Black African	51
ward	10203010	Male	Coloured	772
ward	10203010	Female	Coloured	722
ward	10203010	Male	Indian or Asian	2
ward	10203010	Female	Indian or Asian	5
ward	10203010	Male	White	3
ward	10203010	Female	White	5
ward	10203010	Male	Other	1
ward	10203011	Male	Black African	389
ward	10203011	Female	Black African	418
ward	10203011	Male	Coloured	705
ward	10203011	Female	Coloured	726
ward	10203011	Male	Indian or Asian	1
ward	10203011	Female	Indian or Asian	5
ward	10203011	Male	White	9
ward	10203011	Female	White	9
ward	10203011	Male	Other	8
ward	10203012	Male	Black African	598
ward	10203012	Female	Black African	639
ward	10203012	Male	Coloured	6
ward	10203012	Female	Coloured	11
ward	10203012	Male	Indian or Asian	2
ward	10203012	Male	Other	18
ward	10203012	Female	Other	7
ward	10203013	Male	Black African	164
ward	10203013	Female	Black African	155
ward	10203013	Male	Coloured	597
ward	10203013	Female	Coloured	608
ward	10203013	Male	Indian or Asian	4
ward	10203013	Female	Indian or Asian	2
ward	10203013	Male	Other	16
ward	10203013	Female	Other	6
ward	10203014	Male	Black African	295
ward	10203014	Female	Black African	378
ward	10203014	Male	Coloured	1098
ward	10203014	Female	Coloured	1107
ward	10203014	Male	Indian or Asian	1
ward	10203014	Female	Indian or Asian	5
ward	10203014	Male	White	1
ward	10203014	Male	Other	17
ward	10203014	Female	Other	7
ward	10203015	Male	Black African	33
ward	10203015	Female	Black African	28
ward	10203015	Male	Coloured	88
ward	10203015	Female	Coloured	91
ward	10203015	Male	Indian or Asian	4
ward	10203015	Female	Indian or Asian	5
ward	10203015	Male	White	479
ward	10203015	Female	White	409
ward	10203015	Male	Other	7
ward	10203015	Female	Other	2
ward	10203016	Male	Black African	756
ward	10203016	Female	Black African	828
ward	10203016	Male	Coloured	4
ward	10203016	Female	Coloured	4
ward	10203016	Male	Other	11
ward	10203016	Female	Other	2
ward	10203017	Male	Black African	102
ward	10203017	Female	Black African	115
ward	10203017	Male	Coloured	453
ward	10203017	Female	Coloured	502
ward	10203017	Male	Indian or Asian	5
ward	10203017	Male	White	248
ward	10203017	Female	White	232
ward	10203017	Female	Other	2
ward	10203018	Male	Black African	210
ward	10203018	Female	Black African	290
ward	10203018	Male	Coloured	401
ward	10203018	Female	Coloured	607
ward	10203018	Male	Indian or Asian	6
ward	10203018	Female	Indian or Asian	10
ward	10203018	Male	White	178
ward	10203018	Female	White	515
ward	10203018	Male	Other	6
ward	10203018	Female	Other	6
ward	10203019	Male	Black African	66
ward	10203019	Female	Black African	82
ward	10203019	Male	Coloured	91
ward	10203019	Female	Coloured	105
ward	10203019	Male	Indian or Asian	5
ward	10203019	Female	Indian or Asian	8
ward	10203019	Male	White	237
ward	10203019	Female	White	268
ward	10203019	Male	Other	9
ward	10203019	Female	Other	8
ward	10203020	Male	Black African	15
ward	10203020	Female	Black African	18
ward	10203020	Male	Coloured	257
ward	10203020	Female	Coloured	269
ward	10203020	Male	Indian or Asian	4
ward	10203020	Female	White	1
ward	10203020	Male	Other	5
ward	10203020	Female	Other	4
ward	10203021	Male	Black African	49
ward	10203021	Female	Black African	42
ward	10203021	Male	Coloured	976
ward	10203021	Female	Coloured	991
ward	10203021	Male	Indian or Asian	8
ward	10203021	Female	Indian or Asian	3
ward	10203021	Male	Other	17
ward	10203021	Female	Other	6
ward	10203022	Male	Black African	57
ward	10203022	Female	Black African	72
ward	10203022	Male	Coloured	528
ward	10203022	Female	Coloured	498
ward	10203022	Male	Indian or Asian	10
ward	10203022	Female	Indian or Asian	6
ward	10203022	Male	White	19
ward	10203022	Female	White	19
ward	10203022	Male	Other	13
ward	10203022	Female	Other	17
ward	10203023	Male	Black African	90
ward	10203023	Female	Black African	68
ward	10203023	Male	Coloured	604
ward	10203023	Female	Coloured	641
ward	10203023	Male	Indian or Asian	16
ward	10203023	Female	Indian or Asian	13
ward	10203023	Male	White	26
ward	10203023	Female	White	39
ward	10203023	Male	Other	10
ward	10203023	Female	Other	18
ward	10203024	Male	Black African	26
ward	10203024	Female	Black African	25
ward	10203024	Male	Coloured	586
ward	10203024	Female	Coloured	580
ward	10203024	Male	Indian or Asian	2
ward	10203024	Female	White	1
ward	10203024	Male	Other	4
ward	10203025	Male	Black African	86
ward	10203025	Female	Black African	29
ward	10203025	Male	Coloured	953
ward	10203025	Female	Coloured	717
ward	10203025	Male	Indian or Asian	3
ward	10203025	Female	Indian or Asian	5
ward	10203025	Male	White	27
ward	10203025	Female	White	26
ward	10203025	Male	Other	11
ward	10203025	Female	Other	4
ward	10203026	Male	Black African	28
ward	10203026	Female	Black African	23
ward	10203026	Male	Coloured	877
ward	10203026	Female	Coloured	843
ward	10203026	Male	Indian or Asian	7
ward	10203026	Female	Indian or Asian	5
ward	10203026	Male	White	4
ward	10203026	Female	White	2
ward	10203026	Male	Other	7
ward	10203026	Female	Other	5
ward	10203027	Male	Black African	52
ward	10203027	Female	Black African	58
ward	10203027	Male	Coloured	529
ward	10203027	Female	Coloured	549
ward	10203027	Female	Indian or Asian	1
ward	10203027	Male	Other	6
ward	10203027	Female	Other	2
ward	10203028	Male	Black African	286
ward	10203028	Female	Black African	55
ward	10203028	Male	Coloured	737
ward	10203028	Female	Coloured	337
ward	10203028	Male	Indian or Asian	5
ward	10203028	Female	Indian or Asian	5
ward	10203028	Male	White	70
ward	10203028	Female	White	83
ward	10203028	Male	Other	10
ward	10203028	Female	Other	7
ward	10203029	Male	Black African	37
ward	10203029	Female	Black African	32
ward	10203029	Male	Coloured	523
ward	10203029	Female	Coloured	526
ward	10203029	Male	Indian or Asian	7
ward	10203029	Female	Indian or Asian	7
ward	10203029	Male	White	137
ward	10203029	Female	White	120
ward	10203029	Male	Other	5
ward	10203029	Female	Other	1
ward	10203030	Male	Black African	48
ward	10203030	Female	Black African	70
ward	10203030	Male	Coloured	797
ward	10203030	Female	Coloured	866
ward	10203030	Male	Indian or Asian	2
ward	10203030	Female	Indian or Asian	3
ward	10203030	Male	White	8
ward	10203030	Male	Other	5
ward	10203031	Male	Black African	134
ward	10203031	Female	Black African	69
ward	10203031	Male	Coloured	930
ward	10203031	Female	Coloured	603
ward	10203031	Male	Indian or Asian	2
ward	10203031	Female	Indian or Asian	2
ward	10203031	Male	White	30
ward	10203031	Female	White	20
ward	10203031	Female	Other	2
ward	10204001	Male	Black African	316
ward	10204001	Female	Black African	336
ward	10204001	Male	Coloured	813
ward	10204001	Female	Coloured	827
ward	10204001	Male	Indian or Asian	4
ward	10204001	Female	Indian or Asian	6
ward	10204001	Male	White	54
ward	10204001	Female	White	61
ward	10204001	Male	Other	21
ward	10204001	Female	Other	8
ward	10204002	Male	Black African	487
ward	10204002	Female	Black African	508
ward	10204002	Male	Coloured	307
ward	10204002	Female	Coloured	261
ward	10204002	Male	Indian or Asian	1
ward	10204002	Female	Indian or Asian	1
ward	10204002	Male	White	1
ward	10204002	Female	White	1
ward	10204002	Male	Other	12
ward	10204002	Female	Other	6
ward	10204003	Male	Black African	118
ward	10204003	Female	Black African	91
ward	10204003	Male	Coloured	739
ward	10204003	Female	Coloured	690
ward	10204003	Female	Indian or Asian	2
ward	10204003	Male	White	50
ward	10204003	Female	White	46
ward	10204003	Male	Other	11
ward	10204004	Male	Black African	97
ward	10204004	Female	Black African	60
ward	10204004	Male	Coloured	674
ward	10204004	Female	Coloured	666
ward	10204004	Male	Indian or Asian	4
ward	10204004	Female	Indian or Asian	4
ward	10204004	Male	White	15
ward	10204004	Female	White	21
ward	10204004	Male	Other	4
ward	10204004	Female	Other	2
ward	10204005	Male	Black African	43
ward	10204005	Female	Black African	20
ward	10204005	Male	Coloured	475
ward	10204005	Female	Coloured	501
ward	10204005	Male	Indian or Asian	2
ward	10204005	Female	Indian or Asian	4
ward	10204005	Male	White	12
ward	10204005	Female	White	13
ward	10204005	Male	Other	6
ward	10204006	Male	Black African	34
ward	10204006	Female	Black African	48
ward	10204006	Male	Coloured	462
ward	10204006	Female	Coloured	504
ward	10204006	Male	Indian or Asian	2
ward	10204006	Male	White	12
ward	10204006	Female	White	11
ward	10204006	Male	Other	4
ward	10204006	Female	Other	1
ward	10204007	Male	Black African	101
ward	10204007	Female	Black African	95
ward	10204007	Male	Coloured	60
ward	10204007	Female	Coloured	38
ward	10204007	Male	Indian or Asian	6
ward	10204007	Female	Indian or Asian	3
ward	10204007	Male	White	647
ward	10204007	Female	White	662
ward	10204007	Male	Other	3
ward	10204007	Female	Other	1
ward	10204008	Male	Black African	334
ward	10204008	Female	Black African	621
ward	10204008	Male	Coloured	232
ward	10204008	Female	Coloured	561
ward	10204008	Male	Indian or Asian	11
ward	10204008	Female	Indian or Asian	33
ward	10204008	Male	White	1141
ward	10204008	Female	White	1663
ward	10204008	Male	Other	14
ward	10204008	Female	Other	21
ward	10204009	Male	Black African	62
ward	10204009	Female	Black African	39
ward	10204009	Male	Coloured	56
ward	10204009	Female	Coloured	54
ward	10204009	Male	Indian or Asian	5
ward	10204009	Female	Indian or Asian	3
ward	10204009	Male	White	175
ward	10204009	Female	White	182
ward	10204009	Male	Other	6
ward	10204009	Female	Other	2
ward	10204010	Male	Black African	145
ward	10204010	Female	Black African	154
ward	10204010	Male	Coloured	250
ward	10204010	Female	Coloured	230
ward	10204010	Male	Indian or Asian	7
ward	10204010	Female	Indian or Asian	9
ward	10204010	Male	White	1075
ward	10204010	Female	White	873
ward	10204010	Male	Other	4
ward	10204010	Female	Other	11
ward	10204011	Male	Black African	130
ward	10204011	Female	Black African	109
ward	10204011	Male	Coloured	279
ward	10204011	Female	Coloured	311
ward	10204011	Male	Indian or Asian	7
ward	10204011	Female	Indian or Asian	8
ward	10204011	Male	White	562
ward	10204011	Female	White	519
ward	10204011	Male	Other	5
ward	10204011	Female	Other	5
ward	10204012	Male	Black African	829
ward	10204012	Female	Black African	961
ward	10204012	Male	Coloured	15
ward	10204012	Female	Coloured	20
ward	10204012	Male	Indian or Asian	2
ward	10204012	Female	Indian or Asian	1
ward	10204012	Male	White	1
ward	10204012	Female	White	1
ward	10204012	Male	Other	4
ward	10204013	Male	Black African	103
ward	10204013	Female	Black African	113
ward	10204013	Male	Coloured	125
ward	10204013	Female	Coloured	110
ward	10204013	Male	White	11
ward	10204013	Female	White	10
ward	10204013	Female	Other	1
ward	10204014	Male	Black African	525
ward	10204014	Female	Black African	602
ward	10204014	Male	Coloured	20
ward	10204014	Female	Coloured	19
ward	10204014	Male	White	2
ward	10204014	Male	Other	7
ward	10204015	Male	Black African	1077
ward	10204015	Female	Black African	1163
ward	10204015	Male	Coloured	51
ward	10204015	Female	Coloured	65
ward	10204015	Male	Indian or Asian	5
ward	10204015	Male	White	2
ward	10204015	Male	Other	19
ward	10204015	Female	Other	5
ward	10204016	Male	Black African	106
ward	10204016	Female	Black African	74
ward	10204016	Male	Coloured	716
ward	10204016	Female	Coloured	663
ward	10204016	Male	Indian or Asian	18
ward	10204016	Male	White	198
ward	10204016	Female	White	236
ward	10204016	Male	Other	11
ward	10204016	Female	Other	3
ward	10204017	Male	Black African	29
ward	10204017	Female	Black African	42
ward	10204017	Male	Coloured	403
ward	10204017	Female	Coloured	391
ward	10204017	Male	Indian or Asian	2
ward	10204017	Female	Indian or Asian	1
ward	10204017	Male	White	235
ward	10204017	Female	White	355
ward	10204017	Male	Other	6
ward	10204017	Female	Other	7
ward	10204018	Male	Black African	282
ward	10204018	Female	Black African	313
ward	10204018	Male	Coloured	530
ward	10204018	Female	Coloured	559
ward	10204018	Male	Indian or Asian	7
ward	10204018	Female	Indian or Asian	2
ward	10204018	Male	White	14
ward	10204018	Female	White	16
ward	10204018	Male	Other	26
ward	10204019	Male	Black African	168
ward	10204019	Female	Black African	127
ward	10204019	Male	Coloured	779
ward	10204019	Female	Coloured	751
ward	10204019	Male	Indian or Asian	5
ward	10204019	Female	Indian or Asian	2
ward	10204019	Male	White	73
ward	10204019	Female	White	85
ward	10204019	Male	Other	6
ward	10204019	Female	Other	4
ward	10204020	Male	Black African	95
ward	10204020	Female	Black African	77
ward	10204020	Male	Coloured	662
ward	10204020	Female	Coloured	737
ward	10204020	Male	Indian or Asian	4
ward	10204020	Male	White	89
ward	10204020	Female	White	109
ward	10204020	Male	Other	5
ward	10204020	Female	Other	4
ward	10204021	Male	Black African	27
ward	10204021	Female	Black African	22
ward	10204021	Male	Coloured	372
ward	10204021	Female	Coloured	433
ward	10204021	Female	Indian or Asian	4
ward	10204021	Male	White	274
ward	10204021	Female	White	188
ward	10204021	Male	Other	1
ward	10204021	Female	Other	2
ward	10204022	Male	Black African	84
ward	10204022	Female	Black African	57
ward	10204022	Male	Coloured	87
ward	10204022	Female	Coloured	79
ward	10204022	Male	Indian or Asian	10
ward	10204022	Female	Indian or Asian	10
ward	10204022	Male	White	374
ward	10204022	Female	White	323
ward	10204022	Male	Other	6
ward	10204022	Female	Other	7
ward	10205001	Male	Black African	61
ward	10205001	Female	Black African	66
ward	10205001	Male	Coloured	654
ward	10205001	Female	Coloured	656
ward	10205001	Male	Indian or Asian	3
ward	10205001	Female	Indian or Asian	1
ward	10205001	Male	White	29
ward	10205001	Female	White	21
ward	10205001	Male	Other	6
ward	10205001	Female	Other	7
ward	10205002	Male	Black African	648
ward	10205002	Female	Black African	828
ward	10205002	Male	Coloured	227
ward	10205002	Female	Coloured	217
ward	10205002	Male	Indian or Asian	1
ward	10205002	Female	White	2
ward	10205002	Male	Other	14
ward	10205002	Female	Other	30
ward	10205003	Male	Black African	289
ward	10205003	Female	Black African	283
ward	10205003	Male	Coloured	569
ward	10205003	Female	Coloured	594
ward	10205003	Male	Indian or Asian	6
ward	10205003	Female	Indian or Asian	3
ward	10205003	Male	White	20
ward	10205003	Female	White	24
ward	10205003	Male	Other	10
ward	10205003	Female	Other	12
ward	10205004	Male	Black African	166
ward	10205004	Female	Black African	185
ward	10205004	Male	Coloured	642
ward	10205004	Female	Coloured	748
ward	10205004	Male	Indian or Asian	8
ward	10205004	Female	Indian or Asian	4
ward	10205004	Male	White	29
ward	10205004	Female	White	27
ward	10205004	Male	Other	13
ward	10205004	Female	Other	10
ward	10205005	Male	Black African	137
ward	10205005	Female	Black African	161
ward	10205005	Male	Coloured	756
ward	10205005	Female	Coloured	858
ward	10205005	Male	White	59
ward	10205005	Female	White	88
ward	10205005	Male	Other	6
ward	10205005	Female	Other	8
ward	10205006	Male	Black African	68
ward	10205006	Female	Black African	64
ward	10205006	Male	Coloured	97
ward	10205006	Female	Coloured	101
ward	10205006	Male	Indian or Asian	5
ward	10205006	Female	Indian or Asian	5
ward	10205006	Male	White	180
ward	10205006	Female	White	172
ward	10205006	Male	Other	22
ward	10205006	Female	Other	15
ward	10205007	Male	Black African	108
ward	10205007	Female	Black African	100
ward	10205007	Male	Coloured	91
ward	10205007	Female	Coloured	95
ward	10205007	Male	Indian or Asian	2
ward	10205007	Female	Indian or Asian	7
ward	10205007	Male	White	245
ward	10205007	Female	White	248
ward	10205007	Male	Other	4
ward	10205007	Female	Other	9
ward	10205008	Male	Black African	372
ward	10205008	Female	Black African	386
ward	10205008	Male	Coloured	397
ward	10205008	Female	Coloured	409
ward	10205008	Male	Indian or Asian	2
ward	10205008	Male	White	6
ward	10205008	Female	White	9
ward	10205008	Male	Other	3
ward	10205008	Female	Other	1
ward	10205009	Male	Black African	22
ward	10205009	Female	Black African	5
ward	10205009	Male	Coloured	567
ward	10205009	Female	Coloured	592
ward	10205009	Male	Indian or Asian	15
ward	10205009	Female	Indian or Asian	8
ward	10205009	Male	Other	9
ward	10205010	Male	Black African	7
ward	10205010	Female	Black African	11
ward	10205010	Male	Coloured	725
ward	10205010	Female	Coloured	765
ward	10205010	Male	Indian or Asian	1
ward	10205010	Female	Indian or Asian	5
ward	10205010	Male	Other	6
ward	10205011	Male	Black African	27
ward	10205011	Female	Black African	25
ward	10205011	Male	Coloured	452
ward	10205011	Female	Coloured	469
ward	10205011	Male	Indian or Asian	13
ward	10205011	Female	Indian or Asian	8
ward	10205011	Female	White	1
ward	10205011	Male	Other	25
ward	10205011	Female	Other	22
ward	10205012	Male	Black African	90
ward	10205012	Female	Black African	66
ward	10205012	Male	Coloured	440
ward	10205012	Female	Coloured	469
ward	10205012	Male	Indian or Asian	13
ward	10205012	Female	Indian or Asian	6
ward	10205012	Male	White	78
ward	10205012	Female	White	100
ward	10205012	Male	Other	7
ward	10205012	Female	Other	7
ward	10205013	Male	Black African	19
ward	10205013	Female	Black African	11
ward	10205013	Male	Coloured	659
ward	10205013	Female	Coloured	668
ward	10205013	Male	White	7
ward	10205013	Male	Other	4
ward	10205014	Male	Black African	4
ward	10205014	Female	Black African	7
ward	10205014	Male	Coloured	488
ward	10205014	Female	Coloured	501
ward	10205014	Male	Indian or Asian	7
ward	10205014	Female	Indian or Asian	4
ward	10205014	Female	White	2
ward	10205014	Male	Other	1
ward	10205014	Female	Other	1
ward	10205015	Male	Black African	131
ward	10205015	Female	Black African	103
ward	10205015	Male	Coloured	476
ward	10205015	Female	Coloured	297
ward	10205015	Male	Indian or Asian	10
ward	10205015	Female	Indian or Asian	9
ward	10205015	Male	White	398
ward	10205015	Female	White	236
ward	10205015	Male	Other	3
ward	10205016	Male	Black African	704
ward	10205016	Female	Black African	817
ward	10205016	Male	Coloured	12
ward	10205016	Female	Coloured	6
ward	10205016	Male	Indian or Asian	1
ward	10205016	Female	Indian or Asian	1
ward	10205016	Female	White	1
ward	10205016	Male	Other	6
ward	10205016	Female	Other	5
ward	10205017	Male	Black African	299
ward	10205017	Female	Black African	358
ward	10205017	Male	Coloured	1
ward	10205017	Female	Coloured	6
ward	10205017	Male	Other	4
ward	10205017	Female	Other	1
ward	10205018	Male	Black African	327
ward	10205018	Female	Black African	311
ward	10205018	Male	Coloured	452
ward	10205018	Female	Coloured	461
ward	10205018	Female	Indian or Asian	2
ward	10205018	Male	White	12
ward	10205018	Female	White	18
ward	10205018	Male	Other	3
ward	10205018	Female	Other	4
ward	10205019	Male	Black African	59
ward	10205019	Female	Black African	28
ward	10205019	Male	Coloured	520
ward	10205019	Female	Coloured	500
ward	10205019	Male	Indian or Asian	2
ward	10205019	Female	Indian or Asian	2
ward	10205019	Male	White	22
ward	10205019	Female	White	30
ward	10205019	Male	Other	2
ward	10205019	Female	Other	2
ward	10205020	Male	Black African	76
ward	10205020	Female	Black African	49
ward	10205020	Male	Coloured	549
ward	10205020	Female	Coloured	644
ward	10205020	Female	Indian or Asian	2
ward	10205020	Male	White	50
ward	10205020	Female	White	47
ward	10205020	Male	Other	2
ward	10205020	Female	Other	3
ward	10205021	Male	Black African	507
ward	10205021	Female	Black African	322
ward	10205021	Male	Coloured	930
ward	10205021	Female	Coloured	1002
ward	10205021	Male	Indian or Asian	12
ward	10205021	Female	Indian or Asian	4
ward	10205021	Male	White	31
ward	10205021	Female	White	16
ward	10205021	Male	Other	10
ward	10205021	Female	Other	6
ward	10206001	Male	Black African	20
ward	10206001	Female	Black African	16
ward	10206001	Male	Coloured	380
ward	10206001	Female	Coloured	357
ward	10206001	Male	Indian or Asian	3
ward	10206001	Female	Indian or Asian	3
ward	10206001	Male	White	72
ward	10206001	Female	White	70
ward	10206001	Male	Other	7
ward	10206001	Female	Other	10
ward	10206002	Male	Black African	556
ward	10206002	Female	Black African	608
ward	10206002	Male	Coloured	94
ward	10206002	Female	Coloured	115
ward	10206002	Male	Indian or Asian	1
ward	10206002	Male	White	101
ward	10206002	Female	White	133
ward	10206002	Male	Other	9
ward	10206002	Female	Other	5
ward	10206003	Male	Black African	58
ward	10206003	Female	Black African	35
ward	10206003	Male	Coloured	664
ward	10206003	Female	Coloured	692
ward	10206003	Male	Indian or Asian	5
ward	10206003	Female	Indian or Asian	2
ward	10206003	Male	White	36
ward	10206003	Female	White	17
ward	10206003	Male	Other	5
ward	10206003	Female	Other	1
ward	10206004	Male	Black African	94
ward	10206004	Female	Black African	86
ward	10206004	Male	Coloured	649
ward	10206004	Female	Coloured	599
ward	10206004	Female	Indian or Asian	2
ward	10206004	Male	White	2
ward	10206004	Female	White	2
ward	10206004	Male	Other	32
ward	10206004	Female	Other	25
ward	10206005	Male	Black African	17
ward	10206005	Female	Black African	14
ward	10206005	Male	Coloured	407
ward	10206005	Female	Coloured	473
ward	10206005	Male	Indian or Asian	1
ward	10206005	Female	Indian or Asian	4
ward	10206005	Male	White	33
ward	10206005	Female	White	22
ward	10206006	Male	Black African	15
ward	10206006	Female	Black African	24
ward	10206006	Male	Coloured	737
ward	10206006	Female	Coloured	835
ward	10206006	Male	White	35
ward	10206006	Female	White	34
ward	10206006	Male	Other	2
ward	10206006	Female	Other	2
ward	10206007	Male	Black African	54
ward	10206007	Female	Black African	43
ward	10206007	Male	Coloured	619
ward	10206007	Female	Coloured	628
ward	10206007	Male	Indian or Asian	4
ward	10206007	Female	Indian or Asian	2
ward	10206007	Male	White	73
ward	10206007	Female	White	85
ward	10206007	Male	Other	11
ward	10206007	Female	Other	8
ward	10206008	Male	Black African	79
ward	10206008	Female	Black African	76
ward	10206008	Male	Coloured	684
ward	10206008	Female	Coloured	607
ward	10206008	Male	White	80
ward	10206008	Female	White	67
ward	10206008	Male	Other	8
ward	10206009	Male	Black African	30
ward	10206009	Female	Black African	34
ward	10206009	Male	Coloured	630
ward	10206009	Female	Coloured	647
ward	10206009	Male	White	41
ward	10206009	Female	White	29
ward	10206009	Male	Other	5
ward	10206010	Male	Black African	485
ward	10206010	Female	Black African	527
ward	10206010	Male	Coloured	31
ward	10206010	Female	Coloured	43
ward	10206010	Male	Indian or Asian	1
ward	10206010	Male	White	1
ward	10206010	Male	Other	4
ward	10206011	Male	Black African	17
ward	10206011	Female	Black African	29
ward	10206011	Male	Coloured	468
ward	10206011	Female	Coloured	438
ward	10206011	Male	White	43
ward	10206011	Female	White	55
ward	10206011	Male	Other	7
ward	10206011	Female	Other	4
ward	10206012	Male	Black African	83
ward	10206012	Female	Black African	67
ward	10206012	Male	Coloured	1010
ward	10206012	Female	Coloured	1047
ward	10206012	Male	Indian or Asian	3
ward	10206012	Female	Indian or Asian	4
ward	10206012	Male	White	20
ward	10206012	Female	White	27
ward	10206012	Male	Other	13
ward	10206012	Female	Other	1
ward	10301001	Male	Black African	169
ward	10301001	Female	Black African	95
ward	10301001	Male	Coloured	518
ward	10301001	Female	Coloured	558
ward	10301001	Male	Indian or Asian	6
ward	10301001	Female	Indian or Asian	2
ward	10301001	Male	White	80
ward	10301001	Female	White	61
ward	10301001	Male	Other	13
ward	10301001	Female	Other	3
ward	10301002	Male	Black African	40
ward	10301002	Female	Black African	29
ward	10301002	Male	Coloured	645
ward	10301002	Female	Coloured	675
ward	10301002	Male	Indian or Asian	2
ward	10301002	Female	Indian or Asian	4
ward	10301002	Male	White	8
ward	10301002	Female	White	8
ward	10301002	Male	Other	21
ward	10301002	Female	Other	11
ward	10301003	Male	Black African	110
ward	10301003	Female	Black African	122
ward	10301003	Male	Coloured	808
ward	10301003	Female	Coloured	798
ward	10301003	Female	Indian or Asian	1
ward	10301003	Male	White	14
ward	10301003	Female	White	16
ward	10301003	Male	Other	8
ward	10301003	Female	Other	10
ward	10301004	Male	Black African	204
ward	10301004	Female	Black African	131
ward	10301004	Male	Coloured	302
ward	10301004	Female	Coloured	257
ward	10301004	Male	Indian or Asian	1
ward	10301004	Female	Indian or Asian	3
ward	10301004	Male	White	131
ward	10301004	Female	White	122
ward	10301004	Male	Other	14
ward	10301004	Female	Other	3
ward	10301005	Male	Black African	407
ward	10301005	Female	Black African	281
ward	10301005	Male	Coloured	494
ward	10301005	Female	Coloured	436
ward	10301005	Male	Indian or Asian	12
ward	10301005	Female	Indian or Asian	2
ward	10301005	Male	White	107
ward	10301005	Female	White	83
ward	10301005	Male	Other	9
ward	10301005	Female	Other	5
ward	10301006	Male	Black African	326
ward	10301006	Female	Black African	287
ward	10301006	Male	Coloured	340
ward	10301006	Female	Coloured	358
ward	10301006	Male	Indian or Asian	1
ward	10301006	Male	White	1
ward	10301006	Female	White	2
ward	10301006	Male	Other	32
ward	10301006	Female	Other	4
ward	10301007	Male	Black African	174
ward	10301007	Female	Black African	151
ward	10301007	Male	Coloured	517
ward	10301007	Female	Coloured	529
ward	10301007	Male	Indian or Asian	1
ward	10301007	Male	White	28
ward	10301007	Female	White	14
ward	10301007	Male	Other	9
ward	10301007	Female	Other	2
ward	10301008	Male	Black African	256
ward	10301008	Female	Black African	283
ward	10301008	Male	Coloured	227
ward	10301008	Female	Coloured	229
ward	10301008	Male	Other	2
ward	10301009	Male	Black African	236
ward	10301009	Female	Black African	135
ward	10301009	Male	Coloured	558
ward	10301009	Female	Coloured	593
ward	10301009	Female	Indian or Asian	6
ward	10301009	Male	White	16
ward	10301009	Female	White	24
ward	10301010	Male	Black African	151
ward	10301010	Female	Black African	121
ward	10301010	Male	Coloured	309
ward	10301010	Female	Coloured	369
ward	10301010	Male	White	24
ward	10301010	Female	White	20
ward	10301010	Male	Other	4
ward	10301010	Female	Other	6
ward	10301011	Male	Black African	219
ward	10301011	Female	Black African	206
ward	10301011	Male	Coloured	246
ward	10301011	Female	Coloured	214
ward	10301011	Male	Indian or Asian	2
ward	10301011	Male	White	17
ward	10301011	Female	White	24
ward	10301011	Male	Other	4
ward	10301011	Female	Other	4
ward	10301012	Male	Black African	323
ward	10301012	Female	Black African	313
ward	10301012	Male	Coloured	318
ward	10301012	Female	Coloured	432
ward	10301012	Male	Indian or Asian	2
ward	10301012	Female	Indian or Asian	1
ward	10301012	Male	White	3
ward	10301012	Female	White	3
ward	10301013	Male	Black African	540
ward	10301013	Female	Black African	518
ward	10301013	Male	Coloured	764
ward	10301013	Female	Coloured	695
ward	10301013	Male	Indian or Asian	6
ward	10301013	Female	Indian or Asian	3
ward	10301013	Male	White	69
ward	10301013	Female	White	64
ward	10301013	Male	Other	24
ward	10301013	Female	Other	12
ward	10302001	Male	Black African	450
ward	10302001	Female	Black African	441
ward	10302001	Male	Coloured	2
ward	10302001	Female	Coloured	9
ward	10302001	Female	Indian or Asian	1
ward	10302001	Male	White	20
ward	10302001	Female	White	22
ward	10302001	Male	Other	4
ward	10302002	Male	Black African	80
ward	10302002	Female	Black African	77
ward	10302002	Male	Coloured	284
ward	10302002	Female	Coloured	331
ward	10302002	Male	Indian or Asian	5
ward	10302002	Female	Indian or Asian	3
ward	10302002	Male	White	148
ward	10302002	Female	White	142
ward	10302002	Male	Other	1
ward	10302002	Female	Other	2
ward	10302003	Male	Black African	4
ward	10302003	Female	Black African	9
ward	10302003	Male	Coloured	12
ward	10302003	Female	Coloured	24
ward	10302003	Male	Indian or Asian	1
ward	10302003	Male	White	92
ward	10302003	Female	White	104
ward	10302004	Male	Black African	49
ward	10302004	Female	Black African	34
ward	10302004	Male	Coloured	494
ward	10302004	Female	Coloured	504
ward	10302004	Male	Indian or Asian	7
ward	10302004	Female	Indian or Asian	1
ward	10302004	Male	White	42
ward	10302004	Female	White	65
ward	10302004	Male	Other	5
ward	10302004	Female	Other	3
ward	10302005	Male	Black African	604
ward	10302005	Female	Black African	713
ward	10302005	Male	Coloured	8
ward	10302005	Female	Coloured	7
ward	10302005	Male	Indian or Asian	4
ward	10302005	Female	Indian or Asian	2
ward	10302005	Female	White	1
ward	10302005	Male	Other	15
ward	10302005	Female	Other	7
ward	10302006	Male	Black African	511
ward	10302006	Female	Black African	589
ward	10302006	Male	Coloured	19
ward	10302006	Female	Coloured	15
ward	10302006	Male	Indian or Asian	1
ward	10302006	Male	White	4
ward	10302006	Female	White	6
ward	10302006	Male	Other	14
ward	10302006	Female	Other	2
ward	10302007	Male	Black African	9
ward	10302007	Female	Black African	16
ward	10302007	Male	Coloured	14
ward	10302007	Female	Coloured	12
ward	10302007	Male	White	119
ward	10302007	Female	White	126
ward	10302007	Male	Other	1
ward	10302007	Female	Other	2
ward	10302008	Male	Black African	19
ward	10302008	Female	Black African	13
ward	10302008	Male	Coloured	693
ward	10302008	Female	Coloured	700
ward	10302008	Male	Indian or Asian	1
ward	10302008	Female	Indian or Asian	1
ward	10302008	Male	White	28
ward	10302008	Female	White	22
ward	10302008	Male	Other	8
ward	10302008	Female	Other	19
ward	10302009	Male	Black African	2
ward	10302009	Female	Black African	3
ward	10302009	Male	Coloured	27
ward	10302009	Female	Coloured	33
ward	10302009	Male	White	52
ward	10302009	Female	White	51
ward	10302009	Male	Other	1
ward	10302010	Male	Black African	211
ward	10302010	Female	Black African	223
ward	10302010	Male	Coloured	153
ward	10302010	Female	Coloured	161
ward	10302010	Male	Indian or Asian	4
ward	10302010	Female	Indian or Asian	4
ward	10302010	Male	White	44
ward	10302010	Female	White	41
ward	10302010	Male	Other	5
ward	10302010	Female	Other	1
ward	10302011	Male	Black African	362
ward	10302011	Female	Black African	219
ward	10302011	Male	Coloured	400
ward	10302011	Female	Coloured	400
ward	10302011	Male	Indian or Asian	3
ward	10302011	Female	Indian or Asian	1
ward	10302011	Male	White	59
ward	10302011	Female	White	59
ward	10302011	Male	Other	7
ward	10302012	Male	Black African	428
ward	10302012	Female	Black African	520
ward	10302012	Male	Coloured	15
ward	10302012	Female	Coloured	24
ward	10302012	Male	Indian or Asian	1
ward	10302012	Male	Other	18
ward	10302012	Female	Other	9
ward	10302013	Male	Black African	17
ward	10302013	Female	Black African	12
ward	10302013	Male	Coloured	13
ward	10302013	Female	Coloured	15
ward	10302013	Male	White	127
ward	10302013	Female	White	136
ward	10302013	Male	Other	2
ward	10303001	Male	Black African	73
ward	10303001	Female	Black African	70
ward	10303001	Male	Coloured	345
ward	10303001	Female	Coloured	409
ward	10303001	Male	Indian or Asian	4
ward	10303001	Female	Indian or Asian	2
ward	10303001	Male	White	30
ward	10303001	Female	White	23
ward	10303001	Female	Other	4
ward	10303002	Male	Black African	59
ward	10303002	Female	Black African	60
ward	10303002	Male	Coloured	567
ward	10303002	Female	Coloured	609
ward	10303002	Female	Indian or Asian	4
ward	10303002	Male	White	51
ward	10303002	Female	White	27
ward	10303002	Male	Other	1
ward	10303002	Female	Other	3
ward	10303003	Male	Black African	180
ward	10303003	Female	Black African	135
ward	10303003	Male	Coloured	410
ward	10303003	Female	Coloured	498
ward	10303003	Male	Indian or Asian	2
ward	10303003	Female	Indian or Asian	2
ward	10303003	Male	White	1
ward	10303003	Male	Other	33
ward	10303003	Female	Other	7
ward	10303004	Male	Black African	22
ward	10303004	Female	Black African	40
ward	10303004	Male	Coloured	150
ward	10303004	Female	Coloured	203
ward	10303004	Male	Indian or Asian	1
ward	10303004	Female	Indian or Asian	1
ward	10303004	Male	White	171
ward	10303004	Female	White	153
ward	10303004	Male	Other	1
ward	10303004	Female	Other	2
ward	10303005	Male	Black African	65
ward	10303005	Female	Black African	73
ward	10303005	Male	Coloured	334
ward	10303005	Female	Coloured	336
ward	10303005	Male	Indian or Asian	1
ward	10303005	Male	White	81
ward	10303005	Female	White	88
ward	10303005	Male	Other	2
ward	10303005	Female	Other	5
ward	10304001	Male	Black African	87
ward	10304001	Female	Black African	68
ward	10304001	Male	Coloured	329
ward	10304001	Female	Coloured	344
ward	10304001	Male	White	144
ward	10304001	Female	White	91
ward	10304001	Male	Other	15
ward	10304001	Female	Other	4
ward	10304002	Male	Black African	57
ward	10304002	Female	Black African	49
ward	10304002	Male	Coloured	596
ward	10304002	Female	Coloured	577
ward	10304002	Male	Indian or Asian	5
ward	10304002	Female	Indian or Asian	1
ward	10304002	Male	White	37
ward	10304002	Female	White	26
ward	10304002	Male	Other	2
ward	10304002	Female	Other	2
ward	10304003	Male	Black African	66
ward	10304003	Female	Black African	33
ward	10304003	Male	Coloured	551
ward	10304003	Female	Coloured	517
ward	10304003	Male	Indian or Asian	1
ward	10304003	Male	White	56
ward	10304003	Female	White	50
ward	10304003	Female	Other	1
ward	10304004	Male	Black African	54
ward	10304004	Female	Black African	54
ward	10304004	Male	Coloured	141
ward	10304004	Female	Coloured	184
ward	10304004	Male	Indian or Asian	3
ward	10304004	Female	Indian or Asian	1
ward	10304004	Male	White	34
ward	10304004	Female	White	58
ward	10304004	Male	Other	2
ward	10304004	Female	Other	1
ward	10304005	Male	Black African	274
ward	10304005	Female	Black African	204
ward	10304005	Male	Coloured	666
ward	10304005	Female	Coloured	675
ward	10304005	Male	Indian or Asian	2
ward	10304005	Female	Indian or Asian	4
ward	10304005	Male	White	1
ward	10304005	Female	White	2
ward	10304005	Male	Other	28
ward	10304005	Female	Other	12
ward	10401001	Male	Black African	17
ward	10401001	Female	Black African	22
ward	10401001	Male	Coloured	548
ward	10401001	Female	Coloured	514
ward	10401001	Male	Indian or Asian	1
ward	10401001	Female	Indian or Asian	1
ward	10401001	Male	White	5
ward	10401001	Female	White	4
ward	10401001	Male	Other	1
ward	10401002	Male	Black African	25
ward	10401002	Female	Black African	28
ward	10401002	Male	Coloured	584
ward	10401002	Female	Coloured	598
ward	10401002	Male	White	27
ward	10401002	Female	White	17
ward	10401002	Male	Other	1
ward	10401002	Female	Other	1
ward	10401003	Male	Black African	21
ward	10401003	Female	Black African	17
ward	10401003	Male	Coloured	418
ward	10401003	Female	Coloured	448
ward	10401003	Female	Indian or Asian	2
ward	10401003	Male	White	4
ward	10401003	Female	White	2
ward	10401003	Male	Other	1
ward	10401003	Female	Other	2
ward	10401004	Male	Black African	60
ward	10401004	Female	Black African	54
ward	10401004	Male	Coloured	341
ward	10401004	Female	Coloured	304
ward	10401004	Male	Indian or Asian	2
ward	10401004	Female	Indian or Asian	1
ward	10401004	Male	White	77
ward	10401004	Female	White	77
ward	10401004	Male	Other	4
ward	10401004	Female	Other	7
ward	10402001	Male	Black African	21
ward	10402001	Female	Black African	14
ward	10402001	Male	Coloured	300
ward	10402001	Female	Coloured	345
ward	10402001	Male	Indian or Asian	1
ward	10402001	Female	Indian or Asian	2
ward	10402001	Male	White	94
ward	10402001	Female	White	90
ward	10402001	Male	Other	1
ward	10402002	Male	Black African	54
ward	10402002	Female	Black African	55
ward	10402002	Male	Coloured	421
ward	10402002	Female	Coloured	414
ward	10402002	Male	Indian or Asian	4
ward	10402002	Female	Indian or Asian	1
ward	10402002	Male	White	84
ward	10402002	Female	White	87
ward	10402002	Male	Other	6
ward	10402003	Male	Black African	22
ward	10402003	Female	Black African	12
ward	10402003	Male	Coloured	139
ward	10402003	Female	Coloured	148
ward	10402003	Male	Indian or Asian	2
ward	10402003	Male	White	64
ward	10402003	Female	White	67
ward	10402003	Male	Other	4
ward	10402003	Female	Other	2
ward	10402004	Male	Black African	56
ward	10402004	Female	Black African	59
ward	10402004	Male	Coloured	598
ward	10402004	Female	Coloured	622
ward	10402004	Male	Indian or Asian	4
ward	10402004	Female	Indian or Asian	7
ward	10402004	Male	White	33
ward	10402004	Female	White	38
ward	10402004	Male	Other	2
ward	10402005	Male	Black African	23
ward	10402005	Female	Black African	22
ward	10402005	Male	Coloured	342
ward	10402005	Female	Coloured	328
ward	10402005	Male	Indian or Asian	1
ward	10402005	Female	Indian or Asian	1
ward	10402005	Male	White	36
ward	10402005	Female	White	52
ward	10402005	Male	Other	5
ward	10402005	Female	Other	1
ward	10402006	Male	Black African	44
ward	10402006	Female	Black African	29
ward	10402006	Male	Coloured	427
ward	10402006	Female	Coloured	486
ward	10402006	Male	Indian or Asian	6
ward	10402006	Female	Indian or Asian	7
ward	10402006	Male	White	28
ward	10402006	Female	White	35
ward	10402006	Male	Other	1
ward	10402006	Female	Other	1
ward	10402007	Male	Black African	83
ward	10402007	Female	Black African	66
ward	10402007	Male	Coloured	255
ward	10402007	Female	Coloured	262
ward	10402007	Male	Indian or Asian	2
ward	10402007	Female	Indian or Asian	4
ward	10402007	Male	White	101
ward	10402007	Female	White	98
ward	10402007	Male	Other	2
ward	10402007	Female	Other	1
ward	10402008	Male	Black African	10
ward	10402008	Female	Black African	6
ward	10402008	Male	Coloured	471
ward	10402008	Female	Coloured	549
ward	10402008	Female	Indian or Asian	1
ward	10403001	Male	Black African	635
ward	10403001	Female	Black African	707
ward	10403001	Male	Coloured	2
ward	10403001	Female	Coloured	9
ward	10403001	Male	Indian or Asian	2
ward	10403001	Female	Indian or Asian	1
ward	10403001	Female	White	1
ward	10403001	Male	Other	5
ward	10403001	Female	Other	1
ward	10403002	Male	Black African	330
ward	10403002	Female	Black African	365
ward	10403002	Male	Coloured	186
ward	10403002	Female	Coloured	198
ward	10403002	Male	Indian or Asian	2
ward	10403002	Female	Indian or Asian	2
ward	10403002	Male	White	2
ward	10403002	Female	White	2
ward	10403002	Male	Other	15
ward	10403002	Female	Other	1
ward	10403003	Male	Black African	611
ward	10403003	Female	Black African	675
ward	10403003	Male	Coloured	247
ward	10403003	Female	Coloured	265
ward	10403003	Male	Indian or Asian	1
ward	10403003	Male	White	6
ward	10403003	Female	White	4
ward	10403003	Male	Other	12
ward	10403003	Female	Other	4
ward	10403004	Male	Black African	27
ward	10403004	Female	Black African	21
ward	10403004	Male	Coloured	207
ward	10403004	Female	Coloured	212
ward	10403004	Male	Indian or Asian	5
ward	10403004	Male	White	113
ward	10403004	Female	White	81
ward	10403004	Female	Other	2
ward	10403005	Male	Black African	17
ward	10403005	Female	Black African	21
ward	10403005	Male	Coloured	150
ward	10403005	Female	Coloured	158
ward	10403005	Female	Indian or Asian	2
ward	10403005	Male	White	149
ward	10403005	Female	White	130
ward	10403005	Male	Other	4
ward	10403005	Female	Other	2
ward	10403006	Male	Black African	53
ward	10403006	Female	Black African	66
ward	10403006	Male	Coloured	122
ward	10403006	Female	Coloured	106
ward	10403006	Male	Indian or Asian	7
ward	10403006	Female	Indian or Asian	6
ward	10403006	Male	White	163
ward	10403006	Female	White	195
ward	10403006	Male	Other	4
ward	10403006	Female	Other	1
ward	10403007	Male	Black African	32
ward	10403007	Female	Black African	30
ward	10403007	Male	Coloured	171
ward	10403007	Female	Coloured	174
ward	10403007	Male	Indian or Asian	2
ward	10403007	Female	Indian or Asian	1
ward	10403007	Male	White	88
ward	10403007	Female	White	101
ward	10403008	Male	Black African	20
ward	10403008	Female	Black African	21
ward	10403008	Male	Coloured	122
ward	10403008	Female	Coloured	157
ward	10403008	Male	Indian or Asian	5
ward	10403008	Male	White	117
ward	10403008	Female	White	129
ward	10403008	Male	Other	5
ward	10403008	Female	Other	4
ward	10403009	Male	Black African	23
ward	10403009	Female	Black African	36
ward	10403009	Male	Coloured	540
ward	10403009	Female	Coloured	539
ward	10403009	Male	Indian or Asian	2
ward	10403009	Female	Indian or Asian	2
ward	10403009	Male	White	1
ward	10403009	Female	White	4
ward	10403009	Male	Other	6
ward	10403009	Female	Other	2
ward	10403010	Male	Black African	18
ward	10403010	Female	Black African	22
ward	10403010	Male	Coloured	5
ward	10403010	Female	Coloured	8
ward	10403010	Male	Indian or Asian	1
ward	10403010	Female	Indian or Asian	2
ward	10403010	Male	White	143
ward	10403010	Female	White	174
ward	10403011	Male	Black African	175
ward	10403011	Female	Black African	249
ward	10403011	Male	Coloured	154
ward	10403011	Female	Coloured	150
ward	10403011	Male	Indian or Asian	4
ward	10403011	Female	Indian or Asian	6
ward	10403011	Male	White	91
ward	10403011	Female	White	77
ward	10403011	Male	Other	10
ward	10403011	Female	Other	7
ward	10403012	Male	Black African	296
ward	10403012	Female	Black African	337
ward	10403012	Male	Coloured	150
ward	10403012	Female	Coloured	142
ward	10403012	Male	Indian or Asian	2
ward	10403012	Female	Indian or Asian	2
ward	10403012	Female	White	1
ward	10403012	Male	Other	6
ward	10403012	Female	Other	1
ward	10403013	Male	Black African	68
ward	10403013	Female	Black African	80
ward	10403013	Male	Coloured	572
ward	10403013	Female	Coloured	568
ward	10403013	Male	Indian or Asian	7
ward	10403013	Female	Indian or Asian	3
ward	10403013	Male	White	4
ward	10403013	Female	White	6
ward	10403014	Male	Black African	53
ward	10403014	Female	Black African	35
ward	10403014	Male	Coloured	741
ward	10403014	Female	Coloured	766
ward	10403014	Male	Indian or Asian	3
ward	10403014	Female	Indian or Asian	9
ward	10403014	Male	White	17
ward	10403014	Female	White	11
ward	10403014	Male	Other	30
ward	10403014	Female	Other	14
ward	10404001	Male	Black African	34
ward	10404001	Female	Black African	50
ward	10404001	Male	Coloured	568
ward	10404001	Female	Coloured	575
ward	10404001	Male	Indian or Asian	1
ward	10404001	Female	Indian or Asian	2
ward	10404001	Male	White	109
ward	10404001	Female	White	116
ward	10404001	Male	Other	9
ward	10404001	Female	Other	6
ward	10404002	Male	Black African	7
ward	10404002	Female	Black African	8
ward	10404002	Male	Coloured	6
ward	10404002	Female	Coloured	4
ward	10404002	Male	Indian or Asian	11
ward	10404002	Female	Indian or Asian	1
ward	10404002	Male	White	164
ward	10404002	Female	White	160
ward	10404002	Female	Other	1
ward	10404003	Male	Black African	8
ward	10404003	Female	Black African	11
ward	10404003	Male	Coloured	31
ward	10404003	Female	Coloured	28
ward	10404003	Male	White	244
ward	10404003	Female	White	191
ward	10404003	Male	Other	6
ward	10404003	Female	Other	3
ward	10404004	Male	Black African	139
ward	10404004	Female	Black African	153
ward	10404004	Male	Coloured	331
ward	10404004	Female	Coloured	302
ward	10404004	Male	Indian or Asian	1
ward	10404004	Female	Indian or Asian	2
ward	10404004	Male	White	162
ward	10404004	Female	White	122
ward	10404004	Female	Other	3
ward	10404005	Male	Black African	38
ward	10404005	Female	Black African	63
ward	10404005	Male	Coloured	218
ward	10404005	Female	Coloured	257
ward	10404005	Male	Indian or Asian	7
ward	10404005	Female	Indian or Asian	6
ward	10404005	Male	White	182
ward	10404005	Female	White	197
ward	10404005	Male	Other	2
ward	10404005	Female	Other	3
ward	10404006	Male	Black African	87
ward	10404006	Female	Black African	82
ward	10404006	Male	Coloured	813
ward	10404006	Female	Coloured	857
ward	10404006	Male	Indian or Asian	4
ward	10404006	Female	Indian or Asian	5
ward	10404006	Male	White	5
ward	10404006	Female	White	7
ward	10404006	Male	Other	19
ward	10404006	Female	Other	11
ward	10404007	Male	Black African	274
ward	10404007	Female	Black African	282
ward	10404007	Male	Coloured	621
ward	10404007	Female	Coloured	643
ward	10404007	Male	Indian or Asian	3
ward	10404007	Female	Indian or Asian	6
ward	10404007	Male	White	4
ward	10404007	Female	White	7
ward	10404007	Male	Other	18
ward	10404007	Female	Other	6
ward	10404008	Male	Black African	99
ward	10404008	Female	Black African	98
ward	10404008	Male	Coloured	645
ward	10404008	Female	Coloured	671
ward	10404008	Male	Indian or Asian	6
ward	10404008	Female	Indian or Asian	5
ward	10404008	Male	White	6
ward	10404008	Female	White	9
ward	10404008	Male	Other	12
ward	10404008	Female	Other	1
ward	10404009	Male	Black African	578
ward	10404009	Female	Black African	619
ward	10404009	Male	Coloured	18
ward	10404009	Female	Coloured	31
ward	10404009	Male	Indian or Asian	1
ward	10404009	Male	White	1
ward	10404009	Female	White	1
ward	10404009	Male	Other	13
ward	10404009	Female	Other	4
ward	10404010	Male	Black African	328
ward	10404010	Female	Black African	346
ward	10404010	Male	Coloured	7
ward	10404010	Female	Coloured	4
ward	10404010	Male	Other	9
ward	10404010	Female	Other	1
ward	10404011	Male	Black African	706
ward	10404011	Female	Black African	716
ward	10404011	Male	Coloured	27
ward	10404011	Female	Coloured	34
ward	10404011	Male	Indian or Asian	2
ward	10404011	Female	Indian or Asian	3
ward	10404011	Male	White	60
ward	10404011	Female	White	52
ward	10404011	Male	Other	6
ward	10404011	Female	Other	2
ward	10404012	Male	Black African	417
ward	10404012	Female	Black African	390
ward	10404012	Male	Coloured	12
ward	10404012	Female	Coloured	17
ward	10404012	Male	Indian or Asian	1
ward	10404012	Female	Indian or Asian	1
ward	10404012	Male	Other	2
ward	10404013	Male	Black African	697
ward	10404013	Female	Black African	752
ward	10404013	Male	Coloured	25
ward	10404013	Female	Coloured	39
ward	10404013	Male	Indian or Asian	4
ward	10404013	Male	White	1
ward	10404013	Female	White	2
ward	10404013	Male	Other	5
ward	10404013	Female	Other	1
ward	10404014	Male	Black African	23
ward	10404014	Female	Black African	23
ward	10404014	Male	Coloured	770
ward	10404014	Female	Coloured	727
ward	10404014	Male	Indian or Asian	2
ward	10404014	Female	Indian or Asian	5
ward	10404014	Male	White	1
ward	10404014	Female	White	3
ward	10404014	Male	Other	11
ward	10404014	Female	Other	4
ward	10404015	Male	Black African	402
ward	10404015	Female	Black African	523
ward	10404015	Male	Coloured	93
ward	10404015	Female	Coloured	115
ward	10404015	Male	White	1
ward	10404015	Male	Other	10
ward	10404015	Female	Other	4
ward	10404016	Male	Black African	88
ward	10404016	Female	Black African	73
ward	10404016	Male	Coloured	1043
ward	10404016	Female	Coloured	1111
ward	10404016	Male	Indian or Asian	7
ward	10404016	Female	Indian or Asian	12
ward	10404016	Male	White	4
ward	10404016	Female	White	7
ward	10404016	Male	Other	15
ward	10404016	Female	Other	2
ward	10404017	Male	Black African	51
ward	10404017	Female	Black African	38
ward	10404017	Male	Coloured	759
ward	10404017	Female	Coloured	774
ward	10404017	Male	Indian or Asian	7
ward	10404017	Female	Indian or Asian	5
ward	10404017	Male	White	9
ward	10404017	Female	White	10
ward	10404017	Male	Other	15
ward	10404018	Male	Black African	14
ward	10404018	Female	Black African	11
ward	10404018	Male	Coloured	5
ward	10404018	Female	Coloured	7
ward	10404018	Male	Indian or Asian	5
ward	10404018	Female	Indian or Asian	7
ward	10404018	Male	White	240
ward	10404018	Female	White	253
ward	10404018	Male	Other	3
ward	10404018	Female	Other	6
ward	10404019	Male	Black African	46
ward	10404019	Female	Black African	76
ward	10404019	Male	Coloured	94
ward	10404019	Female	Coloured	122
ward	10404019	Male	Indian or Asian	3
ward	10404019	Female	Indian or Asian	7
ward	10404019	Male	White	427
ward	10404019	Female	White	465
ward	10404019	Male	Other	20
ward	10404019	Female	Other	23
ward	10404020	Male	Black African	129
ward	10404020	Female	Black African	117
ward	10404020	Male	Coloured	630
ward	10404020	Female	Coloured	630
ward	10404020	Male	White	1
ward	10404020	Female	White	1
ward	10404020	Male	Other	5
ward	10404020	Female	Other	2
ward	10404021	Male	Black African	751
ward	10404021	Female	Black African	900
ward	10404021	Male	Coloured	17
ward	10404021	Female	Coloured	25
ward	10404021	Male	White	1
ward	10404021	Male	Other	7
ward	10404022	Male	Black African	58
ward	10404022	Female	Black African	55
ward	10404022	Male	Coloured	378
ward	10404022	Female	Coloured	460
ward	10404022	Male	Indian or Asian	4
ward	10404022	Female	Indian or Asian	3
ward	10404022	Male	White	174
ward	10404022	Female	White	179
ward	10404022	Male	Other	1
ward	10404022	Female	Other	3
ward	10404023	Male	Black African	151
ward	10404023	Female	Black African	77
ward	10404023	Male	Coloured	589
ward	10404023	Female	Coloured	542
ward	10404023	Male	Indian or Asian	4
ward	10404023	Female	Indian or Asian	5
ward	10404023	Male	White	198
ward	10404023	Female	White	204
ward	10404023	Male	Other	46
ward	10404023	Female	Other	10
ward	10404024	Male	Black African	39
ward	10404024	Female	Black African	30
ward	10404024	Male	Coloured	670
ward	10404024	Female	Coloured	641
ward	10404024	Male	Indian or Asian	6
ward	10404024	Female	Indian or Asian	8
ward	10404024	Male	White	25
ward	10404024	Female	White	30
ward	10404024	Male	Other	12
ward	10404025	Male	Black African	50
ward	10404025	Female	Black African	49
ward	10404025	Male	Coloured	618
ward	10404025	Female	Coloured	640
ward	10404025	Male	Indian or Asian	2
ward	10404025	Female	Indian or Asian	1
ward	10404025	Male	White	45
ward	10404025	Female	White	37
ward	10404025	Male	Other	14
ward	10404025	Female	Other	4
ward	10405001	Male	Black African	34
ward	10405001	Female	Black African	50
ward	10405001	Male	Coloured	349
ward	10405001	Female	Coloured	352
ward	10405001	Male	Indian or Asian	2
ward	10405001	Male	White	94
ward	10405001	Female	White	82
ward	10405001	Female	Other	2
ward	10405002	Male	Black African	5
ward	10405002	Female	Black African	7
ward	10405002	Male	Coloured	324
ward	10405002	Female	Coloured	294
ward	10405002	Male	White	149
ward	10405002	Female	White	160
ward	10405002	Male	Other	2
ward	10405002	Female	Other	3
ward	10405003	Male	Black African	114
ward	10405003	Female	Black African	129
ward	10405003	Male	Coloured	414
ward	10405003	Female	Coloured	496
ward	10405003	Male	Indian or Asian	7
ward	10405003	Female	Indian or Asian	5
ward	10405003	Male	White	165
ward	10405003	Female	White	146
ward	10405003	Male	Other	27
ward	10405003	Female	Other	13
ward	10405004	Male	Black African	111
ward	10405004	Female	Black African	97
ward	10405004	Male	Coloured	263
ward	10405004	Female	Coloured	280
ward	10405004	Male	Indian or Asian	5
ward	10405004	Male	White	5
ward	10405004	Male	Other	2
ward	10405004	Female	Other	1
ward	10405005	Male	Black African	27
ward	10405005	Female	Black African	22
ward	10405005	Male	Coloured	569
ward	10405005	Female	Coloured	555
ward	10405005	Female	Indian or Asian	1
ward	10405005	Male	White	1
ward	10405005	Male	Other	6
ward	10405005	Female	Other	2
ward	10405006	Male	Black African	33
ward	10405006	Female	Black African	42
ward	10405006	Male	Coloured	947
ward	10405006	Female	Coloured	1031
ward	10405006	Male	Indian or Asian	3
ward	10405006	Female	Indian or Asian	7
ward	10405006	Male	White	1
ward	10405006	Female	White	1
ward	10405006	Male	Other	6
ward	10405006	Female	Other	1
ward	10405007	Male	Black African	230
ward	10405007	Female	Black African	35
ward	10405007	Male	Coloured	494
ward	10405007	Female	Coloured	473
ward	10405007	Male	Indian or Asian	8
ward	10405007	Female	Indian or Asian	1
ward	10405007	Male	White	109
ward	10405007	Female	White	93
ward	10405007	Male	Other	9
ward	10405007	Female	Other	1
ward	10405008	Male	Black African	359
ward	10405008	Female	Black African	352
ward	10405008	Male	Coloured	661
ward	10405008	Female	Coloured	680
ward	10405008	Male	Indian or Asian	2
ward	10405008	Female	Indian or Asian	1
ward	10405008	Male	White	2
ward	10405008	Male	Other	6
ward	10405008	Female	Other	1
ward	10405009	Male	Black African	25
ward	10405009	Female	Black African	32
ward	10405009	Male	Coloured	492
ward	10405009	Female	Coloured	479
ward	10405009	Male	Indian or Asian	2
ward	10405009	Female	Indian or Asian	1
ward	10405009	Male	Other	2
ward	10405009	Female	Other	1
ward	10405010	Male	Black African	14
ward	10405010	Female	Black African	12
ward	10405010	Male	Coloured	586
ward	10405010	Female	Coloured	565
ward	10405010	Male	Indian or Asian	4
ward	10405010	Female	Indian or Asian	2
ward	10405010	Female	White	2
ward	10405010	Male	Other	2
ward	10405011	Male	Black African	39
ward	10405011	Female	Black African	33
ward	10405011	Male	Coloured	905
ward	10405011	Female	Coloured	908
ward	10405011	Male	Indian or Asian	2
ward	10405011	Male	White	53
ward	10405011	Female	White	30
ward	10405011	Male	Other	5
ward	10405011	Female	Other	4
ward	10405012	Male	Black African	18
ward	10405012	Female	Black African	7
ward	10405012	Male	Coloured	539
ward	10405012	Female	Coloured	515
ward	10405012	Male	White	40
ward	10405012	Female	White	28
ward	10405012	Male	Other	3
ward	10405012	Female	Other	2
ward	10405013	Male	Black African	23
ward	10405013	Female	Black African	14
ward	10405013	Male	Coloured	445
ward	10405013	Female	Coloured	462
ward	10405013	Male	Indian or Asian	1
ward	10405013	Female	Indian or Asian	1
ward	10405013	Male	White	2
ward	10405013	Female	White	1
ward	10405013	Male	Other	11
ward	10405013	Female	Other	7
ward	10407001	Male	Black African	196
ward	10407001	Female	Black African	198
ward	10407001	Male	Coloured	346
ward	10407001	Female	Coloured	359
ward	10407001	Male	Indian or Asian	1
ward	10407001	Female	Indian or Asian	6
ward	10407001	Male	White	57
ward	10407001	Female	White	52
ward	10407001	Male	Other	41
ward	10407001	Female	Other	27
ward	10407002	Male	Black African	201
ward	10407002	Female	Black African	206
ward	10407002	Male	Coloured	19
ward	10407002	Female	Coloured	38
ward	10407002	Male	Indian or Asian	8
ward	10407002	Female	Indian or Asian	6
ward	10407002	Male	White	210
ward	10407002	Female	White	195
ward	10407002	Male	Other	7
ward	10407002	Female	Other	2
ward	10407003	Male	Black African	259
ward	10407003	Female	Black African	280
ward	10407003	Male	Coloured	123
ward	10407003	Female	Coloured	117
ward	10407003	Female	Indian or Asian	1
ward	10407003	Male	White	2
ward	10407003	Female	White	3
ward	10407003	Male	Other	8
ward	10407003	Female	Other	2
ward	10407004	Male	Black African	204
ward	10407004	Female	Black African	185
ward	10407004	Male	Coloured	453
ward	10407004	Female	Coloured	443
ward	10407004	Male	Indian or Asian	2
ward	10407004	Female	Indian or Asian	8
ward	10407004	Male	White	5
ward	10407004	Female	White	2
ward	10407004	Male	Other	4
ward	10407005	Male	Black African	520
ward	10407005	Female	Black African	548
ward	10407005	Male	Coloured	7
ward	10407005	Female	Coloured	7
ward	10407005	Female	Indian or Asian	2
ward	10407005	Male	White	1
ward	10407005	Female	White	1
ward	10407005	Male	Other	7
ward	10407005	Female	Other	7
ward	10407006	Male	Black African	292
ward	10407006	Female	Black African	382
ward	10407006	Female	Coloured	5
ward	10407006	Female	Indian or Asian	1
ward	10407006	Male	Other	4
ward	10407006	Female	Other	2
ward	10407007	Male	Black African	271
ward	10407007	Female	Black African	253
ward	10407007	Male	Coloured	386
ward	10407007	Female	Coloured	397
ward	10407007	Male	Indian or Asian	7
ward	10407007	Female	Indian or Asian	4
ward	10407007	Male	White	87
ward	10407007	Female	White	61
ward	10407007	Male	Other	170
ward	10407007	Female	Other	145
ward	10408001	Male	Black African	178
ward	10408001	Female	Black African	179
ward	10408001	Male	Coloured	226
ward	10408001	Female	Coloured	222
ward	10408001	Male	Indian or Asian	1
ward	10408001	Male	White	42
ward	10408001	Female	White	46
ward	10408001	Male	Other	25
ward	10408001	Female	Other	6
ward	10408002	Male	Black African	36
ward	10408002	Female	Black African	28
ward	10408002	Male	Coloured	229
ward	10408002	Female	Coloured	209
ward	10408002	Male	Indian or Asian	1
ward	10408002	Female	Indian or Asian	2
ward	10408002	Male	White	109
ward	10408002	Female	White	110
ward	10408002	Male	Other	2
ward	10408002	Female	Other	4
ward	10408003	Male	Black African	353
ward	10408003	Female	Black African	339
ward	10408003	Male	Coloured	120
ward	10408003	Female	Coloured	142
ward	10408003	Female	Indian or Asian	1
ward	10408003	Male	White	5
ward	10408003	Female	White	3
ward	10408003	Male	Other	9
ward	10408003	Female	Other	1
ward	10408004	Male	Black African	372
ward	10408004	Female	Black African	399
ward	10408004	Male	Coloured	20
ward	10408004	Female	Coloured	21
ward	10408004	Female	Indian or Asian	1
ward	10408004	Male	White	37
ward	10408004	Female	White	29
ward	10408004	Male	Other	10
ward	10408004	Female	Other	5
ward	10408005	Male	Black African	58
ward	10408005	Female	Black African	45
ward	10408005	Male	Coloured	369
ward	10408005	Female	Coloured	347
ward	10408005	Male	White	32
ward	10408005	Female	White	36
ward	10408005	Male	Other	2
ward	10408005	Female	Other	2
ward	10408006	Male	Black African	158
ward	10408006	Female	Black African	181
ward	10408006	Male	Coloured	544
ward	10408006	Female	Coloured	588
ward	10408006	Male	Indian or Asian	4
ward	10408006	Female	Indian or Asian	1
ward	10408006	Female	White	1
ward	10408006	Male	Other	8
ward	10408006	Female	Other	6
ward	10408007	Male	Black African	741
ward	10408007	Female	Black African	889
ward	10408007	Male	Coloured	306
ward	10408007	Female	Coloured	367
ward	10408007	Male	Indian or Asian	6
ward	10408007	Female	Indian or Asian	8
ward	10408007	Male	White	4
ward	10408007	Female	White	10
ward	10408007	Male	Other	13
ward	10408007	Female	Other	6
ward	10408008	Male	Black African	194
ward	10408008	Female	Black African	220
ward	10408008	Male	Coloured	261
ward	10408008	Female	Coloured	257
ward	10408008	Male	Indian or Asian	4
ward	10408008	Female	Indian or Asian	1
ward	10408008	Male	White	2
ward	10408008	Female	White	5
ward	10408008	Male	Other	10
ward	10408008	Female	Other	1
ward	10408009	Male	Black African	74
ward	10408009	Female	Black African	68
ward	10408009	Male	Coloured	363
ward	10408009	Female	Coloured	387
ward	10408009	Male	Indian or Asian	8
ward	10408009	Female	Indian or Asian	3
ward	10408009	Male	White	109
ward	10408009	Female	White	104
ward	10408009	Female	Other	4
ward	10408010	Male	Black African	41
ward	10408010	Female	Black African	49
ward	10408010	Male	Coloured	43
ward	10408010	Female	Coloured	38
ward	10408010	Male	Indian or Asian	2
ward	10408010	Female	Indian or Asian	4
ward	10408010	Male	White	169
ward	10408010	Female	White	175
ward	10408010	Male	Other	14
ward	10408010	Female	Other	9
ward	10501001	Male	Black African	45
ward	10501001	Female	Black African	33
ward	10501001	Male	Coloured	186
ward	10501001	Female	Coloured	215
ward	10501001	Male	White	10
ward	10501001	Female	White	8
ward	10501001	Male	Other	3
ward	10501002	Male	Black African	2
ward	10501002	Female	Black African	2
ward	10501002	Male	Coloured	35
ward	10501002	Female	Coloured	54
ward	10501002	Male	White	7
ward	10501002	Female	White	9
ward	10501002	Male	Other	2
ward	10501002	Female	Other	5
ward	10501003	Male	Black African	1
ward	10501003	Male	Coloured	9
ward	10501003	Female	Coloured	14
ward	10501003	Male	White	12
ward	10501003	Female	White	6
ward	10501003	Female	Other	2
ward	10501004	Male	Black African	10
ward	10501004	Female	Black African	5
ward	10501004	Male	Coloured	290
ward	10501004	Female	Coloured	260
ward	10501004	Male	White	6
ward	10501004	Female	White	4
ward	10502001	Male	Black African	17
ward	10502001	Female	Black African	13
ward	10502001	Male	Coloured	277
ward	10502001	Female	Coloured	262
ward	10502001	Male	Indian or Asian	7
ward	10502001	Female	Indian or Asian	1
ward	10502001	Male	White	13
ward	10502001	Female	White	9
ward	10502001	Male	Other	2
ward	10502002	Male	Black African	6
ward	10502002	Female	Black African	7
ward	10502002	Male	Coloured	157
ward	10502002	Female	Coloured	159
ward	10502002	Male	White	28
ward	10502002	Female	White	20
ward	10502002	Male	Other	1
ward	10502003	Male	Black African	1
ward	10502003	Female	Black African	2
ward	10502003	Male	Coloured	236
ward	10502003	Female	Coloured	274
ward	10502003	Male	Other	5
ward	10502003	Female	Other	1
ward	10502004	Male	Black African	7
ward	10502004	Female	Black African	4
ward	10502004	Male	Coloured	359
ward	10502004	Female	Coloured	325
ward	10502004	Male	White	30
ward	10502004	Female	White	22
ward	10503001	Male	Black African	90
ward	10503001	Female	Black African	131
ward	10503001	Male	Coloured	501
ward	10503001	Female	Coloured	451
ward	10503001	Female	Indian or Asian	2
ward	10503001	Male	White	35
ward	10503001	Female	White	25
ward	10503001	Male	Other	4
ward	10503001	Female	Other	4
ward	10503002	Male	Black African	67
ward	10503002	Female	Black African	59
ward	10503002	Male	Coloured	371
ward	10503002	Female	Coloured	308
ward	10503002	Female	Indian or Asian	1
ward	10503002	Male	White	93
ward	10503002	Female	White	96
ward	10503002	Male	Other	1
ward	10503003	Male	Black African	20
ward	10503003	Female	Black African	28
ward	10503003	Male	Coloured	632
ward	10503003	Female	Coloured	710
ward	10503003	Male	Indian or Asian	5
ward	10503003	Female	Indian or Asian	2
ward	10503003	Male	White	2
ward	10503004	Male	Black African	221
ward	10503004	Female	Black African	228
ward	10503004	Male	Coloured	105
ward	10503004	Female	Coloured	124
ward	10503004	Male	Indian or Asian	5
ward	10503004	Female	Indian or Asian	4
ward	10503004	Male	White	85
ward	10503004	Female	White	83
ward	10503004	Male	Other	4
ward	10503004	Female	Other	5
ward	10503005	Male	Black African	241
ward	10503005	Female	Black African	231
ward	10503005	Male	Coloured	373
ward	10503005	Female	Coloured	391
ward	10503005	Male	Indian or Asian	1
ward	10503005	Female	Indian or Asian	1
ward	10503005	Male	Other	8
ward	10503005	Female	Other	4
ward	10503006	Male	Black African	13
ward	10503006	Female	Black African	8
ward	10503006	Male	Coloured	416
ward	10503006	Female	Coloured	429
ward	10503006	Male	Indian or Asian	5
ward	10503006	Female	Indian or Asian	4
ward	10503006	Female	White	1
ward	10503006	Male	Other	2
ward	10503007	Male	Black African	72
ward	10503007	Female	Black African	79
ward	10503007	Male	Coloured	690
ward	10503007	Female	Coloured	708
ward	10503007	Male	Indian or Asian	6
ward	10503007	Female	Indian or Asian	1
ward	10503007	Male	White	41
ward	10503007	Female	White	23
ward	10503007	Male	Other	14
ward	10503007	Female	Other	2
ward	19100001	Male	Black African	148
ward	19100001	Female	Black African	151
ward	19100001	Male	Coloured	307
ward	19100001	Female	Coloured	299
ward	19100001	Male	Indian or Asian	98
ward	19100001	Female	Indian or Asian	94
ward	19100001	Male	White	1184
ward	19100001	Female	White	1189
ward	19100001	Male	Other	42
ward	19100001	Female	Other	29
ward	19100002	Male	Black African	244
ward	19100002	Female	Black African	377
ward	19100002	Male	Coloured	386
ward	19100002	Female	Coloured	424
ward	19100002	Male	Indian or Asian	52
ward	19100002	Female	Indian or Asian	46
ward	19100002	Male	White	985
ward	19100002	Female	White	1033
ward	19100002	Male	Other	36
ward	19100002	Female	Other	34
ward	19100003	Male	Black African	354
ward	19100003	Female	Black African	330
ward	19100003	Male	Coloured	413
ward	19100003	Female	Coloured	433
ward	19100003	Male	Indian or Asian	37
ward	19100003	Female	Indian or Asian	28
ward	19100003	Male	White	1395
ward	19100003	Female	White	1327
ward	19100003	Male	Other	33
ward	19100003	Female	Other	35
ward	19100004	Male	Black African	1947
ward	19100004	Female	Black African	2161
ward	19100004	Male	Coloured	379
ward	19100004	Female	Coloured	467
ward	19100004	Male	Indian or Asian	80
ward	19100004	Female	Indian or Asian	86
ward	19100004	Male	White	751
ward	19100004	Female	White	774
ward	19100004	Male	Other	75
ward	19100004	Female	Other	59
ward	19100005	Male	Black African	246
ward	19100005	Female	Black African	120
ward	19100005	Male	Coloured	481
ward	19100005	Female	Coloured	188
ward	19100005	Male	Indian or Asian	22
ward	19100005	Female	Indian or Asian	31
ward	19100005	Male	White	1254
ward	19100005	Female	White	1154
ward	19100005	Male	Other	13
ward	19100005	Female	Other	27
ward	19100006	Male	Black African	1312
ward	19100006	Female	Black African	1466
ward	19100006	Male	Coloured	834
ward	19100006	Female	Coloured	869
ward	19100006	Male	Indian or Asian	6
ward	19100006	Female	Indian or Asian	4
ward	19100006	Male	White	168
ward	19100006	Female	White	145
ward	19100006	Male	Other	44
ward	19100006	Female	Other	13
ward	19100007	Male	Black African	177
ward	19100007	Female	Black African	166
ward	19100007	Male	Coloured	2492
ward	19100007	Female	Coloured	2496
ward	19100007	Male	Indian or Asian	17
ward	19100007	Female	Indian or Asian	17
ward	19100007	Male	White	86
ward	19100007	Female	White	86
ward	19100007	Male	Other	35
ward	19100007	Female	Other	28
ward	19100008	Male	Black African	563
ward	19100008	Female	Black African	612
ward	19100008	Male	Coloured	578
ward	19100008	Female	Coloured	587
ward	19100008	Male	Indian or Asian	30
ward	19100008	Female	Indian or Asian	26
ward	19100008	Male	White	1223
ward	19100008	Female	White	1222
ward	19100008	Male	Other	31
ward	19100008	Female	Other	23
ward	19100009	Male	Black African	1533
ward	19100009	Female	Black African	1964
ward	19100009	Male	Coloured	2178
ward	19100009	Female	Coloured	2300
ward	19100009	Male	Indian or Asian	40
ward	19100009	Female	Indian or Asian	31
ward	19100009	Male	White	47
ward	19100009	Female	White	31
ward	19100009	Male	Other	100
ward	19100009	Female	Other	90
ward	19100010	Male	Black African	503
ward	19100010	Female	Black African	675
ward	19100010	Male	Coloured	1410
ward	19100010	Female	Coloured	1610
ward	19100010	Male	Indian or Asian	40
ward	19100010	Female	Indian or Asian	46
ward	19100010	Male	White	451
ward	19100010	Female	White	563
ward	19100010	Male	Other	113
ward	19100010	Female	Other	123
ward	19100011	Male	Black African	791
ward	19100011	Female	Black African	995
ward	19100011	Male	Coloured	2422
ward	19100011	Female	Coloured	2469
ward	19100011	Male	Indian or Asian	22
ward	19100011	Female	Indian or Asian	19
ward	19100011	Male	White	436
ward	19100011	Female	White	380
ward	19100011	Male	Other	96
ward	19100011	Female	Other	51
ward	19100012	Male	Black African	194
ward	19100012	Female	Black African	162
ward	19100012	Male	Coloured	3121
ward	19100012	Female	Coloured	3245
ward	19100012	Male	Indian or Asian	20
ward	19100012	Female	Indian or Asian	25
ward	19100012	Male	White	5
ward	19100012	Female	White	6
ward	19100012	Male	Other	77
ward	19100012	Female	Other	50
ward	19100013	Male	Black African	1188
ward	19100013	Female	Black African	1394
ward	19100013	Male	Coloured	3567
ward	19100013	Female	Coloured	3607
ward	19100013	Male	Indian or Asian	24
ward	19100013	Female	Indian or Asian	17
ward	19100013	Male	White	6
ward	19100013	Female	White	2
ward	19100013	Male	Other	105
ward	19100013	Female	Other	30
ward	19100014	Male	Black African	719
ward	19100014	Female	Black African	730
ward	19100014	Male	Coloured	2357
ward	19100014	Female	Coloured	2593
ward	19100014	Male	Indian or Asian	20
ward	19100014	Female	Indian or Asian	17
ward	19100014	Male	White	364
ward	19100014	Female	White	346
ward	19100014	Male	Other	46
ward	19100014	Female	Other	25
ward	19100015	Male	Black African	204
ward	19100015	Female	Black African	203
ward	19100015	Male	Coloured	323
ward	19100015	Female	Coloured	322
ward	19100015	Male	Indian or Asian	31
ward	19100015	Female	Indian or Asian	29
ward	19100015	Male	White	848
ward	19100015	Female	White	860
ward	19100015	Male	Other	16
ward	19100015	Female	Other	19
ward	19100016	Male	Black African	1117
ward	19100016	Female	Black African	1260
ward	19100016	Male	Coloured	2853
ward	19100016	Female	Coloured	2984
ward	19100016	Male	Indian or Asian	26
ward	19100016	Female	Indian or Asian	21
ward	19100016	Male	White	11
ward	19100016	Female	White	8
ward	19100016	Male	Other	82
ward	19100016	Female	Other	24
ward	19100017	Male	Black African	395
ward	19100017	Female	Black African	386
ward	19100017	Male	Coloured	3498
ward	19100017	Female	Coloured	3453
ward	19100017	Male	Indian or Asian	29
ward	19100017	Female	Indian or Asian	25
ward	19100017	Male	White	12
ward	19100017	Female	White	12
ward	19100017	Male	Other	85
ward	19100017	Female	Other	44
ward	19100018	Male	Black African	2370
ward	19100018	Female	Black African	2628
ward	19100018	Male	Coloured	13
ward	19100018	Female	Coloured	22
ward	19100018	Female	Indian or Asian	1
ward	19100018	Female	White	1
ward	19100018	Male	Other	25
ward	19100018	Female	Other	1
ward	19100019	Male	Black African	1368
ward	19100019	Female	Black African	1669
ward	19100019	Male	Coloured	3324
ward	19100019	Female	Coloured	3448
ward	19100019	Male	Indian or Asian	31
ward	19100019	Female	Indian or Asian	29
ward	19100019	Male	White	10
ward	19100019	Female	White	5
ward	19100019	Male	Other	156
ward	19100019	Female	Other	36
ward	19100020	Male	Black African	1630
ward	19100020	Female	Black African	1839
ward	19100020	Male	Coloured	2560
ward	19100020	Female	Coloured	2520
ward	19100020	Male	Indian or Asian	24
ward	19100020	Female	Indian or Asian	18
ward	19100020	Male	White	2
ward	19100020	Female	White	4
ward	19100020	Male	Other	107
ward	19100020	Female	Other	34
ward	19100021	Male	Black African	83
ward	19100021	Female	Black African	114
ward	19100021	Male	Coloured	105
ward	19100021	Female	Coloured	128
ward	19100021	Male	Indian or Asian	14
ward	19100021	Female	Indian or Asian	19
ward	19100021	Male	White	1225
ward	19100021	Female	White	1190
ward	19100021	Male	Other	15
ward	19100021	Female	Other	11
ward	19100022	Male	Black African	367
ward	19100022	Female	Black African	386
ward	19100022	Male	Coloured	2274
ward	19100022	Female	Coloured	2403
ward	19100022	Male	Indian or Asian	29
ward	19100022	Female	Indian or Asian	25
ward	19100022	Male	White	6
ward	19100022	Female	White	11
ward	19100022	Male	Other	83
ward	19100022	Female	Other	78
ward	19100023	Male	Black African	238
ward	19100023	Female	Black African	322
ward	19100023	Male	Coloured	238
ward	19100023	Female	Coloured	226
ward	19100023	Male	Indian or Asian	31
ward	19100023	Female	Indian or Asian	48
ward	19100023	Male	White	1310
ward	19100023	Female	White	1349
ward	19100023	Male	Other	32
ward	19100023	Female	Other	39
ward	19100024	Male	Black African	178
ward	19100024	Female	Black African	175
ward	19100024	Male	Coloured	2319
ward	19100024	Female	Coloured	2351
ward	19100024	Male	Indian or Asian	7
ward	19100024	Female	Indian or Asian	7
ward	19100024	Male	White	1
ward	19100024	Male	Other	17
ward	19100024	Female	Other	6
ward	19100025	Male	Black African	146
ward	19100025	Female	Black African	152
ward	19100025	Male	Coloured	3220
ward	19100025	Female	Coloured	3311
ward	19100025	Male	Indian or Asian	244
ward	19100025	Female	Indian or Asian	265
ward	19100025	Male	White	5
ward	19100025	Female	White	5
ward	19100025	Male	Other	51
ward	19100025	Female	Other	28
ward	19100026	Male	Black African	351
ward	19100026	Female	Black African	372
ward	19100026	Male	Coloured	1621
ward	19100026	Female	Coloured	1632
ward	19100026	Male	Indian or Asian	78
ward	19100026	Female	Indian or Asian	50
ward	19100026	Male	White	363
ward	19100026	Female	White	346
ward	19100026	Male	Other	62
ward	19100026	Female	Other	72
ward	19100027	Male	Black African	412
ward	19100027	Female	Black African	450
ward	19100027	Male	Coloured	749
ward	19100027	Female	Coloured	724
ward	19100027	Male	Indian or Asian	76
ward	19100027	Female	Indian or Asian	88
ward	19100027	Male	White	780
ward	19100027	Female	White	702
ward	19100027	Male	Other	46
ward	19100027	Female	Other	39
ward	19100028	Male	Black African	179
ward	19100028	Female	Black African	115
ward	19100028	Male	Coloured	2593
ward	19100028	Female	Coloured	2590
ward	19100028	Male	Indian or Asian	13
ward	19100028	Female	Indian or Asian	13
ward	19100028	Male	White	1
ward	19100028	Female	White	1
ward	19100028	Male	Other	25
ward	19100028	Female	Other	13
ward	19100029	Male	Black African	214
ward	19100029	Female	Black African	213
ward	19100029	Male	Coloured	3747
ward	19100029	Female	Coloured	3731
ward	19100029	Male	Indian or Asian	7
ward	19100029	Female	Indian or Asian	10
ward	19100029	Male	White	2
ward	19100029	Female	White	6
ward	19100029	Male	Other	59
ward	19100029	Female	Other	47
ward	19100030	Male	Black African	208
ward	19100030	Female	Black African	211
ward	19100030	Male	Coloured	2659
ward	19100030	Female	Coloured	2590
ward	19100030	Male	Indian or Asian	21
ward	19100030	Female	Indian or Asian	20
ward	19100030	Male	White	236
ward	19100030	Female	White	240
ward	19100030	Male	Other	49
ward	19100030	Female	Other	36
ward	19100031	Male	Black African	295
ward	19100031	Female	Black African	346
ward	19100031	Male	Coloured	2801
ward	19100031	Female	Coloured	2826
ward	19100031	Male	Indian or Asian	23
ward	19100031	Female	Indian or Asian	20
ward	19100031	Male	White	1
ward	19100031	Female	White	8
ward	19100031	Male	Other	102
ward	19100031	Female	Other	54
ward	19100032	Male	Black African	778
ward	19100032	Female	Black African	760
ward	19100032	Male	Coloured	2666
ward	19100032	Female	Coloured	2889
ward	19100032	Male	Indian or Asian	17
ward	19100032	Female	Indian or Asian	8
ward	19100032	Male	White	47
ward	19100032	Female	White	39
ward	19100032	Male	Other	57
ward	19100032	Female	Other	33
ward	19100033	Male	Black African	4346
ward	19100033	Female	Black African	4810
ward	19100033	Male	Coloured	27
ward	19100033	Female	Coloured	33
ward	19100033	Male	Indian or Asian	6
ward	19100033	Female	Indian or Asian	1
ward	19100033	Male	White	1
ward	19100033	Female	White	2
ward	19100033	Male	Other	43
ward	19100033	Female	Other	15
ward	19100034	Male	Black African	3445
ward	19100034	Female	Black African	3966
ward	19100034	Male	Coloured	19
ward	19100034	Female	Coloured	19
ward	19100034	Male	Indian or Asian	7
ward	19100034	Female	Indian or Asian	2
ward	19100034	Male	White	6
ward	19100034	Female	White	4
ward	19100034	Male	Other	63
ward	19100034	Female	Other	5
ward	19100035	Male	Black African	3674
ward	19100035	Female	Black African	4449
ward	19100035	Male	Coloured	147
ward	19100035	Female	Coloured	110
ward	19100035	Male	Indian or Asian	1
ward	19100035	Female	Indian or Asian	1
ward	19100035	Male	White	4
ward	19100035	Female	White	3
ward	19100035	Male	Other	60
ward	19100035	Female	Other	33
ward	19100036	Male	Black African	3345
ward	19100036	Female	Black African	3768
ward	19100036	Male	Coloured	120
ward	19100036	Female	Coloured	83
ward	19100036	Male	Indian or Asian	2
ward	19100036	Female	Indian or Asian	2
ward	19100036	Male	White	2
ward	19100036	Female	White	1
ward	19100036	Male	Other	11
ward	19100036	Female	Other	2
ward	19100037	Male	Black African	2199
ward	19100037	Female	Black African	2397
ward	19100037	Male	Coloured	1
ward	19100037	Female	Coloured	7
ward	19100037	Male	Indian or Asian	4
ward	19100037	Female	Indian or Asian	4
ward	19100037	Male	White	1
ward	19100037	Female	White	2
ward	19100037	Male	Other	26
ward	19100037	Female	Other	7
ward	19100038	Male	Black African	1752
ward	19100038	Female	Black African	1942
ward	19100038	Male	Coloured	7
ward	19100038	Female	Coloured	9
ward	19100038	Male	Indian or Asian	4
ward	19100038	Male	White	1
ward	19100038	Female	White	4
ward	19100038	Male	Other	22
ward	19100038	Female	Other	4
ward	19100039	Male	Black African	2566
ward	19100039	Female	Black African	2828
ward	19100039	Male	Coloured	5
ward	19100039	Female	Coloured	6
ward	19100039	Male	Indian or Asian	1
ward	19100039	Male	White	4
ward	19100039	Female	White	6
ward	19100039	Male	Other	37
ward	19100039	Female	Other	7
ward	19100040	Male	Black African	2645
ward	19100040	Female	Black African	2901
ward	19100040	Male	Coloured	22
ward	19100040	Female	Coloured	18
ward	19100040	Male	Indian or Asian	2
ward	19100040	Female	White	1
ward	19100040	Male	Other	7
ward	19100040	Female	Other	1
ward	19100041	Male	Black African	1739
ward	19100041	Female	Black African	1859
ward	19100041	Male	Coloured	22
ward	19100041	Female	Coloured	15
ward	19100041	Male	Indian or Asian	3
ward	19100041	Male	White	2
ward	19100041	Female	White	3
ward	19100041	Male	Other	27
ward	19100042	Male	Black African	2070
ward	19100042	Female	Black African	2308
ward	19100042	Male	Coloured	705
ward	19100042	Female	Coloured	715
ward	19100042	Male	Indian or Asian	13
ward	19100042	Female	Indian or Asian	4
ward	19100042	Male	White	2
ward	19100042	Female	White	1
ward	19100042	Male	Other	58
ward	19100042	Female	Other	44
ward	19100043	Male	Black African	165
ward	19100043	Female	Black African	206
ward	19100043	Male	Coloured	3137
ward	19100043	Female	Coloured	3273
ward	19100043	Male	Indian or Asian	41
ward	19100043	Female	Indian or Asian	37
ward	19100043	Male	White	6
ward	19100043	Female	White	7
ward	19100043	Male	Other	48
ward	19100043	Female	Other	42
ward	19100044	Male	Black African	1341
ward	19100044	Female	Black African	1618
ward	19100044	Male	Coloured	1771
ward	19100044	Female	Coloured	1802
ward	19100044	Male	Indian or Asian	30
ward	19100044	Female	Indian or Asian	26
ward	19100044	Male	White	2
ward	19100044	Female	White	5
ward	19100044	Male	Other	54
ward	19100044	Female	Other	35
ward	19100045	Male	Black African	1021
ward	19100045	Female	Black African	1024
ward	19100045	Male	Coloured	2183
ward	19100045	Female	Coloured	2244
ward	19100045	Male	Indian or Asian	18
ward	19100045	Female	Indian or Asian	15
ward	19100045	Male	White	1
ward	19100045	Female	White	2
ward	19100045	Male	Other	106
ward	19100045	Female	Other	71
ward	19100046	Male	Black African	104
ward	19100046	Female	Black African	101
ward	19100046	Male	Coloured	2758
ward	19100046	Female	Coloured	2821
ward	19100046	Male	Indian or Asian	101
ward	19100046	Female	Indian or Asian	84
ward	19100046	Male	White	2
ward	19100046	Female	White	2
ward	19100046	Male	Other	52
ward	19100046	Female	Other	42
ward	19100047	Male	Black African	81
ward	19100047	Female	Black African	80
ward	19100047	Male	Coloured	3189
ward	19100047	Female	Coloured	3191
ward	19100047	Male	Indian or Asian	12
ward	19100047	Female	Indian or Asian	19
ward	19100047	Female	White	2
ward	19100047	Male	Other	39
ward	19100047	Female	Other	11
ward	19100048	Male	Black African	232
ward	19100048	Female	Black African	257
ward	19100048	Male	Coloured	1316
ward	19100048	Female	Coloured	1438
ward	19100048	Male	Indian or Asian	723
ward	19100048	Female	Indian or Asian	664
ward	19100048	Male	White	7
ward	19100048	Female	White	8
ward	19100048	Male	Other	75
ward	19100048	Female	Other	84
ward	19100049	Male	Black African	154
ward	19100049	Female	Black African	131
ward	19100049	Male	Coloured	3095
ward	19100049	Female	Coloured	3043
ward	19100049	Male	Indian or Asian	45
ward	19100049	Female	Indian or Asian	44
ward	19100049	Male	White	7
ward	19100049	Female	White	4
ward	19100049	Male	Other	42
ward	19100049	Female	Other	21
ward	19100050	Male	Black African	72
ward	19100050	Female	Black African	70
ward	19100050	Male	Coloured	2838
ward	19100050	Female	Coloured	2788
ward	19100050	Male	Indian or Asian	19
ward	19100050	Female	Indian or Asian	12
ward	19100050	Male	White	7
ward	19100050	Female	White	1
ward	19100050	Male	Other	49
ward	19100050	Female	Other	18
ward	19100051	Male	Black African	2186
ward	19100051	Female	Black African	2407
ward	19100051	Male	Coloured	18
ward	19100051	Female	Coloured	8
ward	19100051	Male	Indian or Asian	8
ward	19100051	Female	Indian or Asian	2
ward	19100051	Male	White	4
ward	19100051	Female	White	2
ward	19100051	Male	Other	13
ward	19100051	Female	Other	2
ward	19100052	Male	Black African	2689
ward	19100052	Female	Black African	2864
ward	19100052	Male	Coloured	9
ward	19100052	Female	Coloured	8
ward	19100052	Male	White	1
ward	19100052	Male	Other	11
ward	19100053	Male	Black African	825
ward	19100053	Female	Black African	855
ward	19100053	Male	Coloured	622
ward	19100053	Female	Coloured	603
ward	19100053	Male	Indian or Asian	75
ward	19100053	Female	Indian or Asian	83
ward	19100053	Male	White	621
ward	19100053	Female	White	607
ward	19100053	Male	Other	40
ward	19100053	Female	Other	40
ward	19100054	Male	Black African	328
ward	19100054	Female	Black African	475
ward	19100054	Male	Coloured	117
ward	19100054	Female	Coloured	158
ward	19100054	Male	Indian or Asian	28
ward	19100054	Female	Indian or Asian	37
ward	19100054	Male	White	746
ward	19100054	Female	White	923
ward	19100054	Male	Other	42
ward	19100054	Female	Other	37
ward	19100055	Male	Black African	666
ward	19100055	Female	Black African	812
ward	19100055	Male	Coloured	868
ward	19100055	Female	Coloured	931
ward	19100055	Male	Indian or Asian	83
ward	19100055	Female	Indian or Asian	79
ward	19100055	Male	White	740
ward	19100055	Female	White	758
ward	19100055	Male	Other	80
ward	19100055	Female	Other	54
ward	19100056	Male	Black African	448
ward	19100056	Female	Black African	464
ward	19100056	Male	Coloured	2242
ward	19100056	Female	Coloured	2253
ward	19100056	Male	Indian or Asian	43
ward	19100056	Female	Indian or Asian	54
ward	19100056	Male	White	33
ward	19100056	Female	White	32
ward	19100056	Male	Other	78
ward	19100056	Female	Other	36
ward	19100057	Male	Black African	2592
ward	19100057	Female	Black African	2513
ward	19100057	Male	Coloured	950
ward	19100057	Female	Coloured	959
ward	19100057	Male	Indian or Asian	268
ward	19100057	Female	Indian or Asian	215
ward	19100057	Male	White	909
ward	19100057	Female	White	937
ward	19100057	Male	Other	148
ward	19100057	Female	Other	142
ward	19100058	Male	Black African	800
ward	19100058	Female	Black African	771
ward	19100058	Male	Coloured	341
ward	19100058	Female	Coloured	346
ward	19100058	Male	Indian or Asian	148
ward	19100058	Female	Indian or Asian	121
ward	19100058	Male	White	1427
ward	19100058	Female	White	1191
ward	19100058	Male	Other	98
ward	19100058	Female	Other	82
ward	19100059	Male	Black African	819
ward	19100059	Female	Black African	909
ward	19100059	Male	Coloured	200
ward	19100059	Female	Coloured	226
ward	19100059	Male	Indian or Asian	265
ward	19100059	Female	Indian or Asian	255
ward	19100059	Male	White	1470
ward	19100059	Female	White	1533
ward	19100059	Male	Other	83
ward	19100059	Female	Other	64
ward	19100060	Male	Black African	260
ward	19100060	Female	Black African	273
ward	19100060	Male	Coloured	1655
ward	19100060	Female	Coloured	1627
ward	19100060	Male	Indian or Asian	371
ward	19100060	Female	Indian or Asian	308
ward	19100060	Male	White	133
ward	19100060	Female	White	139
ward	19100060	Male	Other	142
ward	19100060	Female	Other	124
ward	19100061	Male	Black African	1084
ward	19100061	Female	Black African	565
ward	19100061	Male	Coloured	1851
ward	19100061	Female	Coloured	1412
ward	19100061	Male	Indian or Asian	66
ward	19100061	Female	Indian or Asian	38
ward	19100061	Male	White	464
ward	19100061	Female	White	398
ward	19100061	Male	Other	41
ward	19100061	Female	Other	15
ward	19100062	Male	Black African	461
ward	19100062	Female	Black African	479
ward	19100062	Male	Coloured	275
ward	19100062	Female	Coloured	360
ward	19100062	Male	Indian or Asian	76
ward	19100062	Female	Indian or Asian	53
ward	19100062	Male	White	1020
ward	19100062	Female	White	978
ward	19100062	Male	Other	28
ward	19100062	Female	Other	35
ward	19100063	Male	Black African	257
ward	19100063	Female	Black African	229
ward	19100063	Male	Coloured	1552
ward	19100063	Female	Coloured	1633
ward	19100063	Male	Indian or Asian	96
ward	19100063	Female	Indian or Asian	76
ward	19100063	Male	White	180
ward	19100063	Female	White	142
ward	19100063	Male	Other	121
ward	19100063	Female	Other	129
ward	19100064	Male	Black African	292
ward	19100064	Female	Black African	358
ward	19100064	Male	Coloured	316
ward	19100064	Female	Coloured	337
ward	19100064	Male	Indian or Asian	21
ward	19100064	Female	Indian or Asian	39
ward	19100064	Male	White	666
ward	19100064	Female	White	739
ward	19100064	Male	Other	55
ward	19100064	Female	Other	67
ward	19100065	Male	Black African	128
ward	19100065	Female	Black African	112
ward	19100065	Male	Coloured	2158
ward	19100065	Female	Coloured	2112
ward	19100065	Male	Indian or Asian	25
ward	19100065	Female	Indian or Asian	18
ward	19100065	Male	White	2
ward	19100065	Female	White	8
ward	19100065	Male	Other	53
ward	19100065	Female	Other	41
ward	19100066	Male	Black African	68
ward	19100066	Female	Black African	69
ward	19100066	Male	Coloured	2442
ward	19100066	Female	Coloured	2466
ward	19100066	Male	Indian or Asian	25
ward	19100066	Female	Indian or Asian	36
ward	19100066	Male	White	12
ward	19100066	Female	White	13
ward	19100066	Male	Other	91
ward	19100066	Female	Other	64
ward	19100067	Male	Black African	1481
ward	19100067	Female	Black African	1436
ward	19100067	Male	Coloured	2812
ward	19100067	Female	Coloured	2856
ward	19100067	Male	Indian or Asian	208
ward	19100067	Female	Indian or Asian	185
ward	19100067	Male	White	13
ward	19100067	Female	White	14
ward	19100067	Male	Other	206
ward	19100067	Female	Other	135
ward	19100068	Male	Black African	84
ward	19100068	Female	Black African	105
ward	19100068	Male	Coloured	2682
ward	19100068	Female	Coloured	2759
ward	19100068	Male	Indian or Asian	21
ward	19100068	Female	Indian or Asian	20
ward	19100068	Male	White	10
ward	19100068	Female	White	6
ward	19100068	Male	Other	34
ward	19100068	Female	Other	17
ward	19100069	Male	Black African	2209
ward	19100069	Female	Black African	2627
ward	19100069	Male	Coloured	62
ward	19100069	Female	Coloured	63
ward	19100069	Male	Indian or Asian	13
ward	19100069	Female	Indian or Asian	10
ward	19100069	Male	White	680
ward	19100069	Female	White	601
ward	19100069	Male	Other	210
ward	19100069	Female	Other	124
ward	19100070	Male	Black African	177
ward	19100070	Female	Black African	195
ward	19100070	Male	Coloured	186
ward	19100070	Female	Coloured	213
ward	19100070	Male	Indian or Asian	57
ward	19100070	Female	Indian or Asian	53
ward	19100070	Male	White	1117
ward	19100070	Female	White	1131
ward	19100070	Male	Other	10
ward	19100070	Female	Other	26
ward	19100071	Male	Black African	780
ward	19100071	Female	Black African	467
ward	19100071	Male	Coloured	723
ward	19100071	Female	Coloured	368
ward	19100071	Male	Indian or Asian	23
ward	19100071	Female	Indian or Asian	14
ward	19100071	Male	White	920
ward	19100071	Female	White	970
ward	19100071	Male	Other	29
ward	19100071	Female	Other	22
ward	19100072	Male	Black African	194
ward	19100072	Female	Black African	182
ward	19100072	Male	Coloured	1555
ward	19100072	Female	Coloured	1609
ward	19100072	Male	Indian or Asian	34
ward	19100072	Female	Indian or Asian	22
ward	19100072	Male	White	94
ward	19100072	Female	White	114
ward	19100072	Male	Other	52
ward	19100072	Female	Other	52
ward	19100073	Male	Black African	133
ward	19100073	Female	Black African	201
ward	19100073	Male	Coloured	418
ward	19100073	Female	Coloured	415
ward	19100073	Male	Indian or Asian	44
ward	19100073	Female	Indian or Asian	23
ward	19100073	Male	White	822
ward	19100073	Female	White	847
ward	19100073	Male	Other	48
ward	19100073	Female	Other	57
ward	19100074	Male	Black African	1515
ward	19100074	Female	Black African	1592
ward	19100074	Male	Coloured	528
ward	19100074	Female	Coloured	610
ward	19100074	Male	Indian or Asian	23
ward	19100074	Female	Indian or Asian	7
ward	19100074	Male	White	630
ward	19100074	Female	White	595
ward	19100074	Male	Other	82
ward	19100074	Female	Other	54
ward	19100075	Male	Black African	1106
ward	19100075	Female	Black African	1347
ward	19100075	Male	Coloured	2128
ward	19100075	Female	Coloured	2219
ward	19100075	Male	Indian or Asian	26
ward	19100075	Female	Indian or Asian	17
ward	19100075	Male	White	1
ward	19100075	Female	White	1
ward	19100075	Male	Other	44
ward	19100075	Female	Other	25
ward	19100076	Male	Black African	779
ward	19100076	Female	Black African	890
ward	19100076	Male	Coloured	2807
ward	19100076	Female	Coloured	2702
ward	19100076	Male	Indian or Asian	14
ward	19100076	Female	Indian or Asian	16
ward	19100076	Male	White	15
ward	19100076	Female	White	8
ward	19100076	Male	Other	37
ward	19100076	Female	Other	16
ward	19100077	Male	Black African	739
ward	19100077	Female	Black African	1142
ward	19100077	Male	Coloured	341
ward	19100077	Female	Coloured	378
ward	19100077	Male	Indian or Asian	55
ward	19100077	Female	Indian or Asian	50
ward	19100077	Male	White	918
ward	19100077	Female	White	1292
ward	19100077	Male	Other	99
ward	19100077	Female	Other	96
ward	19100078	Male	Black African	175
ward	19100078	Female	Black African	213
ward	19100078	Male	Coloured	3094
ward	19100078	Female	Coloured	2955
ward	19100078	Male	Indian or Asian	27
ward	19100078	Female	Indian or Asian	35
ward	19100078	Male	White	1
ward	19100078	Female	White	6
ward	19100078	Male	Other	53
ward	19100078	Female	Other	39
ward	19100079	Male	Black African	134
ward	19100079	Female	Black African	125
ward	19100079	Male	Coloured	2943
ward	19100079	Female	Coloured	2992
ward	19100079	Male	Indian or Asian	12
ward	19100079	Female	Indian or Asian	11
ward	19100079	Male	White	5
ward	19100079	Female	White	2
ward	19100079	Male	Other	50
ward	19100079	Female	Other	24
ward	19100080	Male	Black African	3618
ward	19100080	Female	Black African	4224
ward	19100080	Male	Coloured	750
ward	19100080	Female	Coloured	760
ward	19100080	Male	Indian or Asian	25
ward	19100080	Female	Indian or Asian	35
ward	19100080	Male	White	37
ward	19100080	Female	White	17
ward	19100080	Male	Other	62
ward	19100080	Female	Other	40
ward	19100081	Male	Black African	66
ward	19100081	Female	Black African	63
ward	19100081	Male	Coloured	2633
ward	19100081	Female	Coloured	2639
ward	19100081	Male	Indian or Asian	12
ward	19100081	Female	Indian or Asian	12
ward	19100081	Male	White	2
ward	19100081	Female	White	2
ward	19100081	Male	Other	22
ward	19100081	Female	Other	12
ward	19100082	Male	Black African	107
ward	19100082	Female	Black African	112
ward	19100082	Male	Coloured	3713
ward	19100082	Female	Coloured	3847
ward	19100082	Male	Indian or Asian	22
ward	19100082	Female	Indian or Asian	11
ward	19100082	Male	White	2
ward	19100082	Female	White	8
ward	19100082	Male	Other	41
ward	19100082	Female	Other	16
ward	19100083	Male	Black African	1151
ward	19100083	Female	Black African	1248
ward	19100083	Male	Coloured	66
ward	19100083	Female	Coloured	82
ward	19100083	Male	Indian or Asian	3
ward	19100083	Female	Indian or Asian	4
ward	19100083	Male	White	672
ward	19100083	Female	White	609
ward	19100083	Male	Other	79
ward	19100083	Female	Other	55
ward	19100084	Male	Black African	185
ward	19100084	Female	Black African	237
ward	19100084	Male	Coloured	417
ward	19100084	Female	Coloured	372
ward	19100084	Male	Indian or Asian	10
ward	19100084	Female	Indian or Asian	18
ward	19100084	Male	White	805
ward	19100084	Female	White	743
ward	19100084	Male	Other	18
ward	19100084	Female	Other	21
ward	19100085	Male	Black African	2268
ward	19100085	Female	Black African	2428
ward	19100085	Male	Coloured	186
ward	19100085	Female	Coloured	235
ward	19100085	Male	Indian or Asian	16
ward	19100085	Female	Indian or Asian	10
ward	19100085	Male	White	335
ward	19100085	Female	White	350
ward	19100085	Male	Other	72
ward	19100085	Female	Other	51
ward	19100086	Male	Black African	2603
ward	19100086	Female	Black African	2817
ward	19100086	Male	Coloured	1057
ward	19100086	Female	Coloured	964
ward	19100086	Male	Indian or Asian	25
ward	19100086	Female	Indian or Asian	12
ward	19100086	Male	White	47
ward	19100086	Female	White	35
ward	19100086	Male	Other	75
ward	19100086	Female	Other	39
ward	19100087	Male	Black African	3141
ward	19100087	Female	Black African	3371
ward	19100087	Male	Coloured	9
ward	19100087	Female	Coloured	14
ward	19100087	Male	Indian or Asian	5
ward	19100087	Female	Indian or Asian	1
ward	19100087	Female	White	1
ward	19100087	Male	Other	34
ward	19100087	Female	Other	2
ward	19100088	Male	Black African	2318
ward	19100088	Female	Black African	2500
ward	19100088	Male	Coloured	1715
ward	19100088	Female	Coloured	1668
ward	19100088	Male	Indian or Asian	31
ward	19100088	Female	Indian or Asian	16
ward	19100088	Male	White	16
ward	19100088	Female	White	9
ward	19100088	Male	Other	55
ward	19100088	Female	Other	34
ward	19100089	Male	Black African	2835
ward	19100089	Female	Black African	3094
ward	19100089	Male	Coloured	5
ward	19100089	Female	Coloured	7
ward	19100089	Male	Indian or Asian	6
ward	19100089	Female	Indian or Asian	2
ward	19100089	Male	White	1
ward	19100089	Female	White	1
ward	19100089	Male	Other	17
ward	19100089	Female	Other	5
ward	19100090	Male	Black African	3095
ward	19100090	Female	Black African	3296
ward	19100090	Male	Coloured	7
ward	19100090	Female	Coloured	11
ward	19100090	Male	Indian or Asian	1
ward	19100090	Female	Indian or Asian	1
ward	19100090	Male	White	5
ward	19100090	Female	White	2
ward	19100090	Male	Other	49
ward	19100090	Female	Other	2
ward	19100091	Male	Black African	3283
ward	19100091	Female	Black African	3678
ward	19100091	Male	Coloured	12
ward	19100091	Female	Coloured	9
ward	19100091	Male	Indian or Asian	1
ward	19100091	Female	Indian or Asian	1
ward	19100091	Male	White	2
ward	19100091	Male	Other	40
ward	19100091	Female	Other	5
ward	19100092	Male	Black African	3307
ward	19100092	Female	Black African	3610
ward	19100092	Male	Coloured	25
ward	19100092	Female	Coloured	18
ward	19100092	Male	Indian or Asian	1
ward	19100092	Female	Indian or Asian	5
ward	19100092	Male	White	4
ward	19100092	Female	White	6
ward	19100092	Male	Other	34
ward	19100092	Female	Other	16
ward	19100093	Male	Black African	3211
ward	19100093	Female	Black African	3581
ward	19100093	Male	Coloured	7
ward	19100093	Female	Coloured	8
ward	19100093	Male	Indian or Asian	1
ward	19100093	Female	Indian or Asian	2
ward	19100093	Male	White	1
ward	19100093	Male	Other	33
ward	19100093	Female	Other	6
ward	19100094	Male	Black African	2420
ward	19100094	Female	Black African	2672
ward	19100094	Male	Coloured	15
ward	19100094	Female	Coloured	24
ward	19100094	Male	Indian or Asian	1
ward	19100094	Male	White	1
ward	19100094	Male	Other	22
ward	19100094	Female	Other	12
ward	19100095	Male	Black African	5574
ward	19100095	Female	Black African	6505
ward	19100095	Male	Coloured	11
ward	19100095	Female	Coloured	25
ward	19100095	Male	Indian or Asian	7
ward	19100095	Female	Indian or Asian	6
ward	19100095	Male	White	1
ward	19100095	Female	White	7
ward	19100095	Male	Other	86
ward	19100095	Female	Other	12
ward	19100096	Male	Black African	2848
ward	19100096	Female	Black African	3153
ward	19100096	Male	Coloured	37
ward	19100096	Female	Coloured	52
ward	19100096	Male	Indian or Asian	1
ward	19100096	Female	Indian or Asian	1
ward	19100096	Male	White	2
ward	19100096	Female	White	1
ward	19100096	Male	Other	34
ward	19100096	Female	Other	19
ward	19100097	Male	Black African	3020
ward	19100097	Female	Black African	3401
ward	19100097	Male	Coloured	21
ward	19100097	Female	Coloured	30
ward	19100097	Male	Indian or Asian	6
ward	19100097	Female	Indian or Asian	2
ward	19100097	Male	White	3
ward	19100097	Female	White	1
ward	19100097	Male	Other	35
ward	19100097	Female	Other	9
ward	19100098	Male	Black African	2935
ward	19100098	Female	Black African	3395
ward	19100098	Male	Coloured	11
ward	19100098	Female	Coloured	6
ward	19100098	Male	Indian or Asian	1
ward	19100098	Male	White	4
ward	19100098	Female	White	2
ward	19100098	Male	Other	39
ward	19100098	Female	Other	11
ward	19100099	Male	Black African	1429
ward	19100099	Female	Black African	1565
ward	19100099	Male	Coloured	3763
ward	19100099	Female	Coloured	3778
ward	19100099	Male	Indian or Asian	19
ward	19100099	Female	Indian or Asian	14
ward	19100099	Male	White	3
ward	19100099	Female	White	4
ward	19100099	Male	Other	75
ward	19100099	Female	Other	16
ward	19100100	Male	Black African	539
ward	19100100	Female	Black African	487
ward	19100100	Male	Coloured	2299
ward	19100100	Female	Coloured	2372
ward	19100100	Male	Indian or Asian	31
ward	19100100	Female	Indian or Asian	31
ward	19100100	Male	White	653
ward	19100100	Female	White	665
ward	19100100	Male	Other	60
ward	19100100	Female	Other	51
ward	19100101	Male	Black African	3475
ward	19100101	Female	Black African	3883
ward	19100101	Male	Coloured	327
ward	19100101	Female	Coloured	377
ward	19100101	Male	Indian or Asian	8
ward	19100101	Female	Indian or Asian	1
ward	19100101	Male	White	6
ward	19100101	Female	White	4
ward	19100101	Male	Other	95
ward	19100101	Female	Other	31
ward	19100102	Male	Black African	212
ward	19100102	Female	Black African	257
ward	19100102	Male	Coloured	263
ward	19100102	Female	Coloured	305
ward	19100102	Male	Indian or Asian	24
ward	19100102	Female	Indian or Asian	29
ward	19100102	Male	White	1295
ward	19100102	Female	White	1237
ward	19100102	Male	Other	30
ward	19100102	Female	Other	17
ward	19100103	Male	Black African	91
ward	19100103	Female	Black African	132
ward	19100103	Male	Coloured	411
ward	19100103	Female	Coloured	426
ward	19100103	Male	Indian or Asian	32
ward	19100103	Female	Indian or Asian	25
ward	19100103	Male	White	1600
ward	19100103	Female	White	1671
ward	19100103	Male	Other	20
ward	19100103	Female	Other	21
ward	19100104	Male	Black African	3224
ward	19100104	Female	Black African	3758
ward	19100104	Male	Coloured	127
ward	19100104	Female	Coloured	146
ward	19100104	Male	Indian or Asian	9
ward	19100104	Female	Indian or Asian	1
ward	19100104	Male	White	22
ward	19100104	Female	White	38
ward	19100104	Male	Other	131
ward	19100104	Female	Other	95
ward	19100105	Male	Black African	1110
ward	19100105	Female	Black African	1145
ward	19100105	Male	Coloured	1011
ward	19100105	Female	Coloured	1152
ward	19100105	Male	Indian or Asian	17
ward	19100105	Female	Indian or Asian	33
ward	19100105	Male	White	909
ward	19100105	Female	White	847
ward	19100105	Male	Other	40
ward	19100105	Female	Other	22
ward	19100106	Male	Black African	3702
ward	19100106	Female	Black African	4696
ward	19100106	Male	Coloured	2005
ward	19100106	Female	Coloured	2060
ward	19100106	Male	Indian or Asian	21
ward	19100106	Female	Indian or Asian	21
ward	19100106	Male	White	10
ward	19100106	Female	White	6
ward	19100106	Male	Other	138
ward	19100106	Female	Other	75
ward	19100107	Male	Black African	694
ward	19100107	Female	Black African	957
ward	19100107	Male	Coloured	223
ward	19100107	Female	Coloured	239
ward	19100107	Male	Indian or Asian	57
ward	19100107	Female	Indian or Asian	59
ward	19100107	Male	White	1469
ward	19100107	Female	White	1366
ward	19100107	Male	Other	35
ward	19100107	Female	Other	30
ward	19100108	Male	Black African	5007
ward	19100108	Female	Black African	5238
ward	19100108	Male	Coloured	179
ward	19100108	Female	Coloured	205
ward	19100108	Male	Indian or Asian	2
ward	19100108	Female	Indian or Asian	7
ward	19100108	Male	White	5
ward	19100108	Female	White	1
ward	19100108	Male	Other	57
ward	19100108	Female	Other	32
ward	19100109	Male	Black African	1035
ward	19100109	Female	Black African	1183
ward	19100109	Male	Coloured	2752
ward	19100109	Female	Coloured	2730
ward	19100109	Male	Indian or Asian	14
ward	19100109	Female	Indian or Asian	14
ward	19100109	Male	White	18
ward	19100109	Female	White	15
ward	19100109	Male	Other	46
ward	19100109	Female	Other	20
ward	19100110	Male	Black African	146
ward	19100110	Female	Black African	156
ward	19100110	Male	Coloured	2244
ward	19100110	Female	Coloured	2198
ward	19100110	Male	Indian or Asian	33
ward	19100110	Female	Indian or Asian	26
ward	19100110	Male	White	7
ward	19100110	Female	White	4
ward	19100110	Male	Other	43
ward	19100110	Female	Other	16
ward	19100111	Male	Black African	1528
ward	19100111	Female	Black African	1847
ward	19100111	Male	Coloured	1514
ward	19100111	Female	Coloured	1475
ward	19100111	Male	Indian or Asian	14
ward	19100111	Female	Indian or Asian	14
ward	19100111	Male	White	204
ward	19100111	Female	White	196
ward	19100111	Male	Other	96
ward	19100111	Female	Other	67
\.


--
-- Name: youth_gender_population_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY youth_gender_population_group
    ADD CONSTRAINT youth_gender_population_group_pkey PRIMARY KEY (geo_level, geo_code, gender, "population group");


--
-- PostgreSQL database dump complete
--

