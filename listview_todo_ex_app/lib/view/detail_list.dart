import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';


class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Message.imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(Message.workList),
          ],
        ),
      ),

    );
  }
}