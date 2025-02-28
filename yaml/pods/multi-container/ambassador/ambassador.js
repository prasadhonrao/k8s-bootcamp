const express = require('express');
const axios = require('axios');

const app = express();
const PORT = 5000;

const WEATHER_API_URL = 'http://weather-api:4000/weather'; // For Prod

// const WEATHER_API_URL = 'http://localhost:4000/weather'; // For Dev

let lastRequestTime = 0;

app.get('/weather', async (req, res) => {
  const currentTime = Date.now();
  if (currentTime - lastRequestTime < 1000) {
    return res.status(429).json({ error: 'Rate limit exceeded' });
  }
  lastRequestTime = currentTime;

  try {
    const response = await axios.get(WEATHER_API_URL);
    console.log('Forwarded request to Weather API');
    res.json(response.data);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch from Weather API' });
  }
});

app.listen(PORT, () => {
  console.log(`Ambassador proxy running on port ${PORT}`);
});
