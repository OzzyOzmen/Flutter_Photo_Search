import 'package:flutter/material.dart';
import 'package:photogallery/custom_button.dart';

class ErrorPage extends StatefulWidget {

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Sorry !!!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
          SizedBox(
            height: 24,
          ),
          
          Text(
            "There is no result of ur search.",
            
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
                
              }, buttonText: "Close",
             
            ),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}