import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/bmi.jpeg'),
            const Text(
              'BMI 계산기',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/SecondPage');
              }, 
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                '시작하기',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
              ),
          ],
        ),
      ),
    );
  }
}