-- find temp, hm at ON_POINT
SELECT *
FROM combine_data cd
WHERE Time_stamp >= '2022-09-13 10:00:00'
GROUP BY File_path,Serial_Number,Model
;

-- find temp, hm at OFF_POINT
SELECT *
FROM combine_data cd
WHERE Time_stamp <= '2022-09-15 08:00:00'
GROUP BY File_path,Serial_Number,Model
;

-- find temp, hm at thres_1
SELECT *
FROM combine_data cd
WHERE "°C" >=25
GROUP BY File_path,Serial_Number,Model
;

-- find temp, hm at thres_2
SELECT *
FROM combine_data cd
WHERE "°C" >=35
GROUP BY File_path,Serial_Number,Model

-- find max temp, hm on [ON_POINT:thres1]
WITH on_point AS (
SELECT File_path,Serial_Number,Model,Time_stamp,"°C" AS Tmp,"%RH" AS Hmd
FROM combine_data cd
WHERE Time_stamp >= '2022-09-13 10:00:00'
GROUP BY File_path,Serial_Number,Model
)
SELECT cd.File_path,cd.Serial_Number,cd.Model,cd.Time_stamp,MAX(cd."°C"),cd."%RH" 
FROM combine_data cd
WHERE cd."°C">= Tmp AND cd."°C"<=25
GROUP BY cd.File_path,cd.Serial_Number,cd.Model
;

WITH on_point AS (
SELECT File_path,Serial_Number,Model,Time_stamp,"°C" AS Tmp,"%RH" AS Hmd
FROM combine_data cd
WHERE Time_stamp >= '2022-09-13 10:00:00'
GROUP BY File_path,Serial_Number,Model
)
SELECT Tmp FROM on_point
;

SELECT * FROM combine_data cd;