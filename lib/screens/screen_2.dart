import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 2"),
        ),
        body: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
//                  print("Hello world");
              },
              child: Icon(Icons.airplanemode_active),
            )
          ],
        )
    );
  }
}