import 'package:flutter_tutorial/models/detail.dart';

class Information {
  String firstName;
  String lastName;
  String imageUrl;
  Detail details;

  Information(this.firstName, this.lastName, this.imageUrl, this.details);

  Information.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
    details = Detail.fromJson(json['details']);
  }

  toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();

    data['details'] = this.details.toJson();
    data['firstName'] = this.firstName;
    data['imageUrl'] = this.imageUrl;
    data['lastName'] = this.lastName;

    return data;
  }
}
