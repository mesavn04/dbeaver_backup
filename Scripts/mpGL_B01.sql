
--SELECT (SELECT COUNT(*) FROM B01_Dom as Dom) + (select COUNT(*) FROM B01_Ovs as Ovs)
--SELECT COUNT(*) FROM B01_Dom as Dom
--SELECT COUNT(*) FROM B01_Ovs as Ovs
------------------------------------------

--CREATE TABLE B01_ThCnPTr AS
--SELECT * FROM B01_Dom bd 
--UNION ALL
--SELECT * FROM B01_Ovs bo;
-------------------------------------------

--SELECT COUNT(*) FROM B01_ThCnPTr btcp 
-------------------------------------------

--DROP TABLE B01_Dom;
--DROP TABLE B01_Ovs;
-------------------------------------------

--CREATE TABLE Clone_B01 AS
--SELECT * FROM B01_ThCnPTr btcp;
-------------------------------------------

--SELECT DISTINCT SUBSTRING(Doc_No,1,2)
--FROM GL_Vend gv;
--PS,PU,JE,JR,PC
--PS: 112; PU: 3318 clearing;JR: V*,C*,711;PC: 156, 3318

--SELECT DISTINCT Offset_Acct ,Offset_Acct_Name 
--FROM GL_Vend gv 
--WHERE substr(Doc_No,1,2) = 'PC'
-------------------------------------------

SELECT *
FROM B01_ThCnPTr btcp 
WHERE OrgType = 'JE'
--JE,RC,IN

-------------------------------------------


--UPDATE Clone_B01 
--SET OrgType = REPLACE(OrgType, 'RC', 'PS' )
--WHERE OrgType LIKE 'RC';
-------------------------------------------

--UPDATE Clone_B01 
--SET OrgType = REPLACE(OrgType, 'IN', 'PU' )
--WHERE OrgType LIKE 'IN';
-------------------------------------------

--SELECT DISTINCT gv.Vend_Code, gv.Vend_Name, gv.Posting_Date, gv.Due_Date, gv.Doc_No, gv.Trans_No,
--gv.Remarks, gv.Offset_Acct, gv.Offset_Acct_Name, gv.Deb_Cred_LC,
--SUBSTRING(cb.Textbox2,12,8) as shortAcct,SUBSTRING(cb.CardName,1,8) as shortCardName,
--cb.Manufacture,(cb.OrgType||' '||cb.OrgNo1) as N_OrgNo,cb.OrgDate,
--cb.FCDebit,cb.FCCredit,cb.Debit,cb.Credit,cb.Rate
--FROM GL_Vend gv 
--CROSS JOIN Clone_B01 cb 
--WHERE N_OrgNo ISNULL
-------------------------------------------



-------------------------------------------

--SELECT DISTINCT gv.Vend_Code, gv.Vend_Name, gv.Posting_Date, gv.Due_Date, gv.Doc_No, gv.Trans_No,
--gv.Remarks, gv.Offset_Acct, gv.Offset_Acct_Name, gv.Deb_Cred_LC,
--SUBSTRING(cb.Textbox2,12,8) as shortAcct,SUBSTRING(cb.CardName,1,8) as shortCardName,
--cb.Manufacture,(cb.OrgType||' '||cb.OrgNo1) as N_OrgNo,cb.OrgDate,
--cb.FCDebit,cb.FCCredit,cb.Debit,cb.Credit,cb.Rate
--FROM GL_Vend gv 
--left join Clone_B01 cb 
--ON (cb.OrgType||' '||cb.OrgNo1) = gv.Doc_No
--AND SUBSTRING(cb.CardName,1,8) = gv.Vend_Code
--WHERE N_OrgNo ISNULL



