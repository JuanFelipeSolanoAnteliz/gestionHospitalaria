const router = require('express').Router();
const layout = require('../view/indexView');
const doctoresV1 = require('../version/doctorsV1');

router.use(layout);
router.use('/v1', doctoresV1);


module.exports = router;
