
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photogallery/Contact.dart';
import 'package:photogallery/HowItWorks.dart';
import 'package:photogallery/photosearch.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueGrey[900]),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Photo Search Example'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: [
             // HowItWorks(),
              PhotoSearch(),
              Contact(),
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  //const Choice(title: 'Nasıl Çalışır', icon: Icons.info_outline),
  const Choice(title: 'Search Photo', icon: Icons.picture_in_picture),
  const Choice(title: 'Contact', icon: Icons.contact_mail),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Container(
          child: PhotoSearch(),
        ));
  }
}
