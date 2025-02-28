const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const PORT = 3000;

app.use(express.json());

// Middleware to log requests
app.use((req, res, next) => {
  const logDirectory = '/logs';
  const logFile = path.join(logDirectory, 'app.log');

  // Create directory if it doesn't exist
  if (!fs.existsSync(logDirectory)) {
    console.log('Creating logs directory...');
    fs.mkdirSync(logDirectory, { recursive: true });
  }

  const log = `${new Date().toISOString()} - ${req.method} ${req.url}\n`;
  fs.appendFileSync(logFile, log);
  next();
});

app.get('/', (req, res) => {
  res.send('Hello from Express!');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
