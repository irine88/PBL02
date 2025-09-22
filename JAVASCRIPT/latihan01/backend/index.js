const express = require('express');
const cors = require('cors');
const studentRoutes = require('./routes/student');

const app = express()
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use('/api/students', studentRoutes);