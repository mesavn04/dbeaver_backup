-- rev_cogs_2020 definition
CREATE TABLE rev_cogs_2020 (
	`Category` TEXT,
	`Manufacturer` TEXT,
	`Item_Code` TEXT,
	`Item_Name` TEXT,
	`Revenue_Sale` REAL,
	`Revenue_Sale_Return` REAL,
	`Return_after_Paid` REAL,
	`Net_Revenue` REAL,
	`COGS_Sale` REAL,
	`Sale_Return` REAL,
	`Goods_Receipt` REAL,
	`Goods_Issue` REAL,
	`Adjustment` REAL,
	`Revaluation` REAL,
	`Net_COGS` REAL,
	`Gross_Profit` REAL,
	`Document_Type` VARCHAR(30),
	`Document_Date` DATE,
	`Branch` VARCHAR(5),
	`Document_Num` TEXT,
	`JE_No` TEXT,
	`Commission` VARCHAR(5),
	`Line` INTEGER,
	`Quantity` REAL,
	`Sale_Price` REAL,
	`Line_Total` REAL,
	`Discount_pct` REAL,
	`Stock_Price` REAL,
	`BU` TEXT,
	`Customer` TEXT
);

select *
from rev_cogs_2020 rc;

select count(*)
from rev_cogs_2020 rc;

delete from rev_cogs_2020;
