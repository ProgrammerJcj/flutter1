import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/controller.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String _lampImage;
  late bool lampStatus;


  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    _lampImage = 'images/lamp_on.png';
    lampStatus = true;

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main 화면'),
          actions: [
            IconButton(
              onPressed: (){
                 Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context){
                  return Controller(lampStatus: lampStatus, text: textEditingController.text,);
                }),
              ).then((value) => getData(value));
              }, 
              icon: const Icon(Icons.edit)
              )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: textEditingController,
                        decoration: const InputDecoration(
                          labelText: '글자를 입력하세요',
                        ),
                        keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(height: 20,),
              Image.asset(
                _lampImage,
                width: 150,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }

    // functions
  getData(value){
    print('Controller : $value');
    setState(() {
    if(value[0]){
      _lampImage = 'images/lamp_on.png';
      lampStatus = true;
    }else{
      _lampImage = 'images/lamp_off.png';
      lampStatus = false;
    } 
    textEditingController.text = value[1];
    });
  }
}