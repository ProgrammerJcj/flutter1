import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal_item.dart';
import 'package:navigator_tabbar_ex_app/first_page.dart';
import 'package:navigator_tabbar_ex_app/second_page.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome>
    with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;
  List<Animal> animalList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(
        animalName: '벌',
        kind: '곤충류',
        imagePath: "images/bee.png",
        flyExist: true));

    animalList.add(Animal(
        animalName: '고양이',
        kind: '포유류',
        imagePath: "images/cat.png",
        flyExist: false));

    animalList.add(Animal(
        animalName: '젖소',
        kind: '포유류',
        imagePath: "images/cow.png",
        flyExist: false));

    animalList.add(Animal(
        animalName: '강아지',
        kind: '포유류',
        imagePath: "images/dog.png",
        flyExist: false));

    animalList.add(Animal(
        animalName: '여우',
        kind: '포유류',
        imagePath: "images/fox.png",
        flyExist: false));

    animalList.add(Animal(
        animalName: '원숭이',
        kind: '영장류',
        imagePath: "images/monkey.png",
        flyExist: false));

    animalList.add(Animal(
        animalName: '돼지',
        kind: '포유류',
        imagePath: "images/pig.png",
        flyExist: false));

    animalList.add(Animal(
        animalName: '늑대',
        kind: '포유류',
        imagePath: "images/wolf.png",
        flyExist: false));
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
        title: const Text("Animal List"),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          //first page에 데이터 넘겨주기
          FirstPage(list: animalList),
          SecondPage(list: animalList)
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        height: 70,
        child: TabBar(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 6, color: Colors.yellow),
            insets: EdgeInsets.symmetric(horizontal: 60),
          ),
          controller: controller,
          labelColor: Colors.black,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
            text: "목록",
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
              text: "입력",
            ),
          ],
        ),
      ),
    );
  }
}
