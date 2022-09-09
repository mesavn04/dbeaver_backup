/*
CREATE TABLE budget_2022.`Rev_COGS` (
	ARRev5 VARCHAR(20) NULL,
	ARCRev5 VARCHAR(20) NULL,
	GRRev5 VARCHAR(20) NULL,
	Revenue9 VARCHAR(20) NULL,
	ARCogs5 VARCHAR(20) NULL,
	ARCCogs5 VARCHAR(20) NULL,
	GRCogs5 VARCHAR(20) NULL,
	GICogs5 VARCHAR(20) NULL,
	JECogs5 VARCHAR(20) NULL,
	REVCogs5 VARCHAR(20) NULL,
	COGS5 VARCHAR(20) NULL,
	Revenue10 VARCHAR(20) NULL,
	COGS14 VARCHAR(20) NULL,
	Category4 VARCHAR(50) NULL,
	ARRev6 VARCHAR(20) NULL,
	ARCRev6 VARCHAR(20) NULL,
	GRRev6 VARCHAR(20) NULL,
	Revenue11 VARCHAR(20) NULL,
	ARCogs6 VARCHAR(20) NULL,
	ARCCogs6 VARCHAR(20) NULL,
	GRCogs6 VARCHAR(20) NULL,
	GICogs6 VARCHAR(20) NULL,
	JECogs6 VARCHAR(20) NULL,
	REVCogs6 VARCHAR(20) NULL,
	COGS6 VARCHAR(20) NULL,
	Revenue12 VARCHAR(20) NULL,
	COGS12 VARCHAR(20) NULL,
	Category5 TEXT NULL,
	Manufacture3 TEXT NULL,
	ARRev7 VARCHAR(20) NULL,
	ARCRev7 VARCHAR(20) NULL,
	GRRev7 VARCHAR(20) NULL,
	Revenue13 VARCHAR(20) NULL,
	ARCogs7 VARCHAR(20) NULL,
	ARCCogs7 VARCHAR(20) NULL,
	GRCogs7 VARCHAR(20) NULL,
	GICogs7 VARCHAR(20) NULL,
	JECogs7 VARCHAR(20) NULL,
	REVCogs7 VARCHAR(20) NULL,
	COGS7 VARCHAR(20) NULL,
	Revenue14 VARCHAR(20) NULL,
	COGS11 VARCHAR(20) NULL,
	Category6 TEXT NULL,
	Manufacture4 TEXT NULL,
	LinkLevel4 TEXT NULL,
	ItemName2 TEXT NULL,
	ARRev8 VARCHAR(20) NULL,
	ARCRev8 VARCHAR(20) NULL,
	GRRev8 VARCHAR(20) NULL,
	Revenue15 VARCHAR(20) NULL,
	ARCogs8 VARCHAR(20) NULL,
	ARCCogs8 VARCHAR(20) NULL,
	GRCogs8 VARCHAR(20) NULL,
	GICogs8 VARCHAR(20) NULL,
	JECogs8 VARCHAR(20) NULL,
	REVCogs8 VARCHAR(20) NULL,
	COGS8 VARCHAR(20) NULL,
	Revenue16 VARCHAR(20) NULL,
	COGS10 VARCHAR(20) NULL,
	Category7 TEXT NULL,
	Manufacture5 TEXT NULL,
	ItemCode2 TEXT NULL,
	ItemName3 TEXT NULL,
	ARRev9 VARCHAR(20) NULL,
	ARCRev9 VARCHAR(20) NULL,
	GRRev9 VARCHAR(20) NULL,
	Revenue17 VARCHAR(20) NULL,
	ARCogs9 VARCHAR(20) NULL,
	ARCCogs9 VARCHAR(20) NULL,
	GRCogs9 VARCHAR(20) NULL,
	GICogs9 VARCHAR(20) NULL,
	JECogs9 VARCHAR(20) NULL,
	REVCogs9 VARCHAR(20) NULL,
	COGS9 VARCHAR(20) NULL,
	Textbox203 VARCHAR(20) NULL,
	DocType2 VARCHAR(50) NULL,
	DocDate2 VARCHAR(10) NULL,
	DocBranch2 VARCHAR(10) NULL,
	DocNum2 TEXT NULL,
	TransId2 TEXT NULL,
	Commission2 VARCHAR(20) NULL,
	LineNum2 INTEGER NULL,
	Quantity2 VARCHAR(20) NULL,
	SalePrice2 VARCHAR(20) NULL,
	LineTotal2 VARCHAR(20) NULL,
	DocDiscPrcnt2 VARCHAR(20) NULL,
	StockPrice2 VARCHAR(20) NULL
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
*/
-- --------------------------------------------

