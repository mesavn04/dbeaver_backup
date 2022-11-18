DELETE FROM REV_COGS;

SELECT *
FROM REV_COGS rc;

SELECT DISTINCT BU
FROM REV_COGS rc;

SELECT DISTINCT Manufacture
FROM REV_COGS rc
WHERE BU ='Dịch vụ';

SELECT DISTINCT strftime("%Y","Document Date")
FROM REV_COGS rc;

DELETE FROM REV_COGS
WHERE strftime("%Y","Document Date") = '2020';

UPDATE REV_COGS
SET BU = "KDD2"
WHERE BU = "KDD 2";

UPDATE REV_COGS
SET Manufacture = 'M00157 - DICH VU'
WHERE BU ='Dịch vụ'

SELECT [Manufacture],[Item Code],[Item Name],[BU],
strftime('%Y',[Document Date]) AS [Year],
[Net sales],[Quantity]
FROM REV_COGS rc
WHERE strftime('%m',[Document Date]) < '11'
GROUP BY [Manufacture],[Item Code],[Item Name],[BU],[Year]



