import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solid_test_app/widgets/home_title.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int colorIndex = 0;

  var backgroundColors = <Color>[
    Colors.deepPurple,
    Colors.blue,
    Colors.lightBlueAccent,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          setState(() {
            colorIndex = randomColorIndex;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: backgroundColors[colorIndex],
          child: Center(
            child: HomeTitle('Hey there 👋'),
          ),
        ),
      ),
    );
  }

  int get randomColorIndex {
    int randomIndex = Random().nextInt(backgroundColors.length);
    // to make sure color won't change to the same one
    while (randomIndex == colorIndex) {
      randomIndex = Random().nextInt(backgroundColors.length);
    }

    return randomIndex;
  }
}
