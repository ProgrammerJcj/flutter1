import 'package:flutter/material.dart';
class MySnackBar3 extends StatelessWidget {
  const MySnackBar3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Elevated Button is clicked'),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.red,
              ),
            );
          }, 
          style: ElevatedButton.styleFrom(
            primary: Colors.red
          ),
          child: const Text('Snackbar Button'))
      );
  }
}