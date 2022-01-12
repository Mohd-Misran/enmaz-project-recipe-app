const express = require('express');

const categoryRouter = require('./routes/categoryRoutes.js');
const recipeRouter = require('./routes/recipeRoutes.js');
const userRouter = require('./routes/userRoutes.js');

// Create express app
const app = express();

// Body-parser
app.use(express.json({ limit: '10kb' }));

// Routers
app.use('/api/v1/categories', categoryRouter);
app.use('/api/v1/recipes', recipeRouter);
app.use('/api/v1/users', userRouter);

// Unhandled routes
app.all('*', (req, res) => {
  res.status(404).json({ status: 'fail', message: `${req.url} not found.` });
});

module.exports = app;
