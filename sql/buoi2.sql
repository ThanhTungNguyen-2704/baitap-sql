CREATE TABLE khach_hang (
    ma_kh INT PRIMARY KEY,
    ho_ten VARCHAR(100),
    tuoi INT,
    tinh_thanh VARCHAR(50),
    nha_mang VARCHAR(20),       -- 'Viettel', 'Vinaphone', 'Mobifone'
    ngay_dang_ky DATE,
    loai_thue_bao VARCHAR(20)   -- 'Tra truoc', 'Tra sau'
);

CREATE TABLE cuoc_goi (
    ma_cuoc_goi INT PRIMARY KEY,
    ma_kh INT,
    thoi_luong_phut INT,
    cuoc_phi DECIMAL(10,2),
    loai_cuoc_goi VARCHAR(20),  -- 'Noi mang', 'Ngoai mang', 'Quoc te'
    ngay_goi DATE
);
INSERT INTO khach_hang VALUES
(1, 'Nguyen Van A', 28, 'Ha Noi', 'Viettel', '2023-01-15', 'Tra sau'),
(2, 'Tran Thi B', 35, 'Ho Chi Minh', 'Vinaphone', '2022-06-10', 'Tra truoc'),
(3, 'Le Van C', 19, 'Da Nang', 'Viettel', '2024-03-20', 'Tra truoc'),
(4, 'Pham Thi D', 42, 'Ha Noi', 'Mobifone', '2021-11-05', 'Tra sau'),
(5, 'Hoang Van E', 25, NULL, 'Vinaphone', '2023-08-30', 'Tra sau'),
(6, 'Vu Thi F', 50, 'Ho Chi Minh', 'Viettel', '2020-02-14', 'Tra sau'),
(7, 'Do Van G', 22, 'Hai Phong', 'Viettel', '2024-01-01', 'Tra truoc');

INSERT INTO cuoc_goi VALUES
(101, 1, 15, 5000, 'Noi mang', '2024-05-01'),
(102, 2, 30, 12000, 'Ngoai mang', '2024-05-02'),
(103, 3, 5, 1500, 'Noi mang', '2024-05-03'),
(104, 1, 120, 50000, 'Quoc te', '2024-05-04'),
(105, 4, 8, 2000, 'Noi mang', '2024-05-05'),
(106, 6, 45, 15000, 'Ngoai mang', '2024-05-06'),
(107, 7, 2, 500, 'Noi mang', '2024-05-07');

-- cau 1
SELECT * FROM khach_hang 
Where nha_mang = 'Viettel' ;
-- cau 2
SELECT * FROM khach_hang 
Where tuoi > 30 ;
-- cau 3
SELECT * FROM khach_hang 
Where tinh_thanh = 'Ha Noi' AND nha_mang ='Viettel' ;
-- cau 4
SELECT * FROM khach_hang 
Where nha_mang ='Viettel' OR nha_mang = 'Vinaphone' ;
-- cau 5
SELECT * FROM khach_hang 
Where Not loai_thue_bao = 'Tra truoc' ;
-- cau 6
SELECT * FROM khach_hang 
Where tuoi BETWEEN 20 AND 35 ;
-- cau 7
SELECT * FROM khach_hang 
Where tinh_thanh IN ('Ha Noi' , 'Da Nang' , 'Hai Phong') ;
-- cau 8
SELECT * FROM khach_hang 
Where ho_ten LIKE 'Nguyen%' ;
-- cau 9
SELECT * FROM khach_hang 
Where tinh_thanh IS NULL ;
-- cau 10 
SELECT * FROM khach_hang 
ORDER BY tuoi ASC ;
-- cau 11
SELECT * FROM khach_hang 
ORDER BY ngay_dang_ky DESC ;
-- cau 12 
SELECT * FROM khach_hang 
Where nha_mang = 'Viettel'  
ORDER BY tuoi DESC  
LIMIT 3 ;
-- cau 14
SELECT * FROM khach_hang 
Where (nha_mang = 'Viettel' AND tuoi < 25) OR (nha_mang ='Vinaphone' AND loai_thue_bao ='Tra sau') ;
