import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/view/detail_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert')
                  .then((value) => rebuildData());
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: GestureDetector(
                  onTap: () {
                    Message.imagePath = todoList[position].imagePath;
                    Message.workList = todoList[position].workList;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailList(),
                        ));
                  },
                  child: Card(
                    color: position % 2 == 0
                        ? const Color.fromARGB(255, 105, 169, 232)
                        : Colors.red,
                    child: Row(
                      children: [
                        Image.asset(
                          todoList[position].imagePath,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(todoList[position].workList),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  // --- Functions
  rebuildData() {
    setState(() {
      if(Message.action){

      todoList.add(
          TodoList(imagePath: Message.imagePath, workList: Message.workList));
        Message.action = false; // 예전꺼로 변하니까 더이상 rebuildData() 실행 안함 
      }
    });
  }
} // End
