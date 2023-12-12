import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,

);

const kWeatherTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,


);


const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
  color: Colors.yellow
);


const kDecorationStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.location_city,
    color: Colors.teal,
    size: 30,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),

  // Base border with rounded edges
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),

  // When the field is enabled, show a yellow border with rounded edges
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.yellow),
  ),

  // When the field is focused, show a green border with rounded edges
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.green),
  ),
);