-- fix Date issue
UPDATE rev_cogs 
SET DocDate2 = concat('01','/','01','/','1900')
where DocDate2 ='';

UPDATE rev_cogs
SET DocDate2 = concat(substr(DocDate2,7,4),'-',substr(DocDate2,4,2),'-',substr(DocDate2,1,2))
where DocDate2 <>'';

-- fix Number fields data type
UPDATE rev_cogs
SET ARRev9 = REPLACE(ARRev9, ',', '' )
WHERE ARRev9 LIKE '%,%';

UPDATE rev_cogs
SET ARRev9 = REPLACE(ARRev9, ')', '' )
WHERE ARRev9 LIKE '%)';

UPDATE rev_cogs
SET ARRev9 = REPLACE(ARRev9, '(', '-' )
WHERE ARRev9 LIKE '(%';

UPDATE rev_cogs
SET ARRev9 = REPLACE(ARRev9 , ',', '' )
WHERE ARRev9 LIKE '%,%';

UPDATE rev_cogs
SET ARRev9 = REPLACE(ARRev9, ')', '' )
WHERE ARRev9 LIKE '%)';

UPDATE rev_cogs
SET ARRev9 = REPLACE(ARRev9, '(', '-' )
WHERE ARRev9 LIKE '(%';

UPDATE rev_cogs
SET ARRev9 = REPLACE(ARRev9, '-', '0' )
WHERE ARRev9 LIKE '-';
-- -----
UPDATE rev_cogs
SET ARCRev9 = REPLACE(ARCRev9, ',', '' )
WHERE ARCRev9 LIKE '%,%';

UPDATE rev_cogs
SET ARCRev9 = REPLACE(ARCRev9, ')', '' )
WHERE ARCRev9 LIKE '%)';

UPDATE rev_cogs
SET ARCRev9 = REPLACE(ARCRev9, '(', '-' )
WHERE ARCRev9 LIKE '(%';

UPDATE rev_cogs
SET ARCRev9 = REPLACE(ARCRev9 , ',', '' )
WHERE ARCRev9 LIKE '%,%';

UPDATE rev_cogs
SET ARCRev9 = REPLACE(ARCRev9, ')', '' )
WHERE ARCRev9 LIKE '%)';

UPDATE rev_cogs
SET ARCRev9 = REPLACE(ARCRev9, '(', '-' )
WHERE ARCRev9 LIKE '(%';

UPDATE rev_cogs
SET ARCRev9 = REPLACE(ARCRev9, '-', '0' )
WHERE ARCRev9 LIKE '-';
-- -----
UPDATE rev_cogs
SET GRRev9 = REPLACE(GRRev9, ',', '' )
WHERE GRRev9 LIKE '%,%';

UPDATE rev_cogs
SET GRRev9 = REPLACE(GRRev9, ')', '' )
WHERE GRRev9 LIKE '%)';

UPDATE rev_cogs
SET GRRev9 = REPLACE(GRRev9, '(', '-' )
WHERE GRRev9 LIKE '(%';

UPDATE rev_cogs
SET GRRev9 = REPLACE(GRRev9 , ',', '' )
WHERE GRRev9 LIKE '%,%';

UPDATE rev_cogs
SET GRRev9 = REPLACE(GRRev9, ')', '' )
WHERE GRRev9 LIKE '%)';

UPDATE rev_cogs
SET GRRev9 = REPLACE(GRRev9, '(', '-' )
WHERE GRRev9 LIKE '(%';

UPDATE rev_cogs
SET GRRev9 = REPLACE(GRRev9, '-', '0' )
WHERE GRRev9 LIKE '-';
-- -----
UPDATE rev_cogs
SET Revenue17 = REPLACE(Revenue17, ',', '' )
WHERE Revenue17 LIKE '%,%';

