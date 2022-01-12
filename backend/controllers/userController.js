const User = require('../models/userModel.js');

exports.createUser = async (req, res) => {
  const newUser = await User.create(req.body);
  res.status(201).json({
    status: 'success',
    user: { _id: newUser['_id'], name: newUser['name'], email: newUser['email'] },
  });
};

exports.getAllUsers = async (req, res) => {
  const users = await User.find();
  res.status(200).json({ status: 'success', users });
};

exports.loginUser = async (req, res) => {
  const user = await User.findOne({ email: req.body.email }).select('+password +salt');
  if (!user || !user.validatePassword(req.body.password, user.password, user.salt)) {
    res.status(401).json({ status: 'fail', message: 'Invalid credentials.' });
  } else {
    res.status(200).json({
      status: 'message',
      message: 'Logged in successfully.',
      user: { name: user.name, email: user.email },
    });
  }
};
