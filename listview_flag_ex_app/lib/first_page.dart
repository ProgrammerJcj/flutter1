import 'package:flutter/material.dart';
import 'package:listview_flag_ex_app/flag_item.dart';

class FirstPage extends StatefulWidget {
  final List<Flag> list;

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
                      Text(
                        "     ${widget.list[position].country[0]}${" _ "*(widget.list[position].country.length-1)}",
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
            title: const Text("국기명"),
            content: Text("이 국기는 ${widget.list[position].country} 국기 입니다"),
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
}