import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/first_page.dart';
import 'package:tabbar_image_ex_app/second_page.dart';

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
      home: const MyHomePage(),
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
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() { // super.dispose()전에 작성
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 변경하기',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          ),
          ),
        backgroundColor: Colors.amber,
      ),
      body: TabBarView(
        controller: controller,
        children: const [FirstPage(), SecondPage()],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
        height: 100,
          child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(
                icon: Icon(Icons.card_giftcard,
                color:  Colors.blue,
                ),
                text: 'Button',
              ),
              Tab(
                icon: Icon(Icons.card_membership,
                color:  Colors.red,
                ),
                text: 'Swipe',
              ),
            ],
          ),
        )
  
    );
  }
}
