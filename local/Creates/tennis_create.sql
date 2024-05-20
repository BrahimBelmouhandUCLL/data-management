--Schema creation-------------------------------------------
CREATE SCHEMA tennis AUTHORIZATION brahimbelmouhand;
------------------------------------------------------------
SET search_path TO tennis;
DROP TABLE IF EXISTS bestuursleden;
CREATE TABLE bestuursleden(
	spelersnr integer NOT NULL,
	begin_datum date NOT NULL,
	eind_datum date,
	functie char(20),
	PRIMARY KEY(spelersnr, begin_datum)
);
DROP TABLE IF EXISTS boetes;
CREATE TABLE boetes(
	betalingsnr integer NOT NULL,
	spelersnr integer NOT NULL,
	datum date NOT NULL,
	bedrag numeric NOT NULL,
	PRIMARY KEY(betalingsnr, spelersnr)
);
DROP TABLE IF EXISTS spelers;
CREATE TABLE spelers(
	spelersnr integer PRIMARY KEY NOT NULL,
	naam char(15) NOT NULL,
	voorletters char(3) NOT NULL,
	geb_datum date,
	geslacht char(1) NOT NULL,
	jaartoe smallint NOT NULL,
	straat varchar(30),
	huisnr char(4),
	postcode char(6),
	plaats varchar(30) NOT NULL,
	telefoon char(13),
	bondsnr char(4)
);
DROP TABLE IF EXISTS spelers_l;
CREATE TABLE spelers_l(
	spelersnr integer PRIMARY KEY NOT NULL,
	naam char(15) NOT NULL,
	voorletters char(3) NOT NULL,
	geb_datum date,
	geb_uur timestamp,
	geslacht char(1) NOT NULL,
	jaartoe smallint NOT NULL,
	straat text,
	huisnr char(4),
	postcode char(6),
	plaats text NOT NULL,
	telefoon char(10),
	bondsnr char(10)
);
DROP TABLE IF EXISTS spelers_xl;
CREATE TABLE spelers_xl(
	spelersnr integer PRIMARY KEY NOT NULL,
	naam char(15) NOT NULL,
	voorletters char(3) NOT NULL,
	geb_datum date,
	geb_uur timestamp,
	geslacht char(1) NOT NULL,
	jaartoe smallint NOT NULL,
	straat text,
	huisnr char(4),
	postcode char(6),
	plaats text NOT NULL,
	telefoon char(10),
	bondsnr char(10)
);
DROP TABLE IF EXISTS spelers_xxl;
CREATE TABLE spelers_xxl(
	spelersnr integer PRIMARY KEY NOT NULL,
	naam char(15) NOT NULL,
	voorletters char(3) NOT NULL,
	geb_datum date,
	geb_uur timestamp,
	geslacht char(1) NOT NULL,
	jaartoe smallint NOT NULL,
	straat text,
	huisnr char(4),
	postcode char(6),
	plaats text NOT NULL,
	telefoon char(10),
	bondsnr char(10)
);
DROP TABLE IF EXISTS spelers_xxxl;
CREATE TABLE spelers_xxxl(
	spelersnr integer PRIMARY KEY NOT NULL,
	naam char(15) NOT NULL,
	voorletters char(3) NOT NULL,
	geb_datum date,
	geb_uur timestamp,
	geslacht char(1) NOT NULL,
	jaartoe smallint NOT NULL,
	straat text,
	huisnr char(4),
	postcode char(6),
	plaats text NOT NULL,
	telefoon char(10),
	bondsnr char(10)
);
DROP TABLE IF EXISTS teams;
CREATE TABLE teams(
	teamnr integer PRIMARY KEY NOT NULL,
	spelersnr integer NOT NULL,
	divisie char(6) NOT NULL
);
DROP TABLE IF EXISTS wedstrijden;
CREATE TABLE wedstrijden(
	wedstrijdnr integer PRIMARY KEY NOT NULL,
	teamnr integer NOT NULL,
	spelersnr integer NOT NULL,
	gewonnen smallint NOT NULL,
	verloren smallint NOT NULL
);