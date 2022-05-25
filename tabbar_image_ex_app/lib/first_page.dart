
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
      // appBar: AppBar(
      //   title: const Text('First Page'),
      // ),
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
            const SizedBox(height: 100,),
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
}