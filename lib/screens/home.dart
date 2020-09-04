import 'package:flutter/material.dart';

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
      backgroundColor: backgroundColors[colorIndex],
    );
  }
}
