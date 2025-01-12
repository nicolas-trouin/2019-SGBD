@"D:\Nicolas\Documents\INSA\SGBD\TP\TP1\mondial-inputs.sql"

-- Question 1
ALTER TABLE COUNTRY
  ADD CONSTRAINT FK_CAPITAL_COUNTRY
  FOREIGN KEY (CAPITAL, CODE, PROVINCE) 
  REFERENCES CITY (NAME, COUNTRY, PROVINCE);

-- Question 2
ALTER TABLE COUNTRY
  ADD CONSTRAINT UNIQUE_NAME_COUNTRY
  UNIQUE (NAME);

-- Question 3
ALTER TABLE COUNTRY
  MODIFY NAME NOT NULL;
  
-- Question 4
ALTER TABLE PROVINCE
  ADD CONSTRAINT FK_CAPITAL_PROVINCE
  FOREIGN KEY (CAPITAL, COUNTRY, CAPPROV)
  REFERENCES CITY (NAME, COUNTRY, PROVINCE);
  
-- Question 5
ALTER TABLE PROVINCE
  ADD CONSTRAINT FK_COUNTRY_PROVINCE
  FOREIGN KEY (COUNTRY)
  REFERENCES COUNTRY (CODE);
  
-- Question 6
ALTER TABLE CITY
    ADD CONSTRAINT FK_COUNTRY_CITY
    FOREIGN KEY (COUNTRY)
    REFERENCES COUNTRY (CODE);

-- Question 7
ALTER TABLE CITY
  ADD CONSTRAINT FK_PROVINCE_CITY
  FOREIGN KEY (COUNTRY, PROVINCE)
  REFERENCES PROVINCE (COUNTRY, NAME);

-- Question 8
ALTER TABLE BORDERS
  ADD CONSTRAINT POSITIVE_LENGTH_BORDER
  CHECK (Length > 0);

-- Question 9 (pas possible car il existe déjà des villes qui ont les mêmes coordonnées)
ALTER TABLE CITY
  ADD CONSTRAINT UNIQUE_LOC_CITY
  UNIQUE (LATITUDE, LONGITUDE);
  
SELECT * 
FROM CITY C1 JOIN CITY C2 ON C1.LATITUDE = C2.LATITUDE AND C1.LONGITUDE = C2.LONGITUDE 
WHERE C1.NAME > C2.NAME OR C1.COUNTRY > C2.COUNTRY OR C1.PROVINCE > C2.PROVINCE;