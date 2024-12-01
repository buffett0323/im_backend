const express = require('express');
const { parsePdfToExtractDetails } = require('./pdfParser/pdfParser');
const { Pool } = require('pg');
const { execFile } = require('child_process');
const path = require('path');
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
  // Extract the PDF document from the request
  const { document } = req.body;

  if (!document) {
    return res.status(400).json({ message: 'PDF document is required' });
  }

  try {
    // Parse the PDF to extract details
    const { title, publisher, date, summary, author, fullText, analyzeState, category } = await parsePdfToExtractDetails(document);

    if (!title || !fullText || !author) {
      return res.status(400).json({ message: 'Missing required fields (Title, Full_text, or Author)' });
    }

    // SQL query to insert document details into the database
    const query = `
      INSERT INTO Document (Title, Publisher, Date, Summary, Author, Full_text, Analyze_state, Category)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
      RETURNING *;
    `;

    // Insert into the database
    const result = await pool.query(query, [
      title,
      publisher,
      date,
      summary,
      author,
      fullText,
      analyzeState || 'Pending',
      category || 'Uncategorized',
    ]);

    // Send success response
    res.status(201).json({
      message: 'Document uploaded successfully',
      document: result.rows[0],
    });
  } catch (err) {
    console.error('Error uploading document:', err.stack);
    res.status(500).json({ message: 'Error uploading document' });
  }
});



// 2. API to filter documents to the database
app.post('/filter-document', async (req, res) => {
  const { condition } = req.body;

  if (!condition) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  const query = `

  `;

  try {
    const result = await pool.query(query, [title, content, author]);
    res.status(201).json({
      message: 'Article filtered successfully',
      article: result.rows[0],
    });
  } catch (err) {
    console.error('Error filtering article', err.stack);
    res.status(500).json({ message: 'Error filtering article' });
  }
});


// 3. API to tag documents
app.post('/tagging', async (req, res) => {
  const { condition } = req.body;

  if (!condition) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  const query = `

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


// 4. API to get analytical results
app.post('/get_anal_res', async (req, res) => {
  const { condition } = req.body;

  if (!condition) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  const query = `

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