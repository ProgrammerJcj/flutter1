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
  late bool sumSwitch;
  late bool subSwitch;
  late bool mulSwitch;
  late bool divSwitch;

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController2 = TextEditingController();
    addresult = TextEditingController();
    subresult = TextEditingController();
    mulresult = TextEditingController();
    divresult = TextEditingController();
    sumSwitch = true;
    subSwitch = true;
    mulSwitch = true;
    divSwitch = true;
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
            padding: const EdgeInsets.all(10.0),
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
                      ElevatedButton( // 계산하기 버튼
                        onPressed: () {
                          setState(() {
                          if (textEditingController.text.trim().isEmpty ||
                              textEditingController2.text.trim().isEmpty) { // 두 칸중 하나라도 비어 있을 시
                            errorSnackBar(context);
                          } else {
                            if(sumSwitch==true){ // 덧셈 스위치가 켜있을 경우
                            addresult.text =
                                (int.parse(textEditingController.text) +
                                        int.parse(textEditingController2.text))
                                    .toString();
                            }
                            if(subSwitch==true){ // 뺄셈 스위치가 켜있을 경우
                            subresult.text =
                                (int.parse(textEditingController.text) -
                                        int.parse(textEditingController2.text))
                                    .toString();
                              
                            }
                            if(mulSwitch==true){ // 곱셈 스위치가 켜있을 경우
                            mulresult.text =
                                (int.parse(textEditingController.text) *
                                        int.parse(textEditingController2.text))
                                    .toString();

                            }
                            if(divSwitch==true){ // 나눗셈 스위치가 켜있을 경우
                            divresult.text =
                                (int.parse(textEditingController.text) /
                                        int.parse(textEditingController2.text))
                                    .toString();

                            }
                          }
                           });
                        },
                        child: const Text('계산하기'),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton( // 지우기 버튼
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('덧셈:'),
                      Switch( //덧셈 스위치
                        value: sumSwitch, 
                        onChanged: (value){
                          setState(() {
                            sumSwitch=value;
                            if (textEditingController.text.trim().isEmpty ||
                              textEditingController2.text.trim().isEmpty) { // 두 칸중 빈칸이 있을 경우
                                addresult.text = '';
                          } else {
                            if(sumSwitch==true){ // 덧셈 스위치를 키는 경우
                              addresult.text =
                                (int.parse(textEditingController.text) +
                                        int.parse(textEditingController2.text))
                                    .toString();
                            }else{ // 덧셈 스위치를 끄는 경우
                            addresult.text = '';
                            }
                          }
                          });
                        }
                        ),
                      const Text('뺄셈:'),
                      Switch(
                        value: subSwitch, 
                        onChanged: (value){
                          setState(() {
                            subSwitch=value;
                            if (textEditingController.text.trim().isEmpty ||
                              textEditingController2.text.trim().isEmpty) { // 두 칸중 빈칸이 있을 경우
                            subresult.text = '';
                          } else {
                            if(subSwitch==true){ // 뺄셈 스위치를 키는 경우
                              subresult.text =
                                (int.parse(textEditingController.text) -
                                        int.parse(textEditingController2.text))
                                    .toString();
                            }else{ // 뺄셈 스위치를 끄는 경우
                            subresult.text = '';
                            }
                          }
                          });
                        }
                        ),
                      const Text('곱셈:'),
                      Switch(
                        value: mulSwitch, 
                        onChanged: (value){
                          setState(() {
                            mulSwitch=value;
                            if (textEditingController.text.trim().isEmpty ||
                              textEditingController2.text.trim().isEmpty) { // 두 칸중 빈칸이 있을 경우
                            mulresult.text = '';
                          } else {
                            if(mulSwitch==true){ // 곱셈 스위치를 키는 경우
                              mulresult.text =
                                (int.parse(textEditingController.text) *
                                        int.parse(textEditingController2.text))
                                    .toString();
                            }else{ // 곱셈 스위치를 끄는 경우
                            mulresult.text = '';
                            }
                          }
                          });
                        }
                        ),
                      const Text('나눗셈:'),
                      Switch(
                        value: divSwitch, 
                        onChanged: (value){
                          setState(() {
                            divSwitch=value;
                            if (textEditingController.text.trim().isEmpty ||
                              textEditingController2.text.trim().isEmpty) { // 두 칸중 빈칸이 있을 경우
                            divresult.text = '';
                          } else {
                            if(divSwitch==true){ // 나눗셈 스위치를 키는 경우
                              divresult.text =
                                (int.parse(textEditingController.text) /
                                        int.parse(textEditingController2.text))
                                    .toString();
                            }else{ // 나눗셈 스위치를 끄는 경우
                            divresult.text = '';
                            }
                          }
                          });
                        }
                        ),
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
