const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const cors = require('cors');

const mongoose = require('mongoose');
mongoose.connect("mongodb://localhost:27017/mydb")
  .then(() => console.log('Database connected successfully'))
  .catch(err => console.log(err));

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use('/', require('./routes/user.route'));

app.listen(port, () => {
  console.log('Server running on port ' + port);
});
