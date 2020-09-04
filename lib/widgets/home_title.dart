import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String text;

  const HomeTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
