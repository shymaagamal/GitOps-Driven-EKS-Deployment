const request = require('supertest');
const express = require('express');
const path = require('path');

const app = express();
app.use(express.static(path.join(__dirname, '../public')));

describe('Express App', () => {
  it('should respond with 200 for GET /', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
  });

  it('should serve static files from public directory', async () => {
    const response = await request(app).get('/index.html');
    expect(response.status).toBe(200);
    expect(response.text).toContain('html'); // Adjust based on your index.html content
  });

  it('should return 404 for non-existent routes', async () => {
    const response = await request(app).get('/non-existent');
    expect(response.status).toBe(404); // Assumes you add a 404 handler
  });
});