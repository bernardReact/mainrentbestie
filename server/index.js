const bcrypt = require('bcrypt');
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
require('dotenv').config();

const app = express();
app.use(express.json());
app.use(cors());

// 1. Setup the Database Connection
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// 2. Connect to the Database
db.connect((err) => {
    if (err) {
        console.log("❌ Error connecting to database:", err);
    } else {
        console.log("✅ Connected to MySQL Database successfully!");
    }
});

// 3. Start the Server on Port 3001
app.listen(3001, () => {
    console.log("🚀 Server is running on port 3001");
});
// REGISTER ENDPOINT
app.post('/register', async (req, res) => {
    const { full_name, agency_name, email, phone, password } = req.body;

    // 1. Check if user already exists
    db.query('SELECT email FROM users WHERE email = ?', [email], async (err, result) => {
        if (err) {
            console.log(err); // Print error to black screen so we can see it
            return res.status(500).send("Database error checking user");
        }
        if (result.length > 0) return res.status(400).send("Email already in use!");

        // 2. Scramble the Password
        const hashedPassword = await bcrypt.hash(password, 10);

        // 3. Insert - NOTE: We use 'phone_number' to match your database!
        db.query(
            'INSERT INTO users (full_name, agency_name, email, phone_number, password_hash) VALUES (?, ?, ?, ?, ?)',
            [full_name, agency_name, email, phone, hashedPassword],
            (err, result) => {
                if (err) {
                    console.log(err); // Print error to black screen
                    return res.status(500).send("Error creating user: " + err.sqlMessage);
                }
                res.send("User registered successfully!");
            }
        );
    });
});