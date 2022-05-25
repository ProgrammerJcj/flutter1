import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      // debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Text Exercise 01'
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Text(
              '유비',
            ),
            Text(
              '관우',
            ),
            Text(
              '장비',
            ),
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Text(
              '조조',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            Text(
              '여포',
            ),
            Text(
              '동탁',
            ),
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}