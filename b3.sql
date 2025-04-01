create database RapPhim;
use RapPhim;

create table Phim(
	MaPhim int auto_increment primary key unique,
    TenPhim varchar(200),
    Trailer varchar(200),
    HinhAnh varchar(200),
    MoTa varchar(500),
    NgayKhoiChieu timestamp
);

create table Rap(
	MaRap int auto_increment primary key unique,
    TenRap varchar(100),
    MaCumRap varchar(20),
    foreign key (MaCumRap) references CumRap(MaCumRap)
);

create table CumRap(
	MaCumRap varchar(20) primary key,
    TenCumRap varchar(50)
);



-- Người dùng
create table NguoiDung(
	TaiKhoan varchar(50) primary key unique,
    MatKhau varchar(50),
    Email varchar(50) unique,
    SoDT varchar(15) unique,
    HoTen varchar(100),
    MaLoaiNguoiDung varchar(10),
    foreign key (MaLoaiNguoiDung) references LoaiNguoiDung(MaLoaiNguoiDung)
);

create table LoaiNguoiDung(
	MaLoaiNguoiDung varchar(10) primary key,
    TenLoaiNguoiDung varchar(10)
);

-- Ghế
create table Ghe(
	MaGhe varchar(10) primary key,
    KichHoat boolean default false,
    STT int auto_increment unique,
    TenGhe varchar(10),
    MaLoaiGhe varchar(10),
    MaRap int,
    foreign key (MaRap) references Rap(MaRap),
    foreign key (MaLoaiGhe) references LoaiGhe(MaLoaiGhe)
);

create table LoaiGhe(
	MaLoaiGhe varchar(10) primary key,
    TenLoaiGhe varchar(10),
    MoTa varchar(300),
	ChietKhau decimal(4,2)
);

create table Chieu(
	ThoiLuong time,
    GiaVe decimal(10,2),
    NgayGioChieu timestamp,
    MaPhim int,
    MaRap int,
    primary key (MaPhim, MaRap),
    foreign key (MaPhim) references Phim(MaPhim),
	foreign key (MaRap) references Rap(MaRap)
);

-- Đặt vé 
create table DatVe(
	NgayDat timestamp,
    GiaVe decimal(10,2),
    ChietKhau decimal(4,2),
    TaiKhoan varchar(50),
    MaPhim int,
    MaRap int,
	MaGhe varchar(10),
    primary key (TaiKhoan, MaPhim, MaRap, MaGhe),
    foreign key (TaiKhoan) references NguoiDung(TaiKhoan),
    foreign key (MaPhim, MaRap) references Chieu(MaPhim, MaRap),
    foreign key (MaGhe) references Ghe(MaGhe)
);

-- 1
select Rap.MaRap, Rap.TenRap, Ghe.STT, CumRap.TenCumRap
from Rap
join Ghe on Ghe.MaRap = Rap.MaRap
join CumRap on CumRap.MaCumRap = Rap.MaCumRap
where TenCumRap = "Mega GS";

-- 2
select Ghe.MaGhe, Ghe.TenGhe, Rap.TenRap, Ghe.STT, LoaiGhe.TenLoaiGhe, Ghe.KichHoat
from Ghe
join Rap on Rap.MaRap = Ghe.MaRap
join LoaiGhe on LoaiGhe.MaLoaiGhe = Ghe.MaLoaiGhe
where TenLoaiGhe = "Thường";

-- 3
select Phim.TenPhim, Rap.TenRap, Chieu.NgayGioChieu, Chieu.GiaVe, Chieu.ThoiLuong
from Chieu
join Rap on Rap.MaRap = Chieu.MaRap
join Phim on Chieu.MaPhim = Phim.MaPhim
where NgayGioChieu = "2019-01-01 14:00:00";


-- 4
select TaiKhoan, Email, SoDT
from NguoiDung
join LoaiNguoiDung on LoaiNguoiDung.MaLoaiNguoiDung = NguoiDung.MaLoaiNguoiDung
where LoaiNguoiDung.MaLoaiNguoiDung = "Nhóm 1";

-- 5
select TenPhim, TenRap, NgayGioChieu, GiaVe, ThoiLuong
from Phim
join Chieu on Chieu.MaPhim = Phim.MaPhim
join Rap on Rap.MaRap = Chieu.MaRap
where TenPhim like '%Ted%';