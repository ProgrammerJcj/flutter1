import 'dart:async';

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
        primarySwatch: Colors.grey,
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
  late String displayCharacter; // 출력할 문자열
  late String character; // 출력 하는 문자열
  late List str; // displayCharacter를 한글자씩 배열로 만든 값
  late int currentStr; // list index 값

@override
  void initState() {
    super.initState();
    displayCharacter='대한민국';
    str = displayCharacter.split('');
    currentStr=0;
    character='';

    Timer.periodic(const Duration(seconds: 1), (Timer timer){
      changeCharacter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Text(
          character,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

// function
changeCharacter(){
  setState(() {
    if(currentStr == str.length){ // currenStr값이 배열길이를 넘어갈 경우
      currentStr=0; //index 값 0
      character=''; //출력 문자열 초기화
    }
    character+=str[currentStr]; // 출력 문자열에 한글자씩 추가
    currentStr++; // 배열 index 값 증가

  });
}




} // End