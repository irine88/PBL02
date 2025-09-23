const express = require('express');
const cors = require('cors');
const studentRoute = require('./route/studentRoute');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use('/api/students', studentRoute);



app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});