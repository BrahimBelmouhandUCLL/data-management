SET search_path TO mammoet;
SELECT *
FROM toegangspunt
WHERE gebouw SIMILAR TO '%(7{2}|9{2})';