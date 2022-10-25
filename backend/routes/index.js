const express = require('express')
const actions = require('../methods/actions')
const router = express.Router()

router.get('/', (req, res) => {
    res.send('Hello World')
})

router.get('/dashboard', (req, res) => {
    res.send('Dashboard')
})

//@desc Adding new user
//@route POST /adduser
router.post('/adduser', actions.addNew)

//@desc Authenticate a user
//@route POST /authenticate
router.post('/authenticate', actions.authenticate)

//@desc Get info on a user
//@route GET /getinfo
router.get('/getinfo', actions.getinfo)

//@route GET buslist
router.get('/busList', actions.busList)

//@route POST bus update details
router.post('/busUpdateDetails', actions.busUpdateDetails)

//@route GET bus view detials
router.get('/busViewDetails', actions.busViewDetails)

module.exports = router
