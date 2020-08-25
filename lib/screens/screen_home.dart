import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:theta_v_basic_app/checkConnection.dart';
import 'package:theta_v_basic_app/takePicture.dart';
import 'package:theta_v_basic_app/displayImage.dart';
import 'package:theta_v_basic_app/main.dart';



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
      appBar: generateAppBar('RICOH THETA BASIC APP', context, '/second'),
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
