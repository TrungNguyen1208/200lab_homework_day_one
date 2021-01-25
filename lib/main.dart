import 'package:flutter/material.dart';
import 'package:homework_day_one/challenge_screen.dart';
import 'package:homework_day_one/temperature_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TemperatureScreen(),
//      home: ChallengeScreen(),
    );
  }
}

