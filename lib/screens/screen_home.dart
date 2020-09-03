import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:theta_v_basic_app/components/output_text.dart';

import 'package:theta_v_basic_app/checkConnection.dart';
import 'package:theta_v_basic_app/takePicture.dart';
import 'package:theta_v_basic_app/displayImage.dart';
import 'package:theta_v_basic_app/main.dart';
import 'package:theta_v_basic_app/startCapture.dart';
import 'package:theta_v_basic_app/stopCapture.dart';
import 'package:theta_v_basic_app/toggleMode.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String connectionStatus = 'Connect to the camera Wifi!';
  String hdrStatus = '';

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

  Future<String> getHdr() async {
    var url = 'http://192.168.1.1/osc/commands/execute';

    Map data = {
      'name': 'camera.getOptions',
      'parameters': {
        'optionNames': [
          "_filter",
        ]
      }
    };

    //encode Map to JSON
    var body = jsonEncode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
    Map<String, dynamic> hdrType = jsonDecode(response.body);
    String hdrState = hdrType['results']['options']['_filter'];
    setState(() {
      hdrStatus = 'HDR is $hdrState';
    });

    return 'HDR is: $hdrState';
  }

  @override
  void initState() {
    checkConnection();
    getHdr();
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
            Text(hdrStatus),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                generateActionButton(takePicture, 'Take Picture'),
                generateActionButton(toggleMode, 'Toggle Shooting Modes'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                generateActionButton(startCapture, 'Start Video'),
                generateActionButton(stopCapture, 'STOP Video'),
              ],
            ),
            generateActionButton(getImage, 'Display last image'),
          ],
        ),
      ),

    );
  }
}
