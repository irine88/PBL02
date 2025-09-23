const express = require('express');
const router = express.Router();
const studentController = require('../controller/studentController');

// Routes untuk CRUD Student
router.get('/', studentController.getAllStudents);
router.post('/', studentController.createStudent);
router.put('/:id', studentController.updateStudent);
router.delete('/:id', studentController.deleteStudent);
//router.get('/search', studentController.searchStudents);
router.get('/:id', studentController.getStudentById);

module.exports = router;
