const mongoose = require('mongoose');

const recipeSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, 'Recipe must have a title.'],
    unique: true,
    trim: true,
  },
  type: {
    type: String,
    trim: true,
    enum: {
      values: ['Veg', 'Non-Veg', 'Dessert', 'Drink'],
      message: 'Limited choices for type.',
    },
    default: 'Food',
  },
  prepTime: Number,
  image: { type: String, defaul: 'default.jpg' },
  url: { type: String, required: [true, 'Recipe must have a url.'] },
  category: {
    type: mongoose.Schema.ObjectId,
    ref: 'Category',
  },
});

const Recipe = mongoose.model('Recipe', recipeSchema);

module.exports = Recipe;
