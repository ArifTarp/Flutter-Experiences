import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpView extends StatefulWidget {
  HttpView({Key key}) : super(key: key);

  @override
  _HttpViewState createState() => _HttpViewState();
}

class _HttpViewState extends State<HttpView> {
  bool isHaveData;
  String name;

  @override
  void initState() {
    super.initState();
    isHaveData = false;
    name = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildSecondWay());
  }

  Center buildSecondWay() {
    return Center(
      child: FutureBuilder(
        future: getNamesFromAPIForSecondWay(),
        builder: (context, snapshot) {
          return checkConnection(snapshot);
        },
      ),
    );
  }

  Future getNamesFromAPIForSecondWay() async {
    final data = (await http.get(
            "https://my-custom-api-4f6e8.firebaseio.com/informations.json"))
        .body;
    return data;
  }

  Widget checkConnection(AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        return Text(snapshot.data);
      } else {
        return Text("No data available...");
      }
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else {
      return Text("Connection failed...");
    }
  }

  Center buildFirstWay() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          isHaveData ? Text(name) : CircularProgressIndicator(),
          RaisedButton(
            onPressed: () {
              getNamesFromAPIForFirstWay();
            },
            child: Text("Send Request"),
          )
        ],
      ),
    );
  }

  Future getNamesFromAPIForFirstWay() async {
    final data = (await http.get(
            "https://my-custom-api-4f6e8.firebaseio.com/informations.json"))
        .body;

    var jsonData = json.decode(data);
    //print(jsonData[1]["firstName"]);
    setState(() {
      name = jsonData[1]["firstName"];
      isHaveData = !isHaveData;
    });
  }
}
