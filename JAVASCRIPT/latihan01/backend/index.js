const express = require('express');
const cors = require('cors');
const studentRoutes = require('./routes/studentRoutes');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use('/api/students', studentRoutes);

app.get('/', (req, res) => {
  res.send('<h1>Selamat Datang</h1><br><h2>Website PBL</h2><h3>Web Developer dengan Nodejs dan React</h3>');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});