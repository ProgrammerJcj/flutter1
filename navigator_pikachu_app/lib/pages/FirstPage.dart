import 'package:flutter/material.dart';
import 'package:navigator_pikachu_app/pages/SecondPage.dart';
import 'package:navigator_pikachu_app/pages/ThirdPage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 189),
      appBar: AppBar(
        title: const Text('Menu'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                    )
                  );
              }, 
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40)
              ),
              child: const Text('피카츄1'),
              ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ThirdPage(),
                    )
                  );
              }, 
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40)
              ),
              child: const Text('피카츄2'),
              )
          ],
        ),
      ),
    );
  }
}