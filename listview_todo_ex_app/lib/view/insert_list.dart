import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool cartSwitch;
  late bool clockSwitch;
  late bool pencilSwitch;
  late String imageName;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    cartSwitch = true;
    clockSwitch = false;
    pencilSwitch = false;
    imageName = "images/cart.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("구매"),
                  Switch(
                      value: cartSwitch,
                      onChanged: (value) {
                        setState(() {
                          cartSwitch = value;
                          if (cartSwitch) {
                            clockSwitch = false;
                            pencilSwitch = false;
                          }
                          cartSwitchOn();

                          if (cartSwitch) {
                            imageName = "images/cart.png";
                          }
                        });
                      }),
                  Image.asset(
                    "images/cart.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("약속"),
                  Switch(
                      value: clockSwitch,
                      onChanged: (value) {
                        setState(() {
                          clockSwitch = value;
                          cartSwitch = false;
                          pencilSwitch = false;
                          cartSwitchOn();
                          if (clockSwitch) {
                            imageName = "images/clock.png";
                          }
                        });
                      }),
                  Image.asset(
                    "images/clock.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("공부"),
                  Switch(
                      value: pencilSwitch,
                      onChanged: (value) {
                        setState(() {
                          clockSwitch = false;
                          cartSwitch = false;
                          pencilSwitch = value;
                          cartSwitchOn();
                          if (pencilSwitch) {
                            imageName = "images/pencil.png";
                          }
                        });
                      }),
                  Image.asset(
                    "images/pencil.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: "목록을 입력하세요",
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isNotEmpty) {
                      addList();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("OK")),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions
  addList() {
    Message.imagePath = imageName; //그냥 지금 선택 안하니까 임의 설정
    Message.workList = textEditingController.text;
    Message.action = true; // 지금 생긴 거라는 표시!
  }

  cartSwitchOn() {
    if (!cartSwitch && !pencilSwitch && !clockSwitch) {
      cartSwitch = true;
    }
  }
}
