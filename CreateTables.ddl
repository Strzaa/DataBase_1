-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   at:        2022-06-09 12:39:09 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE grupa (
    id_grupy      NUMBER,
    nazwa_grupy   VARCHAR2(100) NOT NULL
);

ALTER TABLE grupa ADD CONSTRAINT grupa_pk PRIMARY KEY ( id_grupy );

CREATE TABLE kategorie (
    id_kategorii      NUMBER,
    nazwa_kategorii   VARCHAR2(100) NOT NULL
);

ALTER TABLE kategorie ADD CONSTRAINT kategorie_pk PRIMARY KEY ( id_kategorii );

CREATE TABLE klienci (
    id_klienta               NUMBER,
    adres_klienta            VARCHAR2(150),
    imię_klienta             VARCHAR2(100) NOT NULL,
    nazwisko_klienta         VARCHAR2(100) NOT NULL,
    limitkredytowy_klienta   NUMBER,
    grupa_id_grupy           NUMBER
);

ALTER TABLE klienci ADD CONSTRAINT klienci_pk PRIMARY KEY ( id_klienta );

CREATE TABLE pozycjarachunku (
    rachunek_id_rachunku            NUMBER,
    produkty_kod_produktu           NUMBER,
    ilosc_kupionego_produktu        NUMBER NOT NULL
);

CREATE TABLE produkty (
    kod_produktu               NUMBER,
    nazwa_produktu             VARCHAR2(100) NOT NULL,
    dostępnaliczba_produktu    NUMBER,
    cena_produktu              NUMBER(9, 2),
    dostępnawysyłka_produktu   CHAR(1),
    kategorie_id_kategorii     NUMBER NOT NULL
);

ALTER TABLE produkty ADD CONSTRAINT produkty_pk PRIMARY KEY ( kod_produktu );

CREATE TABLE rachunek (
    id_rachunku          NUMBER NOT NULL,
    data_rachunku       DATE NOT NULL,
    klienci_id_klienta   NUMBER NOT NULL
);

ALTER TABLE rachunek ADD CONSTRAINT rachunek_pk PRIMARY KEY ( id_rachunku );

ALTER TABLE klienci
    ADD CONSTRAINT klienci_grupa_fk FOREIGN KEY ( grupa_id_grupy )
        REFERENCES grupa ( id_grupy );

ALTER TABLE pozycjarachunku
    ADD CONSTRAINT pozycjarachunku_produkty_fk FOREIGN KEY ( produkty_kod_produktu )
        REFERENCES produkty ( kod_produktu );

ALTER TABLE pozycjarachunku
    ADD CONSTRAINT pozycjarachunku_rachunek_fk FOREIGN KEY ( rachunek_id_rachunku )
        REFERENCES rachunek ( id_rachunku );

ALTER TABLE produkty
    ADD CONSTRAINT produkty_kategorie_fk FOREIGN KEY ( kategorie_id_kategorii )
        REFERENCES kategorie ( id_kategorii );

ALTER TABLE rachunek
    ADD CONSTRAINT rachunek_klienci_fk FOREIGN KEY ( klienci_id_klienta )
        REFERENCES klienci ( id_klienta );

ALTER TABLE klienci
    ADD CONSTRAINT klienci_grupa_fk FOREIGN KEY ( grupa_id_grupy )
        REFERENCES grupa ( id_grupy );

ALTER TABLE pozycjarachunku
    ADD CONSTRAINT pozycjarachunku_produkty_fk FOREIGN KEY ( produkty_kod_produktu )
        REFERENCES produkty ( kod_produktu );

ALTER TABLE pozycjarachunku
    ADD CONSTRAINT pozycjarachunku_rachunek_fk FOREIGN KEY ( rachunek_id_rachunku )
        REFERENCES rachunek ( id_rachunku );

ALTER TABLE produkty
    ADD CONSTRAINT produkty_kategorie_fk FOREIGN KEY ( kategorie_id_kategorii )
        REFERENCES kategorie ( id_kategorii );

ALTER TABLE rachunek
    ADD CONSTRAINT rachunek_klienci_fk FOREIGN KEY ( klienci_id_klienta )
        REFERENCES klienci ( id_klienta );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
