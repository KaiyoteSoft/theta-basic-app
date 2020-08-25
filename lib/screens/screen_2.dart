import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';
import 'package:theta_v_basic_app/state.dart';
import 'package:theta_v_basic_app/info.dart';
import 'dart:io';
import 'package:theta_v_basic_app/state.dart';
import 'package:theta_v_basic_app/main.dart';

class ScreenTwo extends StatefulWidget {
  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  String outputText = 'Camera output displayed here';

  void changeMessage(Function functionName) async {
    var changedText = await functionName();
    setState(() {
      outputText = changedText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar('Diagnostics', context, '/third'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                changeMessage(state);
              },
              child: Text("Get the state"),
            ),
            RaisedButton(
              onPressed: () {
                changeMessage(info);
              },
              child: Text('Get info'),
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