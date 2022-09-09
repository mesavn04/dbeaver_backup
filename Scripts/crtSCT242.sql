
ALTER TABLE SCT
RENAME TO SCT_242_07_21;

--DROP TABLE SCT_242_07_21;
----------------

--fix PostingDate issue
--UPDATE sct_242_N
--SET PostingDate24 = substr(TaxDate24,4,2) ||'/'|| substr(TaxDate24,1,2) ||'/'||substr(TaxDate24, 7,4)
--WHERE PostingDate24 <> '';
--
--UPDATE sct_242_N 
--SET PostingDate24 = REPLACE(PostingDate24,'//','')
--WHERE PostingDate24 ='//';
----------------

--fix Debit, Credit data type
UPDATE SCT_242_07_21
SET debit = REPLACE(debit, ',', '' )
WHERE debit LIKE '%,%';

UPDATE SCT_242_07_21
SET debit = REPLACE(debit, ')', '' )
WHERE debit LIKE '%)';

UPDATE SCT_242_07_21
SET debit = REPLACE(debit, '(', '-' )
WHERE debit LIKE '(%';

UPDATE SCT_242_07_21
SET Credit = REPLACE(Credit , ',', '' )
WHERE Credit LIKE '%,%';

UPDATE SCT_242_07_21
SET Credit = REPLACE(Credit, ')', '' )
WHERE Credit LIKE '%)';

UPDATE SCT_242_07_21
SET Credit = REPLACE(Credit, '(', '-' )
WHERE Credit LIKE '(%';
-------------------------------

CREATE TABLE "sct_242_N" (
   "Id24" INTEGER PRIMARY KEY AUTOINCREMENT,
  "Account24" TEXT,
  "Line24" INTEGER,
  "PostingDate24" TEXT,
  "TransID24" INTEGER,
  "TaxDate24" TEXT,
  "Description24" TEXT,
  "OffstAcct24" INTEGER,
  "Debit24" REAL,
  "Credit24" REAL,
  "NetAmt24" REAL,
  "Branch24" VARCHAR(2),
  "CostCenter24" VARCHAR(5),
  "Department24" VARCHAR(20),
  "Mft24" TEXT,
  "ShortName24" TEXT,
  "ShortAcct24" INTEGER
);
--------------------------------

INSERT INTO sct_242_N
SELECT
NULL,textbox1, Textbox20, PostingDate, TransID, TaxDate, Description, textbox66, 
CAST(Debit AS REAL), CAST(Credit AS REAL), (Debit-Credit) AS NetAmt,
Branch, CostCenter, Department, ManufactureName, ShortName,
CAST(substr(textbox1,1,8) AS INTEGER) AS ShortAcct24
FROM SCT_242_07_21;
-------------------------

--check result
SELECT sum(Debit24),sum(Credit24)
FROM sct_242_N;


