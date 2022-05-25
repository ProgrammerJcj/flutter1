import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack bar'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      // body: const MySnackBar()
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 클래스 파일 따로 생성
            const MySnackBar3(),

            // 함수
            ElevatedButton(
              onPressed: () {
                snackBarFunction(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow
              ),
              child: const Text('Snackbar Button')),

            // 
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Elevated Button is clicked'),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green
              ),
              child: const Text('Snackbar Button')),
          ],
        )
        ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: (){
      //       // ScaffoldMessenger.of(context).showSnackBar(
      //       //   const SnackBar(
      //       //     content: Text('Elevated Button is clicked'),
      //       //     duration: Duration(seconds: 1),
      //       //     backgroundColor: Colors.red,
      //       //   ),
      //       // );
      //       snackBarFunction(context);
      //     }, 
      //     child: const Text('Snackbar Button')
      // )
      // )
    );
  }

  // --- Functions
  snackBarFunction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Elevated Button is clicked'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.yellow,
      ),
    );
  }


} // End