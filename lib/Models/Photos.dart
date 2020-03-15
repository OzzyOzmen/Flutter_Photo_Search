class Photos {
  int photoId;
  String photoName;
  String photoUrl;


  Photos({this.photoId, this.photoName, this.photoUrl});

  Photos.fromJson(Map<String, dynamic> json) {
    photoId = json['photoId'];
    photoName = json['photoName'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photoId'] = this.photoId;
    data['photoName'] = this.photoName;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}
