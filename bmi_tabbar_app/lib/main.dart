import 'package:bmi_tabbar_app/chanjin/FirstPage.dart';
import 'package:bmi_tabbar_app/chanjin/SecondPage.dart';
import 'package:bmi_tabbar_app/chanjin/ThirdPage.dart';
import 'package:bmi_tabbar_app/jinyeong/homepage.dart';
import 'package:bmi_tabbar_app/jinyeong/inputpage.dart';
import 'package:bmi_tabbar_app/jinyeong/resultpage.dart';
import 'package:bmi_tabbar_app/jiyeah/calc.dart';
import 'package:bmi_tabbar_app/jiyeah/result.dart';
import 'package:bmi_tabbar_app/reum/exercise.dart';
import 'package:bmi_tabbar_app/reum/exercise2.dart';
import 'package:bmi_tabbar_app/reum/home.dart';
import 'package:bmi_tabbar_app/reum/report.dart';
import 'package:bmi_tabbar_app/reum/result2.dart';
import 'package:bmi_tabbar_app/yeahjin/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/FirstPage': (context) => const FirstPage(),
        '/SecondPage': (context) => const SecondPage(),
        '/ThirdPage': (context) => const ThirdPage(),
         '/input' :(context) => const InputPage(),
        '/result' :(context) => const ResultPage(),
         "/Result3": (context) => const Result(),
        'result2': (context) => const Result2(),
        'exec': (context) => const Exe(),
        'exec2': (context) => const Exe2(),
        'report': (context) => const Report()
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // super.dispose()전에 작성
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab Bar Test'),
      // ),
      body: TabBarView(
        controller: controller,
        children: const [FirstPage(), HomePage(),Calc(),MyHomePage2(),Main()],
        ),
        bottomNavigationBar: Container(
          color: Colors.yellowAccent,
        height: 100,
          child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(
                icon: Icon(Icons.looks_one,
                color:  Colors.blue,
                ),
                text: '찬진',
              ),
              
              Tab(
                icon: Icon(Icons.looks_one,
                color:  Colors.blue,
                ),
                text: '진영',
              ),
              Tab(
                icon: Icon(Icons.looks_one,
                color:  Colors.blue,
                ),
                text: '지예',
              ),
              Tab(
                icon: Icon(Icons.looks_one,
                color:  Colors.blue,
                ),
                text: '예진',
              ),
              Tab(
                icon: Icon(Icons.looks_two,
                color:  Colors.red,
                ),
                text: '새름',
              ),
            ],
          ),
        )
  
    );
  }
}
