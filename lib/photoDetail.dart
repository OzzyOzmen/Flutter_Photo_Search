import 'package:flutter/material.dart';
import 'package:photogallery/Models/Photos.dart';

class PhotoDetail extends StatefulWidget {
  Photos photo;
  PhotoDetail(this.photo);

  @override
  _PhotoDetailState createState() => _PhotoDetailState(photo);
}

class _PhotoDetailState extends State<PhotoDetail> {
  Photos photo;
  _PhotoDetailState(this.photo);
  var isLoading = false;
  var imageBaseUrl = "https://yoursite.com/images/uploads/photos/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarOpacity: 0 ,
          backgroundColor: Colors.black.withOpacity(1),
          title: Text("${photo.photoName}"),
        ),
        body: Container(
          decoration: new BoxDecoration(
              border: new Border.all( color: Colors.transparent), 
              color: Colors.black.withOpacity(1),
            ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Container(
                  height: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                      left: 20.0, top:0, right: 20, bottom: 30),
                  color: Colors.blue,
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                      color: Colors.green,
                      child: InkWell(
                        child: Image.network(
                          imageBaseUrl + photo.photoUrl,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ),
                      )),
                )),
        ));
  }
}
