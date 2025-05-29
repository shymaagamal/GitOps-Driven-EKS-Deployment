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
});