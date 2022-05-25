import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_switch_app/main.dart';
import 'package:navigator_lamp_switch_app/message.dart';

class Modify extends StatefulWidget {
  const Modify({Key? key}) : super(key: key);

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Message.colorText),
                Switch(
                  value: Message.switchRed, 
                        onChanged: (value){
                          setState(() {
                            Message.switchRed = value;
                            decisionOn();
                          });
                        }
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Message.onOffText),
                Switch(
                  value: Message.switchOn, 
                        onChanged: (value){
                          setState(() {
                            Message.switchOn = value;
                            decisionOn();
                          });
                        }
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: const Text('OK')
              )
          ],
        ),
      ),
    );
  }

    // -- Functions

  decisionOn(){
    if(Message.switchOn){
      if(Message.switchRed){
      Message.imageName = 'images/lamp_red.png';
      Message.colorText = 'red';
      Message.onOffText='on';
      }else{
        Message.imageName = 'images/lamp_on.png';
        Message.onOffText='on';
        Message.colorText='yellow';
      }
    }else{
      if(Message.switchRed){
      Message.imageName = 'images/lamp_off.png';
      Message.onOffText='off';
      Message.colorText = 'red';
      }else{
      Message.imageName = 'images/lamp_off.png';
      Message.onOffText='off';
      Message.colorText = 'yellow';
      }
    }
  }

}