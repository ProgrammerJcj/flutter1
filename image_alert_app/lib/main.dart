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
  late bool _switchOnOff; // SwitchOnOff Status

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _switchOnOff = true;
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
            width: 250,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _lampImage,
                  width: 250,
                  height: 500,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      decisionOn(context);
                    });
                  },
                  child: const Text('켜기')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      decisionOff(context);
                    });
                  },
                  child: const Text('끄기')),
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
  decisionOn(BuildContext context) {
    if (_switchOnOff) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 켜진 상태 입니다.'),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('네, 알겠습니다.'),
                  ),
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('램프 켜기'),
              content: const Text('램프를 키시겠습니까?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                        _switchOnOff = true;
                        _lampImage = 'images/lamp_on.png';
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('네'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('아니오'),
                    ),
                  ],
                ),
              ],
            );
          });
    }
  }

  decisionOff(BuildContext context) {
    if (_switchOnOff) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('램프 끄기'),
              content: const Text('램프를 끄시겠습니까?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                        _switchOnOff = false;
                        _lampImage = 'images/lamp_off.png';
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('네'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('아니오'),
                    ),
                  ],
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 꺼진 상태 입니다.'),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('네, 알겠습니다.'),
                  ),
                ),
              ],
            );
          });
    }
  }
} // End