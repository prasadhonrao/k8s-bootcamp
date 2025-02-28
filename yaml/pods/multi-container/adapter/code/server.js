const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const PORT = 3000;

app.use(express.json());

// Middleware to log requests
app.use((req, res, next) => {
  const logDirectory = '/logs';
  const logFile = path.join(logDirectory, 'app.json');

  // Create directory if it doesn't exist
  if (!fs.existsSync(logDirectory)) {
    console.log('Creating logs directory...');
    fs.mkdirSync(logDirectory, { recursive: true });
  }

  // Create log file if it doesn't exist
  if (!fs.existsSync(logFile)) {
    console.log('Creating log file in json format...');
    fs.writeFileSync(logFile, '');
  }

  const logEntry = {
    timestamp: new Date().toISOString(),
    method: req.method,
    path: req.url,
  };

  fs.appendFileSync(logFile, JSON.stringify(logEntry) + '\n');
  next();
});

app.get('/', (req, res) => {
  res.send('K8s Sidecar Pattern');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
