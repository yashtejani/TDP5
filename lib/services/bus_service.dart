import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

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

  updateBusDeatails(busId, capacity, occupied, newPassengers) async {
    try {
      var url = "${mainUrl}busUpdateDetails";
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';
      var seats = occupied + newPassengers;
      if (seats > capacity) {
        seats = capacity;
      }
      var data = {"busId": busId, "occupied_seats": seats};
      var response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode(data),
          encoding: Encoding.getByName('utf-8'));

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
