const mysql = require("mysql2/promise");
const fs = require("fs");
const path = require("path");

async function initDb() {
  try {
    const connection = await mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "", // Add your MySQL root password here
      multipleStatements: true,
    });

    const sql = fs.readFileSync(path.join(__dirname, "../military_assets.sql"), "utf8");

    await connection.query(sql);
    console.log("Database and tables created, sample data inserted.");
    await connection.end();
  } catch (err) {
    console.error("Error initializing database:", err.message);
  }
}

initDb();
