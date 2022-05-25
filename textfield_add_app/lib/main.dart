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
  late String string1;
  late int num1;
  late TextEditingController textEditingController;
  late TextEditingController textEditingController2;

  @override
  void initState() {
    string1 = '';
    num1 = 0;
    textEditingController = TextEditingController();
    textEditingController2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 덧셈 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: '첫번째 숫자를 입력하세요',
                    ),
                    
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: textEditingController2,
                  decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20,),
                ElevatedButton.icon(
                  onPressed: (){
                    setState(() {
                      if(textEditingController.text.trim().isEmpty || textEditingController2.text.trim().isEmpty){
                        errorSnackBar(context);
                        string1='';
                      }else{
                      num1 = int.parse(textEditingController.text)+int.parse(textEditingController2.text);
                      string1='입력하신 숫자의 합은 $num1 입니다.';
                      }
                    });
                  }, 
                  icon: const Icon(Icons.add), 
                  label: const Text('덧셈 계산'),
                ),
                const SizedBox(height: 50,),
                Text(
                  string1,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // // -- functions


  // Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        )
      );
  }







}