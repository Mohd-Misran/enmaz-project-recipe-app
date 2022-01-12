const Recipe = require('../models/recipeModel.js');

exports.createRecipe = async (req, res) => {
  const newRecipe = await Recipe.create(req.body);
  res.status(201).json({ status: 'success', recipe: newRecipe });
};

exports.getRecipe = async (req, res) => {
  const recipe = await Recipe.findById(req.params.id);
  if (!Recipe) {
    res.status(404).json({ status: 'fail', message: `Recipe not found.` });
  } else {
    res.status(200).json({ status: 'success', recipe });
  }
};

exports.getAllRecipes = async (req, res) => {
  const recipes = await Recipe.find();
  res.status(200).json({ status: 'success', recipes });
};
