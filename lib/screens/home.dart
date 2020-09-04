import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_app/blocs/home/home_cubit.dart';
import 'package:solid_test_app/blocs/home/home_state.dart';
import 'package:solid_test_app/widgets/custom_checkbox_tile.dart';
import 'package:solid_test_app/widgets/home_title.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, HomeState state) {
      return Scaffold(
        body: InkWell(
          onTap: () {
            context.bloc<HomeCubit>().changeColorIndex();
          },
          child: _Background(
            showGradients: state.showGradient,
            backgroundColor: state.backgroundColor,
            secondBackgroundColor: state.secondBackgroundColor,
          ),
        ),
        floatingActionButton: CustomCheckboxTile(
          title: 'Show gradient',
          activeColor: state.backgroundColor,
          value: state.showGradient,
          onChanged: (bool newValue) {
            context.bloc<HomeCubit>().updateShowGradient(newValue);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}

class _Background extends StatelessWidget {
  final Color backgroundColor;
  final Color secondBackgroundColor;
  final bool showGradients;

  const _Background(
      {Key key,
      @required this.backgroundColor,
      @required this.showGradients,
      @required this.secondBackgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: LinearGradient(colors: [
          backgroundColor,
          secondBackgroundColor,
        ]),
      ),
      duration: Duration(milliseconds: 200),
      child: Center(child: HomeTitle('Hey there 👋')),
    );
  }
}
