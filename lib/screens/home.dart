import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solid_test_app/widgets/custom_checkbox_tile.dart';
import 'package:solid_test_app/widgets/home_title.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int colorIndex = 0;
  bool showGradients = false;

  var backgroundColors = <Color>[
    Colors.deepPurple,
    Colors.blue,
    Colors.lightBlueAccent,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];
  var darkerBackgroundColors = <Color>[
    Colors.deepPurple[900],
    Colors.blue[900],
    Colors.lightBlue[900],
    Colors.green[900],
    Colors.yellow[900],
    Colors.orange[900],
    Colors.red[900],
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
          decoration: BoxDecoration(
            color: backgroundColor,
            gradient: LinearGradient(colors: [
              backgroundColor,
              showGradients ? darkerBackgroundColor : backgroundColor
            ]),
          ),
          duration: Duration(milliseconds: 200),
          child: Center(child: HomeTitle('Hey there 👋')),
        ),
      ),
      floatingActionButton: CustomCheckboxTile(
        title: 'Show gradient',
        activeColor: backgroundColor,
        value: showGradients,
        onChanged: (bool newValue) {
          setState(() {
            showGradients = newValue;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Color get backgroundColor => backgroundColors[colorIndex];

  Color get darkerBackgroundColor => darkerBackgroundColors[colorIndex];

  int get randomColorIndex {
    int randomIndex = Random().nextInt(backgroundColors.length);
    // to make sure color won't change to the same one
    while (randomIndex == colorIndex) {
      randomIndex = Random().nextInt(backgroundColors.length);
    }

    return randomIndex;
  }
}
