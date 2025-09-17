# untuk menghapus database
DROP DATABASE pbl2;

# membuat database
CREATE DATABASE IF NOT EXISTS pbl2;

# menunjuk database yang digunakan
USE pbl2;

# membuat tabel definisi
CREATE table IF NOT EXISTS siswa (
	nis 	varchar(5),
    nama 	varchar(50),
    alamat 	varchar(100),
    kota 	varchar(25)
);

# merubah tabel
ALTER TABLE siswa
	#rename: untuk merubah nama column.
	rename column nis to nisa;
    #change: untuk merubah nama column DAN data type.
    
ALTER TABLE siswa
    change nisa nisi varchar(10);
	#modify: untuk merubah 
    #modify

#show tables;

#describe siswa;

insert siswa values
	('1234567890', 'Septiawan', 'Ciganitri', 'Bandung'),
	('1234567890', 'Irine', 'TKI', 'Bandung'),
    ('1234567890', 'Dzakiy', 'Gubeng', 'Surabaya'),
    ('1234567890', 'Dzaka', 'Ciganitri', 'Bandung'),
    ('1234567890', 'Nabila', 'Ciganitri', 'Bandung');

update siswa
set nisi = '1234567891' where nama = 'Irine';

update siswa
set nisi = '1234567892' where nama = 'Dzakiy';

update siswa
set nisi = '1234567893' where nama = 'Dzaka';

update siswa
set nisi = '1234567894' where nama = 'Nabila';

alter table siswa
	add primary key (nisi);

#select * from siswa;

create table kota (
	kode		varchar(1) primary key,
    namakota	varchar(25)
);

#show tables;


DELIMITER //
CREATE PROCEDURE sp_ins_kota (
	IN sp_kode varchar(1),
    IN sp_nama varchar(25)
)

BEGIN
	INSERT INTO kota (kode, namakota) VALUES(sp_kode, sp_nama);
END//

DELIMITER ;

call sp_ins_kota('1', 'Bandung');
call sp_ins_kota('2', 'Jakarta');
call sp_ins_kota('3', 'Surabaya');

describe kota;

select * from kota;

select * from siswa;

update siswa
set kota = '1'
where alamat = 'Ciganitri';

update siswa
set kota = '2'
where alamat = 'Gubeng';

update siswa
set kota = '3'
where alamat = 'TKI';

select * from siswa;

alter table siswa
	change kota kd_kota varchar(1);

alter table siswa
	add foreign key (kd_kota)
    references kota(kode);

select siswa.nama, siswa.alamat, kota.namakota
from siswa, kota
where siswa.kd_kota = kota.kode
order by siswa.nisi;

select kota.namakota, count(kota.namakota) as Jumlah_Siswa
from siswa, kota
where siswa.kd_kota = kota.kode and
	kota.namakota = 'Bandung'
group by kota.namakota;