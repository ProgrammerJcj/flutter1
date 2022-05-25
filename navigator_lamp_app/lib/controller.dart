import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  final bool lampStatus;
  final String text;
  const Controller({Key? key, required this.lampStatus, required this.text}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late String switchLabel;
  late bool switchValue;
  late TextEditingController textEditingController;

  List status = [];

  @override
  void initState() {
    super.initState();
    if (widget.lampStatus) {
      switchLabel = 'On';
      switchValue = true;
    } else {
      switchLabel = 'off';
      switchValue = false;
    }
    textEditingController = TextEditingController(text: widget.text);
    // textEditingController = TextEditingController();
    // textEditingController.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('수정화면'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: '글자를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(switchLabel),
                  Switch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                          if (value) {
                            switchLabel = 'On';
                          } else {
                            switchLabel = 'Off';
                          }
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    status.add(switchValue);
                    status.add(textEditingController.text);
                    Navigator.pop(context, status);
                  },
                  child: const Text('OK')),
            ],
          ),
        ),
      ),
    );
  }
}
