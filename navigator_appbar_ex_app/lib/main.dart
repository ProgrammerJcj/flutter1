import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/Mail.dart';
import 'package:navigator_appbar_ex_app/ReceivedMail.dart';
import 'package:navigator_appbar_ex_app/SendMail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Mail(),
        '/send' :(context) => const SendMail(),
        '/received':(context) {
          return const ReceivedMail();
        }
      },
      initialRoute: '/',
    );
  }
}

