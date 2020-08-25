import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  @override
  _ScreenThreeState createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  int number = 2;

  void changePicture() {
    setState(() {
      number = number + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 3"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network("https://picsum.photos/seed/$number/100/100"),
                  Image.network("https://picsum.photos/seed/${number + 1}/100/100"),
                  Image.network("https://picsum.photos/seed/${number + 2}/100/100"),
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
                  onPressed: changePicture,
                  child: Text("Button 3")
              )
            ],
          ),
        )
    );
  }
}