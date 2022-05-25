import 'dart:ui';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //property 

  late int _hitcount;
  late double _pikaradius;

  @override
  void initState() {
    _hitcount = 1; 
    _pikaradius = 110;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pika Hit Count"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        GestureDetector(
          onTap: () {
            setState(() {
            _hitcount ++;
            });
          },

              child: CircleAvatar(
                backgroundImage: AssetImage("images/pikachu-1.png"),
                backgroundColor: Colors.white,
                radius: _pikaradius,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text("Hits : $_hitcount",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
    ); 
  }






 // Function



}