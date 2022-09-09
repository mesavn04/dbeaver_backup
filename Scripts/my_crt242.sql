/*
-- sct_242_u definition
CREATE TABLE `sct_242_u` (
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
UPDATE sct_242_u
SET PostingDate = concat('01','/','01','/','1900')
where PostingDate ='';

UPDATE sct_242_u
SET PostingDate = concat(substr(PostingDate,7,4),'-',substr(PostingDate,4,2),'-',substr(PostingDate,1,2))
where PostingDate <>'';

UPDATE sct_242_u
SET TaxDate = concat('01','/','01','/','1900')
where TaxDate ='';

UPDATE sct_242_u
SET TaxDate = concat(substr(TaxDate,7,4),'-',substr(TaxDate,4,2),'-',substr(TaxDate,1,2))
where TaxDate <>'';
-- -----------------------------

-- fix TransID and textbox66 issue
UPDATE sct_242_u
SET TransID = REPLACE(TransID, '.0', '' )
WHERE TransID LIKE '%.0';

UPDATE sct_242_u
SET textbox66 = REPLACE(textbox66, '.0', '' )
WHERE textbox66 LIKE '%.0';
-- -----------------------------

-- fix Debit, Credit data type
UPDATE sct_242_u
SET Debit = REPLACE(Debit, ',', '' )
WHERE Debit LIKE '%,%';

UPDATE sct_242_u
SET Debit = REPLACE(Debit, ')', '' )
WHERE Debit LIKE '%)';

UPDATE sct_242_u
SET Debit = REPLACE(Debit, '(', '-' )
WHERE Debit LIKE '(%';

UPDATE sct_242_u
SET Credit = REPLACE(Credit , ',', '' )
WHERE Credit LIKE '%,%';

UPDATE sct_242_u
SET Credit = REPLACE(Credit, ')', '' )
WHERE Credit LIKE '%)';

UPDATE sct_242_u
SET Credit = REPLACE(Credit, '(', '-' )
WHERE Credit LIKE '(%';
-- -----------------------------
/*
-- create new table sct_242_n
CREATE TABLE `sct_242_n` (
  `Id24` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Account24` TEXT,
  `Line24` INTEGER,
  `PostingDate24` DATE,
  `TransID24` VARCHAR(10),
  `TaxDate24` DATE,
  `Description24` TEXT,
  `OffstAcct24` VARCHAR(10),
  `Debit24` REAL,
  `Credit24` REAL,
  `NetAmt24` REAL,
  `Branch24` VARCHAR(5),
  `CostCenter24` VARCHAR(5),
  `Department24` VARCHAR(20),
  `Mft24` TEXT,
  `ShortName24` TEXT,
  `ShortAcct24` VARCHAR(10),
  PRIMARY KEY (Id24)
);
-- -----------------------
*/
-- insert data to sct_242_n
INSERT INTO sct_242_n (Id24, Account24, Line24, PostingDate24, TransID24,
TaxDate24, Description24, OffstAcct24, Debit24, Credit24, NetAmt24,
Branch24, CostCenter24, Department24, Mft24, ShortName24, ShortAcct24)
select NULL,textbox1,Textbox20,cast(PostingDate as DATE),TransID,cast(TaxDate as DATE),
Description,textbox66,
CAST(Debit AS REAL), CAST(Credit AS REAL), (Debit-Credit) AS NetAmt,
Branch,CostCenter,Department,ManufactureName,ShortName,
CAST(substr(textbox1,1,8) AS CHAR) AS ShortAcct24
FROM sct_242_u;
-- -----------------------

-- check result
SELECT sum(Debit24),sum(Credit24)
FROM sct_242_n;


