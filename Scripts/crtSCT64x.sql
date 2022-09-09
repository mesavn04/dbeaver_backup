ALTER TABLE SCT
RENAME TO SCT_64x_07_21;

--DROP TABLE SCT_64x_07_21;
----------------
--fix PostingDate issue
--UPDATE SCT_64x_07_21
--SET PostingDate64 = substr(TaxDate64,4,2) ||'/'|| substr(TaxDate64,1,2) ||'/'||substr(TaxDate64, 7,4)
--WHERE PostingDate64 NOT NULL;
--
--UPDATE SCT_64x_07_21 
--SET PostingDate64 = REPLACE(PostingDate64,'//','')
--WHERE PostingDate64 ='//';
----------------

--fix Debit, Credit data type
UPDATE SCT_64x_07_21
SET debit = REPLACE(debit, ',', '' )
WHERE debit LIKE '%,%';

UPDATE SCT_64x_07_21
SET debit = REPLACE(debit, ')', '' )
WHERE debit LIKE '%)';

UPDATE SCT_64x_07_21
SET debit = REPLACE(debit, '(', '-' )
WHERE debit LIKE '(%';

UPDATE SCT_64x_07_21
SET Credit = REPLACE(Credit , ',', '' )
WHERE Credit LIKE '%,%';

UPDATE SCT_64x_07_21
SET Credit = REPLACE(Credit, ')', '' )
WHERE Credit LIKE '%)';

UPDATE SCT_64x_07_21
SET Credit = REPLACE(Credit, '(', '-' )
WHERE Credit LIKE '(%';

CREATE TABLE "sct_64x_N" (
   "Id64" INTEGER PRIMARY KEY AUTOINCREMENT,
  "Account64" TEXT,
  "Line64" INTEGER,
  "PostingDate64" TEXT,
  "TransID64" INTEGER,
  "TaxDate64" TIMESTAMP,
  "Description64" TEXT,
  "OffstAcct64" INTEGER,
  "Debit64" REAL,
  "Credit64" REAL,
  "NetAmt64" REAL,
  "Branch64" VARCHAR(2),
  "CostCenter64" VARCHAR(5),
  "Department64" VARCHAR(20),
  "Mft64" TEXT,
  "ShortName64" TEXT,
  "ShortAcct64" INTEGER
);

INSERT INTO sct_64x_N
SELECT
NULL,textbox1, Textbox20, PostingDate, TransID, TaxDate, Description,
textbox66, CAST(Debit AS REAL), CAST(Credit AS REAL), 
(Debit-Credit) AS NetAmt,Branch, CostCenter, Department, ManufactureName, ShortName,
CAST(substr(textbox1,1,8) AS INTEGER) AS ShortAcct64
FROM SCT_64x_07_21;
-------------------------

--check result
SELECT sum(Debit64),sum(Credit64)
FROM sct_64x_N;


