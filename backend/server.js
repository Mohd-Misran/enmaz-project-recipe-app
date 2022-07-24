const dotenv = require('dotenv');
const mongoose = require('mongoose');
const app = require('./app.js');

// Load config
dotenv.config({ path: './config.env' });

// Connect to DB
let DB_CONNECTION_STRING = process.env.DATABASE;
DB_CONNECTION_STRING = DB_CONNECTION_STRING.replace(
  '$DB_PASSWORD$',
  process.env.DB_PASSWORD
);
mongoose.connect(DB_CONNECTION_STRING).then(() => {
  console.log('DB connection successful.');
});

// Create server
const port = 3000;
app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
