import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Loading_screen.dart';



class NetworkHelper{
  final String url;
  NetworkHelper(this.url);


  Future<dynamic> getData() async{
    final response = await http.get(Uri.parse(url));
    //'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body); //
      return data;
    }

    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load location information ');
    }

    }

}