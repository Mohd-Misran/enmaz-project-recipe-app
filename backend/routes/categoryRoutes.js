const express = require('express');
const categoryController = require('../controllers/categoryController.js');

const router = express.Router();

router
  .route('/')
  .get(categoryController.getAllCategories)
  .post(categoryController.createCategory);

router.route('/:id/recipes').get(categoryController.getAllRecipesByCategory);

router.route('/:id').get(categoryController.getCategory);

module.exports = router;
