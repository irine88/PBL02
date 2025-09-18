drop database if exists warung;
create database warung;
use warung;

create table gender (
	kodegender char(1) primary key,
    gender varchar(20)
);

create table kota (
	kodekota char(1) primary key,
    kota varchar(20)
);

create table pelanggan (
	kodepelanggan char(5) primary key,
    namapelanggan varchar(20),
    kodegender char(1),
    alamat varchar(100),
    kodekota char(1),
    foreign key (kodegender) references gender(kodegender)
		on delete restrict on update cascade,
	foreign key (kodekota) references kota(kodekota)
		on delete restrict on update cascade
);

create table satuan (
	kodesatuan char(1) primary key,
    satuan varchar(20)
);

create table produk (
	kodeproduk char(4) primary key,
    namaproduk varchar(20),
    kodesatuan char(1),
    stok int,
    harga int,
    foreign key (kodesatuan) references satuan(kodesatuan)
		on delete restrict on update cascade
);

create table penjualan (
	kodepenjualan char(4) primary key,
    tanggalpenjualan date,
	kodepelanggan char(5),
    foreign key (kodepelanggan) references pelanggan(kodepelanggan)
		on delete restrict on update cascade
);

create table detailpenjualan (
	kodepenjualan char(4),
    kodeproduk char(4),
    jumlah int,
    foreign key (kodepenjualan) references penjualan(kodepenjualan)
		on delete cascade on update cascade,
    foreign key (kodeproduk) references produk(kodeproduk)
		on delete restrict on update cascade
);

DELIMITER //
create procedure insertgender (
	in p_kodegender char(1),
    in p_gender varchar(20)
)
BEGIN
	insert into gender(kodegender, gender)
		values (p_kodegender, p_gender);
END //
DELIMITER ;
call insertgender('1', 'Pria');
call insertgender('2', 'Wanita');

DELIMITER //
create procedure insertkota (
	in p_kodekota char(1),
    in p_kota varchar(20)
)
BEGIN
	insert into kota(kodekota, kota)
		values (p_kodekota, p_kota);
END //
DELIMITER ;
call insertkota('1', 'Jakarta');
call insertkota('2', 'Bandung');
call insertkota('3', 'Surabaya');

DELIMITER //
create procedure insertpelanggan (
	in p_kodepelanggan char(5),
    in p_namapelanggan varchar(20),
    in p_kodegender char(1),
    in p_alamat varchar(100),
    in p_kodekota char(1)
)
BEGIN
	insert into pelanggan(kodepelanggan, namapelanggan, kodegender, alamat, kodekota)
		values (p_kodepelanggan, p_namapelanggan, p_kodegender, p_alamat, p_kodekota);
END //
DELIMITER ;
call insertpelanggan('PLG01', 'Mohamad', '1', 'Priok', '1');
call insertpelanggan('PLG02', 'Naufal', '1', 'Cilincing', '1');
call insertpelanggan('PLG03', 'Atila', '1', 'Bojongsoang', '2');
call insertpelanggan('PLG04', 'Tsalsa', '2', 'Buah Batu', '2');
call insertpelanggan('PLG05', 'Damay', '2', 'Gubeng', '3');
call insertpelanggan('PLG06', 'Tsaniy', '1', 'Darmo', '3');
call insertpelanggan('PLG07', 'Nabila', '2', 'Lebak Bulus', '1');

DELIMITER //
create procedure insertsatuan (
	in p_kodesatuan char(1),
    in p_satuan varchar(20)
)
BEGIN
	insert into satuan(kodesatuan, satuan)
		values (p_kodesatuan, p_satuan);
END //
DELIMITER ;
call insertsatuan('1', 'Bungkus');
call insertsatuan('2', 'Pak');
call insertsatuan('3', 'Botol');

DELIMITER //
create procedure insertproduk (
	in p_kodeproduk char(4),
    in p_namaproduk varchar(20),
    in p_kodesatuan char(1),
    in p_stok int,
    in p_harga int
)
BEGIN
	insert into produk(kodeproduk, namaproduk, kodesatuan, stok, harga)
		values (p_kodeproduk, p_namaproduk, p_kodesatuan, p_stok, p_harga);
