import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_app/screens/home.dart';

import 'blocs/home/home_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Test App',
      home: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: Home(),
      ),
    );
  }
}
