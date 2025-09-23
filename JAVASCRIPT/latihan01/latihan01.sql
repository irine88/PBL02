drop database if exists pbl;
create database pbl;
use pbl;

create table students (
	kode_siswa tinyint auto_increment primary key,
	nama_siswa varchar(50),
    alamat_siswa varchar(50),
    tanggal_siswa varchar(50),
    jurusan_siswa varchar(25)
);