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
  late String _lampImage; // Image Name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late bool _switchSize; // SwitchSize Status
  late bool _switchOnOff; // SwitchOnOff Status
  late bool _switchColor; // SwitchOnOff Status

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _switchSize = false;
    _switchOnOff = true;
    _switchColor = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 300,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _lampImage,
                  width: _lampWidth,
                  height: _lampHeight,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text('전구 색깔'),
                  Switch(
                      value: _switchColor,
                      onChanged: (value) {
                        setState(() {
                          _switchColor = value;
                          decisionLampColor();
                        });
                      }),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const Text('전구 확대'),
                  Switch(
                      value: _switchSize,
                      onChanged: (value) {
                        setState(() {
                          _switchSize = value;
                          decisionLampSize();
                        });
                      }),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const Text('전구 스위치'),
                  Switch(
                      value: _switchOnOff,
                      onChanged: (value) {
                        setState(() {
                          _switchOnOff = value;
                          decisionOnOff();
                        });
                      }),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  // -- Functions
  decisionOnOff() {
    if (_switchOnOff) {
      if (_switchColor) {
        _lampImage = 'images/lamp_red.png';
      } else {
        _lampImage = 'images/lamp_on.png';
      }
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }

  decisionLampSize() {
    if (_switchSize) {
      _lampWidth = 300;
      _lampHeight = 600;
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
    }
  }

  decisionLampColor() {
    if (_switchOnOff) {
      if (_switchColor) {
        _lampImage = 'images/lamp_red.png';
      } else {
        _lampImage = 'images/lamp_on.png';
      }
    }
  }

  // decisionLampColor(){
  //   switch (_switchOnOff) {
  //     case true:
  //       switch(_switchColor){
  //         case true:
  //         _lampImage = 'images/lamp_red.png';
  //         break;
  //         default:
  //         _lampImage = 'images/lamp_on.png';
  //         break;
  //       }
  //       break;
  //     default:
  //     break;
  //   }
  // }


} // End
