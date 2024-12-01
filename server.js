const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 3000;

require('dotenv').config(); // Load environment variables from .env file

// Middleware to parse JSON request bodies
app.use(express.json());

// PostgreSQL connection configuration
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});



// Test the database connection
pool.connect()
  .then(() => console.log('Connected to PostgreSQL'))
  .catch(err => console.error('Connection error', err.stack));



// Buffett's APIs 
// 1. API to upload documents to the database
app.post('/upload-document', async (req, res) => {
  const { title, content, author } = req.body;

  if (!title || !content || !author) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  //   CREATE TABLE Document (
  //     DocumentID SERIAL PRIMARY KEY,
  //     Title VARCHAR NOT NULL,
  //     Publisher VARCHAR,
  //     Date DATE,
  //     Summary TEXT,
  //     Author VARCHAR,
  //     Full_text TEXT NOT NULL,
  //     Analyze_state VARCHAR,
  //     Category VARCHAR
  // );

  const query = `
    INSERT INTO Document (title, content, author)
    VALUES ($1, $2, $3)
    RETURNING *;
  `;

  try {
    const result = await pool.query(query, [title, content, author]);
    res.status(201).json({
      message: 'Article uploaded successfully',
      article: result.rows[0],
    });
  } catch (err) {
    console.error('Error uploading article', err.stack);
    res.status(500).json({ message: 'Error uploading article' });
  }
});






// henry place



// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

module.exports = pool;