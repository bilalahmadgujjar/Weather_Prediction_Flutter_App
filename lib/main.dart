import 'package:clima/Loading_screen.dart';
import 'package:clima/Location_screen.dart';
import 'package:flutter/material.dart';
import 'Scratch.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark(),
      home: LoadingScreen(),
      //home: LocationScreen(),

    );
  }
}

