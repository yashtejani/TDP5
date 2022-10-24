var User = require('../models/users')
var BusInfo = require('../models/bus_info')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')

var functions = {
    addNew: function (req, res) {
	    console.log(req.body);
        if ((!req.body.name) || (!req.body.password)) {
            res.json({success: false, msg: 'Enter all fields'})
        }
        else {
            var newUser = User({
                name: req.body.name,
                password: req.body.password
            });
            newUser.save(function (err, newUser) {
                if (err) {
                    res.json({success: false, msg: 'Failed to save'})
                }
                else {
                    res.json({success: true, msg: 'Successfully saved'})
                }
            })
        }
    },
    authenticate: function (req, res) {
        User.findOne({
            name: req.body.name
        }, function (err, user) {
                if (err) throw err
                if (!user) {
                    res.status(403).send({success: false, msg: 'Authentication Failed, User not found'})
                }

                else {
                    user.comparePassword(req.body.password, function (err, isMatch) {
                        if (isMatch && !err) {
                            var token = jwt.encode(user, config.secret)
                            res.json({success: true, token: token})
                        }
                        else {
                            return res.status(403).send({success: false, msg: 'Authentication failed, wrong password'})
                        }
                    })
                }
        }
        )
    },
    getinfo: function (req, res) {
        if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            return res.json({success: true, msg: 'Hello ' + decodedtoken.name})
        }
        else {
            return res.json({success: false, msg: 'No Headers'})
        }
    },
	busViewDetails: function (req, res) {
		try {
			if (req.query.busId) {
				BusInfo.findOne({busId: parseInt(req.query.busId)}, (err, bus_info) => {
					if (bus_info) {
						console.log('bus: ', bus_info);
						return res.json({success: true, bus_info})
					}
					else if (err) {
						console.error(err);
						return res.json({success: false, msg: 'Bus not found with given id'});
					}
				})
			} else	return res.json({success: false, msg: 'Bus not found with given id'})
		} catch(err) {
			console.error(err);
			return res.status(500).send(err);
		}
	},
	busList: async function (req, res) {
		try {
			let busDetails = await BusInfo.find();
			if (busDetails) {
				return res.json({success: true, busDetails});
			} else {
				return res.json({success: false, msg: 'No bus details found'});
			}
		} catch(err) {
			console.error(err);
			return res.json({success: false, err});
		}
	},
	busUpdateDetails: async function (req, res) {
		try {
			let busDetails = await BusInfo.updateOne({busId: req.body.busId}, {$set: {occupied_seats: req.body.occupied_seats, arrival_time: req.body.arrival_time, departure_time: req.body.departure_time}});
            if (busDetails) {
				return res.json({success: true, busDetails});
			} else {
				return res.json({success: false, msg: 'No bus found to update'});
			}
		} catch(err) {
			return res.json({success: false, err});
		}
	}
}

module.exports = functions
