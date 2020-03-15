
import 'package:flutter/material.dart';
import 'package:photogallery/splash.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blueGrey[700],
    ),
    home: SplashPage(),
  ));
}