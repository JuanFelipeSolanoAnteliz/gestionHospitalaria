const express = require('express');
const doctores = express();
const doctorController = require('../controller/doctorController');

doctores.get('/', doctorController.getAll);
doctores.get('/:id', doctorController.getById);

module.exports = doctores;