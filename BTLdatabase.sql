create table GiangVien(
IDGV int not null identity(1,1) primary key,
HoTen varchar(30) not null,
NgaySinh date not null,
SDT varchar(20) not null)

create table QuanLy(
IDQL int not null identity(1,1) primary key,
HoTen varchar(30) not null,
NgaySinh date not null,
SDT varchar(20) not null)

create table Nganh(
MaNganh int identity(1,1) not null primary key,
TenNganh varchar(30) not null)

create table Mon(
MaMon int identity(1,1) not null Primary key,
MaNganh int foreign key references Nganh(MaNganh),
TenMon varchar(30) not null)

create table Nam(
IDNam int identity(1,1) not null primary key,
Nam varchar(5) not null)

create table HocKy(
IDKy int identity(1,1) not null primary key,
IDNam int foreign key references Nam(IDNam), 
Ky tinyint not null)

create table GD(
IDGD int identity(1,1) not null primary key,
IDKy int foreign key references HocKy(IDKy), 
DG tinyint not null)

create table LopHP(
IDLop int identity(1,1) not null primary key,
MaMon int foreign key references Mon(MaMon),
IDGD int foreign key references GD(IDGD))

create table PhongHoc(
MaPhong int identity(1,1) not null primary key,
SoPhong int not null)

create table KeHoachDuKien(
MaMon int foreign key references Mon(MaMon),
ThoiGian date not null,
MaPhong int foreign key references PhongHoc(MaPhong))

create table LichTrinhThucTe(
MaMon int foreign key references Mon(MaMon),
ThoiGian date not null,
MaPhong int foreign key references PhongHoc(MaPhong))

create table QTV(
MaQTV int identity(1,1) primary key not null,
TaiKhoan varchar(20) not null,
MatKhau varchar(20) not null,
Hoten varchar(30) not null)

create table accGV(
IDGV int foreign key references GiangVien(IDGV),
TaiKhoan varchar(20) not null,
MatKhau varchar(20) not null,
Email varchar(50) not null)

create table accQL(
IDQL int foreign key references QuanLy(IDQL),
TaiKhoan varchar(20) not null,
MatKhau varchar(20) not null,
Email varchar(50) not null)