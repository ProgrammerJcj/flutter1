import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail'),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.png'),
              ),
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              title: const Text('보낸 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/send');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: const Text('받은 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/received');
              },
            )
          ],
        ),
      ),
    );
  }
}