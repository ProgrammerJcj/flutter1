import 'package:flutter/material.dart';
import 'package:listview_flag_ex_insert_app/flag_item.dart';

class InsertPage extends StatefulWidget {
  final List<Flag> list;
  const InsertPage({Key? key, required this.list}) : super(key: key);

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final nameController = TextEditingController();
  final questController = TextEditingController();
  var _imagePath;
  String imageName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: questController,
              maxLines: 1,
              decoration: const InputDecoration(labelText: "문제를 입력하세요"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: nameController,
              maxLines: 1,
              decoration: const InputDecoration(labelText: "정답을 입력하세요"),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/korea.png";
                    setState(() {
                      imageName = "korea";
                    });
                  },
                  child: Image.asset(
                    "images/korea.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/china.png";
                    setState(() {
                      imageName = "china";
                    });
                  },
                  child: Image.asset(
                    "images/china.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/spain.png";
                    setState(() {
                      imageName = "spain";
                    });
                  },
                  child: Image.asset(
                    "images/spain.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/germany.png";
                    setState(() {
                      imageName = "germany";
                    });
                  },
                  child: Image.asset(
                    "images/germany.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/france.png";
                    setState(() {
                      imageName = "france";
                    });
                  },
                  child: Image.asset(
                    "images/france.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/italy.png";
                    setState(() {
                      imageName = "italy";
                    });
                  },
                  child: Image.asset(
                    "images/italy.png",
                    width: 80,
                  ),
                ),
              ],
            ),
          ),
          Text(imageName),
          ElevatedButton(
              onPressed: () {
                _showDialog(context);
              },
              child: const Text("문제 추가하기"))
        ],
      ),
    );
  }

  //--- Functions

  _showDialog(BuildContext context) {
    var flag = Flag(
      country: nameController.text,
      imagePath: _imagePath,
    );

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("문제 추가하기"),
            content: Text(
              "이 국가의 문제는 ${questController.text} 입니다."
              "또 이 문제의 정답은 ${flag.country} 입니다.\n"
              '이 문제를 추가 하시겠습니까?',
              style: const TextStyle(fontSize: 17),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  widget.list.add(flag);
                  Navigator.of(ctx).pop();
                },
                child: const Text("예"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  "아니오",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }
} // End