UPDATE rev_cogs
SET Revenue17 = REPLACE(Revenue17, ')', '' )
WHERE Revenue17 LIKE '%)';

UPDATE rev_cogs
SET Revenue17 = REPLACE(Revenue17, '(', '-' )
WHERE Revenue17 LIKE '(%';

UPDATE rev_cogs
SET Revenue17 = REPLACE(Revenue17 , ',', '' )
WHERE Revenue17 LIKE '%,%';

UPDATE rev_cogs
SET Revenue17 = REPLACE(Revenue17, ')', '' )
WHERE Revenue17 LIKE '%)';

UPDATE rev_cogs
SET Revenue17 = REPLACE(Revenue17, '(', '-' )
WHERE Revenue17 LIKE '(%';

UPDATE rev_cogs
SET Revenue17 = REPLACE(Revenue17, '-', '0' )
WHERE Revenue17 LIKE '-';
-- -----
UPDATE rev_cogs
SET ARCogs9 = REPLACE(ARCogs9, ',', '' )
WHERE ARCogs9 LIKE '%,%';

UPDATE rev_cogs
SET ARCogs9 = REPLACE(ARCogs9, ')', '' )
WHERE ARCogs9 LIKE '%)';

UPDATE rev_cogs
SET ARCogs9 = REPLACE(ARCogs9, '(', '-' )
WHERE ARCogs9 LIKE '(%';

UPDATE rev_cogs
SET ARCogs9 = REPLACE(ARCogs9 , ',', '' )
WHERE ARCogs9 LIKE '%,%';

UPDATE rev_cogs
SET ARCogs9 = REPLACE(ARCogs9, ')', '' )
WHERE ARCogs9 LIKE '%)';

UPDATE rev_cogs
SET ARCogs9 = REPLACE(ARCogs9, '(', '-' )
WHERE ARCogs9 LIKE '(%';

UPDATE rev_cogs
SET ARCogs9 = REPLACE(ARCogs9, '-', '0' )
WHERE ARCogs9 LIKE '-';
-- -----
UPDATE rev_cogs
SET ARCCogs9 = REPLACE(ARCCogs9, ',', '' )
WHERE ARCCogs9 LIKE '%,%';

UPDATE rev_cogs
SET ARCCogs9 = REPLACE(ARCCogs9, ')', '' )
WHERE ARCCogs9 LIKE '%)';

UPDATE rev_cogs
SET ARCCogs9 = REPLACE(ARCCogs9, '(', '-' )
WHERE ARCCogs9 LIKE '(%';

UPDATE rev_cogs
SET ARCCogs9 = REPLACE(ARCCogs9 , ',', '' )
WHERE ARCCogs9 LIKE '%,%';

UPDATE rev_cogs
SET ARCCogs9 = REPLACE(ARCCogs9, ')', '' )
WHERE ARCCogs9 LIKE '%)';

UPDATE rev_cogs
SET ARCCogs9 = REPLACE(ARCCogs9, '(', '-' )
WHERE ARCCogs9 LIKE '(%';

UPDATE rev_cogs
SET ARCCogs9 = REPLACE(ARCCogs9, '-', '0' )
WHERE ARCCogs9 LIKE '-';
-- -----
UPDATE rev_cogs
SET GRCogs9 = REPLACE(GRCogs9, ',', '' )
WHERE GRCogs9 LIKE '%,%';

UPDATE rev_cogs
SET GRCogs9 = REPLACE(GRCogs9, ')', '' )
WHERE GRCogs9 LIKE '%)';

UPDATE rev_cogs
SET GRCogs9 = REPLACE(GRCogs9, '(', '-' )
WHERE GRCogs9 LIKE '(%';

UPDATE rev_cogs
SET GRCogs9 = REPLACE(GRCogs9 , ',', '' )
WHERE GRCogs9 LIKE '%,%';

UPDATE rev_cogs
SET GRCogs9 = REPLACE(GRCogs9, ')', '' )
WHERE GRCogs9 LIKE '%)';

UPDATE rev_cogs
SET GRCogs9 = REPLACE(GRCogs9, '(', '-' )
WHERE GRCogs9 LIKE '(%';

