import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/takePicture.dart';
import 'package:theta_v_basic_app/state.dart';
import 'package:theta_v_basic_app/displayImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RICOH THETA V Basic App',
      home: MyHomePage(title: 'RICOH THETA V Basic App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var imageUrl = 'https://picsum.photos/200/300';

  void getImage() async {
    var changedUrl = await displayFile();
    setState(() {
      imageUrl = changedUrl;
    });
    print("change Image");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[300],
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Image.network(imageUrl),
            ),
            Text(
              'Basic RICOH THETA Functions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Source Sans Pro'
              ),
            ),
            RaisedButton(
              onPressed:() {
                takePicture();
                },
              child: Text("Take a picture!"),
            ),
            RaisedButton(
              onPressed: () {
                state();
              },
              child: Text("Get the state"),
            ),
            RaisedButton(
              onPressed: () {
                getImage();
//              displayFile();
              },
              child: Text("Display last image")
            ),
          ],
        ),
      ),
    );
  }
}
