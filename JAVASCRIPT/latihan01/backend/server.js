const express = require('express');
const app = express();
const studentRouters = require('./routers/studentRouters');

app.use(express.json());
app.use('/api/students', studentRouters);

app.listen(3000, () => {
  console.log('Server berjalan di http://localhost:3000');
});