UPDATE rev_cogs
SET GRCogs9 = REPLACE(GRCogs9, '-', '0' )
WHERE GRCogs9 LIKE '-';
-- -----
UPDATE rev_cogs
SET GICogs9 = REPLACE(GICogs9, ',', '' )
WHERE GICogs9 LIKE '%,%';

UPDATE rev_cogs
SET GICogs9 = REPLACE(GICogs9, ')', '' )
WHERE GICogs9 LIKE '%)';

UPDATE rev_cogs
SET GICogs9 = REPLACE(GICogs9, '(', '-' )
WHERE GICogs9 LIKE '(%';

UPDATE rev_cogs
SET GICogs9 = REPLACE(GICogs9 , ',', '' )
WHERE GICogs9 LIKE '%,%';

UPDATE rev_cogs
SET GICogs9 = REPLACE(GICogs9, ')', '' )
WHERE GICogs9 LIKE '%)';

UPDATE rev_cogs
SET GICogs9 = REPLACE(GICogs9, '(', '-' )
WHERE GICogs9 LIKE '(%';

UPDATE rev_cogs
SET GICogs9 = REPLACE(GICogs9, '-', '0' )
WHERE GICogs9 LIKE '-';
-- -----
UPDATE rev_cogs
SET JECogs9 = REPLACE(JECogs9, ',', '' )
WHERE JECogs9 LIKE '%,%';

UPDATE rev_cogs
SET JECogs9 = REPLACE(JECogs9, ')', '' )
WHERE JECogs9 LIKE '%)';

UPDATE rev_cogs
SET JECogs9 = REPLACE(JECogs9, '(', '-' )
WHERE JECogs9 LIKE '(%';

UPDATE rev_cogs
SET JECogs9 = REPLACE(JECogs9 , ',', '' )
WHERE JECogs9 LIKE '%,%';

UPDATE rev_cogs
SET JECogs9 = REPLACE(JECogs9, ')', '' )
WHERE JECogs9 LIKE '%)';

UPDATE rev_cogs
SET JECogs9 = REPLACE(JECogs9, '(', '-' )
WHERE JECogs9 LIKE '(%';

UPDATE rev_cogs
SET JECogs9 = REPLACE(JECogs9, '-', '0' )
WHERE JECogs9 LIKE '-';
-- -----
UPDATE rev_cogs
SET REVCogs9 = REPLACE(REVCogs9, ',', '' )
WHERE REVCogs9 LIKE '%,%';

UPDATE rev_cogs
SET REVCogs9 = REPLACE(REVCogs9, ')', '' )
WHERE REVCogs9 LIKE '%)';

UPDATE rev_cogs
SET REVCogs9 = REPLACE(REVCogs9, '(', '-' )
WHERE REVCogs9 LIKE '(%';

UPDATE rev_cogs
SET REVCogs9 = REPLACE(REVCogs9 , ',', '' )
WHERE REVCogs9 LIKE '%,%';

UPDATE rev_cogs
SET REVCogs9 = REPLACE(REVCogs9, ')', '' )
WHERE REVCogs9 LIKE '%)';

UPDATE rev_cogs
SET REVCogs9 = REPLACE(REVCogs9, '(', '-' )
WHERE REVCogs9 LIKE '(%';

UPDATE rev_cogs
SET REVCogs9 = REPLACE(REVCogs9, '-', '0' )
WHERE REVCogs9 LIKE '-';
-- -----
UPDATE rev_cogs
SET COGS9 = REPLACE(COGS9, ',', '' )
WHERE COGS9 LIKE '%,%';

UPDATE rev_cogs
SET COGS9 = REPLACE(COGS9, ')', '' )
WHERE COGS9 LIKE '%)';

UPDATE rev_cogs
SET COGS9 = REPLACE(COGS9, '(', '-' )
WHERE COGS9 LIKE '(%';

UPDATE rev_cogs
SET COGS9 = REPLACE(COGS9 , ',', '' )
WHERE COGS9 LIKE '%,%';

UPDATE rev_cogs
SET COGS9 = REPLACE(COGS9, ')', '' )
WHERE COGS9 LIKE '%)';

UPDATE rev_cogs
SET COGS9 = REPLACE(COGS9, '(', '-' )
WHERE COGS9 LIKE '(%';

