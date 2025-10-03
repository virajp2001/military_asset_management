const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "", // Add your MySQL root password here
  database: "military_assets",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

const promisePool = pool.promise();

// Test connection and log status
promisePool.getConnection()
  .then((connection) => {
    console.log("Connected to MySQL database.");
    connection.release();
  })
  .catch((err) => {
    console.error("Error connecting to MySQL database:", err.message);
  });

module.exports = promisePool;
