SELECT *
FROM Categories c;

SELECT * FROM Sal_detail sd;

SELECT c.*,sd.* 
FROM Categories c
LEFT JOIN Sal_detail sd
ON c.Empl_code = sd.Ma_NV
;

SELECT c.DepCode1,SUM(sd.Luong_co_ban) AS LCB
FROM Categories c
LEFT JOIN Sal_detail sd
ON c.Empl_code = sd.Ma_NV
WHERE c.DepCode1 ="HCM09"
;



--SELECT c.DepName1,sd.STT,sd.Ma_NV,sd.Ho_ten,c.Chuc_danh,c.Ma_chuc_danh,c.Noi_lam_viec,
--c.Ngay_gia_nhap,c.Ten_khong_dau,c.Ngay_nghi_viec,c.Bac_luong,c.Muc_luong,
--sd.Ngay_cong_TT,sd.Ngay_cong_tinh_luong,
--SUM(sd.Luong_co_ban) AS Luong_CB,SUM(sd.Thuong_vi_tri) Thuong_VT,SUM(sd.Thuong_thanh_tich) AS Thuong_TT,SUM(sd.PC_Cong_viec) AS PC_CV
--FROM Sal_detail sd
--LEFT JOIN Categories c
--ON C.Empl_code = sd.Ma_NV
--GROUP BY sd.STT,sd.Ma_NV,sd.Ho_ten,c.Chuc_danh,c.Ma_chuc_danh,c.Noi_lam_viec,
--c.Ngay_gia_nhap,c.Ten_khong_dau,c.Ngay_nghi_viec,c.Bac_luong,c.Muc_luong,
--sd.Ngay_cong_TT,sd.Ngay_cong_tinh_luong
--ORDER BY sd.STT
;

WITH Totl_sal AS (
	SELECT c.DepName1 AS Dpt1,
	SUM(sd.Luong_co_ban) AS Luong_CB,SUM(sd.Thuong_vi_tri) Thuong_VT,SUM(sd.Thuong_thanh_tich) AS Thuong_TT,SUM(sd.PC_Cong_viec) AS PC_CV
	FROM Sal_detail sd
	LEFT JOIN Categories c
	ON C.Empl_code = sd.Ma_NV
	GROUP BY c.DepName1
	ORDER BY c.DepName1),
Dtail1 AS (
	SELECT c2.DepName1 AS Dn1,sd2.*
	FROM Categories c2
	LEFT JOIN Sal_detail sd2
	ON c2.Empl_code = sd2.Ma_NV 
)
SELECT Tl.*,Dt.*
FROM Totl_sal Tl
LEFT JOIN Dtail1 Dt
ON Tl.Dpt1 = Dt.Dn1
;