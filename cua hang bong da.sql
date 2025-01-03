-- Tạo cơ sở dữ liệu
CREATE DATABASE bongda;
USE bongda;

-- Bảng Khách hàng
CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    TenKhachHang VARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL UNIQUE,
    Email VARCHAR(100) UNIQUE,
    DiaChi VARCHAR(255)
);

-- Bảng Danh mục sản phẩm
CREATE TABLE DanhMucSanPham (
    MaDanhMuc INT  PRIMARY KEY,
    TenDanhMuc VARCHAR(100) NOT NULL UNIQUE
);

-- Bảng Sản phẩm
CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY,
    TenSanPham VARCHAR(100) NOT NULL,
    Gia FLOAT NOT NULL,
    SoLuong INT NOT NULL,
    MaDanhMuc INT,
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMucSanPham(MaDanhMuc)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- Bảng Đơn hàng
CREATE TABLE DonHang (
    MaDonHang INT  PRIMARY KEY,
    NgayDatHang DATETIME DEFAULT CURRENT_TIMESTAMP,
    MaKhachHang INT NOT NULL,
    TongTien FLOAT NOT NULL,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Bảng Chi tiết đơn hàng
CREATE TABLE ChiTietDonHang (
    MaChiTietDonHang INT PRIMARY KEY,
    MaDonHang INT NOT NULL,
    MaSanPham INT NOT NULL,
    SoLuong INT NOT NULL,
    DonGia FLOAT NOT NULL,
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
        ON DELETE CASCADE ON UPDATE CASCADE
);
