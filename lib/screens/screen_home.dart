import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:theta_v_basic_app/checkConnection.dart';
import 'package:theta_v_basic_app/takePicture.dart';
import 'package:theta_v_basic_app/state.dart';
import 'package:theta_v_basic_app/displayImage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String connectionStatus = 'Connect to the camera Wifi!';

  void checkConnection() async {
    var url = 'http://192.168.1.1/osc/info';
    try {
      final response =  await http.get(url);
      setState(() {
        connectionStatus = 'The camera is connected!';
      });
    } on SocketException {
      print('No internet connection');
      setState(() {
        connectionStatus = '!! Connect to the camera Wifi !!!!';
      });
    }
  }

  @override
  void initState() {
    checkConnection();
    super.initState();
  }


  var imageUrl = 'https://picsum.photos/200/300';
  String outputText = 'Camera output displayed here';

  void getImage() async {
    var changedUrl = await displayFile();
    setState(() {
      imageUrl = changedUrl;
    });
    print("change Image");
  }

  void changeMessage() async {
    var changedText = await state();
    setState(() {
      outputText = changedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        leading: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Icon(Icons.arrow_forward),
        ),
        title: Text('RICOH THETA Basic App'),
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(connectionStatus),
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
                changeMessage();
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(outputText),
            ),
          ],
        ),
      ),

    );
  }
}
