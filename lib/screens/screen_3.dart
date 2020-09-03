import 'package:flutter/material.dart';
import 'package:theta_v_basic_app/get_timeshift.dart';
import 'package:theta_v_basic_app/main.dart';
import 'package:theta_v_basic_app/screens/screen_home.dart';
import 'package:theta_v_basic_app/toggle_hdr.dart';
import 'dart:async';

class ScreenThree extends StatefulWidget {
  @override
  _ScreenThreeState createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  int number = 2;
  String textFromFunction = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: generateAppBar('Change Camera Settings', context, '/'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      filterToggle();
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Toggle HDR'),
                  ),
                  generateActionButton(disableTimer, 'Disable Timer'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network("https://picsum.photos/seed/${number + 3}/100/100"),
                  Image.network("https://picsum.photos/seed/${number + 4}/100/100"),
                  Image.network("https://picsum.photos/seed/${number + 5  }/100/100"),
                ],
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text("Button 3")
              )
            ],
          ),
        )
    );
  }
}