/*
Option 1: filter 242 and left join 64x, then union the result,
 but the result in Acct24 column is wrong
 
----Union data to new table SCT_242_final
--Left excluding join sct_242 (Dr242,Cr11)
CREATE TABLE sct_242_final AS
SELECT * FROM sct_242_N
WHERE OffstAcct24 NOT LIKE '64%'
UNION
--try to mapping sct_64x with sct_242 (Dr64, Cr242)
SELECT
	DISTINCT id64, OffstAcct64 as Acct64,
	line64,PostingDate64,transid64,TaxDate64,description64,
	ShortAcct64 as OffAct64,Credit64 as Dr64,Debit64 as Cr64,(Credit64 - Debit64) as NAmt64,
	Branch64,CostCenter64,Department64,Mft64,ShortName64,ShortAcct64
FROM sct_64x_N
CROSS JOIN sct_242_N
ON	transid64 = transid24
AND OffstAcct64 = shortacct24
;
*/

/*  Option 2: left join 242 and 64x, then try to de-dupe the result
 * 
 * */

DROP TABLE sct_242_final;

CREATE TABLE sct_242_final AS
SELECT DISTINCT sn.Id24,sxn.Id64, sn.Account24, sn.Line24,sxn.Line64, sn.PostingDate24,
sn.TransID24,sn.TaxDate24,sn.Description24,sn.OffstAcct24,
IIF(sn.OffstAcct24 NOT LIKE '64%', sn.Debit24, sxn.Credit64) AS Dr24,
IIF(sn.OffstAcct24 NOT LIKE '64%',sn.Credit24,
IIF(sn.OffstAcct24 LIKE '64%' AND sn.Debit24<>0,0,
IIF(sn.OffstAcct24 LIKE '64%' AND sn.Debit24=0,sxn.Debit64,0))) AS Cr24,
IIF(sn.OffstAcct24 NOT LIKE '64%',sn.Branch24,sxn.Branch64) AS Brnch24,
IIF(sn.OffstAcct24 NOT LIKE '64%',sn.CostCenter24,sxn.CostCenter64) AS CC24,
IIF(sn.OffstAcct24 NOT LIKE '64%',sn.Department24,sxn.Department64) AS Dprmt24,
IIF(sn.OffstAcct24 NOT LIKE '64%',sn.Mft24,sxn.Mft64) AS Mf24,
IIF(sn.OffstAcct24 NOT LIKE '64%',sn.ShortName24,sxn.ShortName64) AS Shrtname24
FROM sct_242_N sn
LEFT JOIN sct_64x_N sxn
ON sn.ShortAcct24 = sxn.OffstAcct64
AND sn.TransID24 = sxn.TransID64
ORDER BY sn.Account24,sn.Line24,sxn.Line64
;

/* select unique rows in sct_242_final */
SELECT * FROM sct_242_final sf
WHERE NOT EXISTS (
SELECT 1 from sct_242_final sf2 
WHERE sf.Id64 = sf2.Id64
AND sf.TransID24 = sf2.TransID24
AND sf.rowid > sf2.rowid
)
;

/*  If you want to delete duplicate rows in sct_242_final  */
DELETE FROM sct_242_final
WHERE EXISTS (
SELECT 1 from sct_242_final sf2 
WHERE sct_242_final.Id64 = sf2.Id64
AND sct_242_final.TransID24 = sf2.TransID24
AND sct_242_final.rowid > sf2.rowid
)
;
SELECT * FROM sct_242_final sf
;


/* An example deduplicate in sqlite
 * https://database.guide/2-ways-to-delete-duplicate-rows-in-sqlite/
*/
CREATE TABLE Pets (
PetID INT,
PetName TEXT,
PetType TEXT
);

INSERT INTO Pets (PetID,PetName,PetType)
VALUES
(1,"Wag","Dog"),
(1,"Wag","Dog"),
(2,"Scratch","Cat"),
(3,"Tweet","Bird"),
(4,"Bark","Dog"),
(4,"Bark","Dog"),
(4,"Bark","Dog");

-- option 1
SELECT * FROM Pets
WHERE EXISTS (
  SELECT 1 FROM Pets p2 
  WHERE Pets.PetName = p2.PetName
  AND Pets.PetType = p2.PetType
  AND Pets.rowid > p2.rowid
);

DELETE FROM Pets
WHERE EXISTS (
  SELECT 1 FROM Pets p2 
  WHERE Pets.PetName = p2.PetName
  AND Pets.PetType = p2.PetType
  AND Pets.rowid > p2.rowid
);

SELECT * FROM Pets;

-- option 2
SELECT * FROM Pets
WHERE rowid > (
  SELECT MIN(rowid) FROM Pets p2  
  WHERE Pets.PetName = p2.PetName
  AND Pets.PetType = p2.PetType
);

DELETE FROM Pets
WHERE rowid > (
  SELECT MIN(rowid) FROM Pets p2  
  WHERE Pets.PetName = p2.PetName
  AND Pets.PetType = p2.PetType
);

SELECT * FROM Pets;
