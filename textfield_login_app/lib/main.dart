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
  late TextEditingController textEditingControllerID;
  late TextEditingController textEditingControllerPW;
  late String ID;
  late String PW;

  @override
  void initState() {
    textEditingControllerID = TextEditingController();
    textEditingControllerPW = TextEditingController();
    ID = 'root';
    PW = 'qwer1234';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.abc,
                  size: 150,
                ),
                TextField(
                  controller: textEditingControllerID,
                  decoration: const InputDecoration(labelText: '사용자 ID를 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: textEditingControllerPW,
                  decoration: const InputDecoration(labelText: '패스워드를 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: const Text('Log In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // functions
  _login(BuildContext context) {
    if (textEditingControllerID.text == ID &&
        textEditingControllerPW.text == PW) {
      showDialog(
          context: context,
          barrierDismissible: false, // alert창 밖을 눌러도 alert종료 안됨
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('환영 합니다!'),
              content: const Text('신분이 확인 되었습니다.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } else if (textEditingControllerID.text.trim().isEmpty ||
        textEditingControllerPW.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('사용자ID와 암호를 입력하세요!'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('사용자ID나 암호가 맞지 않습니다!'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }
}
