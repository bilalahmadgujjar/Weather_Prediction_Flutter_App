import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(Cityscreen());
}

class Cityscreen extends StatefulWidget {
  Cityscreen({Key? key}) : super(key: key); // Corrected constructor

  @override
  State<Cityscreen> createState() => _CityscreenState();
}

class _CityscreenState extends State<Cityscreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.teal,
                    style: TextStyle(color: Colors.black),
                    decoration: kDecorationStyle,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: Text(
                      'Get Weather',
                      style: kWeatherTextStyle,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
