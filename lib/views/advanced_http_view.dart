import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/information.dart';
import 'package:http/http.dart' as http;

class AdvancedHttpView extends StatefulWidget {
  AdvancedHttpView({Key key}) : super(key: key);

  @override
  _AdvancedHttpView createState() => _AdvancedHttpView();
}

class _AdvancedHttpView extends State<AdvancedHttpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: buildFutureBuilderAnotherWay(),
    ));
  }

  FutureBuilder<Information> buildFutureBuilderAnotherWay() {
    return FutureBuilder<Information>(
      future: getDataFromAPIAnotherWay(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("First Name: ${snapshot.data.firstName}"),
                Text("Last Name: ${snapshot.data.lastName}"),
                Text("Image Url: ${snapshot.data.imageUrl}"),
                Text("City: ${snapshot.data.details.city}"),
                Text("Job: ${snapshot.data.details.job}"),
              ],
            );
          } else {
            return Text("No data available...");
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Text("Connection failed...");
        }
      },
    );
  }

  Future<Information> getDataFromAPIAnotherWay() async {
    var url = "https://my-custom-api-4f6e8.firebaseio.com/informations/2.json";
    var wrongUrl =
        "https://my-customapi-4f6e8.firebaseio.com/informations/2.json";
    final response = (await http.get(url));

    if (response.statusCode == 404) {
      return null;
    }

    var information = Information.fromJson(json.decode(response.body));

    return information;
  }

  /*-----------------------------------------------------------------*/

  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      future: getDataFromAPI(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var information =
                Information.fromJson(json.decode(snapshot.data.body));
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("First Name: ${information.firstName}"),
                Text("Last Name: ${information.lastName}"),
                Text("Image Url: ${information.imageUrl}"),
                Text("City: ${information.details.city}"),
                Text("Job: ${information.details.job}"),
              ],
            );
          } else {
            return Text("No data available...");
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Text("Connection failed...");
        }
      },
    );
  }

  Future getDataFromAPI() async {
    final response = (await http
        .get("https://my-custom-api-4f6e8.firebaseio.com/informations/1.json"));
    // we can append .body or we can append snapshot.data.body
    return response;
  }
}
