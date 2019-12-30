-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 30, 2019 lúc 03:25 PM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btl`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(11) NOT NULL,
  `adm_name` varchar(255) NOT NULL,
  `adm_login_name` varchar(255) NOT NULL,
  `adm_password` varchar(255) NOT NULL,
  `adm_mail` varchar(255) NOT NULL,
  `adm_phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `cla_id` int(11) NOT NULL,
  `cla_name` varchar(255) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `pha_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gv`
--

CREATE TABLE `gv` (
  `gv_id` int(11) NOT NULL,
  `gv_name` varchar(255) NOT NULL,
  `gv_login_name` varchar(255) NOT NULL,
  `gv_password` varchar(255) NOT NULL,
  `gv_mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `majors`
--

CREATE TABLE `majors` (
  `maj_id` int(11) NOT NULL,
  `maj_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manage`
--

CREATE TABLE `manage` (
  `man_id` int(11) NOT NULL,
  `man_name` varchar(255) NOT NULL,
  `man_login_name` varchar(255) NOT NULL,
  `man_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phases`
--

CREATE TABLE `phases` (
  `pha_id` int(11) NOT NULL,
  `pha_name` varchar(255) NOT NULL,
  `sem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plans`
--

CREATE TABLE `plans` (
  `pla_id` int(11) NOT NULL,
  `time` date NOT NULL,
  `cla_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `realitys`
--

CREATE TABLE `realitys` (
  `rea_id` int(11) NOT NULL,
  `time` date NOT NULL,
  `cla_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `semesters`
--

CREATE TABLE `semesters` (
  `sem_id` int(11) NOT NULL,
  `sem_name` varchar(255) NOT NULL,
  `yea_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `sub_id` int(11) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `maj_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `use_id` int(11) NOT NULL,
  `use_name` varchar(255) NOT NULL,
  `use_login_name` varchar(255) NOT NULL,
  `use_password` varchar(255) NOT NULL,
  `use_mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `years`
--

CREATE TABLE `years` (
  `yea_id` int(11) NOT NULL,
  `yea_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`cla_id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `pha_id` (`pha_id`);

--
-- Chỉ mục cho bảng `gv`
--
ALTER TABLE `gv`
  ADD PRIMARY KEY (`gv_id`);

--
-- Chỉ mục cho bảng `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`maj_id`);

--
-- Chỉ mục cho bảng `manage`
--
ALTER TABLE `manage`
  ADD PRIMARY KEY (`man_id`);

--
-- Chỉ mục cho bảng `phases`
--
ALTER TABLE `phases`
  ADD PRIMARY KEY (`pha_id`),
  ADD KEY `sem_id` (`sem_id`);

--
-- Chỉ mục cho bảng `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`pla_id`),
  ADD KEY `cla_id` (`cla_id`);

--
-- Chỉ mục cho bảng `realitys`
--
ALTER TABLE `realitys`
  ADD PRIMARY KEY (`rea_id`),
  ADD KEY `cla_id` (`cla_id`);

--
-- Chỉ mục cho bảng `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`sem_id`),
  ADD KEY `yea_id` (`yea_id`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `maj_id` (`maj_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`use_id`);

--
-- Chỉ mục cho bảng `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`yea_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `cla_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gv`
--
ALTER TABLE `gv`
  MODIFY `gv_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `majors`
--
ALTER TABLE `majors`
  MODIFY `maj_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `manage`
--
ALTER TABLE `manage`
  MODIFY `man_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phases`
--
ALTER TABLE `phases`
  MODIFY `pha_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `plans`
--
ALTER TABLE `plans`
  MODIFY `pla_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `realitys`
--
ALTER TABLE `realitys`
  MODIFY `rea_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `semesters`
--
ALTER TABLE `semesters`
  MODIFY `sem_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `use_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `years`
--
ALTER TABLE `years`
  MODIFY `yea_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`pha_id`) REFERENCES `phases` (`pha_id`);

--
-- Các ràng buộc cho bảng `phases`
--
ALTER TABLE `phases`
  ADD CONSTRAINT `phases_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semesters` (`sem_id`);

--
-- Các ràng buộc cho bảng `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_ibfk_1` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`);

--
-- Các ràng buộc cho bảng `realitys`
--
ALTER TABLE `realitys`
  ADD CONSTRAINT `realitys_ibfk_1` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`);

--
-- Các ràng buộc cho bảng `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`yea_id`) REFERENCES `years` (`yea_id`);

--
-- Các ràng buộc cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`maj_id`) REFERENCES `majors` (`maj_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
