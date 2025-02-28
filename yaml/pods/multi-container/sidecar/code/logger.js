const fs = require('fs');
const path = require('path');

const logDirectory = '/logs';
const logFile = path.join(logDirectory, 'app.log');

console.log('Log monitoring started...');

// Create the log directory if it doesn't exist
if (!fs.existsSync(logDirectory)) {
  console.log('Creating logs directory...');
  fs.mkdirSync(logDirectory, { recursive: true });
}

// Create the log file if it doesn't exist
if (!fs.existsSync(logFile)) {
  console.log('Creating log file...');
  fs.writeFileSync(logFile, '');
}

fs.watchFile(logFile, (curr, prev) => {
  const data = fs.readFileSync(logFile, 'utf8');
  console.log('Updated Logs:\n', data);
});
