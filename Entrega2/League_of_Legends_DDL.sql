-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
-- ddl-end --


-- object: public."Champion" | type: TABLE --
-- DROP TABLE IF EXISTS public."Champion" CASCADE;
CREATE TABLE public.Champion (
	name varchar(20) NOT NULL,
	class varchar(20) NOT NULL,
	play_style varchar(20) NOT NULL,
	title varchar(30) NOT NULL,
	CONSTRAINT "Champion_pk" PRIMARY KEY (name)

);
-- ddl-end --
ALTER TABLE public.Champion OWNER TO postgres;
-- ddl-end --

-- object: public."Ability" | type: TABLE --
-- DROP TABLE IF EXISTS public."Ability" CASCADE;
CREATE TABLE public.Ability (
	ability_ID serial NOT NULL,
	name varchar(50) NOT NULL,
	key char NOT NULL,
	base_cooldown real,
	base_range integer,
	name_Champion varchar(20),
	CONSTRAINT Ability_pk PRIMARY KEY (ability_ID)

);
-- ddl-end --
ALTER TABLE public.Ability OWNER TO postgres;
-- ddl-end --

-- object: public."Play" | type: TABLE --
-- DROP TABLE IF EXISTS public."Play" CASCADE;
CREATE TABLE public.Play (
	pick_rate real NOT NULL,
	ban_rate real NOT NULL,
	win_rate real NOT NULL,
	kills real NOT NULL,
	deaths real NOT NULL,
	year_Worlds integer NOT NULL,
	role_Worlds varchar(20) NOT NULL,
	name_Champion varchar(20) NOT NULL,
	CONSTRAINT Play_pk PRIMARY KEY (year_Worlds,role_Worlds,name_Champion)

);
-- ddl-end --
ALTER TABLE public.Play OWNER TO postgres;
-- ddl-end --

-- object: public."Worlds" | type: TABLE --
-- DROP TABLE IF EXISTS public."Worlds" CASCADE;
CREATE TABLE public.Worlds (
	year integer NOT NULL,
	role varchar(20) NOT NULL,
	CONSTRAINT Worlds_pk PRIMARY KEY (year,role)

);
-- ddl-end --
ALTER TABLE public.Worlds OWNER TO postgres;
-- ddl-end --

-- object: "Champion_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Ability" DROP CONSTRAINT IF EXISTS "Champion_fk" CASCADE;
ALTER TABLE public.Ability ADD CONSTRAINT Champion_fk FOREIGN KEY (name_Champion)
REFERENCES public.Champion (name) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Worlds_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Play" DROP CONSTRAINT IF EXISTS "Worlds_fk" CASCADE;
ALTER TABLE public.Play ADD CONSTRAINT Worlds_fk FOREIGN KEY (year_Worlds,role_Worlds)
REFERENCES public.Worlds (year,role) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Champion_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Play" DROP CONSTRAINT IF EXISTS "Champion_fk" CASCADE;
ALTER TABLE public.Play ADD CONSTRAINT Champion_fk FOREIGN KEY (name_Champion)
REFERENCES public.Champion (name) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


