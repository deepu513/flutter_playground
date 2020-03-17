import 'package:flutter/material.dart';
import 'package:flutter_playground/src/demo/screens/HomeScreen.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var greenColor = Color.fromARGB(255, 51, 175, 133);

    return MaterialApp(
      home: SafeArea(
        child: HomeScreen(),
      ),
      theme: ThemeData(
        primaryColor: greenColor,
        fontFamily: 'Rubik',
        splashFactory: InkRipple.splashFactory,
      ),
    );
  }
}
