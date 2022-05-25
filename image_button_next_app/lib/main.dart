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
  late int currentImage2;

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
    currentImage2 = 1;
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
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 10,
                      )),
                  child: Image.asset(
                    'images/${imageName[currentImage]}',
                    width: 350,
                    height: 550,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 270,
                top: 8,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                      width: 5,
                    )
                  ),
                  child: Image.asset(
                    'images/${imageName[currentImage2]}',
                    fit: BoxFit.fill,
                    width: 100,
                    height: 150,
                  ),
                ),
              )
            ]
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentImage--;

                        if (currentImage < 0) {
                          currentImage = imageName.length - 1;
                        }
                        currentImage2=currentImage+1;
                        if(currentImage>=imageName.length-1){
                          currentImage2=0;
                        }
                      });
                    },
                    child: const Text('<< 이전')),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentImage++;
                        if (currentImage >= imageName.length) {
                          currentImage = 0;
                        }
                        currentImage2=currentImage+1;
                        if(currentImage>=imageName.length-1){
                          currentImage2=0;
                        }
                      });
                    },
                    child: const Text('다음 >>')),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),

      //                       currentImage++;
      //                       if (currentImage >= imageName.length) {
      //                         currentImage = 0;
      //                       }
      //                     });
      //           },
      //           iconSize: 100,
      //           color: Colors.white,
      //           icon: const Icon(Icons.keyboard_arrow_right_outlined)
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
} // End
