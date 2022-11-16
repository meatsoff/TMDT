
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/23/2022 08:52:22
-- Generated from EDMX file
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE BanHang;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__ChiTietDo__IdSiz__24927208]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChiTietDonHang] DROP CONSTRAINT [FK__ChiTietDo__IdSiz__24927208];
GO
IF OBJECT_ID(N'[dbo].[FK__ChiTietDon__IdDH__267ABA7A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChiTietDonHang] DROP CONSTRAINT [FK__ChiTietDon__IdDH__267ABA7A];
GO
IF OBJECT_ID(N'[dbo].[FK__ChiTietDon__IdSP__25869641]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChiTietDonHang] DROP CONSTRAINT [FK__ChiTietDon__IdSP__25869641];
GO
IF OBJECT_ID(N'[dbo].[FK__ChiTietPhi__IdNL__6383C8BA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChiTietPhieuNhap] DROP CONSTRAINT [FK__ChiTietPhi__IdNL__6383C8BA];
GO
IF OBJECT_ID(N'[dbo].[FK__ChiTietPhi__IdPN__6477ECF3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChiTietPhieuNhap] DROP CONSTRAINT [FK__ChiTietPhi__IdPN__6477ECF3];
GO
IF OBJECT_ID(N'[dbo].[FK__Kho__SoLuong__66603565]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Kho] DROP CONSTRAINT [FK__Kho__SoLuong__66603565];
GO
IF OBJECT_ID(N'[dbo].[FK__DonHang__IdKH__21B6055D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DonHang] DROP CONSTRAINT [FK__DonHang__IdKH__21B6055D];
GO
IF OBJECT_ID(N'[dbo].[FK__DonHang__IdTinhT__75A278F5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DonHang] DROP CONSTRAINT [FK__DonHang__IdTinhT__75A278F5];
GO
IF OBJECT_ID(N'[dbo].[FK_HoaDon_DonHang]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HoaDon] DROP CONSTRAINT [FK_HoaDon_DonHang];
GO
IF OBJECT_ID(N'[dbo].[FK_HoaDon_HoaDon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HoaDon] DROP CONSTRAINT [FK_HoaDon_HoaDon];
GO
IF OBJECT_ID(N'[dbo].[FK_SanPham_KhuyenMai]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK_SanPham_KhuyenMai];
GO
IF OBJECT_ID(N'[dbo].[FK__NhanVien__IdLoai__1DE57479]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NhanVien] DROP CONSTRAINT [FK__NhanVien__IdLoai__1DE57479];
GO
IF OBJECT_ID(N'[dbo].[FK__SanPham__IdLoaiS__164452B1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK__SanPham__IdLoaiS__164452B1];
GO
IF OBJECT_ID(N'[dbo].[FK_CongThuc_NguyenLieu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CongThuc] DROP CONSTRAINT [FK_CongThuc_NguyenLieu];
GO
IF OBJECT_ID(N'[dbo].[FK__PhieuNhap__IdNV__6A30C649]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhieuNhap] DROP CONSTRAINT [FK__PhieuNhap__IdNV__6A30C649];
GO
IF OBJECT_ID(N'[dbo].[FK_CongThuc_SanPham]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CongThuc] DROP CONSTRAINT [FK_CongThuc_SanPham];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ChiTietDonHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ChiTietDonHang];
GO
IF OBJECT_ID(N'[dbo].[ChiTietPhieuNhap]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ChiTietPhieuNhap];
GO
IF OBJECT_ID(N'[dbo].[DonHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DonHang];
GO
IF OBJECT_ID(N'[dbo].[HoaDon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HoaDon];
GO
IF OBJECT_ID(N'[dbo].[KhachHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KhachHang];
GO
IF OBJECT_ID(N'[dbo].[Kho]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Kho];
GO
IF OBJECT_ID(N'[dbo].[KhuyenMai]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KhuyenMai];
GO
IF OBJECT_ID(N'[dbo].[LoaiNhanVien]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoaiNhanVien];
GO
IF OBJECT_ID(N'[dbo].[LoaiSanPham]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoaiSanPham];
GO
IF OBJECT_ID(N'[dbo].[NguyenLieu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NguyenLieu];
GO
IF OBJECT_ID(N'[dbo].[NhanVien]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NhanVien];
GO
IF OBJECT_ID(N'[dbo].[PhieuNhap]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhieuNhap];
GO
IF OBJECT_ID(N'[dbo].[SanPham]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SanPham];
GO
IF OBJECT_ID(N'[dbo].[SizeSanPham]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SizeSanPham];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[TinhTrangDonHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TinhTrangDonHang];
GO
IF OBJECT_ID(N'[dbo].[CongThuc]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CongThuc];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ChiTietDonHang'
CREATE TABLE [dbo].[ChiTietDonHang] (
    [IdChiTietDH] int IDENTITY(1,1) NOT NULL,
    [SoLuong] int  NOT NULL,
    [GhiChuChiTiet] nvarchar(50)  NULL,
    [GiaBan] float  NOT NULL,
    [DanhGiaSanPham] int  NULL,
    [IdSP] int  NOT NULL,
    [IdDH] int  NOT NULL,
    [IdSizeSP] varchar(50)  NOT NULL
);
GO

-- Creating table 'ChiTietPhieuNhap'
CREATE TABLE [dbo].[ChiTietPhieuNhap] (
    [IdCTPN] int IDENTITY(1,1) NOT NULL,
    [SoLuongNhap] int  NOT NULL,
    [GiaNhap] float  NOT NULL,
    [IdNL] int  NOT NULL,
    [IdPN] int  NOT NULL
);
GO

-- Creating table 'DonHang'
CREATE TABLE [dbo].[DonHang] (
    [IdDH] int IDENTITY(1,1) NOT NULL,
    [NgayTaoDon] datetime  NOT NULL,
    [DiaChiGiaoHang] nvarchar(50)  NOT NULL,
    [GhiChu] nvarchar(50)  NULL,
    [TongTien] float  NOT NULL,
    [DiemKHSuDung] int  NOT NULL,
    [IdKH] int  NOT NULL,
    [IdTinhTrangDH] varchar(50)  NULL,
    [NgayGioCapNhat] datetime  NULL
);
GO

-- Creating table 'HoaDon'
CREATE TABLE [dbo].[HoaDon] (
    [IdHD] int IDENTITY(1,1) NOT NULL,
    [IdNV] int  NOT NULL,
    [IdDH] int  NOT NULL,
    [NgayTaoHD] datetime  NOT NULL,
    [TongTien] float  NOT NULL
);
GO

-- Creating table 'KhachHang'
CREATE TABLE [dbo].[KhachHang] (
    [IdKH] int IDENTITY(1,1) NOT NULL,
    [EmailKH] nvarchar(50)  NOT NULL,
    [MatKhau] nvarchar(50)  NOT NULL,
    [TenKhachHang] nvarchar(50)  NOT NULL,
    [NgaySinh] datetime  NOT NULL,
    [SDTKH] nvarchar(50)  NOT NULL,
    [DiaChi] nvarchar(50)  NOT NULL,
    [NgayTaoTK] datetime  NOT NULL,
    [DiemTichLuy] int  NOT NULL,
    [TinhTrang] bit  NOT NULL
);
GO

-- Creating table 'Kho'
CREATE TABLE [dbo].[Kho] (
    [IdCTPN] int  NOT NULL,
    [SoLuong] int  NOT NULL
);
GO

-- Creating table 'KhuyenMai'
CREATE TABLE [dbo].[KhuyenMai] (
    [IdKM] int IDENTITY(1,1) NOT NULL,
    [PhanTramKM] int  NOT NULL,
    [NgayHetHan] datetime  NOT NULL,
    [GhiChuKM] nvarchar(50)  NOT NULL,
    [TinhTrang] bit  NOT NULL
);
GO

-- Creating table 'LoaiNhanVien'
CREATE TABLE [dbo].[LoaiNhanVien] (
    [IdLoaiNV] varchar(50)  NOT NULL,
    [TenLoaiNhanVien] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'LoaiSanPham'
CREATE TABLE [dbo].[LoaiSanPham] (
    [IdLoaiSP] varchar(50)  NOT NULL,
    [TenLoaiSP] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'NguyenLieu'
CREATE TABLE [dbo].[NguyenLieu] (
    [IdNL] int IDENTITY(1,1) NOT NULL,
    [TenNL] nvarchar(50)  NOT NULL,
    [GiaNL] float  NOT NULL,
    [DonVi] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'NhanVien'
CREATE TABLE [dbo].[NhanVien] (
    [IdNV] int IDENTITY(1,1) NOT NULL,
    [EmailNV] nvarchar(50)  NOT NULL,
    [MatKhau] nvarchar(50)  NOT NULL,
    [TenNhanVien] nvarchar(50)  NOT NULL,
    [SDTNV] nvarchar(50)  NOT NULL,
    [NgaySinh] datetime  NOT NULL,
    [DiaChi] nvarchar(50)  NOT NULL,
    [NgayCapTK] datetime  NOT NULL,
    [TinhTrang] bit  NOT NULL,
    [IdLoaiNV] varchar(50)  NOT NULL
);
GO

-- Creating table 'PhieuNhap'
CREATE TABLE [dbo].[PhieuNhap] (
    [IdPN] int IDENTITY(1,1) NOT NULL,
    [NgayNhap] datetime  NOT NULL,
    [TongTienNhap] float  NOT NULL,
    [IdNV] int  NOT NULL
);
GO

-- Creating table 'SanPham'
CREATE TABLE [dbo].[SanPham] (
    [IdSP] int IDENTITY(1,1) NOT NULL,
    [TenSP] nvarchar(50)  NOT NULL,
    [HinhAnh] nvarchar(50)  NULL,
    [MoTa] nvarchar(1000)  NOT NULL,
    [GiaBan] float  NOT NULL,
    [TinhTrang] bit  NOT NULL,
    [IdLoaiSP] varchar(50)  NOT NULL,
    [IdKM] int  NULL,
    [SoLuongCon] int  NULL
);
GO

-- Creating table 'SizeSanPham'
CREATE TABLE [dbo].[SizeSanPham] (
    [IdSizeSP] varchar(50)  NOT NULL,
    [SizeSP] nvarchar(50)  NOT NULL,
    [GhiChuSize] nvarchar(50)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TinhTrangDonHang'
CREATE TABLE [dbo].[TinhTrangDonHang] (
    [IdTinhTrangDH] varchar(50)  NOT NULL,
    [TenTinhTrangDH] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'CongThuc'
CREATE TABLE [dbo].[CongThuc] (
    [DinhLuong] int  NOT NULL,
    [DonVi] nvarchar(10)  NOT NULL,
    [IdSP] int  NOT NULL,
    [IdNL] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdChiTietDH], [IdDH] in table 'ChiTietDonHang'
ALTER TABLE [dbo].[ChiTietDonHang]
ADD CONSTRAINT [PK_ChiTietDonHang]
    PRIMARY KEY CLUSTERED ([IdChiTietDH], [IdDH] ASC);
GO

-- Creating primary key on [IdCTPN] in table 'ChiTietPhieuNhap'
ALTER TABLE [dbo].[ChiTietPhieuNhap]
ADD CONSTRAINT [PK_ChiTietPhieuNhap]
    PRIMARY KEY CLUSTERED ([IdCTPN] ASC);
GO

-- Creating primary key on [IdDH] in table 'DonHang'
ALTER TABLE [dbo].[DonHang]
ADD CONSTRAINT [PK_DonHang]
    PRIMARY KEY CLUSTERED ([IdDH] ASC);
GO

-- Creating primary key on [IdHD] in table 'HoaDon'
ALTER TABLE [dbo].[HoaDon]
ADD CONSTRAINT [PK_HoaDon]
    PRIMARY KEY CLUSTERED ([IdHD] ASC);
GO

-- Creating primary key on [IdKH] in table 'KhachHang'
ALTER TABLE [dbo].[KhachHang]
ADD CONSTRAINT [PK_KhachHang]
    PRIMARY KEY CLUSTERED ([IdKH] ASC);
GO

-- Creating primary key on [IdCTPN] in table 'Kho'
ALTER TABLE [dbo].[Kho]
ADD CONSTRAINT [PK_Kho]
    PRIMARY KEY CLUSTERED ([IdCTPN] ASC);
GO

-- Creating primary key on [IdKM] in table 'KhuyenMai'
ALTER TABLE [dbo].[KhuyenMai]
ADD CONSTRAINT [PK_KhuyenMai]
    PRIMARY KEY CLUSTERED ([IdKM] ASC);
GO

-- Creating primary key on [IdLoaiNV] in table 'LoaiNhanVien'
ALTER TABLE [dbo].[LoaiNhanVien]
ADD CONSTRAINT [PK_LoaiNhanVien]
    PRIMARY KEY CLUSTERED ([IdLoaiNV] ASC);
GO

-- Creating primary key on [IdLoaiSP] in table 'LoaiSanPham'
ALTER TABLE [dbo].[LoaiSanPham]
ADD CONSTRAINT [PK_LoaiSanPham]
    PRIMARY KEY CLUSTERED ([IdLoaiSP] ASC);
GO

-- Creating primary key on [IdNL] in table 'NguyenLieu'
ALTER TABLE [dbo].[NguyenLieu]
ADD CONSTRAINT [PK_NguyenLieu]
    PRIMARY KEY CLUSTERED ([IdNL] ASC);
GO

-- Creating primary key on [IdNV] in table 'NhanVien'
ALTER TABLE [dbo].[NhanVien]
ADD CONSTRAINT [PK_NhanVien]
    PRIMARY KEY CLUSTERED ([IdNV] ASC);
GO

-- Creating primary key on [IdPN] in table 'PhieuNhap'
ALTER TABLE [dbo].[PhieuNhap]
ADD CONSTRAINT [PK_PhieuNhap]
    PRIMARY KEY CLUSTERED ([IdPN] ASC);
GO

-- Creating primary key on [IdSP] in table 'SanPham'
ALTER TABLE [dbo].[SanPham]
ADD CONSTRAINT [PK_SanPham]
    PRIMARY KEY CLUSTERED ([IdSP] ASC);
GO

-- Creating primary key on [IdSizeSP] in table 'SizeSanPham'
ALTER TABLE [dbo].[SizeSanPham]
ADD CONSTRAINT [PK_SizeSanPham]
    PRIMARY KEY CLUSTERED ([IdSizeSP] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [IdTinhTrangDH] in table 'TinhTrangDonHang'
ALTER TABLE [dbo].[TinhTrangDonHang]
ADD CONSTRAINT [PK_TinhTrangDonHang]
    PRIMARY KEY CLUSTERED ([IdTinhTrangDH] ASC);
GO

-- Creating primary key on [DinhLuong], [DonVi], [IdSP], [IdNL] in table 'CongThuc'
ALTER TABLE [dbo].[CongThuc]
ADD CONSTRAINT [PK_CongThuc]
    PRIMARY KEY CLUSTERED ([DinhLuong], [DonVi], [IdSP], [IdNL] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdSizeSP] in table 'ChiTietDonHang'
ALTER TABLE [dbo].[ChiTietDonHang]
ADD CONSTRAINT [FK__ChiTietDo__IdSiz__24927208]
    FOREIGN KEY ([IdSizeSP])
    REFERENCES [dbo].[SizeSanPham]
        ([IdSizeSP])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ChiTietDo__IdSiz__24927208'
CREATE INDEX [IX_FK__ChiTietDo__IdSiz__24927208]
ON [dbo].[ChiTietDonHang]
    ([IdSizeSP]);
GO

-- Creating foreign key on [IdDH] in table 'ChiTietDonHang'
ALTER TABLE [dbo].[ChiTietDonHang]
ADD CONSTRAINT [FK__ChiTietDon__IdDH__267ABA7A]
    FOREIGN KEY ([IdDH])
    REFERENCES [dbo].[DonHang]
        ([IdDH])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ChiTietDon__IdDH__267ABA7A'
CREATE INDEX [IX_FK__ChiTietDon__IdDH__267ABA7A]
ON [dbo].[ChiTietDonHang]
    ([IdDH]);
GO

-- Creating foreign key on [IdSP] in table 'ChiTietDonHang'
ALTER TABLE [dbo].[ChiTietDonHang]
ADD CONSTRAINT [FK__ChiTietDon__IdSP__25869641]
    FOREIGN KEY ([IdSP])
    REFERENCES [dbo].[SanPham]
        ([IdSP])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ChiTietDon__IdSP__25869641'
CREATE INDEX [IX_FK__ChiTietDon__IdSP__25869641]
ON [dbo].[ChiTietDonHang]
    ([IdSP]);
GO

-- Creating foreign key on [IdNL] in table 'ChiTietPhieuNhap'
ALTER TABLE [dbo].[ChiTietPhieuNhap]
ADD CONSTRAINT [FK__ChiTietPhi__IdNL__6383C8BA]
    FOREIGN KEY ([IdNL])
    REFERENCES [dbo].[NguyenLieu]
        ([IdNL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ChiTietPhi__IdNL__6383C8BA'
CREATE INDEX [IX_FK__ChiTietPhi__IdNL__6383C8BA]
ON [dbo].[ChiTietPhieuNhap]
    ([IdNL]);
GO

-- Creating foreign key on [IdPN] in table 'ChiTietPhieuNhap'
ALTER TABLE [dbo].[ChiTietPhieuNhap]
ADD CONSTRAINT [FK__ChiTietPhi__IdPN__6477ECF3]
    FOREIGN KEY ([IdPN])
    REFERENCES [dbo].[PhieuNhap]
        ([IdPN])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ChiTietPhi__IdPN__6477ECF3'
CREATE INDEX [IX_FK__ChiTietPhi__IdPN__6477ECF3]
ON [dbo].[ChiTietPhieuNhap]
    ([IdPN]);
GO

-- Creating foreign key on [IdCTPN] in table 'Kho'
ALTER TABLE [dbo].[Kho]
ADD CONSTRAINT [FK__Kho__SoLuong__66603565]
    FOREIGN KEY ([IdCTPN])
    REFERENCES [dbo].[ChiTietPhieuNhap]
        ([IdCTPN])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdKH] in table 'DonHang'
ALTER TABLE [dbo].[DonHang]
ADD CONSTRAINT [FK__DonHang__IdKH__21B6055D]
    FOREIGN KEY ([IdKH])
    REFERENCES [dbo].[KhachHang]
        ([IdKH])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DonHang__IdKH__21B6055D'
CREATE INDEX [IX_FK__DonHang__IdKH__21B6055D]
ON [dbo].[DonHang]
    ([IdKH]);
GO

-- Creating foreign key on [IdTinhTrangDH] in table 'DonHang'
ALTER TABLE [dbo].[DonHang]
ADD CONSTRAINT [FK__DonHang__IdTinhT__75A278F5]
    FOREIGN KEY ([IdTinhTrangDH])
    REFERENCES [dbo].[TinhTrangDonHang]
        ([IdTinhTrangDH])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DonHang__IdTinhT__75A278F5'
CREATE INDEX [IX_FK__DonHang__IdTinhT__75A278F5]
ON [dbo].[DonHang]
    ([IdTinhTrangDH]);
GO

-- Creating foreign key on [IdDH] in table 'HoaDon'
ALTER TABLE [dbo].[HoaDon]
ADD CONSTRAINT [FK_HoaDon_DonHang]
    FOREIGN KEY ([IdDH])
    REFERENCES [dbo].[DonHang]
        ([IdDH])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HoaDon_DonHang'
CREATE INDEX [IX_FK_HoaDon_DonHang]
ON [dbo].[HoaDon]
    ([IdDH]);
GO

-- Creating foreign key on [IdNV] in table 'HoaDon'
ALTER TABLE [dbo].[HoaDon]
ADD CONSTRAINT [FK_HoaDon_HoaDon]
    FOREIGN KEY ([IdNV])
    REFERENCES [dbo].[NhanVien]
        ([IdNV])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HoaDon_HoaDon'
CREATE INDEX [IX_FK_HoaDon_HoaDon]
ON [dbo].[HoaDon]
    ([IdNV]);
GO

-- Creating foreign key on [IdKM] in table 'SanPham'
ALTER TABLE [dbo].[SanPham]
ADD CONSTRAINT [FK_SanPham_KhuyenMai]
    FOREIGN KEY ([IdKM])
    REFERENCES [dbo].[KhuyenMai]
        ([IdKM])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SanPham_KhuyenMai'
CREATE INDEX [IX_FK_SanPham_KhuyenMai]
ON [dbo].[SanPham]
    ([IdKM]);
GO

-- Creating foreign key on [IdLoaiNV] in table 'NhanVien'
ALTER TABLE [dbo].[NhanVien]
ADD CONSTRAINT [FK__NhanVien__IdLoai__1DE57479]
    FOREIGN KEY ([IdLoaiNV])
    REFERENCES [dbo].[LoaiNhanVien]
        ([IdLoaiNV])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__NhanVien__IdLoai__1DE57479'
CREATE INDEX [IX_FK__NhanVien__IdLoai__1DE57479]
ON [dbo].[NhanVien]
    ([IdLoaiNV]);
GO

-- Creating foreign key on [IdLoaiSP] in table 'SanPham'
ALTER TABLE [dbo].[SanPham]
ADD CONSTRAINT [FK__SanPham__IdLoaiS__164452B1]
    FOREIGN KEY ([IdLoaiSP])
    REFERENCES [dbo].[LoaiSanPham]
        ([IdLoaiSP])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SanPham__IdLoaiS__164452B1'
CREATE INDEX [IX_FK__SanPham__IdLoaiS__164452B1]
ON [dbo].[SanPham]
    ([IdLoaiSP]);
GO

-- Creating foreign key on [IdNL] in table 'CongThuc'
ALTER TABLE [dbo].[CongThuc]
ADD CONSTRAINT [FK_CongThuc_NguyenLieu]
    FOREIGN KEY ([IdNL])
    REFERENCES [dbo].[NguyenLieu]
        ([IdNL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CongThuc_NguyenLieu'
CREATE INDEX [IX_FK_CongThuc_NguyenLieu]
ON [dbo].[CongThuc]
    ([IdNL]);
GO

-- Creating foreign key on [IdNV] in table 'PhieuNhap'
ALTER TABLE [dbo].[PhieuNhap]
ADD CONSTRAINT [FK__PhieuNhap__IdNV__6A30C649]
    FOREIGN KEY ([IdNV])
    REFERENCES [dbo].[NhanVien]
        ([IdNV])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__PhieuNhap__IdNV__6A30C649'
CREATE INDEX [IX_FK__PhieuNhap__IdNV__6A30C649]
ON [dbo].[PhieuNhap]
    ([IdNV]);
GO

-- Creating foreign key on [IdSP] in table 'CongThuc'
ALTER TABLE [dbo].[CongThuc]
ADD CONSTRAINT [FK_CongThuc_SanPham]
    FOREIGN KEY ([IdSP])
    REFERENCES [dbo].[SanPham]
        ([IdSP])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CongThuc_SanPham'
CREATE INDEX [IX_FK_CongThuc_SanPham]
ON [dbo].[CongThuc]
    ([IdSP]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------