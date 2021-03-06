
import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
      // appBar: AppBar(
      //   title: const Text('Second Page'),
      // ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 350,
                height: 600,
              )
            ],
          ),
        ),
      ),
    );
  }

  // -- Functions
  _onHorizontalSwipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.left){
        currentImage++;
        if(currentImage >= imageName.length){
          currentImage=0;
        }
      }else{
        currentImage--;
        if(currentImage < 0){
          currentImage = imageName.length-1;
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.up){
         currentImage++;
        if(currentImage >= imageName.length){
          currentImage=0;
        }
      }else{
        currentImage--;
        if(currentImage < 0){
          currentImage = imageName.length-1;
        }
      }       
      
    });
  }
}