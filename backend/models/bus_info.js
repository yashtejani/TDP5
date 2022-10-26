var mongoose = require('mongoose')
var Schema = mongoose.Schema;
var busInfoSchema = new Schema({
	busId: {
		type: Number,
		required: true,
	},
	capacity: {
		type: Number,
		required: true,
	},
	route: {
		type: String,
		required: true,
	},
	arrival_time: {
		type: String,
		required: true,
	},
	current_location: {
		type: String,
		required: true,
	},
	bus_stops: [{
		type: String,
		required: true,
	}],
	bus_station: [{
		type: String,
		required: true,
	}],
	departure_time: {
		type: String,
		required: true,
	},
	occupied_seats: {
		type: Number,
		required: true,
	},
})

module.exports = mongoose.model('bus_info', busInfoSchema)
