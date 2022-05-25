import 'package:drawer_ex_app/Mail.dart';
import 'package:drawer_ex_app/ReceiveMail.dart';
import 'package:drawer_ex_app/SendMail.dart';
import 'package:flutter/material.dart';

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

