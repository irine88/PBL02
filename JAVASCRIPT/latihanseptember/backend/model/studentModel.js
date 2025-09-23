const pool = require('../database');

exports.getById = async (id) => {
    const [rows] = await pool.query("SELECT * FROM students WHERE kode_siswa = ?", [id]);
    return rows[0];
};

exports.update = async (id, student) => {
    const { nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa } = student;
    const [result] = await pool.query(
        "UPDATE students SET nama_siswa = ?, alamat_siswa = ?, tanggal_siswa = ?, jurusan_siswa = ? WHERE kode_siswa = ?",
        [nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa, id]
    );
    return result.affectedRows;
};

exports.remove = async (id) => {
    const [result] = await pool.query("DELETE FROM students WHERE kode_siswa = ?", [id]);
    return result.affectedRows;
};

exports.search = async (query) => {
    const [rows] = await pool.query("SELECT * FROM students WHERE nama_siswa LIKE ?", [`%${query}%`]);
    return rows;
};

exports.getAll = async () => {
    const [rows] = await pool.query("SELECT * FROM students");
    return rows;
};

exports.create = async (student) => {
    const { nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa } = student;
    const [result] = await pool.query(
        "INSERT INTO students (nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa) VALUES (?, ?, ?, ?)",
        [nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa]
    );
    return result.insertId;
};