import 'package:flutter/material.dart';
import './screens/screen_home.dart';
import './screens/screen_2.dart';
import './screens/screen_3.dart';

Widget generateAppBar(String titleText, BuildContext context, String screenName) {
  return AppBar(
    title: Text(titleText),
    backgroundColor: Colors.blue[300],
    actions: [FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, screenName);
      },
      child: Icon(Icons.arrow_forward),
    ),
    ],
  );
}

Widget generateActionButton(Function functionName, String buttonText) {
  return RaisedButton(
    onPressed: () {
      functionName();
    },
    child: Text(buttonText),
  );
}

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
