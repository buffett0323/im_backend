const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 3000;

// Middleware to parse JSON request bodies
app.use(express.json());

// PostgreSQL connection configuration
const pool = new Pool({
  user: 'your_user',        // Replace with your PostgreSQL username
  host: 'localhost',        // Replace with your PostgreSQL server address
  database: 'your_db_name', // Replace with your database name
  password: 'your_password',// Replace with your PostgreSQL password
  port: 5432,               // Default PostgreSQL port
});

// Test the database connection
pool.connect()
  .then(() => console.log('Connected to PostgreSQL'))
  .catch(err => console.error('Connection error', err.stack));

// API to upload articles to the database
app.post('/upload-article', async (req, res) => {
  const { title, content, author } = req.body;

  if (!title || !content || !author) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  const query = `
    INSERT INTO articles (title, content, author)
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

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
