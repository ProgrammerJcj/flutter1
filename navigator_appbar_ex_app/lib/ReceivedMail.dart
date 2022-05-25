import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Received Mail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            SizedBox(
              height: 50,
            ),
            Text('유비에게서 온 메일'),
            Text('관우에게서 온 메일'),
            Text('장비에게서 온 메일'),
          ],
        ),
      ),
    );
  }
}
