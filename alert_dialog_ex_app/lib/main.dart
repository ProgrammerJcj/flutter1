import 'package:alert_dialog_ex_app/NextPage.dart';
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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and push'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
        child: const Text(
          'Move the 2nd page.'
          ),
        ) 
        ),
    );
  }
}


// function
_showDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext ctx){
      return AlertDialog(
        title: const Text('Page 이동'),
        content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.of(ctx).pop();
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (ctx) =>  NextPage())
                );
            }, 
            child: const Text('Page 이동'),
            ),
        ],
      );
    }
    );  
}

