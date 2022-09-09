-- --Union data to new table SCT_242_final
-- Left excluding join sct_242 (Dr242,Cr11)
CREATE TABLE sct_242_final AS
SELECT * FROM sct_242_n
WHERE OffstAcct24 NOT LIKE '64%'
UNION
-- try to mapping sct_64x with sct_242 (Dr64, Cr242)
SELECT
	DISTINCT id64,
	(SELECT Account24 from sct_64x_n sxn join sct_242_n sn on sn.OffstAcct24 = sxn.ShortAcct64) as Acct64,
	Line64,PostingDate64,Transid64,TaxDate64,Description64,
	ShortAcct64 as OffAct64,Credit64 as Dr64,Debit64 as Cr64,(Credit64 - Debit64) as NAmt64,
	Branch64,CostCenter64,Department64,Mft64,ShortName64,ShortAcct64
FROM sct_64x_n
INNER JOIN sct_242_n
ON	transid64 = transid24
AND OffstAcct64 = shortacct24
;
-- --Union data to new table SCT_242_final
-- Left excluding join sct_242 (Dr242,Cr11)
CREATE TABLE sct_242_final AS
SELECT * FROM sct_242_n
WHERE OffstAcct24 NOT LIKE '64%'
union
-- try to mapping sct_64x with sct_242 (Dr64, Cr242)
SELECT distinct xn.Id64,sn.Account24 as Acct64,xn.Line64,xn.PostingDate64,xn.Transid64,xn.TaxDate64,xn.Description64,
	xn.ShortAcct64 as OffAct64,xn.Credit64 as Dr64,xn.Debit64 as Cr64,(xn.Credit64 - xn.Debit64) as NAmt64,
	xn.Branch64,xn.CostCenter64,xn.Department64,xn.Mft64,xn.ShortName64,xn.ShortAcct64
FROM sct_64x_n xn
inner join sct_242_n sn
on (xn.TransID64 = sn.TransID24 AND xn.OffstAcct64 = sn.ShortAcct24)
;

-- test result
select sum(Debit24),sum(Credit24) 
from sct_242_final sf
where month(PostingDate24) =11;


-- if sct_242_final already exist, just append new data into it.
INSERT INTO b04_th_cnptr.sct_242_final
(Id24, Account24, Line24, PostingDate24, TransID24, TaxDate24, Description24, 
OffstAcct24, Debit24, Credit24, NetAmt24, Branch24, CostCenter24, Department24, 
Mft24, ShortName24, ShortAcct24)
SELECT * FROM sct_242_n
WHERE OffstAcct24 NOT LIKE '64%'
union
-- try to mapping sct_64x with sct_242 (Dr64, Cr242)
SELECT distinct xn.Id64,sn.Account24 as Acct64,xn.Line64,xn.PostingDate64,xn.Transid64,xn.TaxDate64,xn.Description64,
	xn.ShortAcct64 as OffAct64,xn.Credit64 as Dr64,xn.Debit64 as Cr64,(xn.Credit64 - xn.Debit64) as NAmt64,
	xn.Branch64,xn.CostCenter64,xn.Department64,xn.Mft64,xn.ShortName64,xn.ShortAcct64
FROM sct_64x_n xn
inner join sct_242_n sn
on (xn.TransID64 = sn.TransID24 AND xn.OffstAcct64 = sn.ShortAcct24)
;


