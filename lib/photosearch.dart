import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:photogallery/Models/Photos.dart';
import 'package:photogallery/error.dart';
import 'package:photogallery/photoDetail.dart';

class PhotoSearch extends StatefulWidget {
  @override
  _PhotoSearchState createState() => _PhotoSearchState();
}

class _PhotoSearchState extends State<PhotoSearch> {
  List<Photos> list = List();
  List<Photos> listem = List();
  String resimAdi;
  

  @override
  void initState() {
    super.initState();
    //_fetchData();
  }

  var isLoading = false;
  var imageBaseUrl = "https://yoursite.com/images/uploads/photos/";

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get("https://api.yoursite.com/api/home/");

    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Photos.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Upps something gone wrong while fetching photos !!!');
    }
  }

  void _filtrele() {
    listem.clear();

    for (var item in list) {
      if (item.photoName.contains(resimAdi)) {
        print(item.photoName);
        print(item.photoUrl);
        listem.add(item);
      }
    }
    _fetchData();
  }

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 25.0, right: 25, top: 20, bottom: 20),
          child: RaisedButton(
            child: new Text(
              "Search",
            ),
            onPressed: () {
              if (list.length < 1) {
                 _fetchData();
              }
              _filtrele();
              if (listem.length < 1) {
                myError();
              }
            },
            color: Colors.blueGrey[900],
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blueGrey[900])),
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(child:Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter photo name',
                        labelText: 'Photo Name',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          resimAdi = value;
                          // _filtrele();
                        });
                      },
                    ),
                  ),
                  Container(
                      height: 420,
                      alignment: Alignment.center,
                      child: ListView.builder(
                          itemCount: listem.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Container(
                                  height: MediaQuery.of(context).size.width / 4,
                                  margin: EdgeInsets.only(
                                      left: 1.0, top: 1, right: 1),
                                  padding: EdgeInsets.all(1.0),
                                  //color: Colors.blue,
                                  alignment: Alignment.center,
                                  child: Text(
                                    this.listem[index].photoName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 1)),
                                Container(
                                    height:
                                        MediaQuery.of(context).size.width / 1,
                                    margin: EdgeInsets.only(
                                        left: 20.0,
                                        top: 5,
                                        right: 20,
                                        bottom: 20),
                                    // color: Colors.blue,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                        child: Image.network(
                                          this.imageBaseUrl +
                                              listem[index].photoUrl,
                                          fit: BoxFit.fill,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        onTap: () {
                                          openPhotoDetail(this.listem[index]);
                                        })),
                              ],
                            );
                          })),
                ],
              )));
  }

  void openPhotoDetail(Photos photos) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (contex) => PhotoDetail(photos)));
  }

  void myError() async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: ErrorPage(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }
}
