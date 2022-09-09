--SELECT COUNT(*) FROM B04_THCN_PTR btp;
--SELECT COUNT(*) FROM GL_Vend gv;

-------------------------------------------

--SELECT COUNT(*) FROM 
--(SELECT DISTINCT gv.Vend_Code, gv.Vend_Name, gv.Posting_Date, gv.Due_Date, gv.Doc_No, gv.Trans_No,
--gv.Remarks, gv.Offset_Acct, gv.Offset_Acct_Name, gv.Deb_Cred_LC,
--btp.CardCode,btp.Account,btp.Transid,btp.RefDate
--FROM GL_Vend gv 
--LEFT JOIN B04_THCN_PTR btp 
--ON gv.Trans_No = btp.Transid
--WHERE btp.Transid ISNULL);
-------------------------------------------

--SELECT SUM(Deb_Cred_LC) FROM (
--SELECT DISTINCT btp.Textbox6 AS Line,btp.CardCode,btp.Account,btp.Transid,btp.RefDate,
--gv.Vend_Code, gv.Vend_Name, gv.Posting_Date, gv.Due_Date, gv.Doc_No, gv.Trans_No,
--gv.Remarks, gv.Offset_Acct, gv.Offset_Acct_Name, gv.Deb_Cred_LC
--FROM B04_THCN_PTR btp 
--LEFT JOIN GL_Vend gv
--ON btp.Transid = gv.Trans_No
--AND btp.CardCode = gv.Vend_Code
--WHERE btp.CardCode = 'VDP10005'
--);
-------------------------------------------


-------------------------------------------