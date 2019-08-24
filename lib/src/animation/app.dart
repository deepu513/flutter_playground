import 'package:flutter/material.dart';

import 'screens/animation_screen.dart';

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log in',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationScreen()
    );
  }
}
