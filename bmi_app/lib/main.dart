import 'package:bmi_app/FirstPage.dart';
import 'package:bmi_app/ThirdPage.dart';
import 'package:bmi_app/Message.dart';
import 'package:bmi_app/SecondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     routes: {
        '/' :(context) => const FirstPage(),
        '/SecondPage' :(context) => const SecondPage(),
        '/ThirdPage' :(context) => const ThirdPage(),
     },
      initialRoute: '/',
    );
  }
}

