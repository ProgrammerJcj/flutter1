import 'package:flutter/material.dart';
import 'package:listview_flag_ex_insert_app/flag_item.dart';
import 'package:listview_flag_ex_insert_app/insert_page.dart';
import 'package:listview_flag_ex_insert_app/list_page.dart';


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
  List<Flag> flagList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    flagList.add(Flag(imagePath: 'images/austria.png', country: '오스트리아'));
    flagList.add(Flag(imagePath: 'images/belgium.png', country: '벨기에'));
    flagList.add(Flag(imagePath: 'images/france.png', country: '프랑스'));
    flagList.add(Flag(imagePath: 'images/germany.png', country: '독일'));
    flagList.add(Flag(imagePath: 'images/hungary.png', country: '헝가리'));
    flagList.add(Flag(imagePath: 'images/italy.png', country: '이탈리아'));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("국가명 맞추기"),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          //first page에 데이터 넘겨주기
          ListPage(list: flagList),
          InsertPage(list: flagList)
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.amber,
        height: 60,
        child: TabBar(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 4, color: Colors.blue),
            insets: EdgeInsets.symmetric(horizontal: 40),
          ),
          controller: controller,
          labelColor: Colors.black,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
              text: "문제풀기",
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
              text: "문제만들기",
            ),
          ],
        ),
      ),
    );
  }
}
