const mysql = require('mysql2');            // Import mysql2 library to interact with MySQL
require('dotenv').config();                   // Load environment variables from .env file

// Create a connection pool (multiple connections managed automatically)
// Pool is better for handling many concurrent queries, more scalable
const pool = mysql.createPool({
    host: process.env.DB_HOST,                  // MySQL host (e.g. localhost)
    user: process.env.DB_USER,                  // MySQL user (e.g. root)
    password: process.env.DB_PASSWORD,          // MySQL password
    database: process.env.DB_NAME,               // Database name to use
    port: process.env.DB_PORT                    // Port number for MySQL (usually 3306)
}).promise();                                // Use promise-based API (instead of callbacks)

module.exports = pool;                        // Export the pool object for other files to use
