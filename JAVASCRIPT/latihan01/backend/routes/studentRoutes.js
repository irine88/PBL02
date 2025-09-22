const express = require('express');
const router = express.Router();
const studentController = require('../controllers/studentController');

router.get('/', studentController.getAllStudents);
router.post('/', studentController.createStudent);
router.put('/:id', studentConroller.updateStudent);
router.delete('/:id', studentController.deleteStudent);
router.get('/search', studentController.searchStudent);
router.get('/:id', studentController. getStudentById);

module.exports = router;