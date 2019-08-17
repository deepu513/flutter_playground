import 'package:flutter/material.dart';

import 'blocs/provider.dart';
import 'screens/login_screen.dart';

class LoginBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log in',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