END //
DELIMITER ;
call insertproduk('P001', 'Indomie', '1', 10, 3000);
call insertproduk('P002', 'Roti', '2', 3, 18000);
call insertproduk('P003', 'Kecap', '3', 8, 4700);
call insertproduk('P004', 'Saos Tomat', '3', 8, 5800);
call insertproduk('P005', 'Bihun', '1', 5, 3500);
call insertproduk('P006', 'Sikat Gigi', '2', 5, 15000);
call insertproduk('P007', 'Pasta Gigi', '2', 7, 10000);
call insertproduk('P008', 'Saos Sambal', '3', 5, 7300);

DELIMITER //
create procedure insertpenjualan (
	in p_kodepenjualan char(4),
    in p_tanggalpenjualan date,
    in p_kodepelanggan char(5)
)
BEGIN
	insert into penjualan(kodepenjualan, tanggalpenjualan, kodepelanggan)
		values (p_kodepenjualan, p_tanggalpenjualan, p_kodepelanggan);
END //

create procedure insertdetailpenjualan (
	in p_kodepenjualan char(4),
    in p_kodeproduk char(4),
    in p_jumlah int
)
BEGIN
	insert into detailpenjualan(kodepenjualan, kodeproduk, jumlah)
		values (p_kodepenjualan, p_kodeproduk, p_jumlah);
END //
DELIMITER ;
call insertpenjualan('J001', '2025-09-08', 'PLG03');
call insertdetailpenjualan('J001', 'P001', 2);
call insertdetailpenjualan('J001', 'P003', 1);
call insertdetailpenjualan('J001', 'P004', 1);
call insertpenjualan('J002', '2025-09-08', 'PLG07');
call insertdetailpenjualan('J002', 'P006', 3);
call insertdetailpenjualan('J002', 'P007', 1);
call insertpenjualan('J003', '2025-09-09', 'PLG02');
call insertdetailpenjualan('J003', 'P001', 5);
call insertdetailpenjualan('J003', 'P004', 2);
call insertdetailpenjualan('J003', 'P008', 2);
call insertdetailpenjualan('J003', 'P003', 1);
call insertpenjualan('J004', '2025-09-10', 'PLG05');
call insertdetailpenjualan('J004', 'P002', 3);
call insertdetailpenjualan('J004', 'P004', 2);
call insertdetailpenjualan('J004', 'P008', 2);
call insertdetailpenjualan('J004', 'P006', 2);
call insertdetailpenjualan('J004', 'P007', 1);

-- SHOWING RESULTS
create view vw_pelanggan as
select 
	pelanggan.kodepelanggan as 'Kode',
    pelanggan.namapelanggan as 'Nama',
    gender.gender as 'Kelamin',
    pelanggan.alamat as 'Alamat',
    kota.kota as 'Kota'
from pelanggan
join gender on pelanggan.kodegender = gender.kodegender
join kota on pelanggan.kodekota = kota.kodekota
order by pelanggan.kodepelanggan;

create view vw_produk as
select
	produk.kodeproduk as 'Kode',
    produk.namaproduk as 'Nama',
    satuan.satuan as 'Satuan',
    produk.stok as 'Stok',
    produk.harga as 'Harga'
from produk
join satuan on produk.kodesatuan = satuan.kodesatuan
order by produk.kodeproduk;

create view vw_penjualan as
select
	DATE_FORMAT(penjualan.tanggalpenjualan, '%d/%m/%Y') as 'Tanggal Jual',
    penjualan.kodepenjualan as 'No Jual',
    pelanggan.namapelanggan as 'Nama',
    produk.namaproduk as 'Produk',
    detailpenjualan.jumlah as 'Jumlah',
    produk.harga as 'Harga',
    (detailpenjualan.jumlah * produk.harga) as 'Subtotal'
from penjualan
join detailpenjualan on penjualan.kodepenjualan = detailpenjualan.kodepenjualan
join pelanggan on penjualan.kodepelanggan = pelanggan.kodepelanggan
join produk on detailpenjualan.kodeproduk = produk.kodeproduk
order by penjualan.kodepenjualan;

select * from vw_pelanggan;
select * from vw_produk;
select * from vw_penjualan;

