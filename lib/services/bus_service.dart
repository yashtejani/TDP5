import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BusService {
  var mainUrl = Uri.parse('http://localhost:3002/');
  getBusList() async {
    try {
      var url = "${mainUrl}busList";
      var data = await http.get(Uri.parse(url));
      return json.decode(data.body);
    } on HttpException catch (e) {
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  updateBusDeatails(busId, capacity, occupied, newPassengers, arrived, departed,
      action) async {
    try {
      var url = "${mainUrl}busUpdateDetails";
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';
      var seats;
      var arrivalTime;
      var departureTime;
      var data;

      if (action == "P") {
        seats = occupied + newPassengers;
        if (seats > capacity) {
          seats = capacity;
        }
        data = {"busId": busId, "occupied_seats": 5};
      } else if (action == "A") {
        arrivalTime = DateFormat('HH:mm').format(DateTime.now());
        data = {"busId": busId, "arrival_time": arrivalTime};
      } else if (action == "D") {
        departureTime = DateFormat('HH:mm').format(DateTime.now());
        data = {"busId": busId, "departure_time": departureTime};
      }
      var response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode(data),
          encoding: Encoding.getByName('utf-8'));
      return json.decode(response.body);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getBusDetails(busId) async {
    try {
      var url = Uri.parse('${mainUrl}busViewDetails?busId=$busId');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';

      var response = await http.get(url, headers: headers);
      return json.decode(response.body);
    } on HttpException catch (e) {
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
