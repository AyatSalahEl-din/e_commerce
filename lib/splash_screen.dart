import 'dart:async';

import 'package:e_commerce/auth/login/login.dart';
import 'package:e_commerce/HomeScreen/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
      'assets/images/splash_screen.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
