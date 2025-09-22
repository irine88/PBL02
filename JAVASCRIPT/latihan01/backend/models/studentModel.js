exports.create = async (student) => {
    const {nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa} = student;
    const [result] = await pool.query(
        "INSERT INTO students (nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa) VALUES (?, ?, ?, ?)",
        [nama_siswa, alamat_siswa, tanggal_siswa, jurusan_siswa]
    );
    return result.insertId;
};



exports.updateStudent = async (req, res) => {
    try{
        const {id} = req.params;
        const studentData = req.body;
        const affectedRows = await Student.update(id, studentData);
        if (affectedRows === 0) {
            return res.status(484).json({message: 'Student not found'});
        }
        res.json({message: 'Student updated successfully'});
    } catch (err) {
        res.status(500).json({error: err.message});
    }
}

exports.deleteStudent = async (req, res) => {
    const {id} = req.params;

}