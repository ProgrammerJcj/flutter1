import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/message.dart';
import 'package:navigator_lamp_switch_app/modify.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>const Modify())
                );
            }, 
            icon: const Icon(Icons.create)
            )
        ],
      ),
      body: Center(
        child: Image.asset(
            Message.imageName,
            width: 150,
            height: 300,
          ),
      ),
    );
  }
}