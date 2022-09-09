/*
CREATE TABLE sct_131_u (
	textbox4 VARCHAR(50) NULL,
	textbox1 TEXT NULL,
	OB VARCHAR(20) NULL,
	OB1 VARCHAR(20) NULL,
	Textbox20 INTEGER NULL,
	PostingDate VARCHAR(10) NULL,
	TransID TEXT NULL,
	TaxDate VARCHAR(10) NULL,
	Description TEXT NULL,
	textbox66 TEXT NULL,
	Debit VARCHAR(30) NULL,
	Credit VARCHAR(30) NULL,
	Branch VARCHAR(5) NULL,
	CostCenter VARCHAR(10) NULL,
	Department VARCHAR(20) NULL,
	ManufactureName TEXT NULL,
	ShortName TEXT NULL,
	Debit1 VARCHAR(30) NULL,
	Credit1 VARCHAR(30) NULL,
	textbox16 VARCHAR(30) NULL,
	textbox17 VARCHAR(30) NULL,
	textbox58 VARCHAR(50) NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
*/

/*
After create sct_131_u, import csv to this table.
If count(*) less than total row in csv file --> python import csv to sqlite
 */

-- fix Date issue
UPDATE sct_131_u 
SET PostingDate = concat('01','/','01','/','1900')
where PostingDate ='';

UPDATE sct_131_u
SET PostingDate = concat(substr(PostingDate,7,4),'-',substr(PostingDate,4,2),'-',substr(PostingDate,1,2))
where PostingDate <>'';

UPDATE sct_131_u
SET TaxDate = concat('01','/','01','/','1900')
where TaxDate ='';

UPDATE sct_131_u
SET TaxDate = concat(substr(TaxDate,7,4),'-',substr(TaxDate,4,2),'-',substr(TaxDate,1,2))
where TaxDate <>'';
-- -----------------------------

-- fix Debit, Credit data type
UPDATE sct_131_u
SET Debit = REPLACE(Debit, ',', '' )
WHERE Debit LIKE '%,%';

UPDATE sct_131_u
SET Debit = REPLACE(Debit, ')', '' )
WHERE Debit LIKE '%)';

UPDATE sct_131_u
SET Debit = REPLACE(Debit, '(', '-' )
WHERE Debit LIKE '(%';

UPDATE sct_131_u
SET Credit = REPLACE(Credit , ',', '' )
WHERE Credit LIKE '%,%';

UPDATE sct_131_u
SET Credit = REPLACE(Credit, ')', '' )
WHERE Credit LIKE '%)';

UPDATE sct_131_u
SET Credit = REPLACE(Credit, '(', '-' )
WHERE Credit LIKE '(%';
-- -----------------------------
/*
-- fix TransID and textbox66 issue
UPDATE sct_131_u
SET TransID = REPLACE(TransID, '.0', '' )
WHERE TransID LIKE '%.0';

UPDATE sct_131_u
SET textbox66 = REPLACE(textbox66, '.0', '' )
WHERE textbox66 LIKE '%.0';
-- -----------------------------
*/

-- create new table sct_131_n
CREATE TABLE `sct_131_n` (
  `Id131` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Account131` TEXT,
  `Line131` INTEGER,
  `PostingDate131` DATE,
  `TransID131` TEXT,
  `TaxDate131` DATE,
  `Description131` TEXT,
  `OffstAcct131` TEXT,
  `Debit131` REAL,
  `Credit131` REAL,
  `NetAmt131` REAL,
  `Branch131` VARCHAR(5),
  `CostCenter131` VARCHAR(10),
  `Department131` VARCHAR(20),
  `Mft131` TEXT,
  `ShortName131` TEXT,
  `ShortAcct131` TEXT,
  PRIMARY KEY (Id131)
);
-- -----------------------

-- insert data to sct_131_n

INSERT INTO sct_131_n (Id131, Account131, Line131, PostingDate131, TransID131, TaxDate131,
Description131, OffstAcct131, Debit131, Credit131, NetAmt131, Branch131, CostCenter131,
Department131, Mft131, ShortName131, ShortAcct131)
select NULL,textbox1,Textbox20,cast(PostingDate as DATE),TransID,cast(TaxDate as DATE),
Description,textbox66, 
CAST(Debit AS REAL), CAST(Credit AS REAL), (Debit-Credit) AS NetAmt,
Branch,CostCenter,Department,ManufactureName,ShortName,
CAST(substr(textbox1,1,8) AS CHAR) AS ShortAcct131
FROM sct_131_u;
-- -----------------------

-- check result
SELECT sum(Debit131),sum(Credit131)
FROM sct_131_n;

select count(*)
from sct_131_u su;
-- -----------------------

/*
 some issue need fix:
 - Dr 131/ Cr131: TransID131 ='668929'
 
 */



