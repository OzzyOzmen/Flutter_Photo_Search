import 'package:flutter/material.dart';

class HowItWorks extends StatefulWidget {
  HowItWorks({Key key}) : super(key: key);

  @override
  _HowItWorksState createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text("How it works Page"),
    ));
  }
}
