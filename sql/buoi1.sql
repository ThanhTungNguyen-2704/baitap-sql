-- ================================================
-- BUOI 01: SELECT CO BAN
-- Ngay: 19/6/2026
-- ================================================

-- PHAN 1: TAO BANG VA DU LIEU MAU
-- ================================================

CREATE TABLE nhan_vien (
    id          INT,
    ho_ten      VARCHAR(100),
    phong_ban   VARCHAR(50),
    luong       INT,
    nam_vao     INT,
    thanh_pho   VARCHAR(50)
);

INSERT INTO nhan_vien VALUES
(1, 'Nguyen Van A', 'Ky thuat',   18000000, 2019, 'Ha Noi'),
(2, 'Tran Thi B',   'Marketing',  12000000, 2021, 'Ho Chi Minh'),
(3, 'Le Van C',     'Ky thuat',   20000000, 2020, 'Ha Noi'),
(4, 'Pham Thi D',   'Ke toan',    10000000, 2022, 'Da Nang'),
(5, 'Hoang Van E',  'Ky thuat',   16000000, 2018, 'Ha Noi'),
(6, 'Nguyen Thi F', 'Marketing',  14000000, 2020, 'Ha Noi'),
(7, 'Vo Van G',     'Ke toan',    11000000, 2023, 'Ho Chi Minh'),
(8, 'Dang Thi H',   'Ky thuat',   22000000, 2019, 'Ha Noi');

-- PHAN 2: BAI LAM
-- ================================================

-- Cau 1: Lay toan bo nhan vien
SELECT * FROM nhan_vien ;

-- Cau 2: Chi hien thi ho_ten va luong
SELECT ho_ten , luong FROM nhan_vien ;

-- Cau 3: Nhan vien thuoc phong Ky thuat
SELECT * FROM nhan_vien Where phong_ban = "Ky thuat" ;

-- Cau 4: Luong tren 15tr va o Ha Noi
SELECT * FROM nhan_vien Where luong >= 15000000 AND thanh_pho = "Ha Noi" ;

-- Cau 5: Vao tu 2020, sap xep luong giam dan
SELECT ho_ten, luong, phong_ban FROM nhan_vien Where nam_vao >= 2020 ORDER BY luong DESC ;

-- Cau 6: Top 5 luong cao nhat
SELECT ho_ten, luong FROM nhan_vien ORDER BY luong DESC LIMIT 5 