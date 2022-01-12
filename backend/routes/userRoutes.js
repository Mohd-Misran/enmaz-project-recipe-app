const express = require('express');

const userController = require('../controllers/userController.js');

const router = express.Router();

router.route('/').get(userController.getAllUsers).post(userController.createUser);

router.route('/login').post(userController.loginUser);

module.exports = router;
