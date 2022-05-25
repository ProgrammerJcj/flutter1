import 'package:bmi_app/Message.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'BMI 측정 결과',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Text('${Message.username}(${Message.sex})님의 BMI는 ',
            style: const TextStyle(
              fontSize: 20,
            ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: Message.bmiLevel*60,),
                const Icon(Icons.check),
              ],
            ),
            Image.asset('images/bmigraph.png'),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                //
              }, 
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  minimumSize: const Size(200, 70)
                ),
              child: Text(
                Message.bmi,
                style: const TextStyle(
                  fontSize: 40,
                ),
              )
              ),
              const SizedBox(height: 300,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/');
                }, 
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  minimumSize: const Size(250, 40)
                ),
                child: const Text('초기화면으로 돌아가기'),
                )
          ],
        ),
      ),
    );
  }
}