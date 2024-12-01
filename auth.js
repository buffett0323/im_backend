// auth.js (Basic Auth example)
const jwt = require('jsonwebtoken'); // Assuming you're using JWT for authentication

// Middleware to verify token
const verifyToken = (req, res, next) => {
  const token = req.headers['authorization'];

  if (!token) {
    return res.status(403).json({ message: 'No token provided' });
  }

  jwt.verify(token, 'your_secret_key', (err, decoded) => {
    if (err) {
      return res.status(403).json({ message: 'Invalid token' });
    }
    req.user = decoded; // Store user data in request object
    next(); // Proceed to next middleware/handler
  });
};

module.exports = { verifyToken };
