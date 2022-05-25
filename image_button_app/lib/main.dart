import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
        primarySwatch: Colors.red,
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
  // Property
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    currentImage = 0;
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageName[currentImage],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            Image.asset(
              'images/${imageName[currentImage]}',
              width: 400,
              height: 400,
            ),
            // const SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           setState(() {
            //             currentImage--;
            //             if (currentImage < 0) {
            //               currentImage = imageName.length - 1;
            //             }
            //           });
            //         },
            //         child: const Text('<< 이전')),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     ElevatedButton(
            //         onPressed: () {
            //           setState(() {
            //             currentImage++;
            //             if (currentImage >= imageName.length) {
            //               currentImage = 0;
            //             }
            //           });
            //         },
            //         child: const Text('다음 >>')),
            //   ],
            // ),
            // const SizedBox(height: 10,),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 250,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30,),
                IconButton(
                  onPressed: (){
                          setState(() {
                            currentImage--;
                            if (currentImage < 0) {
                              currentImage = imageName.length - 1;
                            }
                          });
                }, 
                iconSize: 100,
                color: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_left_outlined)
                ),
                const SizedBox(width: 100,),
                IconButton(
                  onPressed: (){

                          setState(() {
                            currentImage++;
                            if (currentImage >= imageName.length) {
                              currentImage = 0;
                            }
                          });
                }, 
                iconSize: 100,
                color: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_right_outlined)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


} // End
