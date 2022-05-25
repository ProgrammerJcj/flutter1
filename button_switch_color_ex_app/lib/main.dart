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
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool switchValue;
  late Color buttonColor;

  @override
  void initState() {
    switchValue = false;
    buttonColor = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Button color on Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _buttonclick();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                ),
                child: const Text('Flutter')),
            const SizedBox(
              height: 50,
            ),
            Switch(
              value: switchValue,
              onChanged: (value) {
                _buttonclick();
              },
            ),
          ],
        ),
      ),
    );
  }

// functions

  _buttonclick() {
    setState(() {
      if (buttonColor == Colors.blue) {
        buttonColor = Colors.red;
        switchValue = true;
      } else {
        buttonColor = Colors.blue;
        switchValue = false;
      }
    });
  }
}//End


