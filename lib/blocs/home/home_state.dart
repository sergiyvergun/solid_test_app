import 'package:flutter/material.dart';

class HomeState {
  final Color backgroundColor;

  // for gradient
  final Color secondBackgroundColor;
  final bool showGradient;

  HomeState(
      {this.backgroundColor, this.secondBackgroundColor, this.showGradient});
}
