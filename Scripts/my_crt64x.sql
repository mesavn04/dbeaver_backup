/*
-- sct_64x_u definition
CREATE TABLE `sct_64x_u` (
	Workbook TEXT,
	textbox4 TEXT,
	textbox1 TEXT,
	OB TEXT,
	OB1 TEXT,
	Textbox20 INTEGER,
	PostingDate VARCHAR(10),
	TransID TEXT,
	TaxDate VARCHAR(10),
	Description TEXT,
	textbox66 TEXT,
	Debit VARCHAR(30),
	Credit VARCHAR(30),
	Branch VARCHAR(2),
	CostCenter VARCHAR(5),
	Department VARCHAR(30),
	ManufactureName TEXT,
	ShortName TEXT,
	Debit1 VARCHAR(30),
	Credit1 VARCHAR(30),
	textbox16 VARCHAR(30),
	textbox17 VARCHAR(30),
	textbox58 VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
*/
-- ------------------------------------------------------------

/*
CREATE TEMPORARY TABLE temp_table_name
SELECT * FROM original_table
LIMIT 0;

DROP TEMPORARY TABLE table_name;
*/

/*
To copy with indexes and triggers do these 2 queries:
CREATE TABLE new_table LIKE old_table; 
INSERT INTO new_table SELECT * FROM old_table;

To copy just structure and data use this one:
CREATE TABLE new_table AS SELECT * FROM old_table;
 */

-- fix Date issue
UPDATE sct_64x_u 
SET PostingDate = concat('01','/','01','/','1900')
where PostingDate ='';

UPDATE sct_64x_u
SET PostingDate = concat(substr(PostingDate,7,4),'-',substr(PostingDate,4,2),'-',substr(PostingDate,1,2))
where PostingDate <>'';

UPDATE sct_64x_u
SET TaxDate = concat('01','/','01','/','1900')
where TaxDate ='';

UPDATE sct_64x_u
SET TaxDate = concat(substr(TaxDate,7,4),'-',substr(TaxDate,4,2),'-',substr(TaxDate,1,2))
where TaxDate <>'';
-- -----------------------------

-- fix Debit, Credit data type
UPDATE sct_64x_u
SET Debit = REPLACE(Debit, ',', '' )
WHERE Debit LIKE '%,%';

UPDATE sct_64x_u
SET Debit = REPLACE(Debit, ')', '' )
WHERE Debit LIKE '%)';

UPDATE sct_64x_u
SET Debit = REPLACE(Debit, '(', '-' )
WHERE Debit LIKE '(%';

UPDATE sct_64x_u
SET Credit = REPLACE(Credit , ',', '' )
WHERE Credit LIKE '%,%';

UPDATE sct_64x_u
SET Credit = REPLACE(Credit, ')', '' )
WHERE Credit LIKE '%)';

UPDATE sct_64x_u
SET Credit = REPLACE(Credit, '(', '-' )
WHERE Credit LIKE '(%';
-- -----------------------------

-- fix TransID and textbox66 issue
UPDATE sct_64x_u
SET TransID = REPLACE(TransID, '.0', '' )
WHERE TransID LIKE '%.0';

UPDATE sct_64x_u
SET textbox66 = REPLACE(textbox66, '.0', '' )
WHERE textbox66 LIKE '%.0';
-- -----------------------------
/*
-- create new table sct_64x_n
CREATE TABLE `sct_64x_n` (
  `Id64` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Account64` TEXT,
  `Line64` INTEGER,
  `PostingDate64` DATE,
  `TransID64` TEXT,
  `TaxDate64` DATE,
  `Description64` TEXT,
  `OffstAcct64` TEXT,
  `Debit64` REAL,
  `Credit64` REAL,
  `NetAmt64` REAL,
  `Branch64` VARCHAR(5),
  `CostCenter64` VARCHAR(5),
  `Department64` VARCHAR(20),
  `Mft64` TEXT,
  `ShortName64` TEXT,
  `ShortAcct64` TEXT,
  PRIMARY KEY (Id64)
);
-- -----------------------
*/
-- insert data to sct_64x_n
INSERT INTO sct_64x_n (Id64,Account64,Line64,PostingDate64,TransID64,
TaxDate64,Description64,OffstAcct64,Debit64,Credit64,NetAmt64,
Branch64,CostCenter64,Department64,Mft64,ShortName64,ShortAcct64)
select NULL,textbox1,Textbox20,cast(PostingDate as DATE),TransID,cast(TaxDate as DATE),
Description,textbox66, 
CAST(Debit AS REAL), CAST(Credit AS REAL), (Debit-Credit) AS NetAmt,
Branch,CostCenter,Department,ManufactureName,ShortName,
CAST(substr(textbox1,1,8) AS CHAR) AS ShortAcct64
FROM sct_64x_u;
-- -----------------------

-- check result
SELECT sum(Debit64),sum(Credit64)
FROM sct_64x_n;
