const express = require('express');
const axios = require('axios');

const app = express();
const PORT = 3000;
const AMBASSADOR_URL = 'http://localhost:5000/weather'; // Proxy instead of direct API

app.get('/get-weather', async (req, res) => {
  try {
    const response = await axios.get(AMBASSADOR_URL);
    res.json(response.data);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch weather data' });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
