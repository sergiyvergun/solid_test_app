import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:solid_test_app/styles/custom_colors.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
            backgroundColor: CustomColors().backgroundColors[0],
            secondBackgroundColor: CustomColors().darkerBackgroundColors[0],
            showGradient: false));

  int colorIndex = 0;
  bool showGradient = false;

  void changeColorIndex() {
    colorIndex = randomColorIndex;
    updateView();
  }

  void updateShowGradient(bool showGradient) {
    this.showGradient = showGradient;
    updateView();
  }

  void updateView() {
    emit(
      HomeState(
        showGradient: showGradient,
        secondBackgroundColor:
            showGradient ? secondBackgroundColor : backgroundColor,
        backgroundColor: backgroundColor,
      ),
    );
  }

  Color get backgroundColor => CustomColors().backgroundColors[colorIndex];

  Color get secondBackgroundColor =>
      CustomColors().darkerBackgroundColors[colorIndex];

  int get randomColorIndex {
    int randomIndex = Random().nextInt(CustomColors().backgroundColors.length);
    // to make sure color won't change to the same one
    while (randomIndex == colorIndex) {
      randomIndex = Random().nextInt(CustomColors().backgroundColors.length);
    }

    return randomIndex;
  }
}
