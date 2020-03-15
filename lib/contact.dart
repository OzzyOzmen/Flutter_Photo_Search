import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String phoneNumber = "Pls contact us for any reason.";
  String email = "email@mail.com";
  String name = "Contact Information";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            buildHeader(context, name),
            buildInformation(phoneNumber, email, name),
          ],
        )
      ],
    );
  }

  Container buildHeader(BuildContext context, String name) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey[700]),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          SizedBox(height: 20),
          Container(
              child: CircleAvatar(
                maxRadius: 100,
                minRadius: 50,
            child: ClipOval(
              child: Image.asset(
                "assets/images/Logo.png",
                 fit: BoxFit.fill,
                 height:200 ,
              ),
              
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:10,bottom:8,left:8,right:8),
                child: Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildInformation(phoneNumber, email, name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(phoneNumber.toString()),
              // subtitle: Text(
              //   "Telefon",
              //   style: TextStyle(color: Colors.black54),
              // ),
              leading: Icon(Icons.info, color: Colors.blueGrey[900]),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(email.toString()),
              subtitle: Text(
                "E-mail",
                style: TextStyle(color: Colors.black54),
              ),
              leading: Icon(Icons.email, color: Colors.blueGrey[900]),
            ),
          ),
        ],
      ),
    );
  }
}
