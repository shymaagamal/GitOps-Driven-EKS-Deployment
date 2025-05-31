const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files from "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Handle 404 for non-existent routes
app.use((req, res) => {
  res.status(404).send('404: this page is not found');
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});