UPDATE rev_cogs
SET COGS9 = REPLACE(COGS9, '-', '0' )
WHERE COGS9 LIKE '-';
-- -----
UPDATE rev_cogs
SET Textbox203 = REPLACE(Textbox203, ',', '' )
WHERE Textbox203 LIKE '%,%';

UPDATE rev_cogs
SET Textbox203 = REPLACE(Textbox203, ')', '' )
WHERE Textbox203 LIKE '%)';

UPDATE rev_cogs
SET Textbox203 = REPLACE(Textbox203, '(', '-' )
WHERE Textbox203 LIKE '(%';

UPDATE rev_cogs
SET Textbox203 = REPLACE(Textbox203 , ',', '' )
WHERE Textbox203 LIKE '%,%';

UPDATE rev_cogs
SET Textbox203 = REPLACE(Textbox203, ')', '' )
WHERE Textbox203 LIKE '%)';

UPDATE rev_cogs
SET Textbox203 = REPLACE(Textbox203, '(', '-' )
WHERE Textbox203 LIKE '(%';

UPDATE rev_cogs
SET Textbox203 = REPLACE(Textbox203, '-', '0' )
WHERE Textbox203 LIKE '-';
-- -----
UPDATE rev_cogs
SET Quantity2 = REPLACE(Quantity2, ',', '' )
WHERE Quantity2 LIKE '%,%';

UPDATE rev_cogs
SET Quantity2 = REPLACE(Quantity2, ')', '' )
WHERE Quantity2 LIKE '%)';

UPDATE rev_cogs
SET Quantity2 = REPLACE(Quantity2, '(', '-' )
WHERE Quantity2 LIKE '(%';

UPDATE rev_cogs
SET Quantity2 = REPLACE(Quantity2 , ',', '' )
WHERE Quantity2 LIKE '%,%';

UPDATE rev_cogs
SET Quantity2 = REPLACE(Quantity2, ')', '' )
WHERE Quantity2 LIKE '%)';

UPDATE rev_cogs
SET Quantity2 = REPLACE(Quantity2, '(', '-' )
WHERE Quantity2 LIKE '(%';

UPDATE rev_cogs
SET Quantity2 = REPLACE(Quantity2, '-', '0' )
WHERE Quantity2 LIKE '-';
-- -----
UPDATE rev_cogs
SET SalePrice2 = REPLACE(SalePrice2, ',', '' )
WHERE SalePrice2 LIKE '%,%';

UPDATE rev_cogs
SET SalePrice2 = REPLACE(SalePrice2, ')', '' )
WHERE SalePrice2 LIKE '%)';

UPDATE rev_cogs
SET SalePrice2 = REPLACE(SalePrice2, '(', '-' )
WHERE SalePrice2 LIKE '(%';

UPDATE rev_cogs
SET SalePrice2 = REPLACE(SalePrice2 , ',', '' )
WHERE SalePrice2 LIKE '%,%';

UPDATE rev_cogs
SET SalePrice2 = REPLACE(SalePrice2, ')', '' )
WHERE SalePrice2 LIKE '%)';

UPDATE rev_cogs
SET SalePrice2 = REPLACE(SalePrice2, '(', '-' )
WHERE SalePrice2 LIKE '(%';

UPDATE rev_cogs
SET SalePrice2 = REPLACE(SalePrice2, '-', '0' )
WHERE SalePrice2 LIKE '-';
-- -----
UPDATE rev_cogs
SET LineTotal2 = REPLACE(LineTotal2, ',', '' )
WHERE LineTotal2 LIKE '%,%';

UPDATE rev_cogs
SET LineTotal2 = REPLACE(LineTotal2, ')', '' )
WHERE LineTotal2 LIKE '%)';

UPDATE rev_cogs
SET LineTotal2 = REPLACE(LineTotal2, '(', '-' )
WHERE LineTotal2 LIKE '(%';

UPDATE rev_cogs
SET LineTotal2 = REPLACE(LineTotal2 , ',', '' )
WHERE LineTotal2 LIKE '%,%';

UPDATE rev_cogs
SET LineTotal2 = REPLACE(LineTotal2, ')', '' )
WHERE LineTotal2 LIKE '%)';

UPDATE rev_cogs
SET LineTotal2 = REPLACE(LineTotal2, '(', '-' )
WHERE LineTotal2 LIKE '(%';

