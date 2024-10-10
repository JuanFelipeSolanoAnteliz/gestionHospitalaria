const express = require('express');
const doctores = express();
const doctorController = require('../controller/doctorController');

doctores.get('/', doctorController.getAll);


module.exports = doctores;