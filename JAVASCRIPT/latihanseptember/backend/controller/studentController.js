const Student = require('../model/studentModel');

exports.createStudent = async (req, res) => {
    try {
        const studentData = req.body;
        const newId = await Student.create(studentData);
        res.status(201).json({ kode_siswa: newId });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.updateStudent = async (req, res) => {
    try {
        const { id } = req.params;
        const studentData = req.body;
        const affectedRows = await Student.update(id, studentData);
        if (affectedRows === 0) {
            return res.status(404).json({ message: 'Student not found.' });
        }
        res.json({ message: 'Student updated successfully.' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.deleteStudent = async (req, res) => {
    try {
        const { id } = req.params;
        const affectedRows = await Student.remove(id);
        if (affectedRows === 0) {
            return res.status(404).json({ message: 'Student not found.' });
        }
        res.json({ message: 'Student deleted successfully.' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getStudentById = async (req, res) => {
    try {
        const { id } = req.params;
        const student = await Student.getById(id);
        if (!student) {
            return res.status(404).json({ message: 'Student not found.' });
        }
        res.json(student);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.searchStudents = async (req, res) => {
    try {
        const { query } = req.query;
        const students = await Student.search(query);
        res.json(students);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getAllStudents = async (req, res) => {
    try {
        const students = await Student.getAll();
        res.json(students);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};