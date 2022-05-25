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
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print('Text Button');
              },
              onLongPress: (){
                print("Long pressed text button");
              },
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                //
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Elevated button',
              ),
            ),
            OutlinedButton(
              onPressed: (){
                //--
              }, 
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: const BorderSide(
                  color: Colors.black87,
                  width: 2.0
                )
              ),
              child: const Text(
                'outlined button',
              ),
            ),
            TextButton.icon(
              onPressed: (){
              //
              }, 
              icon: const Icon(
              Icons.home,
              ), 
              label: const Text('Go to home'),
              style:  TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: (){
                //--
              }, 
              icon: const Icon(
                Icons.home,
                size: 20, 
              ),
              label: const Text('Go to home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: const Size(200, 40),
              ),
            ),
            OutlinedButton.icon(
              onPressed: (){
                //
              }, 
              icon: const Icon(
                Icons.home,
                color: Colors.red,
              ),
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    //
                  }, 
                  style: TextButton.styleFrom(
                    minimumSize: const Size(150, 40)
                  ),
                  child: const Text('TextButton'),

                ),
                ElevatedButton(
                  onPressed: (){
                    //
                  },
                  child: const Text('ElevatedButton'),
                ),
              ],
            )
          ],
        ),
      ),
    );
    
  }
}