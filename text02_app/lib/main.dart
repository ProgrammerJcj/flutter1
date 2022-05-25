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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Text with Column and Row'
        ),
       ),
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: const [
        //         Icon(Icons.email_rounded),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text(
        //           'James',
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: const [
        //         Icon(Icons.account_balance),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text(
        //           'Cathy',
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: const [
        //         Icon(
        //           Icons.account_circle,
        //           color: Colors.blue,
        //           ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text(
        //           'Kenny',
        //         ),
        //       ],
        //     ),
        //   ]
        // ),


        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.email_rounded),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_balance),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                ),

              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'James',
                  ),
                ),
                // SizedBox(
                //   height: 17,
                // ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Cathy',
                  ),
                ),
                // SizedBox(
                //   height: 17,
                // ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Kenny',
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}