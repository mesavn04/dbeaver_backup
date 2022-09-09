/*
-- TheKho9M21 definition
CREATE TABLE `TheKho9M21` (
	Warehouse TEXT,
	ItemName1 TEXT,
	Textbox126 TEXT,
	BeginStock VARCHAR(20),
	Textbox9 VARCHAR(20),
	DocDate1 VARCHAR(10),
	DocNo TEXT,
	CardName TEXT,
	CardAddress TEXT,
	Comments TEXT,
	InQty VARCHAR(20),
	OutQty VARCHAR(20),
	Textbox44 VARCHAR(20),
	BatchNo TEXT,
	ExpiryDate VARCHAR(10),
	Location TEXT,
	InvoiceSerial TEXT,
	InvoiceCode1 TEXT,
	InvoiceDate VARCHAR(10),
	u_sourceno2 TEXT,
	Textbox128 TEXT,
	InQty1 VARCHAR(20),
	OutQty1 VARCHAR(20),
	InQty2 VARCHAR(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
*/
-- -----------------------------

-- trim warehouse name
UPDATE TheKho9M21
SET Warehouse = REPLACE(Warehouse, 'KHO HÀNG: ', '' )
WHERE Warehouse LIKE 'KHO HÀNG: %';

-- fix number issue
UPDATE TheKho9M21
SET BeginStock = REPLACE(BeginStock, '-', '0' )
WHERE BeginStock LIKE '-';

UPDATE TheKho9M21
SET Textbox44 = REPLACE(Textbox44, '-', '0' )
WHERE Textbox44 LIKE '-';

-- fix date issue
UPDATE TheKho9M21 
SET DocDate1 = concat('01','/','01','/','1900')
where DocDate1 ='';

UPDATE TheKho9M21
SET DocDate1 = concat(substr(DocDate1,7,4),'-',substr(DocDate1,4,2),'-',substr(DocDate1,1,2))
where DocDate1 <>'';

UPDATE TheKho9M21 
SET ExpiryDate = concat('01','/','01','/','1900')
where ExpiryDate ='';

UPDATE TheKho9M21
SET ExpiryDate = concat(substr(ExpiryDate,7,4),'-',substr(ExpiryDate,4,2),'-',substr(ExpiryDate,1,2))
where ExpiryDate <>'';

-- backup sale data
create table `temp_rev_cogs`
select * from n_rev_cogs nrc;

select distinct Document_Type
from temp_rev_cogs trc;
/*
Document_Type  |
---------------+
Jounal Entry   |
A/R Invoice    |
A/R Credit Memo|
Goods Receipt  |
Delivery       |
Revaluation    |
*/

-- fix Document_Type, prepare for mapping inventory
update temp_rev_cogs
set Document_Type = (case when Document_Type = 'A/R Invoice' then 'ARINV/ '
						  when Document_Type = 'A/R Credit Memo' then 'ARCM/ '
						  when Document_Type = 'Goods Receipt' then 'GR/ '
						  when Document_Type = 'Delivery' then 'DEL/ '
					end)
where Document_Type in ('A/R Invoice','A/R Credit Memo','Goods Receipt','Delivery');

-- ----------------------------------
select Manufacturer,Item_Code,Item_Name,concat(Document_Type,Document_Num) as `MapDoc`,
Document_Date,TransId,Line_Num,cast(Quantity as real) as `Qty`,Sale_Price,Stock_Price,BU,
InQty,OutQty,substring_index(substring_index(ItemName1,' - ',1),': ',-1) as `itemname`,
substring_index(ItemName1,':',-1) as `unit`,tm.BatchNo
from temp_rev_cogs trc
left join thekho9m21 tm
on tm.DocNo = concat(Document_Type,Document_Num)
and substring_index(substring_index(ItemName1,' - ',1),': ',-1) = trc.Item_Code
and Item_Code <>''
having BU like 'Hàng lẻ'
;


