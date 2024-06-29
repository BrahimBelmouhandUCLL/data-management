SET search_path TO mammoet;
CREATE FUNCTION c_aansluitingskosten_abonnement(abonnementid_c int)
	RETURNS INT
	AS 
$$
	DECLARE aansluitingskosten1 INT;
	DECLARE aansluitingskosten2 INT;
	DECLARE c_aansluitingskosten INT;
	BEGIN
		SELECT aansluitingskosten
		INTO aansluitingskosten1
		FROM abonnementen
		WHERE abonnementid = abonnementid_c;
		
		SELECT abonnementen.aansluitingskosten
		INTO aansluitingskosten2
		FROM abonnementen
		WHERE abonnementid = abonnementid_c + 1;
		
		SELECT aansluitingskosten1 + aansluitingskosten2 
		INTO c_aansluitingskosten
		FROM abonnementen;
		RETURN c_aansluitingskosten;
	END;
$$
LANGUAGE 'plpgsql';

SELECT c_aansluitingskosten_abonnement(1)
FROM abonnementen;

SET search_path TO mammoet;
CREATE FUNCTION p_aansluitingskosten_abonnement(abonnementid_c int)
	RETURNS INT
	AS 
$$
	DECLARE aansluitingskosten1 INT;
	DECLARE aansluitingskosten2 INT;
	DECLARE p_aansluitingskosten INT;
	BEGIN
		SELECT aansluitingskosten
		INTO aansluitingskosten1
		FROM abonnementen
		WHERE abonnementid = abonnementid_c;
		
		SELECT abonnementen.aansluitingskosten
		INTO aansluitingskosten2
		FROM abonnementen
		WHERE abonnementid = abonnementid_c + 1;
		
		SELECT (aansluitingskosten1 + aansluitingskosten2)/SUM(aansluitingskosten) 
		INTO p_aansluitingskosten
		FROM abonnementen;
		RETURN p_aansluitingskosten;
	END;
$$
LANGUAGE 'plpgsql';

SELECT p_aansluitingskosten_abonnement(1)
FROM abonnementen;
