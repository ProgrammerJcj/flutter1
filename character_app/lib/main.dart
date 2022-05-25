import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          '영웅 Card',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/lee.jpeg'),
                  radius: 60,
                ),
              ),
            ),
            const Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '성웅',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '이순신 장군',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '전적',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '62전 62승',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                Text('옥포해전'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                Text('사천포해전'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                Text('당포해전'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                Text('한산도해전'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                Text('부산포해전'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                Text('명량해전'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                Text('노량해전'),
              ],
            ),
            const Center(
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                backgroundImage: AssetImage('images/turtle.gif'),
                radius: 40,
                )
              ),
          ],
        ),
      ),
    );
  }
}
