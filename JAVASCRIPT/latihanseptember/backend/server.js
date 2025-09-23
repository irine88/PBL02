const express = require('express');
const app = express();
const studentRoute = require('./router/studentRoute');

app.use(express.json());
app.use('/api/students', studentRoute);

app.listen(5000, () => {
    console.log('Server berjalan di http://localhost:5000');
});