UPDATE rev_cogs
SET LineTotal2 = REPLACE(LineTotal2, '-', '0' )
WHERE LineTotal2 LIKE '-';
-- -----
UPDATE rev_cogs
SET DocDiscPrcnt2 = REPLACE(DocDiscPrcnt2, ',', '' )
WHERE DocDiscPrcnt2 LIKE '%,%';

UPDATE rev_cogs
SET DocDiscPrcnt2 = REPLACE(DocDiscPrcnt2, ')', '' )
WHERE DocDiscPrcnt2 LIKE '%)';

UPDATE rev_cogs
SET DocDiscPrcnt2 = REPLACE(DocDiscPrcnt2, '(', '-' )
WHERE DocDiscPrcnt2 LIKE '(%';

UPDATE rev_cogs
SET DocDiscPrcnt2 = REPLACE(DocDiscPrcnt2 , ',', '' )
WHERE DocDiscPrcnt2 LIKE '%,%';

UPDATE rev_cogs
SET DocDiscPrcnt2 = REPLACE(DocDiscPrcnt2, ')', '' )
WHERE DocDiscPrcnt2 LIKE '%)';

UPDATE rev_cogs
SET DocDiscPrcnt2 = REPLACE(DocDiscPrcnt2, '(', '-' )
WHERE DocDiscPrcnt2 LIKE '(%';

UPDATE rev_cogs
SET DocDiscPrcnt2 = REPLACE(DocDiscPrcnt2, '-', '0' )
WHERE DocDiscPrcnt2 LIKE '-';
-- -----
UPDATE rev_cogs
SET StockPrice2 = REPLACE(StockPrice2, ',', '' )
WHERE StockPrice2 LIKE '%,%';

UPDATE rev_cogs
SET StockPrice2 = REPLACE(StockPrice2, ')', '' )
WHERE StockPrice2 LIKE '%)';

UPDATE rev_cogs
SET StockPrice2 = REPLACE(StockPrice2, '(', '-' )
WHERE StockPrice2 LIKE '(%';

UPDATE rev_cogs
SET StockPrice2 = REPLACE(StockPrice2 , ',', '' )
WHERE StockPrice2 LIKE '%,%';

UPDATE rev_cogs
SET StockPrice2 = REPLACE(StockPrice2, ')', '' )
WHERE StockPrice2 LIKE '%)';

UPDATE rev_cogs
SET StockPrice2 = REPLACE(StockPrice2, '(', '-' )
WHERE StockPrice2 LIKE '(%';

UPDATE rev_cogs
SET StockPrice2 = REPLACE(StockPrice2, '-', '0' )
WHERE StockPrice2 LIKE '-';
-- --------------------------------------------

/*
-- budget_2022.n_rev_cogs definition
CREATE TABLE `n_rev_cogs` (
  `Category` text COLLATE utf8mb4_general_ci,
  `Manufacturer` text COLLATE utf8mb4_general_ci,
  `Item_Code` text COLLATE utf8mb4_general_ci,
  `Item_Name` text COLLATE utf8mb4_general_ci,
  `Rev_Sale` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Rev_Sale_Return` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Return_after_Paid` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Net_Revenue` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cogs_Sale` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cogs_Sale_Return` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Goods_Receipt` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Goods_Issue` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Adjustment` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Revaluation` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Net_COGS` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Gross_Profit` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Document_Type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Document_Date` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Branch` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Document_Num` text COLLATE utf8mb4_general_ci,
  `TransId` text COLLATE utf8mb4_general_ci,
  `Commission` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Line_Num` int DEFAULT NULL,
  `Quantity` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Sale_Price` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Line_Total` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Discount_Prcnt` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Stock_Price` varchar(20) COLLATE utf8mb4_general_ci DEFAULT null,
  `Mft_code` text COLLATE utf8mb4_general_ci,
  `BU` text COLLATE utf8mb4_general_ci,
  `Customer` text COLLATE utf8mb4_general_ci,
  `Note` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
*/

