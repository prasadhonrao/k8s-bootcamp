const fs = require('fs');
const path = require('path');

const logDirectory = '/logs';
const inputFile = path.join(logDirectory, 'app.json');
const outputFile = path.join(logDirectory, 'app.txt');

console.log('Adapter started...');

// Check if the input file exists
if (!fs.existsSync(inputFile)) {
  console.log('No logs found.');
}

// Create the output file if it doesn't exist
if (!fs.existsSync(outputFile)) {
  console.log('Creating output file...');
  fs.writeFileSync(outputFile, '');
}

fs.watchFile(inputFile, (curr, prev) => {
  if (!fs.existsSync(inputFile)) {
    console.log('Input file does not exist yet.');
    return;
  }

  const jsonLogs = fs.readFileSync(inputFile, 'utf8').split('\n').filter(Boolean);
  const textLogs = jsonLogs.map((log) => {
    try {
      const data = JSON.parse(log);
      const logEntry = `${data.timestamp} - ${data.method} ${data.path}`;
      console.log(logEntry); // Print log entry to console
      return logEntry;
    } catch (e) {
      return 'Invalid log format';
    }
  });

  fs.writeFileSync(outputFile, textLogs.join('\n'));
  console.log('Logs converted to text format.');
});
