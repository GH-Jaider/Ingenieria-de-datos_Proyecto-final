-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE new_database;
-- ddl-end --


-- object: public."Ability" | type: TABLE --
-- DROP TABLE IF EXISTS public."Ability" CASCADE;
CREATE TABLE public."Ability" (
	id serial NOT NULL,
	name varchar(40) NOT NULL,
	key char NOT NULL,
	base_cooldown real,
	base_range integer,
	"name_Champion" varchar(40),
	CONSTRAINT "Ability_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public."Ability" OWNER TO postgres;
-- ddl-end --

-- object: public."Worlds" | type: TABLE --
-- DROP TABLE IF EXISTS public."Worlds" CASCADE;
CREATE TABLE public."Worlds" (
	year integer NOT NULL,
	CONSTRAINT "Worlds_pk" PRIMARY KEY (year)
);
-- ddl-end --
ALTER TABLE public."Worlds" OWNER TO postgres;
-- ddl-end --

-- object: public."Role" | type: TABLE --
-- DROP TABLE IF EXISTS public."Role" CASCADE;
CREATE TABLE public."Role" (
	id smallint NOT NULL,
	role varchar(40) NOT NULL,
	CONSTRAINT "Role_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public."Role" OWNER TO postgres;
-- ddl-end --

-- object: public."Play" | type: TABLE --
-- DROP TABLE IF EXISTS public."Play" CASCADE;
CREATE TABLE public."Play" (
	pick_rate real NOT NULL,
	ban_rate real NOT NULL,
	win_rate real NOT NULL,
	kills integer NOT NULL,
	deaths integer NOT NULL,
	"name_Champion" varchar(40) NOT NULL,
	"year_Worlds" integer NOT NULL,
	"id_Role" smallint NOT NULL,
	CONSTRAINT "Play_pk" PRIMARY KEY ("name_Champion","year_Worlds","id_Role")
);
-- ddl-end --
ALTER TABLE public."Play" OWNER TO postgres;
-- ddl-end --

-- object: public."Champion" | type: TABLE --
-- DROP TABLE IF EXISTS public."Champion" CASCADE;
CREATE TABLE public."Champion" (
	name varchar(40) NOT NULL,
	tittle varchar(40) NOT NULL,
	"id_Play_style" smallint,
	"id_Class" smallint,
	CONSTRAINT "Champion_pk" PRIMARY KEY (name)
);
-- ddl-end --
ALTER TABLE public."Champion" OWNER TO postgres;
-- ddl-end --

-- object: public."Class" | type: TABLE --
-- DROP TABLE IF EXISTS public."Class" CASCADE;
CREATE TABLE public."Class" (
	id smallint NOT NULL,
	name varchar(30) NOT NULL,
	CONSTRAINT "Class_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public."Class" OWNER TO postgres;
-- ddl-end --

-- object: public."Play_style" | type: TABLE --
-- DROP TABLE IF EXISTS public."Play_style" CASCADE;
CREATE TABLE public."Play_style" (
	id smallint NOT NULL,
	name varchar(30) NOT NULL,
	CONSTRAINT "Play_style_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public."Play_style" OWNER TO postgres;
-- ddl-end --

-- object: "Champion_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Ability" DROP CONSTRAINT IF EXISTS "Champion_fk" CASCADE;
ALTER TABLE public."Ability" ADD CONSTRAINT "Champion_fk" FOREIGN KEY ("name_Champion")
REFERENCES public."Champion" (name) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Champion_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Play" DROP CONSTRAINT IF EXISTS "Champion_fk" CASCADE;
ALTER TABLE public."Play" ADD CONSTRAINT "Champion_fk" FOREIGN KEY ("name_Champion")
REFERENCES public."Champion" (name) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Worlds_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Play" DROP CONSTRAINT IF EXISTS "Worlds_fk" CASCADE;
ALTER TABLE public."Play" ADD CONSTRAINT "Worlds_fk" FOREIGN KEY ("year_Worlds")
REFERENCES public."Worlds" (year) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Role_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Play" DROP CONSTRAINT IF EXISTS "Role_fk" CASCADE;
ALTER TABLE public."Play" ADD CONSTRAINT "Role_fk" FOREIGN KEY ("id_Role")
REFERENCES public."Role" (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Play_style_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Champion" DROP CONSTRAINT IF EXISTS "Play_style_fk" CASCADE;
ALTER TABLE public."Champion" ADD CONSTRAINT "Play_style_fk" FOREIGN KEY ("id_Play_style")
REFERENCES public."Play_style" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Class_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Champion" DROP CONSTRAINT IF EXISTS "Class_fk" CASCADE;
ALTER TABLE public."Champion" ADD CONSTRAINT "Class_fk" FOREIGN KEY ("id_Class")
REFERENCES public."Class" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


