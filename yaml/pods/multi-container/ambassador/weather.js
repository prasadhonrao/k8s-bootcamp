const express = require('express');

const app = express();
const PORT = 4000;

app.get('/weather', (req, res) => {
  const weatherData = {
    location: 'London',
    temperature: '15°C',
    condition: 'Cloudy',
    humidity: '78%',
  };
  res.json(weatherData);
});

app.listen(PORT, () => {
  console.log(`Weather API running on port ${PORT}`);
});
