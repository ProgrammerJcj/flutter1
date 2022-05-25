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
  late TextEditingController textEditingController;
  late TextEditingController textEditingController2;
  late TextEditingController addresult;
  late TextEditingController subresult;
  late TextEditingController mulresult;
  late TextEditingController divresult;

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController2 = TextEditingController();
    addresult = TextEditingController();
    subresult = TextEditingController();
    mulresult = TextEditingController();
    divresult = TextEditingController();
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
          title: const Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                    decoration:
                        const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          if (textEditingController.text.trim().isEmpty ||
                              textEditingController2.text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else {
                            addresult.text =
                                (int.parse(textEditingController.text) +
                                        int.parse(textEditingController2.text))
                                    .toString();
                            subresult.text =
                                (int.parse(textEditingController.text) -
                                        int.parse(textEditingController2.text))
                                    .toString();
                            mulresult.text =
                                (int.parse(textEditingController.text) *
                                        int.parse(textEditingController2.text))
                                    .toString();
                            divresult.text =
                                (int.parse(textEditingController.text) /
                                        int.parse(textEditingController2.text))
                                    .toString();
                          }
                          // });
                        },
                        child: const Text('계산하기'),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            textEditingController.text = '';
                            textEditingController2.text = '';
                            addresult.text = '';
                            subresult.text = '';
                            mulresult.text = '';
                            divresult.text = '';
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text('지우기')),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: addresult,
                    decoration: const InputDecoration(
                      labelText: '덧셈 결과',
                    ),
                    readOnly: true,
                  ),
                  TextField(
                    controller: subresult,
                    decoration: const InputDecoration(
                      labelText: '뺄셈 결과',
                    ),
                    readOnly: true,
                  ),
                  TextField(
                    controller: mulresult,
                    decoration: const InputDecoration(
                      labelText: '곱셈 결과',
                    ),
                    readOnly: true,
                  ),
                  TextField(
                    controller: divresult,
                    decoration: const InputDecoration(
                      labelText: '나눗셈 결과',
                    ),
                    readOnly: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // // -- functions

  // Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
