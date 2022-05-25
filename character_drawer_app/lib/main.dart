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
  late TextEditingController textEditingController; 
  late String character;// 출력할 문자열
  late List str; // displayCharacter를 한글자씩 배열로 만든 값
  late int currentStr; // list index 값

@override
  void initState() {
    super.initState();
    textEditingController=TextEditingController();
    str = textEditingController.text.split('');
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Text(
            character,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          width: 320,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
          ),
          child: Column(

          children: [
            UserAccountsDrawerHeader(
              accountName: Text('pikachu'), 
              accountEmail: Text('pikachu@naver.com'),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            OutlinedButton(
              onPressed: (){
                setState(() {
                  if(textEditingController.text.trim().isEmpty){
                    errorSnackBar(context);
                    textEditingController.text='글자를 입력하세요.';
                  str = textEditingController.text.split('');
                  }else{
                  str = textEditingController.text.split('');
                  }
                  character='';
                  currentStr=0;
                });
                Navigator.pop(context);
              }, 
              style: OutlinedButton.styleFrom(
                maximumSize: Size(200, 40),
              ),
              child: Text('광고문구 생성'),
              ),
          ],
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

// Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('글자를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }


} // End