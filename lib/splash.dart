// import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:photogallery/home.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: HomePage(),
        title: Text(
          'Photo Search Example',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
        ),
        image: Image.asset('assets/images/Logo.png'),
        backgroundColor: Colors.blueGrey[700],
        styleTextUnderTheLoader: TextStyle(color: Colors.white),
        photoSize: 100.0,
        //onClick: () => print("aaa"),
        loaderColor: Colors.white,
        );
  }
 
 // Example of flare animation splash screen
 
  // Widget build(BuildContext context) {
  //   return SplashScreen.navigate(
  //     name: "assets/animations/welcome_page.flr",
  //     next: HomePage(),
  //     width: double.infinity,
  //     height: double.infinity,
  //     alignment: Alignment.center,
  //     until: () => Future.delayed(Duration(seconds: 5)),
  //     backgroundColor: Colors.blueGrey[700],
  //     startAnimation: "welcome",
  //   );
  // }

}