-- --------------------------------------------
-- insert data to n_rev_cogs
INSERT INTO n_rev_cogs (Category,Manufacturer,Item_Code,Item_Name, 
Rev_Sale,Rev_Sale_Return,Return_after_Paid,Net_Revenue,
Cogs_Sale,Cogs_Sale_Return,Goods_Receipt,Goods_Issue,Adjustment,Revaluation,Net_COGS, 
Gross_Profit,Document_Type,Document_Date,Branch, 
Document_Num,TransId,Commission,Line_Num,Quantity,Sale_Price,Line_Total, 
Discount_Prcnt,Stock_Price,Mft_code,BU,Customer,Note)
SELECT Category7, Manufacture5, ItemCode2, ItemName3, cast(ARRev9 as real), cast(ARCRev9 as real), 
cast(GRRev9 as real),cast(Revenue17 as real),cast(ARCogs9 as real),cast(ARCCogs9 as real),cast(GRCogs9 as real),
cast(GICogs9 as real),cast(JECogs9 as real),cast(REVCogs9 as real),cast(COGS9 as real),cast(Textbox203 as real), 
DocType2,cast(DocDate2 as DATE),DocBranch2,DocNum2,TransId2,Commission2,LineNum2,
cast(Quantity2 as real),cast(SalePrice2 as real),cast(LineTotal2 as real),cast(DocDiscPrcnt2 as real),
cast(StockPrice2 as real),substring(Manufacture5,1,6) as MftCode,null,null,null
FROM rev_cogs;
-- --------------------------------------------

/*
need to fix some issue, like Dr131/Cr131
-- mapping Customer
UPDATE n_rev_cogs
set Customer = null
where Customer is not null;

-- insert into n_rev_cogs(Customer)
select distinct from 
(
select ShortName131
from sct_131_n
where n_rev_cogs.TransId = sct_131_n.TransID131
) as temp
;

select distinct Customer 
from n_rev_cogs nrc;

select count(*) from n_rev_cogs nrc
order by Document_Date;

delete from n_rev_cogs
where Category is null;
-- --------------------------------------------
*/

-- mapping BU
UPDATE n_rev_cogs AS nrc, bu_mft AS bm
SET nrc.BU = bm.BU 
WHERE nrc.Mft_code = bm.Manufacturer_Code;

UPDATE n_rev_cogs 
SET bu = 'Dịch vụ'
WHERE Category ='DICH VU';

UPDATE n_rev_cogs 
SET bu = 'UY THAC'
WHERE Category <>'DICH VU'
AND Commission ='Yes';

-- fix BU for special TransID
UPDATE n_rev_cogs 
SET bu = 'UY THAC'
WHERE Document_Num = '1040386';


-- check scenario 1 Mft but belongs to 2 BU
select Manufacturer,BU,sum(Net_Revenue),sum(Net_COGS),month(Document_Date) as `Month`
from n_rev_cogs nrc
-- where Document_Date between '2021-08-01' and '2021-08-31'
where BU like 'UY THAC'
group by Manufacturer,BU,month(Document_Date)
order by month(Document_Date),Manufacturer;

select null,null,sum(Net_Revenue),sum(Net_COGS) 
from n_rev_cogs nrc
where Document_Date between '2021-09-01' and '2021-09-30'
and BU like 'UY THAC';


/*
BU            |
--------------+
              |
Dịch vụ       |
Dược phân phối|
Hàng lẻ       |
KDD2          |
Medical Device|
MSD (Tự doanh)|
Nhà thầu phụ  |
Phòng mạch BS |
THẨM MỸ       |
UY THAC       |
Vaccine       |
VTTH          |
*/
-- --------------------------------------------

-- check result
SELECT sum(Gross_Profit)
FROM n_rev_cogs;

-- select sum(Adjustment) as adj from
-- (select Adjustment from n_rev_cogs limit 1) as src
-- ;
-- --------------------------------------------


select *
from n_rev_cogs nrc
-- where BU in ('Dịch vụ','Dược phân phối','Hàng lẻ','Nhà thầu phụ','Phòng mạch BS','UY THAC','Vaccine')
-- where BU like 'Hàng lẻ'
where Manufacturer like '%medical%'
order by Document_Date;

SELECT Category, Manufacturer, Item_Code, Item_Name, Document_Type,
Document_Date,Quantity, Sale_Price, Discount_Prcnt, Stock_Price
FROM budget_2022.n_rev_cogs
where Item_Code ='HL1100008'
-- and Stock_Price >=129716.7964
;




