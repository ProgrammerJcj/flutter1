import 'package:flutter/material.dart';
import 'package:listview_app/animal_item.dart';

class FirstPage extends StatefulWidget {
  // list 넘긴거 생성자 이용해서 받기
  final List<Animal> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            //widget : 위에서 받은 리스트 가져오라는 의미.
            // list 받은 클래스랑 현재 클래스는 다른 클래스이기 때문에 이 클래스는 list가 뭔지 모르니까. 
            itemCount: widget.list.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  _showDialog(context, position);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text("     ${widget.list[position].animalName}",
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  // --- Functions
  _showDialog(BuildContext context, position) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(widget.list[position].animalName),
            content: Text("이 동물은 ${widget.list[position].kind} 입니다"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('종료'),
              ),
            ],
          );
        });
  }
} // End
