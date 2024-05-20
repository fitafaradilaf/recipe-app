const express = require('express')
const User = require('../models/user.model')
const router = express.Router()


router.post('/signup', (req, res) => {
  User.findOne({ email: req.body.email })
      .then(user => {
          if (user == null) {
              const newUser = new User({
                  email: req.body.email,
                  password: req.body.password
              })
              newUser.save()
                  .then(() => res.json('User added!'))
                  .catch(err => res.status(400).json('Error: ' + err));
          } else {
              res.status(400).json('Error: User already exists');
          }
      })
      .catch(err => {
          console.log(err)
          res.json(err)
      });
});


router.post('/signin', (req, res) => {
    if (!req.body.email || !req.body.password) {
        return res.status(400).json({ error: 'Email and password are required' });
    }

    User.findOne({ email: req.body.email, password: req.body.password })
        .then(user => {
            if (!user) {
                return res.status(404).json({ error: 'User not found' });
            }

            res.json(user);
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'An error occurred while trying to log in' });
        });
});
module.exports = router
