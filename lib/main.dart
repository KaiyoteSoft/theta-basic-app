import 'package:flutter/material.dart';
import './screens/screen_home.dart';
//import './screens/screen_1.dart';
import './screens/screen_2.dart';
import './screens/screen_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RICOH THETA V Basic App',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => ScreenTwo(),
        '/third':(context) => ScreenThree()
      },
    );
  }
}
