import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/send');
            }, 
            icon: const Icon(Icons.mail)
            ),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/received');
            }, 
            icon: const Icon(Icons.mail_outline)
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/send');
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('보낸 편지함')
              ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/received');
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('받은 편지함')
              ),
          ],
        ),
      ),
    );
  }
}
