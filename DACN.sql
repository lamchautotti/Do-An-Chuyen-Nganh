/*
Created		30-Mar-23
Modified		09-Dec-23
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/
Create database doancoso
go
use doancoso
go

Create table [DichVu]
(
	[MaDV] Integer Identity NOT NULL,
	[TenDV] Nvarchar(20) NULL,
	[Hinh] Varchar(50) NULL,
	[GoiGio] Nvarchar(10) NULL,
	[GiaDV] Money NULL,
Primary Key ([MaDV])
) 
go

Create table [HoaDon]
(
	[MaHD] Integer Identity NOT NULL,
	[NgayLap] Datetime NULL,
	[NgayThucHien] Datetime NULL,
	[TenTK] Char(30) NOT NULL,
	[MaTT] Integer NOT NULL,
Primary Key ([MaHD])
) 
go

Create table [ChiTietDichVu]
(
	[MaDV] Integer NOT NULL,
	[MaHD] Integer NOT NULL,
	[SoLuong] Integer NULL,
	[Gia] Money NULL,
Primary Key ([MaDV],[MaHD])
) 
go

Create table [TaiKhoanND]
(
	[TenTK] Char(30) NOT NULL,
	[MK] Char(30) NULL,
	[TenND] Nvarchar(30) NULL,
	[DiaChi] Nvarchar(50) NULL,
	[SDT] Char(11) NULL,
	[Mail] Char(30) NULL,
	[CCCD] Char(12) NULL,
	[MND] Integer NOT NULL,
Primary Key ([TenTK])
) 
go

Create table [HinhThucTT]
(
	[MaTT] Integer Identity NOT NULL,
	[TenTT] Nvarchar(20) NULL,
	[MoTaTT] Nvarchar(50) NULL,
Primary Key ([MaTT])
) 
go

Create table [DanhGia]
(
	[MaDG] Integer Identity NOT NULL,
	[DoYeuThich] Integer NULL,
	[MaDV] Integer NOT NULL,
	[MaHD] Integer NOT NULL,
Primary Key ([MaDG],[MaDV],[MaHD])
) 
go

Create table [LoaiND]
(
	[MND] Integer Identity NOT NULL,
	[TenLoaiND] Nvarchar(30) NULL,
Primary Key ([MND])
) 
go

Create table [PhanHoi]
(
	[MaPH] Integer Identity NOT NULL,
	[NgayLapPH] Datetime NULL,
	[NoiDung] Nvarchar(500) NULL,
	[MaHD] Integer NOT NULL,
Primary Key ([MaPH])
) 
go


Alter table [ChiTietDichVu] add  foreign key([MaDV]) references [DichVu] ([MaDV])  on update no action on delete no action 
go
Alter table [ChiTietDichVu] add  foreign key([MaHD]) references [HoaDon] ([MaHD])  on update no action on delete no action 
go
Alter table [PhanHoi] add  foreign key([MaHD]) references [HoaDon] ([MaHD])  on update no action on delete no action 
go
Alter table [DanhGia] add  foreign key([MaDV],[MaHD]) references [ChiTietDichVu] ([MaDV],[MaHD])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([TenTK]) references [TaiKhoanND] ([TenTK])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaTT]) references [HinhThucTT] ([MaTT])  on update no action on delete no action 
go
Alter table [TaiKhoanND] add  foreign key([MND]) references [LoaiND] ([MND])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


--DICHVU
insert into DichVu values(N'Tổng vệ sinh','/Content/images/book2.jpg',N'Hành chính',500000)
insert into DichVu values(N'Trông trẻ','/Content/images/book2.jpg',N'Hành chính',300000)
insert into DichVu values(N'Đi chợ','/Content/images/book2.jpg',N'Hành chính',70000)
insert into DichVu values(N'Nấu ăn','/Content/images/book2.jpg',N'Cao điểm',200000)
insert into DichVu values(N'Giặt ủi','/Content/images/book2.jpg',N'Hành chính',40000)
insert into DichVu values(N'Phun khử khuẩn','/Content/images/book2.jpg',N'Hành chính',700000)
insert into DichVu values(N'Chăm sóc người già','/Content/images/book2.jpg',N'Hành chính',400000)
insert into DichVu values(N'Vệ sinh máy lạnh','/Content/images/book2.jpg',N'Hành chính',200000)
GO
--THANHTOAN
insert into HinhThucTT values(N'MoMo',N'Thanh toán qua app MoMo')
insert into HinhThucTT values(N'Tiền mặt',N'Thanh toán trực tiếp bằng tiền mặt')
insert into HinhThucTT values(N'Chuyển khoản',N'Chuyển khoản qua thẻ ngân hàng')
GO
--LOAIND
insert into LoaiND values('Admin')
insert into LoaiND values('Khách hàng')
GO
--TAIKHOAN
insert into TaiKhoanND values('TienTien','tien123',N'Huỳnh Tiên',N'Quận 9','0397621345','tien45@gmail.com','026402006783',2)
insert into TaiKhoanND values('Tai','123456',N'Nguyễn Văn Tài',N'Quận Thủ Đức','0978367000','t56@gmail.com','023803091274',2)
insert into TaiKhoanND values('Chi','nero03',N'Nguyễn Lam Chi',N'Quận 3','0305230070','nero@gmail.com','020902450010',1)
insert into TaiKhoanND values('KhanhBui','kb908',N'Bùi Duy Khánh',N'Quận Gò Vấp','0907491555','buikhanh@gmail.com','021503002768',1)
insert into TaiKhoanND values('Thanh','thanhthuy',N'Đỗ Văn Thành',N'Quận Bình Tân','0367020378','dvt@gmail.com','025609871564',2)
GO
--HOADON
insert into HoaDon values('2022/03/27','2022/03/29','TienTien',1)
insert into HoaDon values('2023/05/13','2022/05/27','Tai',3)
insert into HoaDon values('2023/12/01','2022/12/27','Thanh',2)
GO
--CHITIETDICHVU
insert into ChiTietDichVu values(1,1,2,1000000)
insert into ChiTietDichVu values(1,2,2,1000000)
insert into ChiTietDichVu values(1,3,2,1000000)
GO

CREATE TABLE [dbo].[ThanhToan](
	[MaThanhToan] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[TongTien] [money] NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SoDienThoai] [nchar](10) NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
