
import 'package:bmi_tabbar_app/chanjin/Message.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController username;
  late TextEditingController userheight;
  late TextEditingController userweight;
  late bool maleSwitch;
  late String sex;
  late double bminum;

  @override
  void initState() {
    username = TextEditingController();
    userheight = TextEditingController();
    userweight = TextEditingController();
    maleSwitch = false;
    sex = '남';
    bminum=0;
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
          title: const Text('BMI 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  '정보 입력하기',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              TextField(
                controller: username,
                decoration: const InputDecoration(
                  labelText: '이름',
                ),
                keyboardType: TextInputType.text,
              ),
              Row(
                children: [
                  Text('성별 : $sex'),
                  Switch(
                      value: maleSwitch,
                      onChanged: (value) {
                        setState(() {
                          maleSwitch = value;
                          if (maleSwitch == true) {
                            sex = '여';
                          } else {
                            sex = '남';
                          }
                        });
                      }),
                ],
              ),
              TextField(
                controller: userheight,
                decoration: const InputDecoration(
                  labelText: '키(cm)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: userweight,
                decoration: const InputDecoration(
                  labelText: '몸무게(kg)',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    if (username.text.trim().isEmpty) {
                      errorSnackBar1(context);
                    } else if (userheight.text.trim().isEmpty) {
                      errorSnackBar2(context);
                    } else if (userweight.text.trim().isEmpty) {
                      errorSnackBar3(context);
                    }else{
                      bminum = (int.parse(userweight.text))/((int.parse(userheight.text)/100)*(int.parse(userheight.text)/100));
                      if(bminum<18.5){
                        Message.bmi='저체중';
                        Message.bmiLevel=1;
                      }else if(bminum<23){
                        Message.bmi='정상체중';
                        Message.bmiLevel=2;
                      }else if(bminum<25){
                        Message.bmi='과체중';
                        Message.bmiLevel=3;
                      }else if(bminum<30){
                        Message.bmi='비만';
                        Message.bmiLevel=4;
                      }else{
                        Message.bmi='고도비만';
                        Message.bmiLevel=5;
                      }
                      Message.username=username.text;
                      Message.sex=sex;
                      Navigator.pushNamed(context, '/ThirdPage');
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('계산')),
            ],
          ),
        ),
      ),
    );
  }

  // // -- functions

  // Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('이름을 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  errorSnackBar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('키를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  errorSnackBar3(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('몸무게를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
